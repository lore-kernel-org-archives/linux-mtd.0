Received: from xyz.url.com.tw ([210.59.228.230])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATydn-0007fY-NP
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 07:20:12 +0000
Received: from unknown (HELO pavo.url.com.tw) ([210.59.228.22])
	(envelope-sender <superjason@ms88.url.com.tw>)
	by 0 (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Dec 2003 07:17:44 -0000
Received: from unknown (HELO ms88.url.com.tw) ([210.59.228.105])
	(envelope-sender <superjason@ms88.url.com.tw>)
	by ms88.url.com.tw (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Dec 2003 07:19:37 -0000
Message-ID: <2874520031231072012218@ms88.url.com.tw>
From: "SUPERJASON" <superjason@ms88.url.com.tw>
To: linux-mtd@lists.infradead.org
Date: Wed, 10 Dec 2003 15:20:12 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=big5
Subject: booting Error , cramfs : wrong magic 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,
    I try running arm-linux on the board Cogent 7312 . But  it hangs as
follows . How can i do ?



Linux version 2.4.18-rmk5 (root@localhost.localdomain) (gcc version 2.95.3
20010315 (release)) #27 Wed Jul 3 17:11:52 CDT 2002

Processor: ARM ARM720T revision 2

Architecture: Cirrus-CDB89712

On node 0 totalpages: 4096

zone(0): 4096 pages.

zone(1): 0 pages.

zone(2): 0 pages.

Kernel command line: mem=16m

Calibrating delay loop... 36.76 BogoMIPS

Memory: 16MB = 16MB total

Memory: 14640KB available (1133K code, 236K data, 44K init)

Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)

Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)

Mount-cache hash table entries: 512 (order: 0, 4096 bytes)

Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)

Page-cache hash table entries: 4096 (order: 2, 16384 bytes)

POSIX conformance testing by UNIFIX

Linux NET4.0 for Linux 2.4

Based upon Swansea University Computer Society NET3.039

Initializing RT netlink socket

Starting kswapd

JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.

ttyAM0 at I/O 0x100 (irq = 12) is a CLPS711x

ttyAM1 at I/O 0x1100 (irq = 28) is a CLPS711x

pty: 256 Unix98 ptys configured

Software Watchdog Timer: 0.05, timer margin: 60 sec

block: 64 slots per queue, batch=16

RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

cs89x0:cs89x0_probe(0x0)

PP_addr=0x0

cs89x0.c: v2.4.3-pre1 Russell Nelson <nelson@crynwr.com>, Andrew Morton
<andrewm@uow.edu.au>

eth0: cs8900 rev J found at 0xfe000300 [Cirrus EEPROM] 

cs89x0 media RJ-45, IRQ 7, programmed I/O, MAC 00:30:23:01:00:01

cs89x0_probe1() successful

loop: loaded (max 8 devices)

findTargetBoardFlashType(): Congent 7312 board found; Flash size:16M; Flash
bus width=2 bytes.

Cirrus CDB89712 MTD mappings:

  Flash 0x1000000 at 0x0

  SRAM 0xc000 at 0x60000000

  BootROM 0x80 at 0x70000000

Search for id:(89 18) interleave(1) type(2)

Found: Intel 28F128J3A

flash: Found 1 x16 devices at 0x0 in 16-bit mode

Using word write method

Creating 4 MTD partitions on "flash":

0x00000000-0x000a0000 : "cdb89712 flash linux kernel partition"

mtd: Giving out device 0 to cdb89712 flash linux kernel partition

0x000a0000-0x002a0000 : "cdb89712 flash root partition"

mtd: Giving out device 1 to cdb89712 flash root partition

0x002a0000-0x00400000 : "cdb89712 flash data partition"

mtd: Giving out device 2 to cdb89712 flash data partition

0x00400000-0x01000000 : "cdb89712 flash free partition"

mtd: Giving out device 3 to cdb89712 flash free partition

mtd: Giving out device 4 to SRAM

mtd: Giving out device 5 to BootROM

NET4: Linux TCP/IP 1.0 for NET4.0

IP Protocols: ICMP, UDP, TCP

IP: routing cache hash table of 512 buckets, 4Kbytes

TCP: Hash tables configured (established 1024 bind 1024)

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.

NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com

mtdblock_open

ok

mtdblock_open

mtdblock: read on "cdb89712 flash free partition" at 0x0, size 0x1000

mtdblock: read on "cdb89712 flash free partition" at 0x1000, size 0x1000

mtdblock: read on "cdb89712 flash free partition" at 0x2000, size 0x1000

mtdblock: read on "cdb89712 flash free partition" at 0x3000, size 0x1000

cramfs: wrong magic

mtdblock_release

ok

mtdblock_open

jffs2_scan_empty(): Empty block at 0x0000fffc ends at 0x00010000 (with
0xe0021985)! Marking dirty

jffs2_scan_empty(): Empty block at 0x0002fffc ends at 0x00030000 (with
0xe0021985)! Marking dirty

jffs2_scan_empty(): Empty block at 0x0004fffc ends at 0x00050000 (with
0xe0021985)! Marking dirty

mtdblock_release

ok

VFS: Mounted root (jffs2 filesystem).

Freeing init memory: 44K

eth0: using half-duplex 10Base-T (RJ-45)




--

--
社團、小型企業購買虛擬主機的最佳選擇
http://mymailer.url.com.tw
