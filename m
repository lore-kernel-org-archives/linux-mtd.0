Received: from [194.51.134.17] (helo=www.anfora.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16xU1D-0003Js-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2002 15:33:15 +0100
Received: from christian.anfora (firewall.anfora [194.51.134.18])
	by www.anfora.fr (8.9.3/8.8.7) with SMTP id QAA18370
	for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2002 16:31:02 +0200
Date: Tue, 16 Apr 2002 16:32:30 +0200
From: Gagneraud Christian <cgagneraud@anfora.fr>
To: linux-mtd@lists.infradead.org
Subject: problems when remounting jffs2
Message-Id: <20020416163230.27f26996.cgagneraud@anfora.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

Hi all,

I work on a motorola MPC8260ADS board
it has 8MB of flash.
I work with 
- ppcboot-1.1.5 
- linux-2.4.4 from ftp.denx.de 
- mtd from cvs (03 avril 2002)

I can load linux with ppcboot from jffs2 partition (/dev/mtd1).
linux can mount its root fs from jffs2 (/dev/mtdblock1) and boot correctly
as well from nfs.

All works quiet fine, exept one thing:
when i boot from nfs and i mount /dev/mtdblock1, umount it an then remount it
i have the folowing errors (with nfsroot).
Same errors appears when i boot with jffs2 as root fs.
Only the first mount give me no errors, all the folowings gives the sames errors.

PPCBoot 1.1.5 (Apr 16 2002 - 12:56:56)
[...]
CPU:   MPC8260 (Rev 01, Mask A.1 1K22A-XC) at 166.666 MHz
Board: Motorola MPC8260ADS
DRAM:  16 MB
FLASH:  8 MB
[...]
=> ls
Scanning JFFS2 FS: ........ done.
 drwxrwxrwx        0 Thu Apr 11 16:19:45 2002 bin
 drwxrwxrwx        0 Thu Apr 11 16:19:45 2002 sbin
 drwxrwxrwx        0 Thu Apr 11 16:19:45 2002 usr
 drwxrwxrwx        0 Thu Apr 11 16:19:45 2002 lib
 drwxrwxrwx        0 Fri Apr 12 13:21:27 2002 etc
 drwxrwxrwx        0 Thu Apr 11 16:19:48 2002 dev
 drwxrwxrwx        0 Thu Apr 11 16:19:48 2002 proc
 drwxrwxrwx        0 Fri Apr 12 13:13:44 2002 var
 drwxrwxrwx        0 Fri Apr 12 13:14:32 2002 tmp
 lrwxrwxrwx       11 Thu Apr 11 16:19:45 2002 linuxrc -> bin/busybox
 -rw-r--r--   524303 Tue Apr 16 12:44:08 2002 vmlinuz-mtd.img
 -rw-r--r--   526723 Tue Apr 16 12:44:22 2002 vmlinuz-nfs.img
=> fsload 0x100000 vmlinuz-nfs.img
### JFFS2 loading 'vmlinuz-nfs.img' to 0x100000
Scanning JFFS2 FS: ........ done.
### JFFS2 load compleate: 526723 bytes loaded to 0x100000
=> bootm 0x100000
## Booting image at 00100000 ...
   Image Name:   Linux-2.4.4-0321-EDU-2002-04-15
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    526659 Bytes = 514 kB = 0 MB
   Load Address: 00000000
   Entry Point:  0000000c
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Total memory = 16MB; using 0kB for hash table (at 00000000)
Linux version 2.4.4 (cgagneraud@christian.anfora) (gcc version 2.95.3 20010315 (release/MontaVist2On node 0 totalpages: 4096
[...]
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis Communications AB.
physmap flash device: 800000 at ff800000
Search for id:(8989 00) interleave(4) type(2)
Search for id:(8989 00) interleave(4) type(2)
Search for id:(89 a0) interleave(4) type(1)
Found: Intel 28F016S5
Physically mapped flash: Found 4 x8 devices at 0x0 in 32-bit mode
Using word write method
mtd: Giving out device 0 to Physically mapped flash
init_ads: bd->bi_flashstart=0xFF800000, bd->bi_flashsize=  800000
init_ads: mtd_size=0x       0
Search for id:(8989 00) interleave(4) type(2)
Search for id:(8989 00) interleave(4) type(2)
Search for id:(89 a0) interleave(4) type(1)
Found: Intel 28F016S5
MPC8260ADS Bank 0: Found 4 x8 devices at 0x0 in 32-bit mode
Using word write method
MPC8260ADS flash bank 0: Using static image partition definition
Creating 4 MTD partitions on "MPC8260ADS Bank 0":
0x00000000-0x00700000 : "jffs2-root"
mtd: Giving out device 1 to jffs2-root
0x00700000-0x00740000 : "ppcboot"
mtd: Giving out device 2 to ppcboot
0x00740000-0x00780000 : "environment"
mtd: Giving out device 3 to environment
0x00780000-0x00800000 : "spare"
mtd: Giving out device 4 to spare
[...]
MontaVista Software's Hard Hat Linux 2.0
[...]
root@edu:~# eraseall /dev/mtdblock1
eraseall: /dev/mtdblock1: unable to get MTD device info
root@edu:~# eraseall /dev/mtd1
Erased 7168 Kibyte @ 0 -- 100% complete.       
root@edu:~# dd if=/edu-busybox.jffs2 of=/dev/mtdblock1
4608+0 records in
4608+0 records out
root@edu:~# mount -t jffs2 /dev/mtdblock1 /mnt/flash0
root@edu:~# ls -al /mnt/flash0
total 1031
drwxr-xr-x   12 root     root            0 Jan  1 00:00 .
drwxrwxrwx    4 root     users        4096 Apr 12  2002 ..
drwxrwxrwx    2 root     root            0 Apr 11  2002 bin
drwxrwxrwx    2 root     root            0 Apr 11  2002 dev
drwxrwxrwx    3 root     root            0 Apr 12  2002 etc
drwxrwxrwx    2 root     root            0 Apr 11  2002 lib
lrwxrwxrwx    1 root     root           11 Apr 11  2002 linuxrc -> bin/busybox
drwxrwxrwx    2 root     root            0 Apr 11  2002 proc
drwxrwxrwx    2 root     root            0 Apr 11  2002 sbin
drwxrwxrwx    2 root     root            0 Apr 12  2002 tmp
drwxrwxrwx    4 root     root            0 Apr 11  2002 usr
drwxrwxrwx    2 root     root            0 Jan  1  1970 var
-rw-r--r--    1 root     root       524303 Apr 16  2002 vmlinuz-mtd.img
-rw-r--r--    1 root     root       526723 Apr 16  2002 vmlinuz-nfs.img
root@edu:~# umount /mnt/flash0
root@edu:~# ls -al /mnt/flash0
total 8
drwxr-xr-x    2 root     users        4096 Apr  5  2002 .
drwxrwxrwx    4 root     users        4096 Apr 12  2002 ..
root@edu:~# mount -t jffs2 /dev/mtdblock1 /mnt/flash0
jffs2_scan_eraseblock(): Node at 0x00240000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x000000)JFFS2: Erase block at 0x00240000 is not formatted. It will be erased
[ ... repeated every 0x40000 ... ]
jffs2_scan_eraseblock(): Node at 0x006c0000 {0x1985, 0x2003, 0x0000000c) has invalid CRC 0x000000)JFFS2: Erase block at 0x006c0000 is not formatted. It will be erased
root@edu:~# ls -al /mnt/flash0
total 1031
drwxr-xr-x   12 root     root            0 Jan  1 00:00 .
drwxrwxrwx    4 root     users        4096 Apr 12  2002 ..
drwxrwxrwx    2 root     root            0 Apr 11  2002 bin
drwxrwxrwx    2 root     root            0 Apr 11  2002 dev
drwxrwxrwx    3 root     root            0 Apr 12  2002 etc
drwxrwxrwx    2 root     root            0 Apr 11  2002 lib
lrwxrwxrwx    1 root     root           11 Apr 11  2002 linuxrc -> bin/busybox
drwxrwxrwx    2 root     root            0 Apr 11  2002 proc
drwxrwxrwx    2 root     root            0 Apr 11  2002 sbin
drwxrwxrwx    2 root     root            0 Apr 12  2002 tmp
drwxrwxrwx    4 root     root            0 Apr 11  2002 usr
drwxrwxrwx    2 root     root            0 Jan  1  1970 var
-rw-r--r--    1 root     root       524303 Apr 16  2002 vmlinuz-mtd.img
-rw-r--r--    1 root     root       526723 Apr 16  2002 vmlinuz-nfs.img
root@edu:~# 

I've made my image with:
[cgagneraud@christian ppc]$ mkfs.jffs2 -dppcland-busybox/ -e0x40000 -p0x700000 -bq -o edu-busybox.jffs2
and the image is:
[cgagneraud@christian ppc]$ ll
[...]
-rw-r--r--    1 cgagnera users     7340032 Apr 16 16:12 edu-busybox.jffs2
[...]
and with:
[cgagneraud@christian ppc]$ mkfs.jffs2 -dppcland-busybox/ -e0x40000 -bq -o edu-busybox.jffs2
the image is:
[cgagneraud@christian ppc]$ ll
[...]
-rw-r--r--    1 cgagnera users     2359296 Apr 16 14:58 edu-busybox.jffs2
[...]

2359296=0x240000, thats where the bads nodes begins.
It seems that i've problem in the free space of the partition.
The mkfs.jffs2 put 0xFF in the free space and jffs2 doesnt complain about it
but modify this free space and then when i remount jffs2 complain about its previous modification
and finally my partition is broken.

I'm happy to boot linux with jffs2 but this is my last problem (i hope).
All my previous problems were resolved by reading this ml but for this kind of problem
i havent found a general (and understandable) answer.

Has anyone any idea?

thanks.
Christian

-- 
/**********************************************
* Christian Gagneraud
***********************************************
* cgagneraud@anfora.fr
***********************************************
* ANFORA
* bat Actys, Voie3
* 31313 Labège Innopole
* FRANCE
***********************************************/
