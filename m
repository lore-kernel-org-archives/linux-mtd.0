Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCtht-0006t7-TK
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 15:23:10 +0000
Received: by mail-vc0-f175.google.com with SMTP id p1so3584625vcq.20
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 07:23:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 5 Mar 2013 16:23:06 +0100
Message-ID: <CAGWqfigQOiJHQh7emeN=e_6KqXGiFusPPCj07e6CmrFPizKCNA@mail.gmail.com>
Subject: integck failure
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm currently testing on an MX28EVK board and my tests at this moment
consist out of the following:
<quote>
insmod /home/root/mods/nandsim.ko  overridesize=11
ubiattach -p /dev/mtd9
ubimkvol /dev/ubi0 -s 30MiB -N test
mount -t ubifs /dev/ubi0_0  /mnt/test_file_system/
/home/root/tests/fs-tests/simple/perf
(/home/root/tests/fs-tests/integrity/integck -n 100 -e
/mnt/test_file_system 2>&1) >> /logfile.txt
if [ "$?" = "0" ]; then
       sync
       reboot
fi
</quote>
(Initially I tested this with *real* NAND chips, but I have no problem
reproducing it with nandsim as well).

integck is the standard integck coming from mtd-utils but including
(an earlier version of) the patches I submitted recently:
http://lists.infradead.org/pipermail/linux-mtd/2013-March/045939.html
. These patches should not influence the situation, but they should
make the issue more 'visible'.

When when I look at the logfile above I see the following (
http://pastebin.com/hVBu7bGn ) where "f2<=>90" means as much as
printf("%x<=>%x\n", read_buf[r], check_buf[r]);. Or integck read
"0xf2" but expected to read "0x90". If you later look at the files
integck wrote you will see they contain 0x90 (the correct data).

And if you do something like

<quote>
    fd = open("/tmp/blub", O_CREAT | O_TRUNC | O_RDWR);

    offset=0; size = 1; seed = 6649396;
    actual = file_write_data(&file, fd, offset, size, seed);
    file_write_info(&file, fd, offset, actual, seed);
</quote>
That is, recreate a file up to the point of the _previous_ action,
then it should not be any surprise that that file will contain the
"0xf2".

Or, integck bumps into the following:
- file contains 0xf2
- write 0x90 to the file at offset 0
- read at offset 0, result is 0xf2
- compare 0xf2 to 0x90 and complain it fails
- do lseek(0)
- read the file again (now reading 0x90) and write to file.

I have tested and reproduced this, exactly as described above on:

1. Linux 3.7.0 + MTD (real NAND) + UBI_FASTMAP compiled in (but not
enabled on the partition) + improved flash timing + a backported fix
from 3.8 which resets the BCH block at boottime.
2. Linux 3.7.0 + nandsim + using UBI_FASTMAP
3. Linux 3.8.0 + nandsim + using UBI_FASTMAP
4. Linux 3.8.0 + nandsim with UBI_FASTMAP compiled out.

Three additional observations/remarks.
- In case 3. I had several failures, but all of them were related
with file of a size of 1 or 2 bytes.
- In case 1, I have also observed this failure 'in the middle' of
files where an entire integck update transaction was missing, but with
nandsim I have it only seen trigger this on 1 or 2 byte large fiels.
- In case 1, I observed some Oopses (pasted full oopses here:
http://pastebin.com/tiFNSW7Y ) either __up_write called from
leb_write_unlock or __up_read called from leb_read_unlock. I have not
managed to reproduce these oopses with nandsim, but this entire story
smells like a race-condition and I suspect these may be involved and
for some reason the following story:
http://lists.infradead.org/pipermail/linux-mtd/2012-December/045172.html
sounds a bit related.

 If anybody could shed some light on this, or suggest some
additional/useful tests I'll gladly give them a try.

thanks
E.

-- 
Elie De Brauwer
