Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1430NQ-0004f5-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 18:30:12 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1430N2-0004es-00
	for mtd@infradead.org; Mon, 04 Dec 2000 18:29:48 +0000
Received: from iliad.amd.com (iliad.amd.com [163.181.250.7])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id MAA21231
	for <mtd@infradead.org>; Mon, 4 Dec 2000 12:29:15 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118]) by
 amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id MAA12715 for
 <mtd@infradead.org>; Mon, 4 Dec 2000 12:29:13 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F20D@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Odd behavior of JFFS with AMD chips - kernel panic!
Date: Mon, 4 Dec 2000 12:29:10 -0600
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----_=_NextPart_000_01C05E20.191C5328"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C05E20.191C5328
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

I'm still working on diagnosising what's causing my problems
with JFFS and MTD.

I built a version of the Dec 3rd MTD code for my device, and
booted the kernel.

As far as I can tell, my device works fine with the char interface,
and I was able to build a file system image and put it in flash
using 'cat Flash.img > /dev/mtd2'

mounting the flash system with 'mount -t jffs /dev/mtdblock2 /tst'
also seemed to work.

However, when I copied a file on the filesystem, using 'cp lilo.conf first',
it looks like the write failed and MTD/jffs decided to reorganize
the entire hard drive.  At least some of the writes don't work out,
and the new file on the drive is corrupt.  When I attempt 'more first',
the system reads the first 20 bytes of the file and then has a kernel
panic in flash_safe_read.  Not good.

I'm including my syslog output of the appropriate messages.  I think
some of them were lost to my terminal program's buffer, but I hope
there's enough here that someone can provide some suggestions for 
what I'm doing wrong.  I'll be more than happy to run any additional
tests to provide more information.

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


------_=_NextPart_000_01C05E20.191C5328
Content-Type: text/plain;
 charset=us-ascii;
 name=flashdumpnew.txt
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename=flashdumpnew.txt

