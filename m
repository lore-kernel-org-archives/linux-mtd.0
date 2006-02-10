Received: from web53110.mail.yahoo.com ([206.190.49.60])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7eUr-0000Ib-FH
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 15:04:09 -0500
Message-ID: <20060210195719.27377.qmail@web53110.mail.yahoo.com>
Date: Fri, 10 Feb 2006 11:57:18 -0800 (PST)
From: jimmy liu <jimmyzhmliu@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Help Using MTD JFFS2 as Root File System
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To all,

I need help for my Embedded Linux System. When I use
Ramdisk as the root file system, it works fine. When I
change to MTD JFFS2 as the root file system, I got the
following message(u-boot 1.1.4):

=> bootm ff100000
## Booting image at ff100000 ...
   Image Name:   Linux-2.4.25
   Image Type:   PowerPC Linux Kernel Image (gzip
compressed)
   Data Size:    830399 Bytes = 810.9 kB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Memory BAT mapping: BAT2=16Mb, BAT3=0Mb, residual: 0Mb
Linux version 2.4.25 (root at localhost.localdomain)
(gcc
version 3.3.3 (DENX ELDK6
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock0
rootfstype=jffs2
Warning: real time clock seems stuck!
Calibrating delay loop... 111.00 BogoMIPS
Memory: 14252k available (1312k kernel code, 384k
data, 224k init, 0k highmem)
Dentry cache hash table entries: 2048 (order: 2, 16384
bytes)
Inode cache hash table entries: 1024 (order: 1, 8192
bytes)
Mount cache hash table entries: 512 (order: 0, 4096
bytes)
Buffer cache hash table entries: 1024 (order: 0, 4096
bytes)
Page-cache hash table entries: 4096 (order: 2, 16384
bytes)
POSIX conformance testing by UNIFIX
PCI: Probing PCI hardware
Memory resource not set for host bridge 0
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society
NET3.039
Initializing RT netlink socket
Starting kswapd
Journalled Block Device driver loaded
devfs: v1.12c (20020818) Richard Gooch
(rgooch at atnf.csiro.au)
devfs: boot_options: 0x1
Installing knfsd (copyright (C) 1996
okir at monad.swb.de).
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
i2c-core.o: i2c core module version 2.6.1 (20010830)
i2c-dev.o: i2c /dev entries driver module version
2.6.1 (20010830)
i2c-algo-8260.o: i2c mpc8260 algorithm module
CPM UART driver version 0.01
ttyS0 on SMC1 at 0x0000, BRG7
ttyS1 on SMC2 at 0x0040, BRG8
ttyS2 on SCC1 at 0x8000, BRG1
ttyS3 on SCC2 at 0x8100, BRG2
Generic RTC Driver v1.07
eth0: FCC1 ENET Version 0.4, 00:08:02:06:00:00
eth1: FCC2 ENET Version 0.4, 00:08:02:46:00:00
eth2: FCC3 ENET Version 0.4, 00:08:02:26:00:00
physmap flash device: d00000 at ff300000
phys_mapped_flash: Found 1 x16 devices at 0x0 in
16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind
2048)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Oops: kernel access of bad area, sig: 11
NIP: C00AA878 XER: 20000000 LR: C00AA01C SP: C0233CC0
REGS: c0233c10 TRAP: 0300d
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
DAR: 00000000, DSISR: 20000000
TASK = c0232000[1] 'swapper' Last syscall: 120
last math 00000000 last altivec 00000000
GPR00: 00000400 C0233CC0 C0232000 C02AA4E4 C03CB380
00020000 00000000 C03C0000
GPR08: 00D00000 C0238C00 00000000 C00AA164 82002028
00008800 00000000 0000005A
GPR16: 00000000 00000068 C0150000 C0150000 C0150000
C0150000 00CFFFFF 00000000
GPR24: 00D00000 00020000 00000000 C03CB380 00000000
C03CB380 C02AA4E4 00000000
Call backtrace:
C00AAEBC C00AA01C C00AD954 C00AE134 C00AFEAC C00B04C0
C003E83C
C003EC38 C00538C0 C0053C40 C0054178 C0003C98 C00039D8
C0006798
Kernel panic: Attempted to kill init!
 <0>Rebooting in 180 seconds..

Could somebody help me figure out what is the problem.

Thanks.

Jimmy


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
