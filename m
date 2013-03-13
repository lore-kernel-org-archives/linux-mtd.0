Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFj6L-00084E-A3
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:40:06 +0000
Message-ID: <1363171256.11441.2.camel@sauron.fi.intel.com>
Subject: Re: integck failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Date: Wed, 13 Mar 2013 12:40:56 +0200
In-Reply-To: <CAGWqfigQOiJHQh7emeN=e_6KqXGiFusPPCj07e6CmrFPizKCNA@mail.gmail.com>
References: <CAGWqfigQOiJHQh7emeN=e_6KqXGiFusPPCj07e6CmrFPizKCNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 16:23 +0100, Elie De Brauwer wrote:
> Hello all,
> 
> I'm currently testing on an MX28EVK board and my tests at this moment
> consist out of the following:
> <quote>
> insmod /home/root/mods/nandsim.ko  overridesize=11
> ubiattach -p /dev/mtd9
> ubimkvol /dev/ubi0 -s 30MiB -N test
> mount -t ubifs /dev/ubi0_0  /mnt/test_file_system/
> /home/root/tests/fs-tests/simple/perf
> (/home/root/tests/fs-tests/integrity/integck -n 100 -e
> /mnt/test_file_system 2>&1) >> /logfile.txt
> if [ "$?" = "0" ]; then
>        sync
>        reboot
> fi
> </quote>
> (Initially I tested this with *real* NAND chips, but I have no problem
> reproducing it with nandsim as well).
> 
> integck is the standard integck coming from mtd-utils but including
> (an earlier version of) the patches I submitted recently:
> http://lists.infradead.org/pipermail/linux-mtd/2013-March/045939.html
> . These patches should not influence the situation, but they should
> make the issue more 'visible'.
> 
> When when I look at the logfile above I see the following (
> http://pastebin.com/hVBu7bGn ) where "f2<=>90" means as much as
> printf("%x<=>%x\n", read_buf[r], check_buf[r]);. Or integck read
> "0xf2" but expected to read "0x90". If you later look at the files
> integck wrote you will see they contain 0x90 (the correct data).

What I see in the log is that integck wrote 1 byte at offset 0 many many
times. This looks really strange and not very random. I guess this is a
bug in the test? I have no clue what happened. I would suggest to run
integck with a verbose option and log what it is doing, and then check
the log.

-- 
Best Regards,
Artem Bityutskiy