mount -t jffs /dev/mtdblock2 /tst
Dec  4 11:55:04 netlinux kernel:     fb3autodetect (ino: 81, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:     fd0u3520 (ino: 121, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:     hda (ino: 161, highest_version: 1, =
size: 2)
Dec  4 11:55:04 netlinux kernel:     hdb8 (ino: 201, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     hdd6 (ino: 241, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     nst1l (ino: 281, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptybf (ino: 321, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptye7 (ino: 361, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyqf (ino: 401, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyt7 (ino: 441, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyw0 (ino: 481, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyy8 (ino: 521, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ram8 (ino: 561, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     sdb9 (ino: 601, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     st0a (ino: 641, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     tty35 (ino: 681, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttya1 (ino: 721, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyc8 (ino: 761, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyp0 (ino: 801, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyr8 (ino: 841, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyu0 (ino: 881, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyw8 (ino: 921, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyz0 (ino: 961, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcs29 (ino: 1001, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcs8 (ino: 1041, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcsa42 (ino: 1081, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:     xdb4 (ino: 1121, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     mtdr0 (ino: 1161, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     fb3 (ino: 80, highest_version: 1, =
size: 2)
Dec  4 11:55:04 netlinux kernel:     fd0u3200 (ino: 120, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:     full (ino: 160, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     hdb7 (ino: 200, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     hdd5 (ino: 240, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     nst1a (ino: 280, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptybe (ino: 320, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptye6 (ino: 360, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyqe (ino: 400, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyt6 (ino: 440, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyvf (ino: 480, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ptyy7 (ino: 520, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ram7 (ino: 560, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     sdb8 (ino: 600, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     st0 (ino: 640, highest_version: 1, =
size: 2)
Dec  4 11:55:04 netlinux kernel:     tty34 (ino: 680, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttya0 (ino: 720, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyc7 (ino: 760, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyef (ino: 800, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyr7 (ino: 840, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttytf (ino: 880, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyw7 (ino: 920, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     ttyyf (ino: 960, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcs28 (ino: 1000, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcs7 (ino: 1040, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     vcsa41 (ino: 1080, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:     xdb3 (ino: 1120, highest_version: =
1, size: 2)
Dec  4 11:55:04 netlinux kernel:     mtdblock9 (ino: 1160, =
highest_version: 1, size: 2)
Dec  4 11:55:04 netlinux kernel:   etc/ (ino: 1178, highest_version: 1, =
size: 0)
Dec  4 11:55:04 netlinux kernel:     group (ino: 1199, highest_version: =
1, size: 259)
Dec  4 11:55:04 netlinux kernel:     nsswitch.conf (ino: 1198, =
highest_version: 1, size: 239)
Dec  4 11:55:04 netlinux kernel:     services (ino: 1197, =
highest_version: 1, size: 8377)
Dec  4 11:55:04 netlinux kernel:     resolv.conf (ino: 1196, =
highest_version: 1, size: 121)
Dec  4 11:55:04 netlinux kernel:     protocols (ino: 1195, =
highest_version: 1, size: 894)
Dec  4 11:55:08 netlinux kernel:     issue.net (ino: 1194, =
highest_version: 1, size: 58)
Dec  4 11:55:08 netlinux kernel:     rc.d/ (ino: 1182, highest_version: =
1, size: 0)
Dec  4 11:55:08 netlinux kernel:       rcS (ino: 1193, highest_version: =
1, size: 902)
Dec  4 11:55:08 netlinux kernel:       rc.serial (ino: 1192, =
highest_version: 1, size: 18)
Dec  4 11:55:08 netlinux kernel:       rc.rofilesys.example (ino: 1191, =
highest_version: 1, size: 3813)
Dec  4 11:55:08 netlinux kernel:       rc.modules (ino: 1190, =
highest_version: 1, size: 18)
Dec  4 11:55:08 netlinux kernel:       rc.local (ino: 1189, =
highest_version: 1, size: 18)
Dec  4 11:55:08 netlinux kernel:       init.d/ (ino: 1183, =
highest_version: 1, size: 0)
Dec  4 11:55:08 netlinux kernel:         S05syslog (ino: 1188, =
highest_version: 1, size: 1768)
Dec  4 11:55:08 netlinux kernel:         S20network (ino: 1187, =
highest_version: 1, size: 1690)
Dec  4 11:55:08 netlinux kernel:         S30telnet (ino: 1186, =
highest_version: 1, size: 692)
Dec  4 11:55:08 netlinux kernel:         S90thttpd (ino: 1185, =
highest_version: 1, size: 898)
Dec  4 11:55:08 netlinux kernel:         S25firewall (ino: 1184, =
highest_version: 1, size: 25054)
Dec  4 11:55:08 netlinux kernel:     mtab (ino: 1181, highest_version: =
1, size: 12)
Dec  4 11:55:08 netlinux kernel:     inittab (ino: 1180, =
highest_version: 1, size: 390)
Dec  4 11:55:08 netlinux kernel:     fstab (ino: 1179, highest_version: =
1, size: 104)
Dec  4 11:55:08 netlinux kernel:     lilo.conf (ino: 1206, =
highest_version: 1, size: 526)
Dec  4 11:55:08 netlinux kernel:     shadow- (ino: 1205, =
highest_version: 1, size: 336)
Dec  4 11:55:08 netlinux kernel:     ld.so.cache (ino: 1204, =
highest_version: 1, size: 562)
Dec  4 11:55:08 netlinux kernel:     syslog.conf (ino: 1203, =
highest_version: 1, size: 1011)
Dec  4 11:55:08 netlinux kernel:     shadow (ino: 1202, =
highest_version: 1, size: 348)
Dec  4 11:55:08 netlinux kernel:     securetty (ino: 1201, =
highest_version: 1, size: 88)
Dec  4 11:55:08 netlinux kernel:     passwd (ino: 1200, =
highest_version: 1, size: 448)
Dec  4 11:55:08 netlinux kernel:   sbin/ (ino: 1258, highest_version: =
1, size: 0)
Dec  4 11:55:08 netlinux kernel:     swapon (ino: 1279, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     swapoff (ino: 1278, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     sfdisk (ino: 1277, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     rmmod (ino: 1276, highest_version: =
1, size: 12)
Dec  4 11:55:08 netlinux kernel:     reboot (ino: 1275, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     poweroff (ino: 1274, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     mkswap (ino: 1273, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     mkfDec  4 11:55:08 netlinux =
kernel:     makedevs (ino: 1271, highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     lsmod (ino: 1270, highest_version: =
1, size: 12)
Dec  4 11:55:08 netlinux kernel:     loadkmap (ino: 1269, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     init (ino: 1268, highest_version: =
1, size: 12)
Dec  4 11:55:08 netlinux kernel:     halt (ino: 1267, highest_version: =
1, size: 12)
Dec  4 11:55:08 netlinux kernel:     fsck.minix (ino: 1266, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     freeramdisk (ino: 1265, =
highest_version: 1, size: 12)
Dec  4 11:55:08 netlinux kernel:     getty (ino: 1264, highest_version: =
1, size: 14)
Dec  4 11:55:08 netlinux kernel:     e2fsck (ino: 1263, =
highest_version: 13, size: 413624)
Dec  4 11:55:08 netlinux kernel:     fsck.ext2 (ino: 1262, =
highest_version: 13, size: 413624)
Dec  4 11:55:08 netlinux kernel:     fsck (ino: 1261, highest_version: =
1, size: 10960)
Dec  4 11:55:10 netlinux kernel:     ip (ino: 1260, highest_version: 3, =
size: 84600)
Dec  4 11:55:10 netlinux kernel:     ipchains (ino: 1259, =
highest_version: 3, size: 80692)
Dec  4 11:55:10 netlinux kernel:   lib/ (ino: 1217, highest_version: 1, =
size: 0)
Dec  4 11:55:10 netlinux kernel:     libncurses.so.4 (ino: 1239, =
highest_version: 1, size: 17)
Dec  4 11:55:10 netlinux kernel:     libresolv.so.2 (ino: 1238, =
highest_version: 1, size: 18)
Dec  4 11:55:10 netlinux kernel:     libresolv-2.1.2.so (ino: 1237, =
highest_version: 2, size: 43545)
Dec  4 11:55:10 netlinux kernel:     libnss_files.so.2 (ino: 1236, =
highest_version: 1, size: 21)
Dec  4 11:55:10 netlinux kernel:     libnss_files-2.1.2.so (ino: 1235, =
highest_version: 2, size: 39571)
Dec  4 11:55:10 netlinux kernel:     libnss_dns.so.2 (ino: 1234, =
highest_version: 1, size: 19)
Dec  4 11:55:10 netlinux kernel:     libnss_dns-2.1.2.so (ino: 1233, =
highest_version: 1, size: 15077)
Dec  4 11:55:10 netlinux kernel:     libnss_compat.so.2 (ino: 1232, =
highest_version: 1, size: 22)
Dec  4 11:55:10 netlinux kernel:     libnss_compat-2.1.2.so (ino: 1231, =
highest_version: 2, size: 51384)
Dec  4 11:55:10 netlinux kernel:     libnsl.so.1 (ino: 1230, =
highest_version: 1, size: 15)
Dec  4 11:55:10 netlinux kernel:     libnsl-2.1.2.so (ino: 1229, =
highest_version: 3, size: 97618)
Dec  4 11:55:10 netlinux kernel:     libm.so.6 (ino: 1228, =
highest_version: 1, size: 13)
Dec  4 11:55:10 netlinux kernel:     libm-2.1.2.so (ino: 1227, =
highest_version: 1, size: 4521)
Dec  4 11:55:10 netlinux kernel:     libdl.so.2 (ino: 1226, =
highest_version: 1, size: 14)
Dec  4 11:55:10 netlinux kernel:     libdl-2.1.2.so (ino: 1225, =
highest_version: 1, size: 4641)
Dec  4 11:55:10 netlinux kernel:     libcrypt.so.1 (ino: 1224, =
highest_version: 1, size: 17)
Dec  4 11:55:10 netlinux kernel:     libcrypt-2.1.2.so (ino: 1223, =
highest_version: 1, size: 4431)
Dec  4 11:55:10 netlinux kernel:     libc.so.6 (ino: 1222, =
highest_version: 1, size: 13)
Dec  4 11:55:14 netlinux kernel:     libc-2.1.2.so (ino: 1221, =
highest_version: 19, size: 622255)
Dec  4 11:55:14 netlinux kernel:     ld-linux.so.2 (ino: 1220, =
highest_version: 1, size: 11)
Dec  4 11:55:14 netlinux kernel:     ld-2.1.2.so (ino: 1219, =
highest_version: 3, size: 95645)
Dec  4 11:55:14 netlinux kernel:     libncurses.so.4.2 (ino: 1218, =
highest_version: 9, size: 281191)
Dec  4 11:55:14 netlinux kernel:   boot/ (ino: 52, highest_version: 1, =
size: 0)
Dec  4 11:55:14 netlinux kernel:     map (ino: 58, highest_version: 1, =
size: 13824)
Dec  4 11:55:14 netlinux kernel:     boot.0308 (ino: 57, =
highest_version: 1, size: 512)
Dec  4 11:55:14 netlinux kernel:     vmlinuz.imp (ino: 56, =
highest_version: 14, size: 458295)
Dec  4 11:55:14 netlinux kernel:     vmlinuz.zimg (ino: 55, =
highest_version: 14, size: 458300)
Dec  4 11:55:14 netlinux kernel:     boot.b (ino: 54, highest_version: =
1, size: 4580)
Dec  4 11:55:14 netlinux kernel:     bzembImage (ino: 53, =
highest_version: 12, size: 386982)
Dec  4 11:55:14 netlinux kernel:   home/ (ino: 1207, highest_version: =
1, size: 0)
Dec  4 11:55:14 netlinux kernel:     mlangsdo/ (ino: 1213, =
highest_version: 1, size: 0)
Dec  4 11:55:14 netlinux kernel:       amd/ (ino: 1216, =
highest_version: 1, size: 0)
Dec  4 11:55:14 netlinux kernel:       ToOeE.txt (ino: 1215, =
highest_version: 1, size: 10326)
Dec  4 11:55:14 netlinux kernel:       offers (ino: 1214, =
highest_version: 1, size: 338)
Dec  4 11:55:14 netlinux kernel:     httpd/ (ino: 1208, =
highest_version: 1, size: 0)
Dec  4 11:55:14 netlinux kernel:       html/ (ino: 1209, =
highest_version: 1, size: 0)
Dec  4 11:55:14 netlinux kernel:         lineo.gif (ino: 1212, =
highest_version: 1, size: 1591)
Dec  4 11:55:14 netlinux kernel:         index.html (ino: 1211, =
highest_version: 1, size: 1106)
Dec  4 11:55:14 netlinux kernel:         cgi-bin/ (ino: 1210, =
highest_version: 1, size: 0)
Dec  4 11:55:14 netlinux kernel:   bin/ (ino: 3, highest_version: 1, =
size: 0)
Dec  4 11:55:14 netlinux kernel:     pwd (ino: 39, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     ps (ino: 38, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     ping (ino: 37, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     mv (ino: 36, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     mt (ino: 35, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     mount (ino: 34, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     more (ino: 33, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     mknod (ino: 32, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     mkdir (ino: 31, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     ls (ino: 30, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     ln (ino: 29, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     kill (ino: 28, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     gzip (ino: 27, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     gunzip (ino: 26, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     grep (ino: 25, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     fdflush (ino: 24, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     false (ino: 23, highest_version: =
1, size: 12)
Dec  4 11:55:14 netlinux kernel:     echo (ino: 22, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     du (ino: 21, highest_version: 1, =
size: 12)
Dec  4 11:55:14 netlinux kernel:     dmesg (ino: 20, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     df (ino: 19, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     dd (ino: 18, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     date (ino: 17, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     cp (ino: 16, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     chown (ino: 15, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     chmod (ino: 14, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     chgrp (ino: 13, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     cat (ino: 12, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     busybox (ino: 11, highest_version: =
6, size: 187280)
Dec  4 11:55:18 netlinux kernel:     sh (ino: 51, highest_version: 1, =
size: 3)
Dec  4 11:55:18 netlinux kernel:     tinylogin (ino: 10, =
highest_version: 2, size: 50576)
Dec  4 11:55:18 netlinux kernel:     ash (ino: 50, highest_version: 3, =
size: 95580)
Dec  4 11:55:18 netlinux kernel:     su (ino: 9, highest_version: 1, =
size: 14)
Dec  4 11:55:18 netlinux kernel:     zcat (ino: 49, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     login (ino: 8, highest_version: 1, =
size: 14)
Dec  4 11:55:18 netlinux kernel:     uname (ino: 48, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     deluser (ino: 7, highest_version: =
1, size: 14)
Dec  4 11:55:18 netlinux kernel:     umount (ino: 47, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     delgroup (ino: 6, highest_version: =
1, size: 14)
Dec  4 11:55:18 netlinux kernel:     true (ino: 46, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     adduser (ino: 5, highest_version: =
1, size: 14)
Dec  4 11:55:18 netlinux kernel:     tar (ino: 45, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     addgroup (ino: 4, highest_version: =
1, size: 14)
Dec  4 11:55:18 netlinux kernel:     sync (ino: 44, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     sleep (ino: 43, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     sed (ino: 42, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:     rmdir (ino: 41, highest_version: =
1, size: 12)
Dec  4 11:55:18 netlinux kernel:     rm (ino: 40, highest_version: 1, =
size: 12)
Dec  4 11:55:18 netlinux kernel:   root/ (ino: 1243, highest_version: =
1, size: 0)
Dec  4 11:55:18 netlinux kernel:     d4test/ (ino: 1255, =
highest_version: 1, size: 0)
Dec  4 11:55:18 netlinux kernel:       thing (ino: 1257, =
highest_version: 1, size: 97)
Dec  4 11:55:18 netlinux kernel:       vmlinuz.wrks (ino: 1256, =
highest_version: 16, size: 494731)
Dec  4 11:55:18 netlinux kernel:     d3test/ (ino: 1252, =
highest_version: 1, size: 0)
Dec  4 11:55:18 netlinux kernel:       thing (ino: 1254, =
highest_version: 1, size: 97)
Dec  4 11:55:18 netlinux kernel:       vmlinuz.wrks (ino: 1253, =
highest_version: 16, size: 494731)
Dec  4 11:55:18 netlinux kernel:     d2test/ (ino: 1249, =
highest_version: 1, size: 0)
Dec  4 11:55:18 netlinux kernel:       thing (ino: 1251, =
highest_version: 1, size: 97)
Dec  4 11:55:18 netlinux kernel:       vmlinuz.wrks (ino: 1250, =
highest_version: 16, size: 494731)
Dec  4 11:55:18 netlinux kernel:     dtest/ (ino: 1246, =
highest_version: 1, size: 0)
Dec  4 11:55:18 netlinux kernel:       thing (ino: 1248, =
highest_version: 1, size: 97)
Dec  4 11:55:18 netlinux kernel:       vmlinuz.wrks (ino: 1247, =
highest_version: 16, size: 494731)
Dec  4 11:55:18 netlinux kernel:     lilo.conf (ino: 1245, =
highest_version: 1, size: 467)
Dec  4 11:55:18 netlinux kernel:     .profile (ino: 1244, =
highest_version: 1, size: 80)
Dec  4 11:55:18 netlinux kernel:   lost+found/ (ino: 2, =
highest_version: 1, size: 0)
Dec  4 11:55:18 netlinux kernel:   proc/ (ino: 1242, highest_version: =
1, size: 0)
Dec  4 11:55:18 netlinux kernel:   tst/ (ino: 1362, highest_version: 1, =
size: 0)
Dec  4 11:55:22 netlinux kernel:   opt/ (ino: 1241, highest_version: 1, =
size: 0)
Dec  4 11:55:22 netlinux kernel:   usr/ (ino: 1281, highest_version: 1, =
size: 0)
Dec  4 11:55:22 netlinux kernel:     share/ (ino: 1318, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:       terminfo/ (ino: 1319, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:         x/ (ino: 1340, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           xterm-xfree86 (ino: 1343, =
highest_version: 1, size: 1840)
Dec  4 11:55:22 netlinux kernel:           xterm-new (ino: 1342, =
highest_version: 1, size: 18)
Dec  4 11:55:22 netlinux kernel:           xterm (ino: 1341, =
highest_version: 1, size: 1366)
Dec  4 11:55:22 netlinux kernel:         v/ (ino: 1334, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           vt52 (ino: 1339, =
highest_version: 1, size: 462)
Dec  4 11:55:22 netlinux kernel:           vt220 (ino: 1338, =
highest_version: 1, size: 975)
Dec  4 11:55:22 netlinux kernel:           vt200 (ino: 1337, =
highest_version: 1, size: 10)
Dec  4 11:55:22 netlinux kernel:           vt100-am (ino: 1336, =
highest_version: 1, size: 10)
Dec  4 11:55:22 netlinux kernel:           vt100 (ino: 1335, =
highest_version: 1, size: 1143)
Dec  4 11:55:22 netlinux kernel:         s/ (ino: 1328, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           sun2 (ino: 1333, =
highest_version: 1, size: 8)
Dec  4 11:55:22 netlinux kernel:           sun1 (ino: 1332, =
highest_version: 1, size: 8)
Dec  4 11:55:22 netlinux kernel:           sun (ino: 1331, =
highest_version: 1, size: 1019)
Dec  4 11:55:22 netlinux kernel:           screen-w (ino: 1330, =
highest_version: 1, size: 1334)
Dec  4 11:55:22 netlinux kernel:           screen (ino: 1329, =
highest_version: 1, size: 1318)
Dec  4 11:55:22 netlinux kernel:         r/ (ino: 1326, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           rxvt (ino: 1327, =
highest_version: 1, size: 1627)
Dec  4 11:55:22 netlinux kernel:         l/ (ino: 1324, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           linux (ino: 1325, =
highest_version: 1, size: 1552)
Dec  4 11:55:22 netlinux kernel:         d/ (ino: 1322, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           dumb (ino: 1323, =
highest_version: 1, size: 308)
Dec  4 11:55:22 netlinux kernel:         a/ (ino: 1320, =
highest_version: 1, size: 0)
Dec  4 11:55:22 netlinux kernel:           ansi (ino: 1321, =
highest_version: 1, size: 1450)
Dec  4 11:55:22 netlinux kernel:     lib/ (ino: 1344, highest_version: =
1, size: 0)
Dec  4 11:55:22 netlinux kernel:       libslang.so.1 (ino: 1346, =
highest_version: 1, size: 17)
Dec  4 11:55:22 netlinux kernel:       libslang.so.1.3.7 (ino: 1345, =
highest_version: 12, size: 366280)
Dec  4 11:55:22 netlinux kernel:     bin/ (ino: 1289, highest_version: =
1, size: 0)
Dec  4 11:55:22 netlinux kernel:       whoami (ino: 1317, =
highest_version: 1, size: 12)
Dec  4 11:55:22 netlinux kernel:       uptime (ino: 1316, =
highest_version: 1, size: 12)
Dec  4 11:55:22 netlinux kernel:       tty (ino: 1315, highest_version: =
1, size: 12)
Dec  4 11:55:23 netlinux kernel:       tr (ino: 1314, highest_version: =
1, size: 12)
Dec  4 11:55:23 netlinux kernel:       tail (ino: 1313, =
highest_version: 1, size: 12)
Dec  4 11:55:23 netlinux kernel:       printf (ino: 1312, =
highest_version: 1, size: 12)
Dec  4 11:55:23 netlinux kernel:       nslookup (ino: 1311, =
highest_version: 1, size: 12)
Dec  4 11:55:23 netlinux kernel:       mnc (ino: 1310, highest_version: =
1, size: 12)
Dec  4 11:55:23 netlinux kernel:       mkfifo (ino: 1309, =
highest_version: 1, size: 12)
Dec  4 11:55:23 netlinux kernel:       math (ino: 1308, =
highest_version: 1, size: 12)
Dec  4 11:55:26 netlinux kernel:       logger (ino: 1307, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       loadfont (ino: 1306, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       loadacm (ino: 1305, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       length (ino: 1304, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       killall (ino: 1303, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       hostid (ino: 1302, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       free (ino: 1301, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       find (ino: 1300, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       dirname (ino: 1299, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       clear (ino: 1298, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       chvt (ino: 1297, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       basename (ino: 1296, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       passwd (ino: 1295, =
highest_version: 1, size: 14)
Dec  4 11:55:27 netlinux kernel:       strace (ino: 1294, =
highest_version: 4, size: 102188)
Dec  4 11:55:27 netlinux kernel:       ftp (ino: 1293, highest_version: =
2, size: 64116)
Dec  4 11:55:27 netlinux kernel:       telnet (ino: 1292, =
highest_version: 4, size: 104796)
Dec  4 11:55:27 netlinux kernel:       vi (ino: 1291, highest_version: =
1, size: 5)
Dec  4 11:55:27 netlinux kernel:       elvis (ino: 1290, =
highest_version: 3, size: 78130)
Dec  4 11:55:27 netlinux kernel:     sbin/ (ino: 1282, highest_version: =
1, size: 0)
Dec  4 11:55:27 netlinux kernel:       syslogd (ino: 1288, =
highest_version: 1, size: 25916)
Dec  4 11:55:27 netlinux kernel:       klogd (ino: 1287, =
highest_version: 1, size: 19260)
Dec  4 11:55:27 netlinux kernel:       fbset (ino: 1286, =
highest_version: 1, size: 12)
Dec  4 11:55:27 netlinux kernel:       telnet_wrapper (ino: 1285, =
highest_version: 1, size: 164)
Dec  4 11:55:27 netlinux kernel:       in.telnetd (ino: 1284, =
highest_version: 2, size: 36596)
Dec  4 11:55:27 netlinux kernel:       thttpd (ino: 1283, =
highest_version: 3, size: 71828)
Dec  4 11:55:27 netlinux kernel:   mnt/ (ino: 1240, highest_version: 1, =
size: 0)
Dec  4 11:55:27 netlinux kernel:   tmp/ (ino: 1280, highest_version: 1, =
size: 0)
Dec  4 11:55:27 netlinux kernel: jffs_read_inode(): inode->i_ino =3D=3D =
1
Dec  4 11:55:27 netlinux kernel: jffs_find_file(): ino: 1
Dec  4 11:55:27 netlinux kernel: jffs_find_file(): Found file with ino =
1. (name: "")

cd /tst/root/
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): inode: 0xc0b0cdd0, =
filp: 0xc092ceb0
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "." 1
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): ".." 1
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "var" ino: 1347
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "dev" ino: 59
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "etc" ino: 1178
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "sbin" ino: 1258
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "lib" ino: 1217
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "boot" ino: 52
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "home" ino: 1207
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "bin" ino: 3
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "root" ino: 1243
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "lost+found" ino: 2
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "proc" ino: 1242
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "tst" ino: 1362
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "opt" ino: 1241
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "usr" ino: 1281
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "mnt" ino: 1240
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): "tmp" ino: 1280
Dec  4 11:55:59 netlinux kernel: jffs_readdir(): inode: 0xc0b0cdd0, =
filp: 0xc092ceb0
Dec  4 11:55:59 netlinux kernel: jffs_lookup(): dir: 0xc0b0cdd0, name: =
"root"
Dec  4 11:55:59 netlinux kernel: jffs_find_child()
Dec  4 11:55:59 netlinux kernel: jffs_find_child(): Found "root".
Dec  4 11:55:59 netlinux kernel: jffs_read_inode(): inode->i_ino =3D=3D =
1243
Dec  4 11:55:59 netlinux kernel: jffs_find_file(): ino: 1243
Dec  4 11:55:59 netlinux kernel: jffs_find_file(): Found file with ino =
1243. (name: "root")

cp lilo.conf first (long delay)
Dec  4 11:59:14 netlinux kernel:         0x0000,     /* gid  */
Dec  4 11:59:14 netlinux kernel:         0x3a27f644, /* atime  */
Dec  4 11:59:14 netlinux kernel:         0x3a01980c, /* mtime  */
Dec  4 11:59:14 netlinux kernel:         0x3a01980c, /* ctime  */
Dec  4 11:59:18 netlinux kernel:         0x00000000, /* offset  */
Dec  4 11:59:18 netlinux kernel:         0x0000000e, /* dsize  */
Dec  4 11:59:18 netlinux kernel:         0x0000000e, /* rsize  */
Dec  4 11:59:18 netlinux kernel:         0x02,       /* nsize  */
Dec  4 11:59:18 netlinux kernel:         0x01,       /* nlink  */
Dec  4 11:59:18 netlinux kernel:         0x00,       /* spare  */
Dec  4 11:59:18 netlinux kernel:         0,          /* rename  */
Dec  4 11:59:18 netlinux kernel:         0,          /* deleted  */
Dec  4 11:59:18 netlinux kernel:         0xff,       /* accurate  */
Dec  4 11:59:18 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 11:59:18 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 11:59:18 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 11:59:18 netlinux kernel: }
Dec  4 11:59:18 netlinux kernel: jffs_rewrite_data(): Writing name "su" =
to pos 0x7156572l.
Dec  4 11:59:18 netlinux kernel: , result: 0x000000e8
Dec  4 11:59:18 netlinux kernel: jffs_read_data(): file =3D "su", =
read_offset =3D 0, size =3D 14
Dec  4 11:59:18 netlinux kernel:   jffs_get_node_data(): file: "su", =
ino: 9, version: 1, node_offset: 0
Dec  4 11:59:18 netlinux kernel:   jffs_get_node_data(): Read 14 bytes.
Dec  4 11:59:18 netlinux kernel:   jffs_read_data(): Read 14 bytes.
Dec  4 11:59:18 netlinux kernel: , result: 0x00000574
Dec  4 11:59:18 netlinux kernel: , result: 0x0000075d
Dec  4 11:59:18 netlinux kernel: jffs_insert_node(): ino =3D 9, version =
=3D 2, name =3D "su", deleted =3D 0
Dec  4 11:59:18 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 11:59:18 netlinux kernel: jffs_update_file(): ino: 9, version: 2
Dec  4 11:59:18 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 14
Dec  4 11:59:18 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 9, version: 1
Dec  4 11:59:18 netlinux kernel: jffs_fmfree(): node->ino =3D 9, =
node->version =3D 1
Dec  4 11:59:18 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:18 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 14, f->size =3D 0
Dec  4 11:59:18 netlinux kernel: jffs_insert_data(): f->size =3D 14
Dec  4 11:59:18 netlinux kernel: jffs_remove_redundant_nodes(): ino: 9, =
name: "su", newest_type: 7
Dec  4 11:59:18 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:18 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:18 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:18 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #10, fmc->dirty_size =3D 142500
Dec  4 11:59:18 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:18 netlinux kernel: {
Dec  4 11:59:18 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:18 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:18 netlinux kernel:         7014092, /* used_size  */
Dec  4 11:59:18 netlinux kernel:         142500, /* dirty_size  */
Dec  4 11:59:18 netlinux kernel:         8047760, /* free_size  */
Dec  4 11:59:18 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:18 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:18 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:18 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:18 netlinux kernel:         0xc06445c0, /* head  */    =
(head->offset =3D 0x00000000)
Dec  4 11:59:18 netlinux kernel:         0xc0644d10, /* tail  */    =
(tail->offset + tail->size =3D 0x006d3370)
Dec  4 11:59:18 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:18 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:18 netlinux kernel: }
Dec  4 11:59:18 netlinux kernel: jffs_try_to_erase()
Dec  4 11:59:18 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 11:59:23 netlinux kernel: jffs_get_oldest_node(): ino =3D 10, =
version =3D 1
Dec  4 11:59:23 netlinux kernel: jffs_find_file(): ino: 10
Dec  4 11:59:23 netlinux kernel: jffs_find_file(): Found file with ino =
10. (name: "tinylogin")
Dec  4 11:59:23 netlinux kernel: jffs_garbage_collect_next(): =
"tinylogin", ino: 10, version: 1, location 0x2b8, dsize 32768
Dec  4 11:59:23 netlinux kernel:   total_name_size: 12
Dec  4 11:59:23 netlinux kernel:   data_size: 50576
Dec  4 11:59:23 netlinux kernel:   size: 50648
Dec  4 11:59:23 netlinux kernel:   f->nsize: 9
Dec  4 11:59:23 netlinux kernel:   f->size: 50576
Dec  4 11:59:23 netlinux kernel:   node->data_offset: 0
Dec  4 11:59:23 netlinux kernel:   free_chunk_size1: 8047760
Dec  4 11:59:23 netlinux kernel:   free_chunk_size2: 0
Dec  4 11:59:23 netlinux kernel:   node->fm->offset: 0x000002b8
Dec  4 11:59:23 netlinux kernel: ***jffs_rewrite_data(): node: 10, =
name: "tinylogin", size: 50576
Dec  4 11:59:23 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 50648, node =3D 0xc0cea1c0
Dec  4 11:59:23 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
8047760, free_chunk_size2 =3D 0
Dec  4 11:59:23 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:23 netlinux kernel: {
Dec  4 11:59:23 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:23 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:23 netlinux kernel:         7064740, /* used_size  */
Dec  4 11:59:23 netlinux kernel:         142500, /* dirty_size  */
Dec  4 11:59:23 netlinux kernel:         7997112, /* free_size  */
Dec  4 11:59:23 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:23 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:23 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:23 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:23 netlinux kernel:         0xc06445c0, /* head  */    =
(head->offset =3D 0x00000000)
Dec  4 11:59:23 netlinux kernel:         0xc0644c80, /* tail  */    =
(tail->offset + tail->size =3D 0x006df948)
Dec  4 11:59:23 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:23 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:23 netlinux kernel: }
Dec  4 11:59:23 netlinux kernel: struct jffs_fm: 0xc0644c80
Dec  4 11:59:23 netlinux kernel: {
Dec  4 11:59:23 netlinux kernel:        0x006d3370, /* offset  */
Dec  4 11:59:23 netlinux kernel:        50648, /* size  */
Dec  4 11:59:23 netlinux kernel:        0xc0644d10, /* prev  */
Dec  4 11:59:23 netlinux kernel:        0x00000000, /* next  */
Dec  4 11:59:23 netlinux kernel:        0xc0644cb0, /* nodes  */
Dec  4 11:59:23 netlinux kernel: }
Dec  4 11:59:23 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x7156592l.
Dec  4 11:59:23 netlinux kernel: jffs_raw_inode: inode number: 10
Dec  4 11:59:23 netlinux kernel: {
Dec  4 11:59:23 netlinux kernel:         0x34383931, /* magic  */
Dec  4 11:59:23 netlinux kernel:         0x0000000a, /* ino  */
Dec  4 11:59:23 netlinux kernel:         0x00000003, /* pino  */
Dec  4 11:59:23 netlinux kernel:         0x00000003, /* version  */
Dec  4 11:59:23 netlinux kernel:         0x000089ed, /* mode  */
Dec  4 11:59:23 netlinux kernel:         0x0000,     /* uid  */
Dec  4 11:59:23 netlinux kernel:         0x0000,     /* gid  */
Dec  4 11:59:23 netlinux kernel:         0x3a27f644, /* atime  */
Dec  4 11:59:23 netlinux kernel:         0x39f86ec6, /* mtime  */
Dec  4 11:59:23 netlinux kernel:         0x3a01980c, /* ctime  */
Dec  4 11:59:23 netlinux kernel:         0x00000000, /* offset  */
Dec  4 11:59:23 netlinux kernel:         0x0000c590, /* dsize  */
Dec  4 11:59:23 netlinux kernel:         0x0000c590, /* rsize  */
Dec  4 11:59:23 netlinux kernel:         0x09,       /* nsize  */
Dec  4 11:59:23 netlinux kernel:         0x01,       /* nlink  */
Dec  4 11:59:27 netlinux kernel:         0x00,       /* spare  */
Dec  4 11:59:27 netlinux kernel:         0,          /* rename  */
Dec  4 11:59:27 netlinux kernel:         0,          /* deleted  */
Dec  4 11:59:27 netlinux kernel:         0xff,       /* accurate  */
Dec  4 11:59:27 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 11:59:27 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 11:59:27 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 11:59:27 netlinux kernel: }
Dec  4 11:59:27 netlinux kernel: jffs_rewrite_data(): Writing name =
"tinylogin" to pos 0x7156652l.
Dec  4 11:59:27 netlinux kernel: , result: 0x000003dd
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 0, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 0
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x0001bfb2
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 4096, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x0005191c
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 8192, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 8192
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x00073fe4
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 12288, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 12288
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x0006e68b
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 16384, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 16384
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x00063c29
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 20480, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 20480
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x00073f79
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 24576, size =3D 4096
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 24576
Dec  4 11:59:27 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:27 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:27 netlinux kernel: , result: 0x00072b6c
Dec  4 11:59:27 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 28672, size =3D 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 1, node_offset: 28672
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x0008396c
Dec  4 11:59:31 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 32768, size =3D 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 2, node_offset: 0
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x00084c28
Dec  4 11:59:31 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 36864, size =3D 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 2, node_offset: 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x0004b4bc
Dec  4 11:59:31 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 40960, size =3D 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 2, node_offset: 8192
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x000408e3
Dec  4 11:59:31 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 45056, size =3D 4096
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 2, node_offset: 12288
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x0000bbff
Dec  4 11:59:31 netlinux kernel: jffs_read_data(): file =3D =
"tinylogin", read_offset =3D 49152, size =3D 1424
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): file: =
"tinylogin", ino: 10, version: 2, node_offset: 16384
Dec  4 11:59:31 netlinux kernel:   jffs_get_node_data(): Read 1424 =
bytes.
Dec  4 11:59:31 netlinux kernel:   jffs_read_data(): Read 1424 bytes.
Dec  4 11:59:31 netlinux kernel: , result: 0x0000b54b
Dec  4 11:59:31 netlinux kernel: , result: 0x00000c35
Dec  4 11:59:31 netlinux kernel: jffs_insert_node(): ino =3D 10, =
version =3D 3, name =3D "tinylogin", deleted =3D 0
Dec  4 11:59:31 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 11:59:31 netlinux kernel: jffs_update_file(): ino: 10, version: =
3
Dec  4 11:59:31 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 50576
Dec  4 11:59:31 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 10, version: 1
Dec  4 11:59:31 netlinux kernel: jffs_fmfree(): node->ino =3D 10, =
node->version =3D 1
Dec  4 11:59:31 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 10, version: 2
Dec  4 11:59:31 netlinux kernel: jffs_fmfree(): node->ino =3D 10, =
node->version =3D 2
Dec  4 11:59:31 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:31 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 50576, f->size =3D 0
Dec  4 11:59:31 netlinux kernel: jffs_insert_data(): f->size =3D 50576
Dec  4 11:59:31 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
10, name: "tinylogin", newest_type: 7
Dec  4 11:59:31 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:31 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:31 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:35 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 11:59:35 netlinux kernel: jffs_update_file(): ino: 621, version: =
2
Dec  4 11:59:35 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 2
Dec  4 11:59:35 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 621, version: 1
Dec  4 11:59:35 netlinux kernel: jffs_fmfree(): node->ino =3D 621, =
node->version =3D 1
Dec  4 11:59:35 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:35 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 2, f->size =3D 0
Dec  4 11:59:35 netlinux kernel: jffs_insert_data(): f->size =3D 2
Dec  4 11:59:35 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
621, name: "sdd11", newest_type: 7
Dec  4 11:59:35 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:35 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:35 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:35 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #656, fmc->dirty_size =3D 272736
Dec  4 11:59:35 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:35 netlinux kernel: {
Dec  4 11:59:35 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:35 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:35 netlinux kernel:         7012456, /* used_size  */
Dec  4 11:59:35 netlinux kernel:         272736, /* dirty_size  */
Dec  4 11:59:35 netlinux kernel:         7919160, /* free_size  */
Dec  4 11:59:35 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:35 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:35 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:35 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:35 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:35 netlinux kernel:         0xc0d45c40, /* tail  */    =
(tail->offset + tail->size =3D 0x008729c8)
Dec  4 11:59:35 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:35 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:35 netlinux kernel: }
Dec  4 11:59:35 netlinux kernel: jffs_try_to_erase()
Dec  4 11:59:35 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 11:59:35 netlinux kernel: jffs_get_oldest_node(): ino =3D 622, =
version =3D 1
Dec  4 11:59:35 netlinux kernel: jffs_find_file(): ino: 622
Dec  4 11:59:35 netlinux kernel: jffs_find_file(): Found file with ino =
622. (name: "sdd12")
Dec  4 11:59:35 netlinux kernel: jffs_garbage_collect_next(): "sdd12", =
ino: 622, version: 1, location 0x19ff30, dsize 2
Dec  4 11:59:35 netlinux kernel:   total_name_size: 8
Dec  4 11:59:35 netlinux kernel:   data_size: 2
Dec  4 11:59:35 netlinux kernel:   size: 72
Dec  4 11:59:35 netlinux kernel:   f->nsize: 5
Dec  4 11:59:35 netlinux kernel:   f->size: 2
Dec  4 11:59:35 netlinux kernel:   node->data_offset: 0
Dec  4 11:59:35 netlinux kernel:   free_chunk_size1: 6346296
Dec  4 11:59:35 netlinux kernel:   free_chunk_size2: 1572864
Dec  4 11:59:35 netlinux kernel:   node->fm->offset: 0x0019ff30
Dec  4 11:59:35 netlinux kernel: ***jffs_rewrite_data(): node: 622, =
name: "sdd12", size: 2
Dec  4 11:59:35 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 72, node =3D 0xc0d7f3c0
Dec  4 11:59:35 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
6346296, free_chunk_size2 =3D 1572864
Dec  4 11:59:35 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:35 netlinux kernel: {
Dec  4 11:59:35 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:35 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:35 netlinux kernel:         7012528, /* used_size  */
Dec  4 11:59:35 netlinux kernel:         272736, /* dirty_size  */
Dec  4 11:59:35 netlinux kernel:         7919088, /* free_size  */
Dec  4 11:59:35 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:35 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:35 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:35 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:35 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:35 netlinux kernel:         0xc0d45cd0, /* tail  */    =
(tail->offset + tail->size =3D 0x00872a10)
Dec  4 11:59:39 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:39 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:39 netlinux kernel: }
Dec  4 11:59:39 netlinux kernel: struct jffs_fm: 0xc0d45cd0
Dec  4 11:59:39 netlinux kernel: {
Dec  4 11:59:39 netlinux kernel:        0x008729c8, /* offset  */
Dec  4 11:59:39 netlinux kernel:        72, /* size  */
Dec  4 11:59:39 netlinux kernel:        0xc0d45c40, /* prev  */
Dec  4 11:59:39 netlinux kernel:        0x00000000, /* next  */
Dec  4 11:59:39 netlinux kernel:        0xc0d45d00, /* nodes  */
Dec  4 11:59:39 netlinux kernel: }
Dec  4 11:59:39 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x8858056l.
Dec  4 11:59:39 netlinux kernel: jffs_raw_inode: inode number: 622
Dec  4 11:59:39 netlinux kernel: {
Dec  4 11:59:39 netlinux kernel:         0x34383931, /* magic  */
Dec  4 11:59:39 netlinux kernel:         0x0000026e, /* ino  */
Dec  4 11:59:39 netlinux kernel:         0x0000003b, /* pino  */
Dec  4 11:59:39 netlinux kernel:         0x00000002, /* version  */
Dec  4 11:59:39 netlinux kernel:         0x000061a0, /* mode  */
Dec  4 11:59:39 netlinux kernel:         0x0000,     /* uid  */
Dec  4 11:59:39 netlinux kernel:         0x0000,     /* gid  */
Dec  4 11:59:39 netlinux kernel:         0x3a01980b, /* atime  */
Dec  4 11:59:39 netlinux kernel:         0x39f812cf, /* mtime  */
Dec  4 11:59:39 netlinux kernel:         0x3a019811, /* ctime  */
Dec  4 11:59:39 netlinux kernel:         0x00000000, /* offset  */
Dec  4 11:59:39 netlinux kernel:         0x00000002, /* dsize  */
Dec  4 11:59:39 netlinux kernel:         0x00000002, /* rsize  */
Dec  4 11:59:39 netlinux kernel:         0x05,       /* nsize  */
Dec  4 11:59:39 netlinux kernel:         0x01,       /* nlink  */
Dec  4 11:59:39 netlinux kernel:         0x00,       /* spare  */
Dec  4 11:59:39 netlinux kernel:         0,          /* rename  */
Dec  4 11:59:39 netlinux kernel:         0,          /* deleted  */
Dec  4 11:59:39 netlinux kernel:         0xff,       /* accurate  */
Dec  4 11:59:39 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 11:59:39 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 11:59:39 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 11:59:39 netlinux kernel: }
Dec  4 11:59:39 netlinux kernel: jffs_rewrite_data(): Writing name =
"sdd12" to pos 0x8858116l.
Dec  4 11:59:39 netlinux kernel: , result: 0x0000019e
Dec  4 11:59:39 netlinux kernel: jffs_read_data(): file =3D "sdd12", =
read_offset =3D 0, size =3D 2
Dec  4 11:59:39 netlinux kernel:   jffs_get_node_data(): file: "sdd12", =
ino: 622, version: 1, node_offset: 0
Dec  4 11:59:39 netlinux kernel:   jffs_get_node_data(): Read 2 bytes.
Dec  4 11:59:39 netlinux kernel:   jffs_read_data(): Read 2 bytes.
Dec  4 11:59:39 netlinux kernel: , result: 0x00000044
Dec  4 11:59:39 netlinux kernel: , result: 0x00000745
Dec  4 11:59:39 netlinux kernel: jffs_insert_nDec  4 11:59:39 netlinux =
kernel: jffs_insert_node(): ---------------------------------
------------------------------------- 1
Dec  4 11:59:39 netlinux kernel: jffs_update_file(): ino: 622, version: =
2
Dec  4 11:59:39 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 2
Dec  4 11:59:39 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 622, version: 1
Dec  4 11:59:39 netlinux kernel: jffs_fmfree(): node->ino =3D 622, =
node->version =3D 1
Dec  4 11:59:39 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:39 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 2, f->size =3D 0
Dec  4 11:59:39 netlinux kernel: jffs_insert_data(): f->size =3D 2
Dec  4 11:59:39 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
622, name: "sdd12", newest_type: 7
Dec  4 11:59:39 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:41 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:41 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:41 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #657, fmc->dirty_size =3D 272808
Dec  4 11:59:41 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:41 netlinux kernel: {
Dec  4 11:59:41 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:41 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:41 netlinux kernel:         7012456, /* used_size  */
Dec  4 11:59:41 netlinux kernel:         272808, /* dirty_size  */
Dec  4 11:59:41 netlinux kernel:         7919088, /* free_size  */
Dec  4 11:59:41 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:41 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:41 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:41 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:45 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:45 netlinux kernel:         0xc0d45cd0, /* tail  */    =
(tail->offset + tail->size =3D 0x00872a10)
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:45 netlinux kernel: }
Dec  4 11:59:45 netlinux kernel: jffs_try_to_erase()
Dec  4 11:59:45 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 11:59:45 netlinux kernel: jffs_get_oldest_node(): ino =3D 623, =
version =3D 1
Dec  4 11:59:45 netlinux kernel: jffs_find_file(): ino: 623
Dec  4 11:59:45 netlinux kernel: jffs_find_file(): Found file with ino =
623. (name: "sdd13")
Dec  4 11:59:45 netlinux kernel: jffs_garbage_collect_next(): "sdd13", =
ino: 623, version: 1, location 0x19ff78, dsize 2
Dec  4 11:59:45 netlinux kernel:   total_name_size: 8
Dec  4 11:59:45 netlinux kernel:   data_size: 2
Dec  4 11:59:45 netlinux kernel:   size: 72
Dec  4 11:59:45 netlinux kernel:   f->nsize: 5
Dec  4 11:59:45 netlinux kernel:   f->size: 2
Dec  4 11:59:45 netlinux kernel:   node->data_offset: 0
Dec  4 11:59:45 netlinux kernel:   free_chunk_size1: 6346224
Dec  4 11:59:45 netlinux kernel:   free_chunk_size2: 1572864
Dec  4 11:59:45 netlinux kernel:   node->fm->offset: 0x0019ff78
Dec  4 11:59:45 netlinux kernel: ***jffs_rewrite_data(): node: 623, =
name: "sdd13", size: 2
Dec  4 11:59:45 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 72, node =3D 0xc0d7f410
Dec  4 11:59:45 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
6346224, free_chunk_size2 =3D 1572864
Dec  4 11:59:45 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:45 netlinux kernel: {
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:45 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:45 netlinux kernel:         7012528, /* used_size  */
Dec  4 11:59:45 netlinux kernel:         272808, /* dirty_size  */
Dec  4 11:59:45 netlinux kernel:         7919016, /* free_size  */
Dec  4 11:59:45 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:45 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:45 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:45 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:45 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:45 netlinux kernel:         0xc0d45d60, /* tail  */    =
(tail->offset + tail->size =3D 0x00872a58)
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:45 netlinux kernel: }
Dec  4 11:59:45 netlinux kernel: struct jffs_fm: 0xc0d45d60
Dec  4 11:59:45 netlinux kernel: {
Dec  4 11:59:45 netlinux kernel:        0x00872a10, /* offset  */
Dec  4 11:59:45 netlinux kernel:        72, /* size  */
Dec  4 11:59:45 netlinux kernel:        0xc0d45cd0, /* prev  */
Dec  4 11:59:45 netlinux kernel:        0x00000000, /* next  */
Dec  4 11:59:45 netlinux kernel:        0xc0d45d90, /* nodes  */
Dec  4 11:59:45 netlinux kernel: }
Dec  4 11:59:45 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x8858128l.
Dec  4 11:59:45 netlinux kernel: jffs_raw_inode: inode number: 623
Dec  4 11:59:45 netlinux kernel: {
Dec  4 11:59:45 netlinux kernel:         0x34383931, /* magic  */
Dec  4 11:59:45 netlinux kernel:         0x0000026f, /* ino  */
Dec  4 11:59:45 netlinux kernel:         0x0000003b, /* pino  */
Dec  4 11:59:45 netlinux kernel:         0x00000002, /* version  */
Dec  4 11:59:45 netlinux kernel:         0x000061a0, /* mode  */
Dec  4 11:59:45 netlinux kernel:         0x0000,     /* uid  */
Dec  4 11:59:45 netlinux kernel:         0x0000,     /* gid  */
Dec  4 11:59:45 netlinux kernel:         0x3a01980b, /* atime  */
Dec  4 11:59:45 netlinux kernel:         0x39f812cf, /* mtime  */
Dec  4 11:59:45 netlinux kernel:         0x3a019811, /* ctime  */
Dec  4 11:59:45 netlinux kernel:         0x00000000, /* offset  */
Dec  4 11:59:49 netlinux kernel:         0x00000002, /* dsize  */
Dec  4 11:59:49 netlinux kernel:         0x00000002, /* rsize  */
Dec  4 11:59:49 netlinux kernel:         0x05,       /* nsize  */
Dec  4 11:59:49 netlinux kernel:         0x01,       /* nlink  */
Dec  4 11:59:49 netlinux kernel:         0x00,       /* spare  */
Dec  4 11:59:49 netlinux kernel:         0,          /* rename  */
Dec  4 11:59:49 netlinux kernel:         0,          /* deleted  */
Dec  4 11:59:49 netlinux kernel:         0xff,       /* accurate  */
Dec  4 11:59:49 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 11:59:49 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 11:59:49 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 11:59:49 netlinux kernel: }
Dec  4 11:59:49 netlinux kernel: jffs_rewrite_data(): Writing name =
"sdd13" to pos 0x8858188l.
Dec  4 11:59:49 netlinux kernel: , result: 0x0000019f
Dec  4 11:59:49 netlinux kernel: jffs_read_data(): file =3D "sdd13", =
read_offset =3D 0, size =3D 2
Dec  4 11:59:49 netlinux kernel:   jffs_get_node_data(): file: "sdd13", =
ino: 623, version: 1, node_offset: 0
Dec  4 11:59:49 netlinux kernel:   jffs_get_node_data(): Read 2 bytes.
Dec  4 11:59:49 netlinux kernel:   jffs_read_data(): Read 2 bytes.
Dec  4 11:59:49 netlinux kernel: , result: 0x00000045
Dec  4 11:59:49 netlinux kernel: , result: 0x00000748
Dec  4 11:59:49 netlinux kernel: jffs_insert_node(): ino =3D 623, =
version =3D 2, name =3D "sdd13", deleted =3D 0
Dec  4 11:59:49 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 11:59:49 netlinux kernel: jffs_update_file(): ino: 623, version: =
2
Dec  4 11:59:49 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 2
Dec  4 11:59:49 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 623, version: 1
Dec  4 11:59:49 netlinux kernel: jffs_fmfree(): node->ino =3D 623, =
node->version =3D 1
Dec  4 11:59:49 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:49 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 2, f->size =3D 0
Dec  4 11:59:49 netlinux kernel: jffs_insert_data(): f->size =3D 2
Dec  4 11:59:49 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
623, name: "sdd13", newest_type: 7
Dec  4 11:59:49 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:49 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:49 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:49 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #658, fmc->dirty_size =3D 272880
Dec  4 11:59:49 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:49 netlinux kernel: {
Dec  4 11:59:49 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:49 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:49 netlinux kernel:         7012456, /* used_size  */
Dec  4 11:59:49 netlinux kernel:         272880, /* dirty_size  */
Dec  4 11:59:49 netlinux kernel:         7919016, /* free_size  */
Dec  4 11:59:49 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:49 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:49 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:49 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:49 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:49 netlinux kernel:         0xc0d45d60, /* tail  */    =
(tail->offset + tail->size =3D 0x00872a58)
Dec  4 11:59:49 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:49 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:49 netlinux kernel: }
Dec  4 11:59:49 netlinux kernel: jffs_try_to_erase()
Dec  4 11:59:49 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 11:59:49 netlinux kernel: jffs_get_oldest_node(): ino =3D 624, =
version =3D 1
Dec  4 11:59:49 netlinux kernel: jffs_find_file(): ino: 624
Dec  4 11:59:49 netlinux kernel: jffs_find_file(): Found file with ino =
624. (name: "sdd14")
Dec  4 11:59:49 netlinux kernel: jffs_garbage_collect_next(): "sdd14", =
ino: 624, version: 1, location 0x19ffc0, dsize 2
Dec  4 11:59:54 netlinux kernel:   total_name_size: 8
Dec  4 11:59:54 netlinux kernel:   data_size: 2
Dec  4 11:59:54 netlinux kernel:   size: 72
Dec  4 11:59:54 netlinux kernel:   f->nsize: 5
Dec  4 11:59:54 netlinux kernel:   f->size: 2
Dec  4 11:59:54 netlinux kernel:   node->data_offset: 0
Dec  4 11:59:54 netlinux kernel:   free_chunk_size1: 6346152
Dec  4 11:59:54 netlinux kernel:   free_chunk_size2: 1572864
Dec  4 11:59:54 netlinux kernel:   node->fm->offset: 0x0019ffc0
Dec  4 11:59:54 netlinux kernel: ***jffs_rewrite_data(): node: 624, =
name: "sdd14", size: 2
Dec  4 11:59:54 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 72, node =3D 0xc0d7f460
Dec  4 11:59:54 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
6346152, free_chunk_size2 =3D 1572864
Dec  4 11:59:54 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:54 netlinux kernel: {
Dec  4 11:59:54 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:54 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:54 netlinux kernel:         7012528, /* used_size  */
Dec  4 11:59:54 netlinux kernel:         272880, /* dirty_size  */
Dec  4 11:59:54 netlinux kernel:         7918944, /* free_size  */
Dec  4 11:59:54 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:54 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:54 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:54 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:54 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:54 netlinux kernel:         0xc0d45df0, /* tail  */    =
(tail->offset + tail->size =3D 0x00872aa0)
Dec  4 11:59:54 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:54 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:54 netlinux kernel: }
Dec  4 11:59:54 netlinux kernel: struct jffs_fm: 0xc0d45df0
Dec  4 11:59:54 netlinux kernel: {
Dec  4 11:59:54 netlinux kernel:        0x00872a58, /* offset  */
Dec  4 11:59:54 netlinux kernel:        72, /* size  */
Dec  4 11:59:54 netlinux kernel:        0xc0d45d60, /* prev  */
Dec  4 11:59:54 netlinux kernel:        0x00000000, /* next  */
Dec  4 11:59:54 netlinux kernel:        0xc0d45e20, /* nodes  */
Dec  4 11:59:54 netlinux kernel: }
Dec  4 11:59:54 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x8858200l.
Dec  4 11:59:54 netlinux kernel: jffs_raw_inode: inode number: 624
Dec  4 11:59:54 netlinux kernel: {
Dec  4 11:59:54 netlinux kernel:         0x34383931, /* magic  */
Dec  4 11:59:54 netlinux kernel:         0x00000270, /* ino  */
Dec  4 11:59:54 netlinux kernel:         0x0000003b, /* pino  */
Dec  4 11:59:54 netlinux kernel:         0x00000002, /* version  */
Dec  4 11:59:54 netlinux kernel:         0x000061a0, /* mode  */
Dec  4 11:59:54 netlinux kernel:         0x0000,     /* uid  */
Dec  4 11:59:54 netlinux kernel:         0x0000,     /* gid  */
Dec  4 11:59:54 netlinux kernel:         0x3a01980b, /* atime  */
Dec  4 11:59:54 netlinux kernel:         0x39f812cf, /* mtime  */
Dec  4 11:59:54 netlinux kernel:         0x3a019811, /* ctime  */
Dec  4 11:59:54 netlinux kernel:         0x00000000, /* offset  */
Dec  4 11:59:54 netlinux kernel:         0x00000002, /* dsize  */
Dec  4 11:59:54 netlinux kernel:         0x00000002, /* rsize  */
Dec  4 11:59:54 netlinux kernel:         0x05,       /* nsize  */
Dec  4 11:59:54 netlinux kernel:         0x01,       /* nlink  */
Dec  4 11:59:54 netlinux kernel:         0x00,       /* spare  */
Dec  4 11:59:54 netlinux kernel:         0,          /* rename  */
Dec  4 11:59:54 netlinux kernel:         0,          /* deleted  */
Dec  4 11:59:54 netlinux kernel:         0xff,       /* accurate  */
Dec  4 11:59:54 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 11:59:58 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 11:59:58 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 11:59:58 netlinux kernel: }
Dec  4 11:59:58 netlinux kernel: jffs_rewrite_data(): Writing name =
"sdd14" to pos 0x8858260l.
Dec  4 11:59:58 netlinux kernel: , result: 0x000001a0
Dec  4 11:59:58 netlinux kernel: jffs_read_data(): file =3D "sdd14", =
read_offset =3D 0, size =3D 2
Dec  4 11:59:58 netlinux kernel:   jffs_get_node_data(): file: "sdd14", =
ino: 624, version: 1, node_offset: 0
Dec  4 11:59:58 netlinux kernel:   jffs_get_node_data(): Read 2 bytes.
Dec  4 11:59:58 netlinux kernel:   jffs_read_data(): Read 2 bytes.
Dec  4 11:59:58 netlinux kernel: , result: 0x00000046
Dec  4 11:59:58 netlinux kernel: , result: 0x0000074b
Dec  4 11:59:58 netlinux kernel: jffs_insert_node(): ino =3D 624, =
version =3D 2, name =3D "sdd14", deleted =3D 0
Dec  4 11:59:58 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 11:59:58 netlinux kernel: jffs_update_file(): ino: 624, version: =
2
Dec  4 11:59:58 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 2
Dec  4 11:59:58 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 624, version: 1
Dec  4 11:59:58 netlinux kernel: jffs_fmfree(): node->ino =3D 624, =
node->version =3D 1
Dec  4 11:59:58 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 11:59:58 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 2, f->size =3D 0
Dec  4 11:59:58 netlinux kernel: jffs_insert_data(): f->size =3D 2
Dec  4 11:59:58 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
624, name: "sdd14", newest_type: 7
Dec  4 11:59:58 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 11:59:58 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 11:59:58 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 11:59:58 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #659, fmc->dirty_size =3D 272952
Dec  4 11:59:58 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 11:59:58 netlinux kernel: {
Dec  4 11:59:58 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 11:59:58 netlinux kernel:         15204352, /* flash_size  */
Dec  4 11:59:58 netlinux kernel:         7012456, /* used_size  */
Dec  4 11:59:58 netlinux kernel:         272952, /* dirty_size  */
Dec  4 11:59:58 netlinux kernel:         7918944, /* free_size  */
Dec  4 11:59:58 netlinux kernel:         131072, /* sector_size  */
Dec  4 11:59:58 netlinux kernel:         262144, /* min_free_size  */
Dec  4 11:59:58 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 11:59:58 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 11:59:58 netlinux kernel:         0xc0cad960, /* head  */    =
(head->offset =3D 0x00180000)
Dec  4 11:59:58 netlinux kernel:         0xc0d45df0, /* tail  */    =
(tail->offset + tail->size =3D 0x00872aa0)
Dec  4 11:59:58 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 11:59:58 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 11:59:58 netlinux kernel: }
Dec  4 11:59:58 netlinux kernel: jffs_try_to_erase()
Dec  4 11:59:58 netlinux kernel: jffs_try_to_erase(): erase_size =3D =
131072
Dec  4 12:00:03 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1313, fmc->dirty_size =3D 168700
Dec  4 12:00:03 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:03 netlinux kernel: {
Dec  4 12:00:03 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:03 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:03 netlinux kernel:         7043320, /* used_size  */
Dec  4 12:00:03 netlinux kernel:         168700, /* dirty_size  */
Dec  4 12:00:03 netlinux kernel:         7992332, /* free_size  */
Dec  4 12:00:03 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:03 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:03 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:03 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:03 netlinux kernel:         0xc0e351c0, /* head  */    =
(head->offset =3D 0x00320000)
Dec  4 12:00:03 netlinux kernel:         0xc0e35100, /* tail  */    =
(tail->offset + tail->size =3D 0x00a00bf4)
Dec  4 12:00:03 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:03 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:03 netlinux kernel: }
Dec  4 12:00:03 netlinux kernel: jffs_try_to_erase()
Dec  4 12:00:03 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:00:03 netlinux kernel: jffs_get_oldest_node(): ino =3D 1247, =
version =3D 8
Dec  4 12:00:03 netlinux kernel: jffs_find_file(): ino: 1247
Dec  4 12:00:03 netlinux kernel: jffs_find_file(): Found file with ino =
1247. (name: "vmlinuz.wrks")
Dec  4 12:00:03 netlinux kernel: jffs_garbage_collect_next(): =
"vmlinuz.wrks", ino: 1247, version: 8, location 0x3268cc, dsize 288
Dec  4 12:00:03 netlinux kernel:   total_name_size: 12
Dec  4 12:00:03 netlinux kernel:   data_size: 65464
Dec  4 12:00:03 netlinux kernel:   size: 65536
Dec  4 12:00:03 netlinux kernel:   f->nsize: 12
Dec  4 12:00:03 netlinux kernel:   f->size: 494731
Dec  4 12:00:03 netlinux kernel:   node->data_offset: 261856
Dec  4 12:00:03 netlinux kernel:   free_chunk_size1: 4715532
Dec  4 12:00:03 netlinux kernel:   free_chunk_size2: 3276800
Dec  4 12:00:03 netlinux kernel:   node->fm->offset: 0x003268cc
Dec  4 12:00:03 netlinux kernel: ***jffs_rewrite_data(): node: 1247, =
name: "vmlinuz.wrks", size: 65464
Dec  4 12:00:03 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 65536, node =3D 0xc0e3f890
Dec  4 12:00:03 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
4715532, free_chunk_size2 =3D 3276800
Dec  4 12:00:03 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:03 netlinux kernel: {
Dec  4 12:00:03 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:03 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:03 netlinux kernel:         7108856, /* used_size  */
Dec  4 12:00:03 netlinux kernel:         168700, /* dirty_size  */
Dec  4 12:00:03 netlinux kernel:         7926796, /* free_size  */
Dec  4 12:00:03 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:03 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:04 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:04 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:04 netlinux kernel:         0xc0e351c0, /* head  */    =
(head->offset =3D 0x00320000)
Dec  4 12:00:04 netlinux kernel:         0xc0e35160, /* tail  */    =
(tail->offset + tail->size =3D 0x00a10bf4)
Dec  4 12:00:04 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:04 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:04 netlinux kernel: }
Dec  4 12:00:04 netlinux kernel: struct jffs_fm: 0xc0e35160
Dec  4 12:00:04 netlinux kernel: {
Dec  4 12:00:04 netlinux kernel:        0x00a00bf4, /* offset  */
Dec  4 12:00:04 netlinux kernel:        65536, /* size  */
Dec  4 12:00:04 netlinux kernel:        0xc0e35100, /* prev  */
Dec  4 12:00:04 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:00:04 netlinux kernel:        0xc0e35040, /* nodes  */
Dec  4 12:00:04 netlinux kernel: }
Dec  4 12:00:04 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x10488820l.
Dec  4 12:00:04 netlinux kernel: jffs_raw_inode: inode number: 1247
Dec  4 12:00:04 netlinux kernel: {
Dec  4 12:00:04 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:00:04 netlinux kernel:         0x000004df, /* ino  */
Dec  4 12:00:04 netlinux kernel:         0x000004de, /* pino  */
Dec  4 12:00:04 netlinux kernel:         0x00000015, /* version  */
Dec  4 12:00:04 netlinux kernel:         0x000081a4, /* mode  */
Dec  4 12:00:04 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:00:04 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:00:04 netlinux kernel:         0x3a27f64a, /* atime  */
Dec  4 12:00:04 netlinux kernel:         0x3a01b73a, /* mtime  */
Dec  4 12:00:08 netlinux kernel:         0x3a01b73a, /* ctime  */
Dec  4 12:00:08 netlinux kernel:         0x0003fee0, /* offset  */
Dec  4 12:00:08 netlinux kernel:         0x0000ffb8, /* dsize  */
Dec  4 12:00:08 netlinux kernel:         0x0000ffb8, /* rsize  */
Dec  4 12:00:08 netlinux kernel:         0x0c,       /* nsize  */
Dec  4 12:00:08 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:00:08 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:00:08 netlinux kernel:         0,          /* rename  */
Dec  4 12:00:08 netlinux kernel:         0,          /* deleted  */
Dec  4 12:00:08 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:00:08 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:00:08 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:00:08 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:00:08 netlinux kernel: }
Dec  4 12:00:08 netlinux kernel: jffs_rewrite_data(): Writing name =
"vmlinuz.wrks" to pos 0x10488880l.
Dec  4 12:00:08 netlinux kernel: , result: 0x0000050a
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 261856, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 8, node_offset: 0
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 288 =
bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 0
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 3808 =
bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:08 netlinux kernel: , result: 0x00081d71
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 265952, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 3808
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:08 netlinux kernel: , result: 0x00080a38
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 270048, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 7904
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:08 netlinux kernel: , result: 0x00081374
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 274144, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 12000
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:08 netlinux kernel: , result: 0x00081602
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 278240, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Rea
d 4096 bytes.
Dec  4 12:00:08 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:08 netlinux kernel: , result: 0x000821a8
Dec  4 12:00:08 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 282336, size =3D 4096
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 20192
Dec  4 12:00:08 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x00081d2d
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 286432, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 24288
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x0008178e
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 290528, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: "vmlinuz.=
wrks", ino: 1247, version: 9, node_offset: 28384
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x00081751
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 294624, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 9, node_offset: 32480
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 288 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 0
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 3808 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x00086001
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 298720, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 3808
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x000814fc
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 302816, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 7904
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:11 netlinux kernel: , result: 0x00081658
Dec  4 12:00:11 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 306912, size =3D 4096
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 12000
Dec  4 12:00:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:15 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:15 netlinux kernel: , result: 0x000832f6
Dec  4 12:00:15 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 311008, size =3D 4096
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 16096
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:15 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:15 netlinux kernel: , result: 0x0008350e
Dec  4 12:00:15 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 315104, size =3D 4096
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 20192
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:15 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:15 netlinux kernel: , result: 0x00085d47
Dec  4 12:00:15 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 319200, size =3D 4096
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 24288
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:15 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:15 netlinux kernel: , result: 0x000818b9
Dec  4 12:00:15 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 323296, size =3D 4024
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1247, version: 10, node_offset: 28384
Dec  4 12:00:15 netlinux kernel:   jffs_get_node_data(): Read 4024 =
bytes.
Dec  4 12:00:15 netlinux kernel:   jffs_read_data(): Read 4024 bytes.
Dec  4 12:00:15 netlinux kernel: , result: 0x0007c858
Dec  4 12:00:15 netlinux kernel: , result: 0x00000f2e
Dec  4 12:00:15 netlinux kernel: jffs_insert_node(): ino =3D 1247, =
version =3D 21, name =3D "vmlinuz.wrks", deleted =3D 0
Dec  4 12:00:15 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:00:15 netlinux kernel: jffs_update_file(): ino: 1247, =
version: 21
Dec  4 12:00:15 netlinux kernel: jffs_delete_data(): offset =3D 261856, =
remove_size =3D 65464
Dec  4 12:00:15 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1247, version: 8
Dec  4 12:00:15 netlinux kernel: jffs_fmfree(): node->ino =3D 1247, =
node->version =3D 8
Dec  4 12:00:15 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1247, version: 9
Dec  4 12:00:15 netlinux kernel: jffs_fmfree(): node->ino =3D 1247, =
node->version =3D 9
Dec  4 12:00:15 netlinux kernel: jffs_delete_data(): f->size =3D 429267
Dec  4 12:00:15 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 261856, node->data_size =3D 65464, f->size =3D 429267
Dec  4 12:00:15 netlinux kernel: Cool stuff's happening!
Dec  4 12:00:15 netlinux last message repeated 4 times
Dec  4 12:00:15 netlinux kernel: jffs_insert_data(): f->size =3D 494731
Dec  4 12:00:15 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1247, name: "vmlinuz.wrks", newest_type: 7
Dec  4 12:00:15 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:00:15 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:00:15 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:00:15 netlinux kernel:         0x0c,       /* nsize  */
Dec  4 12:00:15 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:00:15 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:00:15 netlinux kernel:         0,          /* rename  */
Dec  4 12:00:15 netlinux kernel:         0,          /* deleted  */
Dec  4 12:00:15 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:00:15 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:00:15 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:00:15 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:00:15 netlinux kernel: }
Dec  4 12:00:15 netlinux kernel: jffs_rewrite_data(): Writing name =
"vmlinuz.wrks" to pos 0x11181032l.
Dec  4 12:00:19 netlinux kernel: , result: 0x0000050a
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 458248, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 14, node_offset: 0
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 504 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 0
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 3592 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x0008bff4
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 462344, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 3592
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x00088356
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 466440, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 7688
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x00084f1f
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 470536, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 11784
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x0007ee81
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 474632, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 15880
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x00082568
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 478728, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 19976
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x00082643
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 482824, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 24072
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x0008526e
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 486920, size =3D 4096
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 28168
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:19 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:19 netlinux kernel: , result: 0x0008237c
Dec  4 12:00:19 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 491016, size =3D 3715
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 15, node_offset: 32264
Dec  4 12:00:19 netlinux kernel:   jffs_get_node_data(): Read 504 =
bytes.
Dec  4 12:00:23 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1250, version: 16, node_offset: 0
Dec  4 12:00:23 netlinux kernel:   jffs_get_node_data(): Read 3211 =
bytes.
Dec  4 12:00:23 netlinux kernel:   jffs_read_data(): Read 3715 bytes.
Dec  4 12:00:23 netlinux kernel: , result: 0x0007a59d
Dec  4 12:00:23 netlinux kernel: , result: 0x00000c87
Dec  4 12:00:23 netlinux kernel: jffs_insert_node(): ino =3D 1250, =
version =3D 24, name =3D "vmlinuz.wrks", deleted =3D 0
Dec  4 12:00:23 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:00:23 netlinux kernel: jffs_update_file(): ino: 1250, =
version: 24
Dec  4 12:00:23 netlinux kernel: jffs_delete_data(): offset =3D 458248, =
remove_size =3D 36483
Dec  4 12:00:23 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1250, version: 14
Dec  4 12:00:23 netlinux kernel: jffs_fmfree(): node->ino =3D 1250, =
node->version =3D 14
Dec  4 12:00:23 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1250, version: 15
Dec  4 12:00:23 netlinux kernel: jffs_fmfree(): node->ino =3D 1250, =
node->version =3D 15
Dec  4 12:00:23 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1250, version: 16
Dec  4 12:00:23 netlinux kernel: jffs_fmfree(): node->ino =3D 1250, =
node->version =3D 16
Dec  4 12:00:23 netlinux kernel: jffs_delete_data(): f->size =3D 458248
Dec  4 12:00:23 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 458248, node->data_size =3D 36483, f->size =3D 458248
Dec  4 12:00:23 netlinux kernel: jffs_insert_data(): f->size =3D 494731
Dec  4 12:00:23 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1250, name: "vmlinuz.wrks", newest_type: 7
Dec  4 12:00:23 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:00:23 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:00:23 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:00:23 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1332, fmc->dirty_size =3D 275464
Dec  4 12:00:23 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:23 netlinux kernel: {
Dec  4 12:00:23 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:23 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:23 netlinux kernel:         7009904, /* used_size  */
Dec  4 12:00:23 netlinux kernel:         275464, /* dirty_size  */
Dec  4 12:00:23 netlinux kernel:         7918984, /* free_size  */
Dec  4 12:00:23 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:23 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:23 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:23 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:23 netlinux kernel:         0xc0e35af0, /* head  */    =
(head->offset =3D 0x003c0000)
Dec  4 12:00:23 netlinux kernel:         0xc0e35b50, /* tail  */    =
(tail->offset + tail->size =3D 0x00ab2a78)
Dec  4 12:00:23 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:23 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:23 netlinux kernel: }
Dec  4 12:00:23 netlinux kernel: jffs_try_to_erase()
Dec  4 12:00:23 netlinux kernel: jffs_try_to_erase(): erase_size =3D =
131072
Dec  4 12:00:28 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1359, fmc->dirty_size =3D 150164
Dec  4 12:00:28 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:28 netlinux kernel: {
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:28 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:28 netlinux kernel:         7041160, /* used_size  */
Dec  4 12:00:28 netlinux kernel:         150164, /* dirty_size  */
Dec  4 12:00:28 netlinux kernel:         8013028, /* free_size  */
Dec  4 12:00:28 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:28 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:28 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:28 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:28 netlinux kernel:         0xc0e30a20, /* head  */    =
(head->offset =3D 0x004c0000)
Dec  4 12:00:28 netlinux kernel:         0xc0e30960, /* tail  */    =
(tail->offset + tail->size =3D 0x00b9bb1c)
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:28 netlinux kernel: }
Dec  4 12:00:28 netlinux kernel: jffs_try_to_erase()
Dec  4 12:00:28 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:00:28 netlinux kernel: jffs_get_oldest_node(): ino =3D 1256, =
version =3D 14
Dec  4 12:00:28 netlinux kernel: jffs_find_file(): ino: 1256
Dec  4 12:00:28 netlinux kernel: jffs_find_file(): Found file with ino =
1256. (name: "vmlinuz.wrks")
Dec  4 12:00:28 netlinux kernel: jffs_garbage_collect_next(): =
"vmlinuz.wrks", ino: 1256, version: 14, location 0x4c2064, dsize 504
Dec  4 12:00:28 netlinux kernel:   total_name_size: 12
Dec  4 12:00:28 netlinux kernel:   data_size: 36483
Dec  4 12:00:28 netlinux kernel:   size: 36556
Dec  4 12:00:28 netlinux kernel:   f->nsize: 12
Dec  4 12:00:28 netlinux kernel:   f->size: 494731
Dec  4 12:00:28 netlinux kernel:   node->data_offset: 458248
Dec  4 12:00:28 netlinux kernel:   free_chunk_size1: 3032292
Dec  4 12:00:28 netlinux kernel:   free_chunk_size2: 4980736
Dec  4 12:00:28 netlinux kernel:   node->fm->offset: 0x004c2064
Dec  4 12:00:28 netlinux kernel: ***jffs_rewrite_data(): node: 1256, =
name: "vmlinuz.wrks", size: 36483
Dec  4 12:00:28 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 36556, node =3D 0xc0e33ba0
Dec  4 12:00:28 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
3032292, free_chunk_size2 =3D 4980736
Dec  4 12:00:28 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:28 netlinux kernel: {
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:28 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:28 netlinux kernel:         7077716, /* used_size  */
Dec  4 12:00:28 netlinux kernel:         150164, /* dirty_size  */
Dec  4 12:00:28 netlinux kernel:         7976472, /* free_size  */
Dec  4 12:00:28 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:28 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:28 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:28 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:28 netlinux kernel:         0xc0e30a20, /* head  */    =
(head->offset =3D 0x004c0000)
Dec  4 12:00:28 netlinux kernel:         0xc0e309c0, /* tail  */    =
(tail->offset + tail->size =3D 0x00ba49e8)
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:28 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:28 netlinux kernel: }
Dec  4 12:00:28 netlinux kernel: struct jffs_fm: 0xc0e309c0
Dec  4 12:00:28 netlinux kernel: {
Dec  4 12:00:28 netlinux kernel:        0x00b9bb1c, /* offset  */
Dec  4 12:00:28 netlinux kernel:        36556, /* size  */
Dec  4 12:00:28 netlinux kernel:        0xc0e30960, /* prev  */
Dec  4 12:00:28 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:00:28 netlinux kernel:        0xc0e308a0, /* nodes  */
Dec  4 12:00:28 netlinux kernel: }
Dec  4 12:00:28 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x12172060l.
Dec  4 12:00:28 netlinux kernel: jffs_raw_inode: inode number: 1256
Dec  4 12:00:28 netlinux kernel: {
Dec  4 12:00:28 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:00:28 netlinux kernel:         0x000004e8, /* ino  */
Dec  4 12:00:28 netlinux kernel:         0x000004e7, /* pino  */
Dec  4 12:00:28 netlinux kernel:         0x00000018, /* version  */
Dec  4 12:00:28 netlinux kernel:         0x000081a4, /* mode  */
Dec  4 12:00:28 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:00:28 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:00:28 netlinux kernel:         0x3a27f64c, /* atime  */
Dec  4 12:00:28 netlinux kernel:         0x3a01b750, /* mtime  */
Dec  4 12:00:32 netlinux kernel:         0x3a01b750, /* ctime  */
Dec  4 12:00:32 netlinux kernel:         0x0006fe08, /* offset  */
Dec  4 12:00:32 netlinux kernel:         0x00008e83, /* dsize  */
Dec  4 12:00:32 netlinux kernel:         0x00008e83, /* rsize  */
Dec  4 12:00:32 netlinux kernel:         0x0c,       /* nsize  */
Dec  4 12:00:32 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:00:32 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:00:32 netlinux kernel:         0,          /* rename  */
Dec  4 12:00:32 netlinux kernel:         0,          /* deleted  */
Dec  4 12:00:32 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:00:32 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:00:32 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:00:32 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:00:32 netlinux kernel: }
Dec  4 12:00:32 netlinux kernel: jffs_rewrite_data(): Writing name =
"vmlinuz.wrks" to pos 0x12172120l.
Dec  4 12:00:32 netlinux kernel: , result: 0x0000050a
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 458248, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 14, node_offset: 0
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 504 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 0
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 3592 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:32 netlinux kernel: , result: 0x0008bff4
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 462344, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 3592
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:32 netlinux kernel: , result: 0x00088356
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 466440, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 7688
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:32 netlinux kernel: , result: 0x00084f1f
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 470536, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 11784
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:32 netlinux kernel: , result: 0x0007ee81
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 474632, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 15880
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:32 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:32 netlinux kernel: , result: 0x00082568
Dec  4 12:00:32 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 478728, size =3D 4096
Dec  4 12:00:32 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 19976
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:36 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:36 netlinux kernel: , result: 0x00082643
Dec  4 12:00:36 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 482824, size =3D 4096
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 24072
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:36 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:36 netlinux kernel: , result: 0x0008526e
Dec  4 12:00:36 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 486920, size =3D 4096
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 28168
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:36 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:36 netlinux kernel: , result: 0x0008237c
Dec  4 12:00:36 netlinux kernel: jffs_read_data(): file =3D =
"vmlinuz.wrks", read_offset =3D 491016, size =3D 3715
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 15, node_offset: 32264
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): Read 504 =
bytes.
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): file: =
"vmlinuz.wrks", ino: 1256, version: 16, node_offset: 0
Dec  4 12:00:36 netlinux kernel:   jffs_get_node_data(): Read 3211 =
bytes.
Dec  4 12:00:36 netlinux kernel:   jffs_read_data(): Read 3715 bytes.
Dec  4 12:00:36 netlinux kernel: , result: 0x0007a59d
Dec  4 12:00:36 netlinux kernel: , result: 0x00000ca8
Dec  4 12:00:36 netlinux kernel: jffs_insert_node(): ino =3D 1256, =
version =3D 24, name =3D "vmlinuz.wrks", deleted =3D 0
Dec  4 12:00:36 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:00:36 netlinux kernel: jffs_update_file(): ino: 1256, =
version: 24
Dec  4 12:00:36 netlinux kernel: jffs_delete_data(): offset =3D 458248, =
remove_size =3D 36483
Dec  4 12:00:36 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1256, version: 14
Dec  4 12:00:36 netlinux kernel: jffs_fmfree(): node->ino =3D 1256, =
node->version =3D 14
Dec  4 12:00:36 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1256, version: 15
Dec  4 12:00:36 netlinux kernel: jffs_fmfree(): node->ino =3D 1256, =
node->version =3D 15
Dec  4 12:00:37 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1256, version: 16
Dec  4 12:00:37 netlinux kernel: jffs_fmfree(): node->ino =3D 1256, =
node->version =3D 16
Dec  4 12:00:37 netlinux kernel: jffs_delete_data(): f->size =3D 458248
Dec  4 12:00:37 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 458248, node->data_size =3D 36483, f->size =3D 458248
Dec  4 12:00:37 netlinux kernel: jffs_insert_data(): f->size =3D 494731
Dec  4 12:00:37 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1256, name: "vmlinuz.wrks", newest_type: 7
Dec  4 12:00:37 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:00:37 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:00:37 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:00:42 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1383, fmc->dirty_size =3D 188380
Dec  4 12:00:42 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:42 netlinux kernel: {
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:42 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:42 netlinux kernel:         7040616, /* used_size  */
Dec  4 12:00:42 netlinux kernel:         188380, /* dirty_size  */
Dec  4 12:00:42 netlinux kernel:         7975356, /* free_size  */
Dec  4 12:00:42 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:42 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:42 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:42 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:42 netlinux kernel:         0xc0e286b0, /* head  */    =
(head->offset =3D 0x00580000)
Dec  4 12:00:42 netlinux kernel:         0xc0e28650, /* tail  */    =
(tail->offset + tail->size =3D 0x00c64e44)
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:42 netlinux kernel: }
Dec  4 12:00:42 netlinux kernel: jffs_try_to_erase()
Dec  4 12:00:42 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:00:42 netlinux kernel: jffs_get_oldest_node(): ino =3D 1263, =
version =3D 6
Dec  4 12:00:42 netlinux kernel: jffs_find_file(): ino: 1263
Dec  4 12:00:42 netlinux kernel: jffs_find_file(): Found file with ino =
1263. (name: "e2fsck")
Dec  4 12:00:42 netlinux kernel: jffs_garbage_collect_next(): "e2fsck", =
ino: 1263, version: 6, location 0x58b5ac, dsize 204
Dec  4 12:00:42 netlinux kernel:   total_name_size: 8
Dec  4 12:00:42 netlinux kernel:   data_size: 65468
Dec  4 12:00:42 netlinux kernel:   size: 65536
Dec  4 12:00:42 netlinux kernel:   f->nsize: 6
Dec  4 12:00:42 netlinux kernel:   f->size: 413624
Dec  4 12:00:42 netlinux kernel:   node->data_offset: 196404
Dec  4 12:00:42 netlinux kernel:   free_chunk_size1: 2208188
Dec  4 12:00:42 netlinux kernel:   free_chunk_size2: 5767168
Dec  4 12:00:42 netlinux kernel:   node->fm->offset: 0x0058b5ac
Dec  4 12:00:42 netlinux kernel: ***jffs_rewrite_data(): node: 1263, =
name: "e2fsck", size: 65468
Dec  4 12:00:42 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 65536, node =3D 0xc0e25550
Dec  4 12:00:42 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
2208188, free_chunk_size2 =3D 5767168
Dec  4 12:00:42 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:42 netlinux kernel: {
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:42 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:42 netlinux kernel:         7106152, /* used_size  */
Dec  4 12:00:42 netlinux kernel:         188380, /* dirty_size  */
Dec  4 12:00:42 netlinux kernel:         7909820, /* free_size  */
Dec  4 12:00:42 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:42 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:42 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:42 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:42 netlinux kernel:         0xc0e286b0, /* head  */    =
(head->offset =3D 0x00580000)
Dec  4 12:00:42 netlinux kernel:         0xc0e28710, /* tail  */    =
(tail->offset + tail->size =3D 0x00c74e44)
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:42 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:42 netlinux kernel: }
Dec  4 12:00:42 netlinux kernel: struct jffs_fm: 0xc0e28710
Dec  4 12:00:42 netlinux kernel: {
Dec  4 12:00:42 netlinux kernel:        0x00c64e44, /* offset  */
Dec  4 12:00:42 netlinux kernel:        65536, /* size  */
Dec  4 12:00:42 netlinux kernel:        0xc0e28650, /* prev  */
Dec  4 12:00:42 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:00:42 netlinux kernel:        0xc0e28500, /* nodes  */
Dec  4 12:00:42 netlinux kernel: }
Dec  4 12:00:42 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x12996164l.
Dec  4 12:00:42 netlinux kernel: jffs_raw_inode: inode number: 1263
Dec  4 12:00:42 netlinux kernel: {
Dec  4 12:00:42 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:00:42 netlinux kernel:         0x000004ef, /* ino  */
Dec  4 12:00:42 netlinux kernel:         0x000004ea, /* pino  */
Dec  4 12:00:42 netlinux kernel:         0x00000011, /* version  */
Dec  4 12:00:42 netlinux kernel:         0x000081ed, /* mode  */
Dec  4 12:00:42 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:00:42 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:00:42 netlinux kernel:         0x3a2a9077, /* atime  */
Dec  4 12:00:42 netlinux kernel:         0x39f812ca, /* mtime  */
Dec  4 12:00:42 netlinux kernel:         0x3a019817, /* ctime  */
Dec  4 12:00:42 netlinux kernel:         0x0002ff34, /* offset  */
Dec  4 12:00:42 netlinux kernel:         0x0000ffbc, /* dsize  */
Dec  4 12:00:42 netlinux kernel:         0x0000ffbc, /* rsize  */
Dec  4 12:00:42 netlinux kernel:         0x06,       /* nsize  */
Dec  4 12:00:46 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:00:46 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:00:46 netlinux kernel:         0,          /* rename  */
Dec  4 12:00:46 netlinux kernel:         0,          /* deleted  */
Dec  4 12:00:46 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:00:46 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:00:46 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:00:46 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:00:46 netlinux kernel: }
Dec  4 12:00:46 netlinux kernel: jffs_rewrite_data(): Writing name =
"e2fsck" to pos 0x12996224l.
Dec  4 12:00:46 netlinux kernel: , result: 0x0000023e
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 196404, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 6, node_offset: 0
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 204 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 0
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 3892 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x00071aec
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 200500, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 3892
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x0007576a
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 204596, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 7988
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x00074eaf
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 208692, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 12084
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x00078dd7
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 212788, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 16180
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x00073924
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 216884, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 20276
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:46 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:46 netlinux kernel: , result: 0x000816bc
Dec  4 12:00:46 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 220980, size =3D 4096
Dec  4 12:00:46 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 24372
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0008feb6
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 225076, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 28468
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0008ecc4
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 229172, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 7, node_offset: 32564
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 204 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 0
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 3892 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0007de87
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 233268, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 3892
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0006ccd9
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 237364, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 7988
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0007f885
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 241460, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 12084
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0006fa96
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 245556, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 16180
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x000761fb
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 249652, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 20276
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0006e513
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 253748, size =3D 4096
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 24372
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:50 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:50 netlinux kernel: , result: 0x0007702e
Dec  4 12:00:50 netlinux kernel: jffs_read_data(): file =3D "e2fsck", =
read_offset =3D 257844, size =3D 4028
Dec  4 12:00:50 netlinux kernel:   jffs_get_node_data(): file: =
"e2fsck", ino: 1263, version: 8, node_offset: 28468
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4028 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4028 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x0007069a
Dec  4 12:00:55 netlinux kernel: , result: 0x00000f6f
Dec  4 12:00:55 netlinux kernel: jffs_insert_node(): ino =3D 1263, =
version =3D 17, name =3D "e2fsck", deleted =3D 0
Dec  4 12:00:55 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:00:55 netlinux kernel: jffs_update_file(): ino: 1263, =
version: 17
Dec  4 12:00:55 netlinux kernel: jffs_delete_data(): offset =3D 196404, =
remove_size =3D 65468
Dec  4 12:00:55 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1263, version: 6
Dec  4 12:00:55 netlinux kernel: jffs_fmfree(): node->ino =3D 1263, =
node->version =3D 6
Dec  4 12:00:55 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1263, version: 7
Dec  4 12:00:55 netlinux kernel: jffs_fmfree(): node->ino =3D 1263, =
node->version =3D 7
Dec  4 12:00:55 netlinux kernel: jffs_delete_data(): f->size =3D 348156
Dec  4 12:00:55 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 196404, node->data_size =3D 65468, f->size =3D 348156
Dec  4 12:00:55 netlinux kernel: Cool stuff's happening!
Dec  4 12:00:55 netlinux last message repeated 3 times
Dec  4 12:00:55 netlinux kernel: jffs_insert_data(): f->size =3D 413624
Dec  4 12:00:55 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1263, name: "e2fsck", newest_type: 7
Dec  4 12:00:55 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:00:55 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:00:55 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x00027126
Dec  4 12:00:55 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 36864, size =3D 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x0003f818
Dec  4 12:00:55 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 40960, size =3D 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 8192
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x00075ed0
Dec  4 12:00:55 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 45056, size =3D 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 12288
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x000801ab
Dec  4 12:00:55 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 49152, size =3D 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 16384
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x0007969f
Dec  4 12:00:55 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 53248, size =3D 4096
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 20480
Dec  4 12:00:55 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:55 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:55 netlinux kernel: , result: 0x00079d21
Dec  4 12:00:59 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 57344, size =3D 4096
Dec  4 12:00:59 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 24576
Dec  4 12:00:59 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:00:59 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:00:59 netlinux kernel: , result: 0x000818a6
Dec  4 12:00:59 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 61440, size =3D 4016
Dec  4 12:00:59 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 28672
Dec  4 12:00:59 netlinux kernel:   jffs_get_node_data(): Read 4016 =
bytes.
Dec  4 12:00:59 netlinux kernel:   jffs_read_data(): Read 4016 bytes.
Dec  4 12:00:59 netlinux kernel: , result: 0x00077fc2
Dec  4 12:00:59 netlinux kernel: , result: 0x00000bf9
Dec  4 12:00:59 netlinux kernel: jffs_insert_node(): ino =3D 1345, =
version =3D 13, name =3D "libslang.so.1.3.7", deleted =3D 0
Dec  4 12:00:59 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:00:59 netlinux kernel: jffs_update_file(): ino: 1345, =
version: 13
Dec  4 12:00:59 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 65456
Dec  4 12:00:59 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1345, version: 1
Dec  4 12:00:59 netlinux kernel: jffs_fmfree(): node->ino =3D 1345, =
node->version =3D 1
Dec  4 12:00:59 netlinux kernel: jffs_delete_data(): f->size =3D 300824
Dec  4 12:00:59 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 65456, f->size =3D 300824
Dec  4 12:00:59 netlinux kernel: Cool stuff's happening!
Dec  4 12:00:59 netlinux kernel: jffs_insert_data(): f->size =3D 366280
Dec  4 12:00:59 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1345, name: "libslang.so.1.3.7", newest_type: 7
Dec  4 12:00:59 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:00:59 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:00:59 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:00:59 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1479, fmc->dirty_size =3D 209320
Dec  4 12:00:59 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:00:59 netlinux kernel: {
Dec  4 12:00:59 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:00:59 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:00:59 netlinux kernel:         7039924, /* used_size  */
Dec  4 12:00:59 netlinux kernel:         209320, /* dirty_size  */
Dec  4 12:00:59 netlinux kernel:         7955108, /* free_size  */
Dec  4 12:00:59 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:00:59 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:00:59 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:00:59 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:00:59 netlinux kernel:         0xc0e13000, /* head  */    =
(head->offset =3D 0x00640000)
Dec  4 12:00:59 netlinux kernel:         0xc0e0dcb0, /* tail  */    =
(tail->offset + tail->size =3D 0x00d29d5c)
Dec  4 12:00:59 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:00:59 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:00:59 netlinux kernel: }
Dec  4 12:00:59 netlinux kernel: jffs_try_to_erase()
Dec  4 12:00:59 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:00:59 netlinux kernel: jffs_get_oldest_node(): ino =3D 1345, =
version =3D 2
Dec  4 12:00:59 netlinux kernel: jffs_find_file(): ino: 1345
Dec  4 12:00:59 netlinux kernel: jffs_find_file(): Found file with ino =
1345. (name: "libslang.so.1.3.7")
Dec  4 12:00:59 netlinux kernel: jffs_garbage_collect_next(): =
"libslang.so.1.3.7", ino: 1345, version: 2, location 0x650778, dsize 8
0
Dec  4 12:00:59 netlinux kernel:   total_name_size: 20
Dec  4 12:00:59 netlinux kernel:   data_size: 65456
Dec  4 12:00:59 netlinux kernel:   size: 65536
Dec  4 12:01:03 netlinux kernel:   f->nsize: 17
Dec  4 12:01:03 netlinux kernel:   f->size: 366280
Dec  4 12:01:03 netlinux kernel:   node->data_offset: 65456
Dec  4 12:01:03 netlinux kernel:   free_chunk_size1: 1401508
Dec  4 12:01:03 netlinux kernel:   free_chunk_size2: 6553600
Dec  4 12:01:03 netlinux kernel:   node->fm->offset: 0x00650778
Dec  4 12:01:03 netlinux kernel: ***jffs_rewrite_data(): node: 1345, =
name: "libslang.so.1.3.7", size: 65456
Dec  4 12:01:03 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 65536, node =3D 0xc0df5620
Dec  4 12:01:03 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
1401508, free_chunk_size2 =3D 6553600
Dec  4 12:01:03 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:03 netlinux kernel: {
Dec  4 12:01:03 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:03 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:03 netlinux kernel:         7105460, /* used_size  */
Dec  4 12:01:03 netlinux kernel:         209320, /* dirty_size  */
Dec  4 12:01:03 netlinux kernel:         7889572, /* free_size  */
Dec  4 12:01:03 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:03 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:03 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:03 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:03 netlinux kernel:         0xc0e13000, /* head  */    =
(head->offset =3D 0x00640000)
Dec  4 12:01:03 netlinux kernel:         0xc0e0dd40, /* tail  */    =
(tail->offset + tail->size =3D 0x00d39d5c)
Dec  4 12:01:03 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:03 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:03 netlinux kernel: }
Dec  4 12:01:03 netlinux kernel: struct jffs_fm: 0xc0e0dd40
Dec  4 12:01:03 netlinux kernel: {
Dec  4 12:01:03 netlinux kernel:        0x00d29d5c, /* offset  */
Dec  4 12:01:03 netlinux kernel:        65536, /* size  */
Dec  4 12:01:03 netlinux kernel:        0xc0e0dcb0, /* prev  */
Dec  4 12:01:03 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:01:03 netlinux kernel:        0xc0e0dd70, /* nodes  */
Dec  4 12:01:03 netlinux kernel: }
Dec  4 12:01:03 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x13802844l.
Dec  4 12:01:03 netlinux kernel: jffs_raw_inode: inode number: 1345
Dec  4 12:01:03 netlinux kernel: {
Dec  4 12:01:03 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:01:03 netlinux kernel:         0x00000541, /* ino  */
Dec  4 12:01:03 netlinux kernel:         0x00000540, /* pino  */
Dec  4 12:01:03 netlinux kernel:         0x0000000e, /* version  */
Dec  4 12:01:03 netlinux kernel:         0x000081a4, /* mode  */
Dec  4 12:01:03 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:01:03 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:01:03 netlinux kernel:         0x3a27f64f, /* atime  */
Dec  4 12:01:03 netlinux kernel:         0x39f812cb, /* mtime  */
Dec  4 12:01:03 netlinux kernel:         0x3a019819, /* ctime  */
Dec  4 12:01:03 netlinux kernel:         0x0000ffb0, /* offset  */
Dec  4 12:01:03 netlinux kernel:         0x0000ffb0, /* dsize  */
Dec  4 12:01:03 netlinux kernel:         0x0000ffb0, /* rsize  */
Dec  4 12:01:03 netlinux kernel:         0x11,       /* nsize  */
Dec  4 12:01:03 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:01:03 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:01:03 netlinux kernel:         0,          /* rename  */
Dec  4 12:01:03 netlinux kernel:         0,          /* deleted  */
Dec  4 12:01:03 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:01:03 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:01:03 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:01:07 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:01:07 netlinux kernel: }
Dec  4 12:01:07 netlinux kernel: jffs_rewrite_data(): Writing name =
"libslang.so.1.3.7" to pos 0x13802904l.
Dec  4 12:01:07 netlinux kernel: , result: 0x00000581
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 65456, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 2, node_offset: 0
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 80 bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 0
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4016 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x00078416
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 69552, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 4016
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x0007d581
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 73648, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 8112
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x00072e32
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 77744, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 12208
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x0006c0eb
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 81840, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 16304
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x00072919
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 85936, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 20400
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: ,Dec  4 12:01:07 netlinux kernel: =
jffs_read_data(): file =3D "libslang.so.1.3.7", read_offset =3D 90032
, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 24496
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:07 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:07 netlinux kernel: , result: 0x0005d2f1
Dec  4 12:01:07 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 94128, size =3D 4096
Dec  4 12:01:07 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 28592
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x000729da
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 98224, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 3, node_offset: 32688
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 80 bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 0
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4016 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x0007b529
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 102320, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 4016
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x0007c155
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 106416, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 8112
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x0007bffa
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 110512, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 12208
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x0007d78f
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 114608, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 16304
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x00079c73
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 118704, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 20400
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x00077453
Dec  4 12:01:11 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 122800, size =3D 4096
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 24496
Dec  4 12:01:11 netlinux kernel:   jffs_get_node_data(): Read 4096 =
bytes.
Dec  4 12:01:11 netlinux kernel:   jffs_read_data(): Read 4096 bytes.
Dec  4 12:01:11 netlinux kernel: , result: 0x00077c26
Dec  4 12:01:15 netlinux kernel: jffs_read_data(): file =3D =
"libslang.so.1.3.7", read_offset =3D 126896, size =3D 4016
Dec  4 12:01:15 netlinux kernel:   jffs_get_node_data(): file: =
"libslang.so.1.3.7", ino: 1345, version: 4, node_offset: 28592
Dec  4 12:01:15 netlinux kernel:   jffs_get_node_data(): Read 4016 =
bytes.
Dec  4 12:01:15 netlinux kernel:   jffs_read_data(): Read 4016 bytes.
Dec  4 12:01:15 netlinux kernel: , result: 0x00069119
Dec  4 12:01:15 netlinux kernel: , result: 0x00000f08
Dec  4 12:01:15 netlinux kernel: jffs_insert_node(): ino =3D 1345, =
version =3D 14, name =3D "libslang.so.1.3.7", deleted =3D 0
Dec  4 12:01:15 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:01:15 netlinux kernel: jffs_update_file(): ino: 1345, =
version: 14
Dec  4 12:01:15 netlinux kernel: jffs_delete_data(): offset =3D 65456, =
remove_size =3D 65456
Dec  4 12:01:15 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1345, version: 2
Dec  4 12:01:15 netlinux kernel: jffs_fmfree(): node->ino =3D 1345, =
node->version =3D 2
Dec  4 12:01:15 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1345, version: 3
Dec  4 12:01:15 netlinux kernel: jffs_fmfree(): node->ino =3D 1345, =
node->version =3D 3
Dec  4 12:01:15 netlinux kernel: jffs_delete_data(): f->size =3D 300824
Dec  4 12:01:15 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 65456, node->data_size =3D 65456, f->size =3D 300824
Dec  4 12:01:15 netlinux kernel: Cool stuff's happening!
Dec  4 12:01:15 netlinux kernel: Cool stuff's happening!
Dec  4 12:01:15 netlinux kernel: jffs_insert_data(): f->size =3D 366280
Dec  4 12:01:15 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1345, name: "libslang.so.1.3.7", newest_type: 7
Dec  4 12:01:15 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:01:15 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:01:15 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:01:15 netlinux kernel:         0x000081a4, /* mode  */
Dec  4 12:01:15 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:01:15 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:01:15 netlinux kernel:         0x3a27f650, /* atime  */
Dec  4 12:01:15 netlinux kernel:         0x3a01372c, /* mtime  */
Dec  4 12:01:15 netlinux kernel:         0x3a019819, /* ctime  */
Dec  4 12:01:15 netlinux kernel:         0x00000000, /* offset  */
Dec  4 12:01:15 netlinux kernel:         0x00000003, /* dsize  */
Dec  4 12:01:15 netlinux kernel:         0x00000003, /* rsize  */
Dec  4 12:01:15 netlinux kernel:         0x0a,       /* nsize  */
Dec  4 12:01:15 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:01:15 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:01:15 netlinux kernel:         0,          /* rename  */
Dec  4 12:01:15 netlinux kernel:         0,          /* deleted  */
Dec  4 12:01:15 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:01:15 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:01:15 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:01:15 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:01:15 netlinux kernel: }
Dec  4 12:01:15 netlinux kernel: jffs_rewrite_data(): Writing name =
"thttpd.pid" to pos 0x14162508l.
Dec  4 12:01:15 netlinux kernel: , result: 0x00000403
Dec  4 12:01:15 netlinux kernel: jffs_read_data(): file =3D =
"thttpd.pid", read_offset =3D 0, size =3D 3
Dec  4 12:01:15 netlinux kernel:   jffs_get_node_data(): file: =
"thttpd.pid", ino: 1359, version: 1, node_offset: 0
Dec  4 12:01:15 netlinux kernel:   jffs_get_node_data(): Read 3 bytes.
Dec  4 12:01:15 netlinux kernel:   jffs_read_data(): Read 3 bytes.
Dec  4 12:01:15 netlinux kernel: , result: 0x00000076
Dec  4 12:01:15 netlinux kernel: , result: 0x00000662
Dec  4 12:01:19 netlinux kernel: jffs_insert_node(): ino =3D 1359, =
version =3D 2, name =3D "thttpd.pid", deleted =3D 0
Dec  4 12:01:19 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:01:19 netlinux kernel: jffs_update_file(): ino: 1359, =
version: 2
Dec  4 12:01:19 netlinux kernel: jffs_delete_data(): offset =3D 0, =
remove_size =3D 3
Dec  4 12:01:19 netlinux kernel: jffs_delete_data(): Removing node: =
ino: 1359, version: 1
Dec  4 12:01:19 netlinux kernel: jffs_fmfree(): node->ino =3D 1359, =
node->version =3D 1
Dec  4 12:01:19 netlinux kernel: jffs_delete_data(): f->size =3D 0
Dec  4 12:01:19 netlinux kernel: jffs_insert_data(): node->data_offset =
=3D 0, node->data_size =3D 3, f->size =3D 0
Dec  4 12:01:19 netlinux kernel: jffs_insert_data(): f->size =3D 3
Dec  4 12:01:19 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1359, name: "thttpd.pid", newest_type: 7
Dec  4 12:01:19 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:01:19 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:01:19 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:01:19 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1501, fmc->dirty_size =3D 208952
Dec  4 12:01:19 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:19 netlinux kernel: {
Dec  4 12:01:19 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:19 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:19 netlinux kernel:         7006756, /* used_size  */
Dec  4 12:01:19 netlinux kernel:         208952, /* dirty_size  */
Dec  4 12:01:19 netlinux kernel:         7988644, /* free_size  */
Dec  4 12:01:19 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:19 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:19 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:19 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:19 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:19 netlinux kernel:         0xc0e398e0, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81a5c)
Dec  4 12:01:19 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:19 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:19 netlinux kernel: }
Dec  4 12:01:19 netlinux kernel: jffs_try_to_erase()
Dec  4 12:01:19 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:01:19 netlinux kernel: jffs_get_oldest_node(): ino =3D 1360, =
version =3D 1
Dec  4 12:01:19 netlinux kernel: jffs_find_file(): ino: 1360
Dec  4 12:01:19 netlinux kernel: jffs_find_file(): Found file with ino =
1360. (name: "spool")
Dec  4 12:01:19 netlinux kernel: jffs_garbage_collect_next(): "spool", =
ino: 1360, version: 1, location 0x6b0608, dsize 0
Dec  4 12:01:19 netlinux kernel:   total_name_size: 8
Dec  4 12:01:19 netlinux kernel:   data_size: 0
Dec  4 12:01:19 netlinux kernel:   size: 68
Dec  4 12:01:19 netlinux kernel:   f->nsize: 5
Dec  4 12:01:19 netlinux kernel:   f->size: 0
Dec  4 12:01:19 netlinux kernel:   node->data_offset: 0
Dec  4 12:01:19 netlinux kernel:   free_chunk_size1: 1041828
Dec  4 12:01:19 netlinux kernel:   free_chunk_size2: 6946816
Dec  4 12:01:19 netlinux kernel:   node->fm->offset: 0x006b0608
Dec  4 12:01:19 netlinux kernel: ***jffs_rewrite_data(): node: 1360, =
name: "spool", size: 0
Dec  4 12:01:19 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 68, node =3D 0xc0df5df0
Dec  4 12:01:19 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
1041828, free_chunk_size2 =3D 6946816
Dec  4 12:01:19 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:19 netlinux kernel: {
Dec  4 12:01:19 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:19 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:19 netlinux kernel:         7006824, /* used_size  */
Dec  4 12:01:19 netlinux kernel:         208952, /* dirty_size  */
Dec  4 12:01:19 netlinux kernel:         7988576, /* free_size  */
Dec  4 12:01:23 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:23 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:23 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:23 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:23 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:23 netlinux kernel:         0xc0e39970, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81aa0)
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:23 netlinux kernel: }
Dec  4 12:01:23 netlinux kernel: struct jffs_fm: 0xc0e39970
Dec  4 12:01:23 netlinux kernel: {
Dec  4 12:01:23 netlinux kernel:        0x00d81a5c, /* offset  */
Dec  4 12:01:23 netlinux kernel:        68, /* size  */
Dec  4 12:01:23 netlinux kernel:        0xc0e398e0, /* prev  */
Dec  4 12:01:23 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:01:23 netlinux kernel:        0xc0e399a0, /* nodes  */
Dec  4 12:01:23 netlinux kernel: }
Dec  4 12:01:23 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x14162524l.
Dec  4 12:01:23 netlinux kernel: jffs_raw_inode: inode number: 1360
Dec  4 12:01:23 netlinux kernel: {
Dec  4 12:01:23 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:01:23 netlinux kernel:         0x00000550, /* ino  */
Dec  4 12:01:23 netlinux kernel:         0x00000543, /* pino  */
Dec  4 12:01:23 netlinux kernel:         0x00000002, /* version  */
Dec  4 12:01:23 netlinux kernel:         0x000041ed, /* mode  */
Dec  4 12:01:23 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:01:23 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:01:23 netlinux kernel:         0x3a27f650, /* atime  */
Dec  4 12:01:23 netlinux kernel:         0x39f812c6, /* mtime  */
Dec  4 12:01:23 netlinux kernel:         0x3a019819, /* ctime  */
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* offset  */
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* dsize  */
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* rsize  */
Dec  4 12:01:23 netlinux kernel:         0x05,       /* nsize  */
Dec  4 12:01:23 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:01:23 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:01:23 netlinux kernel:         0,          /* rename  */
Dec  4 12:01:23 netlinux kernel:         0,          /* deleted  */
Dec  4 12:01:23 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:01:23 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:01:23 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:01:23 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:01:23 netlinux kernel: }
Dec  4 12:01:23 netlinux kernel: jffs_rewrite_data(): Writing name =
"spool" to pos 0x14162584l.
Dec  4 12:01:23 netlinux kernel: , result: 0x0000022d
Dec  4 12:01:23 netlinux kernel: , result: 0x00000774
Dec  4 12:01:23 netlinux kernel: jffs_insert_node(): ino =3D 1360, =
version =3D 2, name =3D "spool", deleted =3D 0
Dec  4 12:01:23 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:01:23 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1360, name: "spool", newest_type: 3
Dec  4 12:01:23 netlinux kernel: jffs_remove_redundant_nodes(): =
Removing node: ino: 1360, version: 1, mod_type: 3
Dec  4 12:01:23 netlinux kernel: jffs_fmfree(): node->ino =3D 1360, =
node->version =3D 1
Dec  4 12:01:23 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:01:23 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:01:23 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:01:27 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1502, fmc->dirty_size =3D 209020
Dec  4 12:01:27 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:27 netlinux kernel: {
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:27 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:27 netlinux kernel:         7006756, /* used_size  */
Dec  4 12:01:27 netlinux kernel:         209020, /* dirty_size  */
Dec  4 12:01:27 netlinux kernel:         7988576, /* free_size  */
Dec  4 12:01:27 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:27 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:27 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:27 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:27 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:27 netlinux kernel:         0xc0e39970, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81aa0)
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:27 netlinux kernel: }
Dec  4 12:01:27 netlinux kernel: jffs_try_to_erase()
Dec  4 12:01:27 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:01:27 netlinux kernel: jffs_get_oldest_node(): ino =3D 1361, =
version =3D 1
Dec  4 12:01:27 netlinux kernel: jffs_find_file(): ino: 1361
Dec  4 12:01:27 netlinux kernel: jffs_find_file(): Found file with ino =
1361. (name: "tmp")
Dec  4 12:01:27 netlinux kernel: jffs_garbage_collect_next(): "tmp", =
ino: 1361, version: 1, location 0x6b064c, dsize 0
Dec  4 12:01:27 netlinux kernel:   total_name_size: 4
Dec  4 12:01:27 netlinux kernel:   data_size: 0
Dec  4 12:01:27 netlinux kernel:   size: 64
Dec  4 12:01:27 netlinux kernel:   f->nsize: 3
Dec  4 12:01:27 netlinux kernel:   f->size: 0
Dec  4 12:01:27 netlinux kernel:   node->data_offset: 0
Dec  4 12:01:27 netlinux kernel:   free_chunk_size1: 1041760
Dec  4 12:01:27 netlinux kernel:   free_chunk_size2: 6946816
Dec  4 12:01:27 netlinux kernel:   node->fm->offset: 0x006b064c
Dec  4 12:01:27 netlinux kernel: ***jffs_rewrite_data(): node: 1361, =
name: "tmp", size: 0
Dec  4 12:01:27 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 64, node =3D 0xc0df5e40
Dec  4 12:01:27 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
1041760, free_chunk_size2 =3D 6946816
Dec  4 12:01:27 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:27 netlinux kernel: {
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:27 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:27 netlinux kernel:         7006820, /* used_size  */
Dec  4 12:01:27 netlinux kernel:         209020, /* dirty_size  */
Dec  4 12:01:27 netlinux kernel:         7988512, /* free_size  */
Dec  4 12:01:27 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:27 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:27 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:27 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:27 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:27 netlinux kernel:         0xc0e39a00, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81ae0)
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:27 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:27 netlinux kernel: }
Dec  4 12:01:27 netlinux kernel: struct jffs_fm: 0xc0e39a00
Dec  4 12:01:27 netlinux kernel: {
Dec  4 12:01:27 netlinux kernel:        0x00d81aa0, /* offset  */
Dec  4 12:01:27 netlinux kernel:        64, /* size  */
Dec  4 12:01:31 netlinux kernel:        0xc0e39970, /* prev  */
Dec  4 12:01:31 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:01:31 netlinux kernel:        0xc0e39a30, /* nodes  */
Dec  4 12:01:31 netlinux kernel: }
Dec  4 12:01:31 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x14162592l.
Dec  4 12:01:31 netlinux kernel: jffs_raw_inode: inode number: 1361
Dec  4 12:01:31 netlinux kernel: {
Dec  4 12:01:31 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:01:31 netlinux kernel:         0x00000551, /* ino  */
Dec  4 12:01:31 netlinux kernel:         0x00000543, /* pino  */
Dec  4 12:01:31 netlinux kernel:         0x00000002, /* version  */
Dec  4 12:01:31 netlinux kernel:         0x000041ed, /* mode  */
Dec  4 12:01:31 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:01:31 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:01:31 netlinux kernel:         0x3a27f650, /* atime  */
Dec  4 12:01:31 netlinux kernel:         0x39f812c6, /* mtime  */
Dec  4 12:01:31 netlinux kernel:         0x3a019819, /* ctime  */
Dec  4 12:01:31 netlinux kernel:         0x00000000, /* offset  */
Dec  4 12:01:31 netlinux kernel:         0x00000000, /* dsize  */
Dec  4 12:01:31 netlinux kernel:         0x00000000, /* rsize  */
Dec  4 12:01:31 netlinux kernel:         0x03,       /* nsize  */
Dec  4 12:01:31 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:01:31 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:01:31 netlinux kernel:         0,          /* rename  */
Dec  4 12:01:31 netlinux kernel:         0,          /* deleted  */
Dec  4 12:01:31 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:01:31 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:01:31 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:01:31 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:01:31 netlinux kernel: }
Dec  4 12:01:31 netlinux kernel: jffs_rewrite_data(): Writing name =
"tmp" to pos 0x14162652l.
Dec  4 12:01:31 netlinux kernel: , result: 0x00000151
Dec  4 12:01:31 netlinux kernel: , result: 0x00000796
Dec  4 12:01:31 netlinux kernel: jffs_insert_node(): ino =3D 1361, =
version =3D 2, name =3D "tmp", deleted =3D 0
Dec  4 12:01:31 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:01:31 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1361, name: "tmp", newest_type: 3
Dec  4 12:01:31 netlinux kernel: jffs_remove_redundant_nodes(): =
Removing node: ino: 1361, version: 1, mod_type: 3
Dec  4 12:01:31 netlinux kernel: jffs_fmfree(): node->ino =3D 1361, =
node->version =3D 1
Dec  4 12:01:31 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:01:31 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:01:31 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:01:31 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1503, fmc->dirty_size =3D 209084
Dec  4 12:01:31 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:31 netlinux kernel: {
Dec  4 12:01:31 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:31 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:31 netlinux kernel:         7006756, /* used_size  */
Dec  4 12:01:31 netlinux kernel:         209084, /* dirty_size  */
Dec  4 12:01:31 netlinux kernel:         7988512, /* free_size  */
Dec  4 12:01:31 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:31 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:31 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:31 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:31 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:35 netlinux kernel:         0xc0e39a00, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81ae0)
Dec  4 12:01:35 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:35 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:35 netlinux kernel: }
Dec  4 12:01:35 netlinux kernel: jffs_try_to_erase()
Dec  4 12:01:35 netlinux kernel: jffs_try_to_erase(): erase_size =3D 0
Dec  4 12:01:35 netlinux kernel: jffs_get_oldest_node(): ino =3D 1362, =
version =3D 1
Dec  4 12:01:35 netlinux kernel: jffs_find_file(): ino: 1362
Dec  4 12:01:35 netlinux kernel: jffs_find_file(): Found file with ino =
1362. (name: "tst")
Dec  4 12:01:35 netlinux kernel: jffs_garbage_collect_next(): "tst", =
ino: 1362, version: 1, location 0x6b068c, dsize 0
Dec  4 12:01:35 netlinux kernel:   total_name_size: 4
Dec  4 12:01:35 netlinux kernel:   data_size: 0
Dec  4 12:01:35 netlinux kernel:   size: 64
Dec  4 12:01:35 netlinux kernel:   f->nsize: 3
Dec  4 12:01:35 netlinux kernel:   f->size: 0
Dec  4 12:01:35 netlinux kernel:   node->data_offset: 0
Dec  4 12:01:35 netlinux kernel:   free_chunk_size1: 1041696
Dec  4 12:01:35 netlinux kernel:   free_chunk_size2: 6946816
Dec  4 12:01:35 netlinux kernel:   node->fm->offset: 0x006b068c
Dec  4 12:01:35 netlinux kernel: ***jffs_rewrite_data(): node: 1362, =
name: "tst", size: 0
Dec  4 12:01:35 netlinux kernel: jffs_fmalloc(): fmc =3D 0xc0818640, =
size =3D 64, node =3D 0xc0df5e90
Dec  4 12:01:35 netlinux kernel: jffs_fmalloc(): free_chunk_size1 =3D =
1041696, free_chunk_size2 =3D 6946816
Dec  4 12:01:35 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:35 netlinux kernel: {
Dec  4 12:01:35 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:35 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:35 netlinux kernel:         7006820, /* used_size  */
Dec  4 12:01:35 netlinux kernel:         209084, /* dirty_size  */
Dec  4 12:01:35 netlinux kernel:         7988448, /* free_size  */
Dec  4 12:01:35 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:35 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:35 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:35 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:35 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:35 netlinux kernel:         0xc0e39a90, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81b20)
Dec  4 12:01:35 netlinux kernel:         0x00000000, /* head_extra  */
Dec  4 12:01:35 netlinux kernel:         0x00000000, /* tail_extra  */
Dec  4 12:01:35 netlinux kernel: }
Dec  4 12:01:35 netlinux kernel: struct jffs_fm: 0xc0e39a90
Dec  4 12:01:35 netlinux kernel: {
Dec  4 12:01:35 netlinux kernel:        0x00d81ae0, /* offset  */
Dec  4 12:01:35 netlinux kernel:        64, /* size  */
Dec  4 12:01:35 netlinux kernel:        0xc0e39a00, /* prev  */
Dec  4 12:01:35 netlinux kernel:        0x00000000, /* next  */
Dec  4 12:01:35 netlinux kernel:        0xc0e39ac0, /* nodes  */
Dec  4 12:01:35 netlinux kernel: }
Dec  4 12:01:35 netlinux kernel: jffs_rewrite_data(): Writing this raw =
inode to pos 0x14162656l.
Dec  4 12:01:35 netlinux kernel: jffs_raw_inode: inode number: 1362
Dec  4 12:01:35 netlinux kernel: {
Dec  4 12:01:35 netlinux kernel:         0x34383931, /* magic  */
Dec  4 12:01:35 netlinux kernel:         0x00000552, /* ino  */
Dec  4 12:01:35 netlinux kernel:         0x00000001, /* pino  */
Dec  4 12:01:35 netlinux kernel:         0x00000002, /* version  */
Dec  4 12:01:35 netlinux kernel:         0x000041ed, /* mode  */
Dec  4 12:01:35 netlinux kernel:         0x0000,     /* uid  */
Dec  4 12:01:35 netlinux kernel:         0x0000,     /* gid  */
Dec  4 12:01:39 netlinux kernel:         0x3a27f650, /* atime  */
Dec  4 12:01:39 netlinux kernel:         0x39f95ce9, /* mtime  */
Dec  4 12:01:39 netlinux kernel:         0x3a019819, /* ctime  */
Dec  4 12:01:39 netlinux kernel:         0x00000000, /* offset  */
Dec  4 12:01:39 netlinux kernel:         0x00000000, /* dsize  */
Dec  4 12:01:39 netlinux kernel:         0x00000000, /* rsize  */
Dec  4 12:01:39 netlinux kernel:         0x03,       /* nsize  */
Dec  4 12:01:39 netlinux kernel:         0x01,       /* nlink  */
Dec  4 12:01:39 netlinux kernel:         0x00,       /* spare  */
Dec  4 12:01:39 netlinux kernel:         0,          /* rename  */
Dec  4 12:01:39 netlinux kernel:         0,          /* deleted  */
Dec  4 12:01:39 netlinux kernel:         0xff,       /* accurate  */
Dec  4 12:01:39 netlinux kernel:         0x00000000, /* dchksum  */
Dec  4 12:01:39 netlinux kernel:         0x0000,     /* nchksum  */
Dec  4 12:01:39 netlinux kernel:         0x0000,     /* chksum  */
Dec  4 12:01:39 netlinux kernel: }
Dec  4 12:01:39 netlinux kernel: jffs_rewrite_data(): Writing name =
"tst" to pos 0x14162716l.
Dec  4 12:01:39 netlinux kernel: , result: 0x0000015b
Dec  4 12:01:39 netlinux kernel: , result: 0x000007c8
Dec  4 12:01:39 netlinux kernel: jffs_insert_node(): ino =3D 1362, =
version =3D 2, name =3D "tst", deleted =3D 0
Dec  4 12:01:39 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
1
Dec  4 12:01:39 netlinux kernel: jffs_remove_redundant_nodes(): ino: =
1362, name: "tst", newest_type: 3
Dec  4 12:01:39 netlinux kernel: jffs_remove_redundant_nodes(): =
Removing node: ino: 1362, version: 1, mod_type: 3
Dec  4 12:01:39 netlinux kernel: jffs_fmfree(): node->ino =3D 1362, =
node->version =3D 1
Dec  4 12:01:39 netlinux kernel: jffs_insert_node(): =
---------------------------------------------------------------------- =
2
Dec  4 12:01:39 netlinux kernel: jffs_rewrite_data(): Leaving...
Dec  4 12:01:39 netlinux kernel: jffs_garbage_collect_next: Leaving...
Dec  4 12:01:39 netlinux kernel: ***jffs_garbage_collect_thread(): =
round #1504, fmc->dirty_size =3D 209148
Dec  4 12:01:39 netlinux kernel: struct jffs_fmcontrol: 0xc0818640
Dec  4 12:01:39 netlinux kernel: {
Dec  4 12:01:39 netlinux kernel:         0x00000000, /* flash_start  */
Dec  4 12:01:39 netlinux kernel:         15204352, /* flash_size  */
Dec  4 12:01:39 netlinux kernel:         7006756, /* used_size  */
Dec  4 12:01:39 netlinux kernel:         209148, /* dirty_size  */
Dec  4 12:01:39 netlinux kernel:         7988448, /* free_size  */
Dec  4 12:01:39 netlinux kernel:         131072, /* sector_size  */
Dec  4 12:01:39 netlinux kernel:         262144, /* min_free_size  */
Dec  4 12:01:39 netlinux kernel:         65536, /* max_chunk_size  */
Dec  4 12:01:39 netlinux kernel:         0xc0094980, /* mtd  */
Dec  4 12:01:39 netlinux kernel:         0xc0e39160, /* head  */    =
(head->offset =3D 0x006a0000)
Dec  4 12:01:39 netlinux kernel:         0xc0e39a90, /* tail  */    =
(tail->offset + tail->size =3D 0x00d81b20)
Dec  4 12:01:39 netlinux kernDec  4 12:01:39 netlinux kernel:         =
0x00000000, /* tail_extra  */
Dec  4 12:01:39 netlinux kernel: }
Dec  4 12:01:39 netlinux kernel: jffs_try_to_erase()
Dec  4 12:01:39 netlinux kernel: jffs_try_to_erase(): erase_size =3D =
131072

more first
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): inode: 0xc0b0ccc0, =
filp: 0xc092ceb0
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "." 1243
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): ".." 1
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "first" ino: 1363
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "d4test" ino: 1255
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "d3test" ino: 1252
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "d2test" ino: 1249
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "dtest" ino: 1246
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): "lilo.conf" ino: 1245
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): ".profile" ino: 1244
Dec  4 12:16:27 netlinux kernel: jffs_readdir(): inode: 0xc0b0ccc0, =
filp: 0xc092ceb0
Dec  4 12:16:28 netlinux kernel: ***jffs_readpage(): file =3D "first", =
page->offset =3D 0
Dec  4 12:16:28 netlinux kernel: jffs_read_data(): file =3D "first", =
read_offset =3D 0, size =3D 467
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 2, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 3, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 4, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 5, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 6, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 7, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 8, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 9, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 10, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 11, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 12, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 13, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 14, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 15, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 16, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 17, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 18, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 19, node_offset: 0
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): Read 1 byte.
Dec  4 12:16:28 netlinux kernel:   jffs_get_node_data(): file: "first", =
ino: 1363, version: 20, node_offset: 0
Dec  4 12:16:28 netlinux kernel: Kernel panic: Didn't read all bytes in =
flash_safe_read(). Returned 0
Dec  4 12:16:28 netlinux kernel:


------_=_NextPart_000_01C05E20.191C5328--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
