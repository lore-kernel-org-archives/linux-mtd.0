Received: from usstlz-psecap04.emerson.com ([144.191.128.16]
	helo=USSTLZ-PSECAP05.EMERSON.COM)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PC8K2-0006Va-5x
	for linux-mtd@lists.infradead.org; Sat, 30 Oct 2010 10:06:04 +0000
From: <Frisky.Li@Emerson.com>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 30 Oct 2010 10:05:27 +0000
Subject: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
Message-ID: <608527F32EA5304EAFF29F54C602AA89CB788D@usstlz-pmsgem09.emrsn.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,
I=92m debugging JFFS2 file system on NAND FLASH NAND08GW3B2C (8-bit width) =
with Freescale QorQ P4080 silicon 2.0.

u-boot is 2010-06. The kernel is 2.6.34.6. Both are using 36-bit addressing=
. Using "nand erase clean" to format NAND FLASH:
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<----------------------------------------=
-
=3D> nand erase clean
NAND erase: device 0 whole chip
Bad block table found at page 524224, version 0x01
Bad block table found at page 524160, version 0x01
nand_read_bbt: Bad block at 0x000002be0000
Skipping bad block at  0x02be0000
Skipping bad block at  0x3ff80000
Skipping bad block at  0x3ffa0000
Skipping bad block at  0x3ffc0000
Skipping bad block at  0x3ffe0000
OK
----------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


Then boot the board with NFS boot. Boot log for MTD (the first 0x1000000 by=
tes are reserved):
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<----------------------------------------=
-
fe8000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
fe8000000.flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
RedBoot partition parsing not available
Creating 6 MTD partitions on "fe8000000.flash":
0x000000000000-0x000000200000 : "NOR (RO) RCW"
0x000000200000-0x000001000000 : "NOR (RO) FMAN uCode"
0x000001000000-0x000006000000 : "NOR (RO) RAMDISK"
0x000006000000-0x000007d00000 : "NOR (RO) Linux Kernel Image"
0x000007d00000-0x000007ee0000 : "NOR (RO) DTB Image"
0x000007ee0000-0x000008000000 : "NOR (RO) U-Boot Image"
NAND device: Manufacturer ID: 0x20, Chip ID: 0xd3 (ST Micro NAND 1GiB 3,3V =
8-bit)
RedBoot partition parsing not available
Creating 2 MTD partitions on "ffa00000.flash":
0x000000000000-0x000001000000 : "NAND (RO) RESERVED"
0x000001000000-0x000040000000 : "NAND (RW) JFFS2"
eLBC NAND device at 0xfffa00000, bank 1
----------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


