Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13bIoj-0007dp-00
	for mtd-list@infradead.org; Tue, 19 Sep 2000 09:31:53 +0100
Received: from n075p020.adsl.highway.telekom.at ([213.33.9.84] helo=nis.hofr.at)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13bIoh-0007d4-00
	for mtd@infradead.org; Tue, 19 Sep 2000 09:31:52 +0100
Received: (from root@localhost)
	by nis.hofr.at (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) id LAA29547
	for mtd@infradead.org; Tue, 19 Sep 2000 11:06:07 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
Message-Id: <200009190906.LAA29547@nis.hofr.at>
Subject: DOC2000 beginner questions
To: mtd@infradead.org
Date: Tue, 19 Sep 2000 11:06:07 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Hi !

 I'm just starting off with the flash stuff, what I got is a 8MB DOC2000
 which boots DOS at bootup, what I did now is change boot-selection to
 boot from floppy and booted miniRTL from the floppy, and uploaded the
 
 mtdcore.o
 docprobe.o
 doc2000.o 
 nftl.o
 ftl.o

 to the miniRTL system , created the devices mtd0 as  mtd0 c 90 0 / mtd1 c 90 1
 and nftla b 93 0 / nfstla1 b 93 1 etc.

 I was not able to find any introduction on how to use the modules on the
 webpage , looking throuhg the archive did not realy make me much smarter...

 so I'm kind of lost now , insmod docprobe.o gives me the folowing in dmsg 

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
Cannot find driver for DiskOnChip Millennium at 0xDC000
Cannot find driver for DiskOnChip Millennium at 0xDE000

 then I tried the nftl.o , which gives me 

M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.34 2000/06/07 14:48:52 dwmw2 Exp $

 the flash-disk as far as I know is an 8MB DOC2000 . 
 
 any pointers how to get going on this subject appreciated

thx !
hofrat

general info on the system:

Linux version 2.2.17-rtl3.0 (root@rtl3.hofr.at) (gcc version egcs-2.91.66 19990314/Linux (egcs-1.1.2 release)) #3 Mon Sep 18 16:59:33 CEST 2000
Console: colour VGA+ 80x25
Calibrating delay loop... 66.56 BogoMIPS
Memory: 6096k/8192k available (544k kernel code, 432k reserved, 316k data, 28k init)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry hash table entries: 1024 (order 1, 8k)
Buffer cache hash table entries: 8192 (order 3, 32k)
Page cache hash table entries: 2048 (order 1, 8k)
CPU: AMD Am5x86-WB stepping 04
Checking 386/387 coupling... OK, FPU using exception 16 error reporting.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0 for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
TCP: Hash tables configured (ehash 8192 bhash 8192)
Starting kswapd v 1.5 
RAM disk driver initialized:  16 RAM disks of 4096K size
RAMDISK: Compressed image found at block 0
RAMDISK: Uncompressing root archive: done.
RAMDISK: Auto Filesystem - minix: 1365i 4096bk 47fdz(47) 1024zs 2147483647ms
VFS: Mounted root (minix filesystem).
RAMDISK: Extracting root archive: done.
inserting floppy driver for 2.2.17-rtl3.0
Floppy drive(s): fd0 is 1.44M
FDC 0 is an 8272A
VFS: Disk change detected on device fd(2,0)
Freeing unused kernel memory: 28k freed
Real-Time Linux Extension Loaded (http://www.fsmlabs.com/)
ne.c:v1.10 9/23/94 Donald Becker (becker@cesdis.gsfc.nasa.gov)
NE*000 ethercard probe at 0x300: 6c 59 61 00 05 14
eth0: NE2000 found at 0x300, using IRQ 10.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
