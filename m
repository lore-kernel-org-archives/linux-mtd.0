Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fG2u-0006HJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 08:27:24 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id 300BB47A0
	for <linux-mtd@lists.infradead.org>; Fri,  7 Sep 2001 08:36:39 +0200 (CEST)
Message-ID: <3B987838.A7F8B7AA@dgt-lab.com.pl>
Date: Fri, 07 Sep 2001 09:33:12 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:(
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B35@mailse01.axis.se>
Content-Type: text/plain; charset=iso-8859-2
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

Jonas Holmberg wrote:

> > Does the size of the output from mkcramfs exceed the size of
> > the partition
> > the kernel thinks it's in?
>
> No, mkcramfs says: "Everything: 984 kilobytes"
>
> And the image created is 1007616 bytes (984 * 1024).
>

OK. Now I have cramfs on one chip and some partitions on second chip.

But writing my user partition (/dev/mtdblock4) destroys data from the
begining of my chip !
What's wrong?

Some logs:

>From kernel booting:
..................................................................................................................................................

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
Communications AB.
ATMA Flash 0x800000 at 0x41000000
Filesystem flash: Found 1 x16 devices at 0x0 in 16-bit mode
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
ATMA Flash 0x200000 at 0x40000000
Boot flash: Found 1 x16 devices at 0x0 in 16-bit mode
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
0: offset=0x0,size=0x4000,blocks=1
1: offset=0x4000,size=0x2000,blocks=2
2: offset=0x8000,size=0x8000,blocks=1
3: offset=0x10000,size=0x10000,blocks=31
Creating 4 MTD partitions on "Boot flash":
0x00000000-0x00020000 : "ppcboot"
0x00020000-0x00030000 : "config"
0x00030000-0x00100000 : "kernel"
0x00100000-0x00200000 : "user"


In system:
............................................................................................................................................................

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00010000 "Filesystem flash"
mtd1: 00020000 00010000 "ppcboot"
mtd2: 00010000 00010000 "config"
mtd3: 000d0000 00010000 "kernel"
mtd4: 00100000 00010000 "user"
# ls -l /dev/mtd*
crw-rw-rw-    1 517      517       90,   0 Sep  5 08:30 /dev/mtd0
crw-r--r--    1 root     root      90,   2 Sep  6 10:02 /dev/mtd1
crw-r--r--    1 root     root      90,   4 Sep  6 11:11 /dev/mtd2
crw-r--r--    1 root     root      90,   6 Sep  6 11:11 /dev/mtd3
crw-r--r--    1 root     root      90,   8 Sep  6 11:11 /dev/mtd4
brw-rw-rw-    1 517      517       31,   0 Sep  5 08:30 /dev/mtdblock0
crw-r--r--    1 root     root      31,   1 Sep  6 09:36 /dev/mtdblock1
brw-r--r--    1 root     root      31,   2 Sep  6 11:12 /dev/mtdblock2
brw-r--r--    1 root     root      31,   3 Sep  6 11:12 /dev/mtdblock3
brw-r--r--    1 root     root      31,   4 Sep  6 11:12 /dev/mtdblock4
crw-rw-rw-    1 517      517       90,   1 Sep  5 08:30 /dev/mtdr0
crw-r--r--    1 root     root      90,   3 Sep  6 10:02 /dev/mtdr1
#


Mounting:

# mount /dev/mtdblock4 /jffs2/
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x2705 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x7070 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x6f6f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x302e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x3320 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0x7567 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0x3920 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0x3031 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x2030 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x3333 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
...

???????????????????  ^^^^^^^^^^^ WHY
??????????????????????????????????????????????
--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