The NAND JFFS2 partition can be mounted successfully and I can read/write f=
iles on it. Then I re-mount it but error " jffs2_scan_eraseblock(): Magic b=
itmask 0x1985 not found " happens and then I dumped the page at 0x3ed40000:
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<----------------------------------------=
- [root@Blackadder-P4080 root]# uname -a
Linux Blackadder-P4080 2.6.34.6 #10 SMP Thu Oct 28 19:40:46 CST 2010 ppc GN=
U/Linux
[root@Blackadder-P4080 root]#
[root@Blackadder-P4080 root]# mount /dev/mtdblock7 /mnt/nand -t jffs2
[root@Blackadder-P4080 root]# cd /mnt/nand
[root@Blackadder-P4080 nand]# tar xjf /root/mtd-utils-1.4.1.tar.bz2
[root@Blackadder-P4080 nand]# tar xjf /root/mtd-utils-1.4.1.tar.bz2
[root@Blackadder-P4080 nand]# ls
mtd-utils-1.4.1
[root@Blackadder-P4080 nand]# cd -
/root
[root@Blackadder-P4080 root]# umount /mnt/nand
[root@Blackadder-P4080 root]# !mount
mount /dev/mtdblock7 /mnt/nand -t jffs2
Scanning NAND Flash blocks...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ed40000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ed60000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ed80000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3eda0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3edc0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ede0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ee00000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ee20000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ee40000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ee60000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ee80000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3eea0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3eec0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3eee0000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ef00000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ef20000: 0xe0=
ff instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x3ef40000: 0xe0=
ff instead
done
[root@Blackadder-P4080 root]# cd /mnt/nand
[root@Blackadder-P4080 nand]# cd mtd-utils-1.4.1/
[root@Blackadder-P4080 mtd-utils-1.4.1]# ls -l
total 383
-rw-rw-r-- 1 user user 18007 Oct 19 04:47 COPYING
-rwxrwxr-x 1 user user   786 Oct 19 04:47 MAKEDEV
-rw-rw-r-- 1 user user  1460 Oct 19 04:47 Makefile
-rw-rw-r-- 1 user user  1846 Oct 19 04:47 common.mk
-rw-rw-r-- 1 user user 14734 Oct 19 04:47 compr.c
-rw-rw-r-- 1 user user  3369 Oct 19 04:47 compr.h
-rw-rw-r-- 1 user user  2957 Oct 19 04:47 compr_lzo.c
-rw-rw-r-- 1 user user  2661 Oct 19 04:47 compr_rtime.c
-rw-rw-r-- 1 user user  3934 Oct 19 04:47 compr_zlib.c
-rw-rw-r-- 1 user user  4247 Oct 19 04:47 device_table.txt
-rw-rw-r-- 1 user user  3264 Oct 19 04:47 doc_loadbios.c
-rw-rw-r-- 1 user user  8869 Oct 19 04:47 docfdisk.c
-rw-rw-r-- 1 user user   366 Oct 19 04:47 feature-removal-schedule.txt
-rw-rw-r-- 1 user user  1980 Oct 19 04:47 fectest.c
-rw-rw-r-- 1 user user  3687 Oct 19 04:47 flash_erase.c
-rw-rw-r-- 1 user user  7137 Oct 19 04:47 flash_eraseall.c
-rw-rw-r-- 1 user user  1047 Oct 19 04:47 flash_info.c
-rw-rw-r-- 1 user user  1780 Oct 19 04:47 flash_lock.c
-rw-rw-r-- 1 user user  1041 Oct 19 04:47 flash_otp_dump.c
-rw-rw-r-- 1 user user  1264 Oct 19 04:47 flash_otp_info.c
-rw-rw-r-- 1 user user  1534 Oct 19 04:47 flash_otp_lock.c
-rw-rw-r-- 1 user user  1969 Oct 19 04:47 flash_otp_write.c
-rw-rw-r-- 1 user user  1418 Oct 19 04:47 flash_unlock.c
-rw-rw-r-- 1 user user 10932 Oct 19 04:47 flashcp.c
-rw-rw-r-- 1 user user  6536 Oct 19 04:47 ftl_check.c
-rw-rw-r-- 1 user user  9445 Oct 19 04:47 ftl_format.c
drwxrwxr-x 4 user user     0 Oct 19 04:47 include
-rw-rw-r-- 1 user user  8641 Oct 19 04:47 jffs-dump.c
-rw-rw-r-- 1 user user 22291 Oct 19 04:47 jffs2dump.c
-rw-rw-r-- 1 user user 21133 Oct 19 04:47 jffs2reader.c
drwxrwxr-x 2 user user     0 Oct 19 04:47 lib
-rwxrwxr-x 1 user user  4309 Oct 19 04:47 load_nandsim.sh
-rw-rw-r-- 1 user user  1539 Oct 19 04:47 mcast_image.h
-rw-rw-r-- 1 user user  6676 Oct 19 04:47 mkfs.jffs2.1
-rw-rw-r-- 1 user user 50632 Oct 19 04:47 mkfs.jffs2.c
drwxrwxr-x 3 user user     0 Oct 19 04:47 mkfs.ubifs
-rw-rw-r-- 1 user user   727 Oct 19 04:47 mtd-utils.spec
-rw-rw-r-- 1 user user  9525 Oct 19 04:47 mtd_debug.c
-rw-rw-r-- 1 user user 13386 Oct 19 04:47 nanddump.c
-rw-rw-r-- 1 user user  6085 Oct 19 04:47 nandtest.c
-rw-rw-r-- 1 user user 18464 Oct 19 04:47 nandwrite.c
-rw-rw-r-- 1 user user 12414 Oct 19 04:47 nftl_format.c
-rw-rw-r-- 1 user user  7788 Oct 19 04:47 nftldump.c
-rw-rw-r-- 1 user user  8624 Oct 19 04:47 rbtree.c
-rw-rw-r-- 1 user user  5173 Oct 19 04:47 rbtree.h
-rw-rw-r-- 1 user user 14842 Oct 19 04:47 recv_image.c
-rw-rw-r-- 1 user user  7281 Oct 19 04:47 rfddump.c
-rw-rw-r-- 1 user user  3388 Oct 19 04:47 rfdformat.c
-rw-rw-r-- 1 user user  7823 Oct 19 04:47 serve_image.c
-rw-rw-r-- 1 user user  4860 Oct 19 04:47 summary.h
-rw-rw-r-- 1 user user 27167 Oct 19 04:47 sumtool.c
drwxrwxr-x 6 user user     0 Oct 19 04:47 tests
drwxrwxr-x 5 user user     0 Oct 19 04:47 ubi-utils
[root@Blackadder-P4080 mtd-utils-1.4.1]#
[root@Blackadder-P4080 mtd-utils-1.4.1]# nanddump -p -s 0x3ed40000 /dev/mtd=
7
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 5
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x3ed40000 and ending at 0x3f000000...
0x3ed40000: e0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed400f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed401f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed402f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed403f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed404f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed405f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed406f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed40790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x3ed407f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff 19 85 20 03 00 00 00 aa aa 6a 08 ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
...........
...........
...........
...........
----------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



I have worked on trying to fix it for whole week, but failed. Please help, =
thank u!




Frisky
