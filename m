Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wLq9-0000d8-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 13:09:25 +0100
Received: from mail.hamburg.pop.de ([193.98.9.7] helo=mail.provi.de)
	by smtp-out.hamburg.pop.de with esmtp (Exim 3.22 #1)
	id 17wLiy-0000yr-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 14:02:00 +0200
Received: from mail.jena.pop.de ([195.222.197.3])
	by mail.provi.de with esmtp (Exim 3.20 #2)
	id 17wLoV-0008Vi-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 14:07:43 +0200
Received: from goepel2.jena.provi.de (goepel2.jena.provi.de [195.222.197.91])
	by mail.jena.pop.de (8.9.3/8.9.3) with ESMTP id OAA09411
	for <linux-mtd@lists.infradead.org>; Tue, 1 Oct 2002 14:08:58 +0200
Received: from goepel.com (goepel109.goepel [172.16.1.109])
	by goepel2.jena.provi.de (8.10.0/8.10.0) with ESMTP id g91C8kj15098
	for <linux-mtd@lists.infradead.org>; Tue, 1 Oct 2002 14:08:46 +0200
Message-ID: <3D998F83.9000803@goepel.com>
Date: Tue, 01 Oct 2002 14:05:23 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Interesting MTD (jffs2) problem - magic bitmask not found
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hello...


i've posted this on linux-arm mailing list, but i think its also 
interesting for this list...

i run 2.4.18-rmk7 with mtd from cvs (mid september).
problem as follows:
# cat /proc/mtd
   dev:    size   erasesize  name
   mtd0: 00040000 00040000 "blob"
   mtd1: 00040000 00040000 "parm"
   mtd2: 00100000 00040000 "krnl"
   mtd3: 00400000 00040000 "rd"
   mtd4: 00100000 00040000 "krnl2"
   mtd5: 00400000 00040000 "rd2"
   mtd6: 01580000 00040000 "jffs2"
# mtd_debug info /dev/mtd6
   mtd.type = MTD_NORFLASH
   mtd.flags = MTD_CAP_NORFLASH
   mtd.size = 22544384 (21M)
   mtd.erasesize = 262144 (256K)
   mtd.oobblock = 0
   mtd.oobsize = 0
   mtd.ecctype = MTD_ECC_NONE
   regions = 0
# cd /root
# ls temp
   temp1  temp2
# mkfs.jffs2 -r temp -e 262144 -o jffs2img
# eraseall /dev/mtd6
   Erasing 256 Kibyte @ ...[snip]...  100% complete.
# cp jffs2img /dev/mtd6
# mount /dev/mtdblock6 -t jffs2 /mnt/jffs2/
# cd /mnt/jffs2
# ls
   temp1  temp2
# rm -r temp*
... [this tooks very long time] ...
# ls
# cd /
# umount /mnt/jffs2/
# mount /dev/mtdblock6 -t jffs2 /mnt/jffs2/
?????????????????????????????????????????????????????????????????????
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000:
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0xdc6d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000:
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
0x000c instead
...[snip]...
?????????????????????????????????????????????????????????????????????
# mount
   /dev/ramdisk on / type ext2 (rw)
   none on /proc type proc (rw)
   /dev/mtdblock6 on /mnt/jffs2 type jffs2 (rw)
# cd /mnt/jffs2/
# ls
#
...

best regards... Michael Palme
