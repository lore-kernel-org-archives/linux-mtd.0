Received: from msr2.hinet.net ([168.95.4.102] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cMoF-0000i0-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 10:08:52 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Wed, 7 Aug 2002 17:08:16 +0800
Message-ID: <002101c23df1$f8caad00$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0022_01C23E35.06EDED00"
In-Reply-To: <1028636176.19435.47.camel@thomas.tec.linutronix.de>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0022_01C23E35.06EDED00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


> > I read it many time, but CONFIG_JFFS2_FS_NAND use to take care 
> > buffering and OOB . Does I have to use it absolutely? If I 
> do not use 
> > it, what's the result of the driver?
> Yes, you _HAVE_ _ABSOLUTELY_ to use it !  
> IF not, no buffering and OOB check, no bad block management 
> ..--> no JFFS2 on NAND.
> 
JFFS2 on NOR type flash does not use buffering, OOB check and bad block
management, but it can be used now. I meant that CONFIG_JFFS2_FS_NAND is
not defined, maybe the driver still can work, but it is not good as the
original one.


> > We need more info from mount onwards.
> > 
> > Maybe I do not provide repeatable messages and steps. The following 
> > are the steps I use.
> > 1. eraseall /dev/mtd1            
> > 2. mount -t jffs2 /dev/mtdblock1 /mnt
> > 3. Make directory to /mnt
> > 4. Use ftp to copy files to /mnt
> > 5. Change the kernel to to mount /dev/mtdblock1 as root FS. 
> 6. Copy or 
> > delete files and sometime the message display
> > 	ARGH. About to write node to 0x003f9e2c on flash, but 
> there are data 
> > already the re:...
> >     After that, the patition will display more error messages, ECC 
> > error and others.
> 
> I meant, could you get full logs with CONFIG_JFFS2_FS_DEBUG=1 
> from mounting the file system to the ARGH? Make sure you are 
> logging over a serial console so you catch _ALL_ the 
> messages, and remember they're at level KERN_DEBUG so echo 9 
> > /proc/sys/kernel/printk before mount.
> 
OK. I log the file. I have two files, one is logging the process to
build the file system, anothor is logging the process of file operation.
The attached file is the second file. Thanks.


Steve Tsai

------=_NextPart_000_0022_01C23E35.06EDED00
Content-Type: text/plain;
	name="trace2.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="trace2.txt"

.NETpower is starting...
Press <ESC> key to enter console mode.

Boot .NETpower ...........................................g

Linux version 2.4.17-uc0 (root@server) (gcc version 2.95.3 20010315 =
(release)) #
555 Wed Aug 7 15:28:05 CST 2002
Processor: Samsung S3C4510B revision 6
Architecture: NETPOWER
On node 0 totalpages: 4096
zone(0): 0 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/mtdblock1 rw
Calibrating delay loop... 24.88 BogoMIPS
Memory: 16MB =3D 16MB total
Memory: 14672KB available (1190K code, 180K data, 40K init)
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
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis =
Communications
 AB.
i2c-core.o: i2c core module
i2c-dev.o: i2c /dev entries driver module
i2c-core.o: driver i2c-dev dummy driver registered.
i2c-synso.o: i2c algorithm module
i2c-dev.o: Registered 'adaptor' as minor 0
i2c-core.o: adapter adaptor registered as adapter 0.
Samsung S3C4510 Serial driver version 0.9 (2001-12-27) with no serial =
options en
abled
ttyS00 at 0x3ffd000 (irq =3D 5) is a S3C4510B
ttyS01 at 0x3ffe000 (irq =3D 7) is a S3C4510B
block: 64 slots per queue, batch=3D16
RAMDISK driver initialized: 16 RAM disks of 1024K size 1024 blocksize
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 1 disk images:
0: 13B948-13B947 [VIRTUAL 13B948-13B947] (RO)
Samsung S3C4510 Ethernet driver version 0.2 (2002-02-20)
eth0: 00:ae:e4:00:80:81
NAND device: Manufacture ID: 0xec, Chip ID: 0xe6 (Samsung KM29U64000)
Creating 2 MTD partitions on "Samsung KM29U64000":
0x00000000-0x00200000 : "DNP flash partition 1"
0x00200000-0x00800000 : "DNP flash partition 2"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
jffs2: read_super for device 1f:01
jffs2_scan_eraseblock(): Scanning block at 0x0
Empty flash detected from 0x00000000 to 0x00002000
jffs2_scan_eraseblock(): Scanning block at 0x2000
Empty flash detected from 0x00002000 to 0x00004000
jffs2_scan_eraseblock(): Scanning block at 0x4000
Empty flash detected from 0x00004000 to 0x00006000
jffs2_scan_eraseblock(): Scanning block at 0x6000
Empty flash detected from 0x00006000 to 0x00008000
jffs2_scan_eraseblock(): Scanning block at 0x8000
Empty flash detected from 0x00008000 to 0x0000a000
jffs2_scan_eraseblock(): Scanning block at 0xa000
Empty flash detected from 0x0000a000 to 0x0000c000
jffs2_scan_eraseblock(): Scanning block at 0xc000
Empty flash detected from 0x0000c000 to 0x0000e000
jffs2_scan_eraseblock(): Scanning block at 0xe000
Empty flash detected from 0x0000e000 to 0x00010000
jffs2_scan_eraseblock(): Scanning block at 0x10000
Empty flash detected from 0x00010000 to 0x00012000
jffs2_scan_eraseblock(): Scanning block at 0x12000
Empty flash detected from 0x00012000 to 0x00014000
jffs2_scan_eraseblock(): Scanning block at 0x14000
Empty flash detected from 0x00014000 to 0x00016000
jffs2_scan_eraseblock(): Scanning block at 0x16000
Empty flash detected from 0x00016000 to 0x00018000
jffs2_scan_eraseblock(): Scanning block at 0x18000
Empty flash detected from 0x00018000 to 0x0001a000
jffs2_scan_eraseblock(): Scanning block at 0x1a000
Empty flash detected from 0x0001a000 to 0x0001c000
jffs2_scan_eraseblock(): Scanning block at 0x1c000
Empty flash detected from 0x0001c000 to 0x0001e000
jffs2_scan_eraseblock(): Scanning block at 0x1e000
Empty flash detected from 0x0001e000 to 0x00020000
jffs2_scan_eraseblock(): Scanning block at 0x20000
Empty flash detected from 0x00020000 to 0x00022000
jffs2_scan_eraseblock(): Scanning block at 0x22000
Empty flash detected from 0x00022000 to 0x00024000
jffs2_scan_eraseblock(): Scanning block at 0x24000
Empty flash detected from 0x00024000 to 0x00026000
jffs2_scan_eraseblock(): Scanning block at 0x26000
Empty flash detected from 0x00026000 to 0x00028000
jffs2_scan_eraseblock(): Scanning block at 0x28000
Empty flash detected from 0x00028000 to 0x0002a000
jffs2_scan_eraseblock(): Scanning block at 0x2a000
Empty flash detected from 0x0002a000 to 0x0002c000
jffs2_scan_eraseblock(): Scanning block at 0x2c000
Empty flash detected from 0x0002c000 to 0x0002e000
jffs2_scan_eraseblock(): Scanning block at 0x2e000
Empty flash detected from 0x0002e000 to 0x00030000
jffs2_scan_eraseblock(): Scanning block at 0x30000
Empty flash detected from 0x00030000 to 0x00032000
jffs2_scan_eraseblock(): Scanning block at 0x32000
Empty flash detected from 0x00032000 to 0x00034000
jffs2_scan_eraseblock(): Scanning block at 0x34000
Empty flash detected from 0x00034000 to 0x00036000
jffs2_scan_eraseblock(): Scanning block at 0x36000
Empty flash detected from 0x00036000 to 0x00038000
jffs2_scan_eraseblock(): Scanning block at 0x38000
Empty flash detected from 0x00038000 to 0x0003a000
jffs2_scan_eraseblock(): Scanning block at 0x3a000
Empty flash detected from 0x0003a000 to 0x0003c000
jffs2_scan_eraseblock(): Scanning block at 0x3c000
Empty flash detected from 0x0003c000 to 0x0003e000
jffs2_scan_eraseblock(): Scanning block at 0x3e000
Empty flash detected from 0x0003e000 to 0x00040000
jffs2_scan_eraseblock(): Scanning block at 0x40000
Empty flash detected from 0x00040000 to 0x00042000
jffs2_scan_eraseblock(): Scanning block at 0x42000
Empty flash detected from 0x00042000 to 0x00044000
jffs2_scan_eraseblock(): Scanning block at 0x44000
Empty flash detected from 0x00044000 to 0x00046000
jffs2_scan_eraseblock(): Scanning block at 0x46000
Empty flash detected from 0x00046000 to 0x00048000
jffs2_scan_eraseblock(): Scanning block at 0x48000
Empty flash detected from 0x00048000 to 0x0004a000
jffs2_scan_eraseblock(): Scanning block at 0x4a000
Empty flash detected from 0x0004a000 to 0x0004c000
jffs2_scan_eraseblock(): Scanning block at 0x4c000
Empty flash detected from 0x0004c000 to 0x0004e000
jffs2_scan_eraseblock(): Scanning block at 0x4e000
Empty flash detected from 0x0004e000 to 0x00050000
jffs2_scan_eraseblock(): Scanning block at 0x50000
Empty flash detected from 0x00050000 to 0x00052000
jffs2_scan_eraseblock(): Scanning block at 0x52000
Empty flash detected from 0x00052000 to 0x00054000
jffs2_scan_eraseblock(): Scanning block at 0x54000
Empty flash detected from 0x00054000 to 0x00056000
jffs2_scan_eraseblock(): Scanning block at 0x56000
Empty flash detected from 0x00056000 to 0x00058000
jffs2_scan_eraseblock(): Scanning block at 0x58000
Empty flash detected from 0x00058000 to 0x0005a000
jffs2_scan_eraseblock(): Scanning block at 0x5a000
Empty flash detected from 0x0005a000 to 0x0005c000
jffs2_scan_eraseblock(): Scanning block at 0x5c000
Empty flash detected from 0x0005c000 to 0x0005e000
jffs2_scan_eraseblock(): Scanning block at 0x5e000
Empty flash detected from 0x0005e000 to 0x00060000
jffs2_scan_eraseblock(): Scanning block at 0x60000
Empty flash detected from 0x00060000 to 0x00062000
jffs2_scan_eraseblock(): Scanning block at 0x62000
Empty flash detected from 0x00062000 to 0x00064000
jffs2_scan_eraseblock(): Scanning block at 0x64000
Empty flash detected from 0x00064000 to 0x00066000
jffs2_scan_eraseblock(): Scanning block at 0x66000
Empty flash detected from 0x00066000 to 0x00068000
jffs2_scan_eraseblock(): Scanning block at 0x68000
Empty flash detected from 0x00068000 to 0x0006a000
jffs2_scan_eraseblock(): Scanning block at 0x6a000
Empty flash detected from 0x0006a000 to 0x0006c000
jffs2_scan_eraseblock(): Scanning block at 0x6c000
Empty flash detected from 0x0006c000 to 0x0006e000
jffs2_scan_eraseblock(): Scanning block at 0x6e000
Empty flash detected from 0x0006e000 to 0x00070000
jffs2_scan_eraseblock(): Scanning block at 0x70000
Empty flash detected from 0x00070000 to 0x00072000
jffs2_scan_eraseblock(): Scanning block at 0x72000
Empty flash detected from 0x00072000 to 0x00074000
jffs2_scan_eraseblock(): Scanning block at 0x74000
Empty flash detected from 0x00074000 to 0x00076000
jffs2_scan_eraseblock(): Scanning block at 0x76000
Empty flash detected from 0x00076000 to 0x00078000
jffs2_scan_eraseblock(): Scanning block at 0x78000
Empty flash detected from 0x00078000 to 0x0007a000
jffs2_scan_eraseblock(): Scanning block at 0x7a000
Empty flash detected from 0x0007a000 to 0x0007c000
jffs2_scan_eraseblock(): Scanning block at 0x7c000
Empty flash detected from 0x0007c000 to 0x0007e000
jffs2_scan_eraseblock(): Scanning block at 0x7e000
Empty flash detected from 0x0007e000 to 0x00080000
jffs2_scan_eraseblock(): Scanning block at 0x80000
Empty flash detected from 0x00080000 to 0x00082000
jffs2_scan_eraseblock(): Scanning block at 0x82000
Empty flash detected from 0x00082000 to 0x00084000
jffs2_scan_eraseblock(): Scanning block at 0x84000
Empty flash detected from 0x00084000 to 0x00086000
jffs2_scan_eraseblock(): Scanning block at 0x86000
Empty flash detected from 0x00086000 to 0x00088000
jffs2_scan_eraseblock(): Scanning block at 0x88000
Empty flash detected from 0x00088000 to 0x0008a000
jffs2_scan_eraseblock(): Scanning block at 0x8a000
Empty flash detected from 0x0008a000 to 0x0008c000
jffs2_scan_eraseblock(): Scanning block at 0x8c000
Empty flash detected from 0x0008c000 to 0x0008e000
jffs2_scan_eraseblock(): Scanning block at 0x8e000
Empty flash detected from 0x0008e000 to 0x00090000
jffs2_scan_eraseblock(): Scanning block at 0x90000
Empty flash detected from 0x00090000 to 0x00092000
jffs2_scan_eraseblock(): Scanning block at 0x92000
Empty flash detected from 0x00092000 to 0x00094000
jffs2_scan_eraseblock(): Scanning block at 0x94000
Empty flash detected from 0x00094000 to 0x00096000
jffs2_scan_eraseblock(): Scanning block at 0x96000
Empty flash detected from 0x00096000 to 0x00098000
jffs2_scan_eraseblock(): Scanning block at 0x98000
Empty flash detected from 0x00098000 to 0x0009a000
jffs2_scan_eraseblock(): Scanning block at 0x9a000
Empty flash detected from 0x0009a000 to 0x0009c000
jffs2_scan_eraseblock(): Scanning block at 0x9c000
Empty flash detected from 0x0009c000 to 0x0009e000
jffs2_scan_eraseblock(): Scanning block at 0x9e000
Empty flash detected from 0x0009e000 to 0x000a0000
jffs2_scan_eraseblock(): Scanning block at 0xa0000
Empty flash detected from 0x000a0000 to 0x000a2000
jffs2_scan_eraseblock(): Scanning block at 0xa2000
Empty flash detected from 0x000a2000 to 0x000a4000
jffs2_scan_eraseblock(): Scanning block at 0xa4000
Empty flash detected from 0x000a4000 to 0x000a6000
jffs2_scan_eraseblock(): Scanning block at 0xa6000
Empty flash detected from 0x000a6000 to 0x000a8000
jffs2_scan_eraseblock(): Scanning block at 0xa8000
Empty flash detected from 0x000a8000 to 0x000aa000
jffs2_scan_eraseblock(): Scanning block at 0xaa000
Empty flash detected from 0x000aa000 to 0x000ac000
jffs2_scan_eraseblock(): Scanning block at 0xac000
Empty flash detected from 0x000ac000 to 0x000ae000
jffs2_scan_eraseblock(): Scanning block at 0xae000
Empty flash detected from 0x000ae000 to 0x000b0000
jffs2_scan_eraseblock(): Scanning block at 0xb0000
Empty flash detected from 0x000b0000 to 0x000b2000
jffs2_scan_eraseblock(): Scanning block at 0xb2000
Empty flash detected from 0x000b2000 to 0x000b4000
jffs2_scan_eraseblock(): Scanning block at 0xb4000
Empty flash detected from 0x000b4000 to 0x000b6000
jffs2_scan_eraseblock(): Scanning block at 0xb6000
Empty flash detected from 0x000b6000 to 0x000b8000
jffs2_scan_eraseblock(): Scanning block at 0xb8000
Empty flash detected from 0x000b8000 to 0x000ba000
jffs2_scan_eraseblock(): Scanning block at 0xba000
Empty flash detected from 0x000ba000 to 0x000bc000
jffs2_scan_eraseblock(): Scanning block at 0xbc000
Empty flash detected from 0x000bc000 to 0x000be000
jffs2_scan_eraseblock(): Scanning block at 0xbe000
Empty flash detected from 0x000be000 to 0x000c0000
jffs2_scan_eraseblock(): Scanning block at 0xc0000
Empty flash detected from 0x000c0000 to 0x000c2000
jffs2_scan_eraseblock(): Scanning block at 0xc2000
Empty flash detected from 0x000c2000 to 0x000c4000
jffs2_scan_eraseblock(): Scanning block at 0xc4000
Empty flash detected from 0x000c4000 to 0x000c6000
jffs2_scan_eraseblock(): Scanning block at 0xc6000
Empty flash detected from 0x000c6000 to 0x000c8000
jffs2_scan_eraseblock(): Scanning block at 0xc8000
Empty flash detected from 0x000c8000 to 0x000ca000
jffs2_scan_eraseblock(): Scanning block at 0xca000
Empty flash detected from 0x000ca000 to 0x000cc000
jffs2_scan_eraseblock(): Scanning block at 0xcc000
Empty flash detected from 0x000cc000 to 0x000ce000
jffs2_scan_eraseblock(): Scanning block at 0xce000
Empty flash detected from 0x000ce000 to 0x000d0000
jffs2_scan_eraseblock(): Scanning block at 0xd0000
Empty flash detected from 0x000d0000 to 0x000d2000
jffs2_scan_eraseblock(): Scanning block at 0xd2000
Empty flash detected from 0x000d2000 to 0x000d4000
jffs2_scan_eraseblock(): Scanning block at 0xd4000
Empty flash detected from 0x000d4000 to 0x000d6000
jffs2_scan_eraseblock(): Scanning block at 0xd6000
Empty flash detected from 0x000d6000 to 0x000d8000
jffs2_scan_eraseblock(): Scanning block at 0xd8000
Empty flash detected from 0x000d8000 to 0x000da000
jffs2_scan_eraseblock(): Scanning block at 0xda000
Empty flash detected from 0x000da000 to 0x000dc000
jffs2_scan_eraseblock(): Scanning block at 0xdc000
Empty flash detected from 0x000dc000 to 0x000de000
jffs2_scan_eraseblock(): Scanning block at 0xde000
Empty flash detected from 0x000de000 to 0x000e0000
jffs2_scan_eraseblock(): Scanning block at 0xe0000
Empty flash detected from 0x000e0000 to 0x000e2000
jffs2_scan_eraseblock(): Scanning block at 0xe2000
Empty flash detected from 0x000e2000 to 0x000e4000
jffs2_scan_eraseblock(): Scanning block at 0xe4000
Empty flash detected from 0x000e4000 to 0x000e6000
jffs2_scan_eraseblock(): Scanning block at 0xe6000
Empty flash detected from 0x000e6000 to 0x000e8000
jffs2_scan_eraseblock(): Scanning block at 0xe8000
Empty flash detected from 0x000e8000 to 0x000ea000
jffs2_scan_eraseblock(): Scanning block at 0xea000
Empty flash detected from 0x000ea000 to 0x000ec000
jffs2_scan_eraseblock(): Scanning block at 0xec000
Empty flash detected from 0x000ec000 to 0x000ee000
jffs2_scan_eraseblock(): Scanning block at 0xee000
Empty flash detected from 0x000ee000 to 0x000f0000
jffs2_scan_eraseblock(): Scanning block at 0xf0000
Empty flash detected from 0x000f0000 to 0x000f2000
jffs2_scan_eraseblock(): Scanning block at 0xf2000
Empty flash detected from 0x000f2000 to 0x000f4000
jffs2_scan_eraseblock(): Scanning block at 0xf4000
Empty flash detected from 0x000f4000 to 0x000f6000
jffs2_scan_eraseblock(): Scanning block at 0xf6000
Empty flash detected from 0x000f6000 to 0x000f8000
jffs2_scan_eraseblock(): Scanning block at 0xf8000
Empty flash detected from 0x000f8000 to 0x000fa000
jffs2_scan_eraseblock(): Scanning block at 0xfa000
Empty flash detected from 0x000fa000 to 0x000fc000
jffs2_scan_eraseblock(): Scanning block at 0xfc000
Empty flash detected from 0x000fc000 to 0x000fe000
jffs2_scan_eraseblock(): Scanning block at 0xfe000
Empty flash detected from 0x000fe000 to 0x00100000
jffs2_scan_eraseblock(): Scanning block at 0x100000
Empty flash detected from 0x00100000 to 0x00102000
jffs2_scan_eraseblock(): Scanning block at 0x102000
Empty flash detected from 0x00102000 to 0x00104000
jffs2_scan_eraseblock(): Scanning block at 0x104000
Empty flash detected from 0x00104000 to 0x00106000
jffs2_scan_eraseblock(): Scanning block at 0x106000
Empty flash detected from 0x00106000 to 0x00108000
jffs2_scan_eraseblock(): Scanning block at 0x108000
Empty flash detected from 0x00108000 to 0x0010a000
jffs2_scan_eraseblock(): Scanning block at 0x10a000
Empty flash detected from 0x0010a000 to 0x0010c000
jffs2_scan_eraseblock(): Scanning block at 0x10c000
Empty flash detected from 0x0010c000 to 0x0010e000
jffs2_scan_eraseblock(): Scanning block at 0x10e000
Empty flash detected from 0x0010e000 to 0x00110000
jffs2_scan_eraseblock(): Scanning block at 0x110000
Empty flash detected from 0x00110000 to 0x00112000
jffs2_scan_eraseblock(): Scanning block at 0x112000
Empty flash detected from 0x00112000 to 0x00114000
jffs2_scan_eraseblock(): Scanning block at 0x114000
Empty flash detected from 0x00114000 to 0x00116000
jffs2_scan_eraseblock(): Scanning block at 0x116000
Empty flash detected from 0x00116000 to 0x00118000
jffs2_scan_eraseblock(): Scanning block at 0x118000
Empty flash detected from 0x00118000 to 0x0011a000
jffs2_scan_eraseblock(): Scanning block at 0x11a000
Empty flash detected from 0x0011a000 to 0x0011c000
jffs2_scan_eraseblock(): Scanning block at 0x11c000
Empty flash detected from 0x0011c000 to 0x0011e000
jffs2_scan_eraseblock(): Scanning block at 0x11e000
Empty flash detected from 0x0011e000 to 0x00120000
jffs2_scan_eraseblock(): Scanning block at 0x120000
Empty flash detected from 0x00120000 to 0x00122000
jffs2_scan_eraseblock(): Scanning block at 0x122000
Empty flash detected from 0x00122000 to 0x00124000
jffs2_scan_eraseblock(): Scanning block at 0x124000
Empty flash detected from 0x00124000 to 0x00126000
jffs2_scan_eraseblock(): Scanning block at 0x126000
Empty flash detected from 0x00126000 to 0x00128000
jffs2_scan_eraseblock(): Scanning block at 0x128000
Empty flash detected from 0x00128000 to 0x0012a000
jffs2_scan_eraseblock(): Scanning block at 0x12a000
Empty flash detected from 0x0012a000 to 0x0012c000
jffs2_scan_eraseblock(): Scanning block at 0x12c000
Empty flash detected from 0x0012c000 to 0x0012e000
jffs2_scan_eraseblock(): Scanning block at 0x12e000
Empty flash detected from 0x0012e000 to 0x00130000
jffs2_scan_eraseblock(): Scanning block at 0x130000
Empty flash detected from 0x00130000 to 0x00132000
jffs2_scan_eraseblock(): Scanning block at 0x132000
Empty flash detected from 0x00132000 to 0x00134000
jffs2_scan_eraseblock(): Scanning block at 0x134000
Empty flash detected from 0x00134000 to 0x00136000
jffs2_scan_eraseblock(): Scanning block at 0x136000
Empty flash detected from 0x00136000 to 0x00138000
jffs2_scan_eraseblock(): Scanning block at 0x138000
Empty flash detected from 0x00138000 to 0x0013a000
jffs2_scan_eraseblock(): Scanning block at 0x13a000
Empty flash detected from 0x0013a000 to 0x0013c000
jffs2_scan_eraseblock(): Scanning block at 0x13c000
Empty flash detected from 0x0013c000 to 0x0013e000
jffs2_scan_eraseblock(): Scanning block at 0x13e000
Empty flash detected from 0x0013e000 to 0x00140000
jffs2_scan_eraseblock(): Scanning block at 0x140000
Empty flash detected from 0x00140000 to 0x00142000
jffs2_scan_eraseblock(): Scanning block at 0x142000
Empty flash detected from 0x00142000 to 0x00144000
jffs2_scan_eraseblock(): Scanning block at 0x144000
Empty flash detected from 0x00144000 to 0x00146000
jffs2_scan_eraseblock(): Scanning block at 0x146000
Empty flash detected from 0x00146000 to 0x00148000
jffs2_scan_eraseblock(): Scanning block at 0x148000
Empty flash detected from 0x00148000 to 0x0014a000
jffs2_scan_eraseblock(): Scanning block at 0x14a000
Empty flash detected from 0x0014a000 to 0x0014c000
jffs2_scan_eraseblock(): Scanning block at 0x14c000
Empty flash detected from 0x0014c000 to 0x0014e000
jffs2_scan_eraseblock(): Scanning block at 0x14e000
Empty flash detected from 0x0014e000 to 0x00150000
jffs2_scan_eraseblock(): Scanning block at 0x150000
Empty flash detected from 0x00150000 to 0x00152000
jffs2_scan_eraseblock(): Scanning block at 0x152000
Empty flash detected from 0x00152000 to 0x00154000
jffs2_scan_eraseblock(): Scanning block at 0x154000
Empty flash detected from 0x00154000 to 0x00156000
jffs2_scan_eraseblock(): Scanning block at 0x156000
Empty flash detected from 0x00156000 to 0x00158000
jffs2_scan_eraseblock(): Scanning block at 0x158000
Empty flash detected from 0x00158000 to 0x0015a000
jffs2_scan_eraseblock(): Scanning block at 0x15a000
Empty flash detected from 0x0015a000 to 0x0015c000
jffs2_scan_eraseblock(): Scanning block at 0x15c000
Empty flash detected from 0x0015c000 to 0x0015e000
jffs2_scan_eraseblock(): Scanning block at 0x15e000
Empty flash detected from 0x0015e000 to 0x00160000
jffs2_scan_eraseblock(): Scanning block at 0x160000
Empty flash detected from 0x00160000 to 0x00162000
jffs2_scan_eraseblock(): Scanning block at 0x162000
Empty flash detected from 0x00162000 to 0x00164000
jffs2_scan_eraseblock(): Scanning block at 0x164000
Empty flash detected from 0x00164000 to 0x00166000
jffs2_scan_eraseblock(): Scanning block at 0x166000
Empty flash detected from 0x00166000 to 0x00168000
jffs2_scan_eraseblock(): Scanning block at 0x168000
Empty flash detected from 0x00168000 to 0x0016a000
jffs2_scan_eraseblock(): Scanning block at 0x16a000
Empty flash detected from 0x0016a000 to 0x0016c000
jffs2_scan_eraseblock(): Scanning block at 0x16c000
Empty flash detected from 0x0016c000 to 0x0016e000
jffs2_scan_eraseblock(): Scanning block at 0x16e000
Empty flash detected from 0x0016e000 to 0x00170000
jffs2_scan_eraseblock(): Scanning block at 0x170000
Empty flash detected from 0x00170000 to 0x00172000
jffs2_scan_eraseblock(): Scanning block at 0x172000
Empty flash detected from 0x00172000 to 0x00174000
jffs2_scan_eraseblock(): Scanning block at 0x174000
Empty flash detected from 0x00174000 to 0x00176000
jffs2_scan_eraseblock(): Scanning block at 0x176000
Empty flash detected from 0x00176000 to 0x00178000
jffs2_scan_eraseblock(): Scanning block at 0x178000
Empty flash detected from 0x00178000 to 0x0017a000
jffs2_scan_eraseblock(): Scanning block at 0x17a000
Empty flash detected from 0x0017a000 to 0x0017c000
jffs2_scan_eraseblock(): Scanning block at 0x17c000
Empty flash detected from 0x0017c000 to 0x0017e000
jffs2_scan_eraseblock(): Scanning block at 0x17e000
Empty flash detected from 0x0017e000 to 0x00180000
jffs2_scan_eraseblock(): Scanning block at 0x180000
Empty flash detected from 0x00180000 to 0x00182000
jffs2_scan_eraseblock(): Scanning block at 0x182000
Empty flash detected from 0x00182000 to 0x00184000
jffs2_scan_eraseblock(): Scanning block at 0x184000
Empty flash detected from 0x00184000 to 0x00186000
jffs2_scan_eraseblock(): Scanning block at 0x186000
Empty flash detected from 0x00186000 to 0x00188000
jffs2_scan_eraseblock(): Scanning block at 0x188000
Empty flash detected from 0x00188000 to 0x0018a000
jffs2_scan_eraseblock(): Scanning block at 0x18a000
Empty flash detected from 0x0018a000 to 0x0018c000
jffs2_scan_eraseblock(): Scanning block at 0x18c000
Empty flash detected from 0x0018c000 to 0x0018e000
jffs2_scan_eraseblock(): Scanning block at 0x18e000
Empty flash detected from 0x0018e000 to 0x00190000
jffs2_scan_eraseblock(): Scanning block at 0x190000
Empty flash detected from 0x00190000 to 0x00192000
jffs2_scan_eraseblock(): Scanning block at 0x192000
Empty flash detected from 0x00192000 to 0x00194000
jffs2_scan_eraseblock(): Scanning block at 0x194000
Empty flash detected from 0x00194000 to 0x00196000
jffs2_scan_eraseblock(): Scanning block at 0x196000
Empty flash detected from 0x00196000 to 0x00198000
jffs2_scan_eraseblock(): Scanning block at 0x198000
Empty flash detected from 0x00198000 to 0x0019a000
jffs2_scan_eraseblock(): Scanning block at 0x19a000
Empty flash detected from 0x0019a000 to 0x0019c000
jffs2_scan_eraseblock(): Scanning block at 0x19c000
Empty flash detected from 0x0019c000 to 0x0019e000
jffs2_scan_eraseblock(): Scanning block at 0x19e000
Empty flash detected from 0x0019e000 to 0x001a0000
jffs2_scan_eraseblock(): Scanning block at 0x1a0000
Empty flash detected from 0x001a0000 to 0x001a2000
jffs2_scan_eraseblock(): Scanning block at 0x1a2000
Empty flash detected from 0x001a2000 to 0x001a4000
jffs2_scan_eraseblock(): Scanning block at 0x1a4000
Empty flash detected from 0x001a4000 to 0x001a6000
jffs2_scan_eraseblock(): Scanning block at 0x1a6000
Empty flash detected from 0x001a6000 to 0x001a8000
jffs2_scan_eraseblock(): Scanning block at 0x1a8000
Empty flash detected from 0x001a8000 to 0x001aa000
jffs2_scan_eraseblock(): Scanning block at 0x1aa000
Empty flash detected from 0x001aa000 to 0x001ac000
jffs2_scan_eraseblock(): Scanning block at 0x1ac000
Empty flash detected from 0x001ac000 to 0x001ae000
jffs2_scan_eraseblock(): Scanning block at 0x1ae000
Empty flash detected from 0x001ae000 to 0x001b0000
jffs2_scan_eraseblock(): Scanning block at 0x1b0000
Empty flash detected from 0x001b0000 to 0x001b2000
jffs2_scan_eraseblock(): Scanning block at 0x1b2000
Empty flash detected from 0x001b2000 to 0x001b4000
jffs2_scan_eraseblock(): Scanning block at 0x1b4000
Empty flash detected from 0x001b4000 to 0x001b6000
jffs2_scan_eraseblock(): Scanning block at 0x1b6000
Empty flash detected from 0x001b6000 to 0x001b8000
jffs2_scan_eraseblock(): Scanning block at 0x1b8000
Empty flash detected from 0x001b8000 to 0x001ba000
jffs2_scan_eraseblock(): Scanning block at 0x1ba000
Empty flash detected from 0x001ba000 to 0x001bc000
jffs2_scan_eraseblock(): Scanning block at 0x1bc000
Empty flash detected from 0x001bc000 to 0x001be000
jffs2_scan_eraseblock(): Scanning block at 0x1be000
Empty flash detected from 0x001be000 to 0x001c0000
jffs2_scan_eraseblock(): Scanning block at 0x1c0000
Empty flash detected from 0x001c0000 to 0x001c2000
jffs2_scan_eraseblock(): Scanning block at 0x1c2000
Empty flash detected from 0x001c2000 to 0x001c4000
jffs2_scan_eraseblock(): Scanning block at 0x1c4000
Empty flash detected from 0x001c4000 to 0x001c6000
jffs2_scan_eraseblock(): Scanning block at 0x1c6000
Empty flash detected from 0x001c6000 to 0x001c8000
jffs2_scan_eraseblock(): Scanning block at 0x1c8000
Empty flash detected from 0x001c8000 to 0x001ca000
jffs2_scan_eraseblock(): Scanning block at 0x1ca000
Empty flash detected from 0x001ca000 to 0x001cc000
jffs2_scan_eraseblock(): Scanning block at 0x1cc000
Empty flash detected from 0x001cc000 to 0x001ce000
jffs2_scan_eraseblock(): Scanning block at 0x1ce000
Empty flash detected from 0x001ce000 to 0x001d0000
jffs2_scan_eraseblock(): Scanning block at 0x1d0000
Empty flash detected from 0x001d0000 to 0x001d2000
jffs2_scan_eraseblock(): Scanning block at 0x1d2000
Empty flash detected from 0x001d2000 to 0x001d4000
jffs2_scan_eraseblock(): Scanning block at 0x1d4000
Empty flash detected from 0x001d4000 to 0x001d6000
jffs2_scan_eraseblock(): Scanning block at 0x1d6000
Empty flash detected from 0x001d6000 to 0x001d8000
jffs2_scan_eraseblock(): Scanning block at 0x1d8000
Empty flash detected from 0x001d8000 to 0x001da000
jffs2_scan_eraseblock(): Scanning block at 0x1da000
Empty flash detected from 0x001da000 to 0x001dc000
jffs2_scan_eraseblock(): Scanning block at 0x1dc000
Empty flash detected from 0x001dc000 to 0x001de000
jffs2_scan_eraseblock(): Scanning block at 0x1de000
Empty flash detected from 0x001de000 to 0x001e0000
jffs2_scan_eraseblock(): Scanning block at 0x1e0000
Empty flash detected from 0x001e0000 to 0x001e2000
jffs2_scan_eraseblock(): Scanning block at 0x1e2000
Empty flash detected from 0x001e2000 to 0x001e4000
jffs2_scan_eraseblock(): Scanning block at 0x1e4000
Empty flash detected from 0x001e4000 to 0x001e6000
jffs2_scan_eraseblock(): Scanning block at 0x1e6000
Empty flash detected from 0x001e6000 to 0x001e8000
jffs2_scan_eraseblock(): Scanning block at 0x1e8000
Empty flash detected from 0x001e8000 to 0x001ea000
jffs2_scan_eraseblock(): Scanning block at 0x1ea000
Empty flash detected from 0x001ea000 to 0x001ec000
jffs2_scan_eraseblock(): Scanning block at 0x1ec000
Empty flash detected from 0x001ec000 to 0x001ee000
jffs2_scan_eraseblock(): Scanning block at 0x1ee000
Empty flash detected from 0x001ee000 to 0x001f0000
jffs2_scan_eraseblock(): Scanning block at 0x1f0000
Empty flash detected from 0x001f0000 to 0x001f2000
jffs2_scan_eraseblock(): Scanning block at 0x1f2000
Empty flash detected from 0x001f2000 to 0x001f4000
jffs2_scan_eraseblock(): Scanning block at 0x1f4000
Empty flash detected from 0x001f4000 to 0x001f6000
jffs2_scan_eraseblock(): Scanning block at 0x1f6000
Empty flash detected from 0x001f6000 to 0x001f8000
jffs2_scan_eraseblock(): Scanning block at 0x1f8000
Empty flash detected from 0x001f8000 to 0x001fa000
jffs2_scan_eraseblock(): Scanning block at 0x1fa000
Empty flash detected from 0x001fa000 to 0x001fc000
jffs2_scan_eraseblock(): Scanning block at 0x1fc000
Empty flash detected from 0x001fc000 to 0x001fe000
jffs2_scan_eraseblock(): Scanning block at 0x1fe000
Empty flash detected from 0x001fe000 to 0x00200000
jffs2_scan_eraseblock(): Scanning block at 0x200000
Empty flash detected from 0x00200000 to 0x00202000
jffs2_scan_eraseblock(): Scanning block at 0x202000
Empty flash detected from 0x00202000 to 0x00204000
jffs2_scan_eraseblock(): Scanning block at 0x204000
Empty flash detected from 0x00204000 to 0x00206000
jffs2_scan_eraseblock(): Scanning block at 0x206000
Empty flash detected from 0x00206000 to 0x00208000
jffs2_scan_eraseblock(): Scanning block at 0x208000
Empty flash detected from 0x00208000 to 0x0020a000
jffs2_scan_eraseblock(): Scanning block at 0x20a000
Empty flash detected from 0x0020a000 to 0x0020c000
jffs2_scan_eraseblock(): Scanning block at 0x20c000
Empty flash detected from 0x0020c000 to 0x0020e000
jffs2_scan_eraseblock(): Scanning block at 0x20e000
Empty flash detected from 0x0020e000 to 0x00210000
jffs2_scan_eraseblock(): Scanning block at 0x210000
Empty flash detected from 0x00210000 to 0x00212000
jffs2_scan_eraseblock(): Scanning block at 0x212000
Empty flash detected from 0x00212000 to 0x00214000
jffs2_scan_eraseblock(): Scanning block at 0x214000
Empty flash detected from 0x00214000 to 0x00216000
jffs2_scan_eraseblock(): Scanning block at 0x216000
Empty flash detected from 0x00216000 to 0x00218000
jffs2_scan_eraseblock(): Scanning block at 0x218000
Empty flash detected from 0x00218000 to 0x0021a000
jffs2_scan_eraseblock(): Scanning block at 0x21a000
Empty flash detected from 0x0021a000 to 0x0021c000
jffs2_scan_eraseblock(): Scanning block at 0x21c000
Empty flash detected from 0x0021c000 to 0x0021e000
jffs2_scan_eraseblock(): Scanning block at 0x21e000
Empty flash detected from 0x0021e000 to 0x00220000
jffs2_scan_eraseblock(): Scanning block at 0x220000
Empty flash detected from 0x00220000 to 0x00222000
jffs2_scan_eraseblock(): Scanning block at 0x222000
Empty flash detected from 0x00222000 to 0x00224000
jffs2_scan_eraseblock(): Scanning block at 0x224000
Empty flash detected from 0x00224000 to 0x00226000
jffs2_scan_eraseblock(): Scanning block at 0x226000
Empty flash detected from 0x00226000 to 0x00228000
jffs2_scan_eraseblock(): Scanning block at 0x228000
Empty flash detected from 0x00228000 to 0x0022a000
jffs2_scan_eraseblock(): Scanning block at 0x22a000
Empty flash detected from 0x0022a000 to 0x0022c000
jffs2_scan_eraseblock(): Scanning block at 0x22c000
Empty flash detected from 0x0022c000 to 0x0022e000
jffs2_scan_eraseblock(): Scanning block at 0x22e000
Empty flash detected from 0x0022e000 to 0x00230000
jffs2_scan_eraseblock(): Scanning block at 0x230000
Empty flash detected from 0x00230000 to 0x00232000
jffs2_scan_eraseblock(): Scanning block at 0x232000
Empty flash detected from 0x00232000 to 0x00234000
jffs2_scan_eraseblock(): Scanning block at 0x234000
Empty flash detected from 0x00234000 to 0x00236000
jffs2_scan_eraseblock(): Scanning block at 0x236000
Empty flash detected from 0x00236000 to 0x00238000
jffs2_scan_eraseblock(): Scanning block at 0x238000
Empty flash detected from 0x00238000 to 0x0023a000
jffs2_scan_eraseblock(): Scanning block at 0x23a000
Empty flash detected from 0x0023a000 to 0x0023c000
jffs2_scan_eraseblock(): Scanning block at 0x23c000
Empty flash detected from 0x0023c000 to 0x0023e000
jffs2_scan_eraseblock(): Scanning block at 0x23e000
Empty flash detected from 0x0023e000 to 0x00240000
jffs2_scan_eraseblock(): Scanning block at 0x240000
Empty flash detected from 0x00240000 to 0x00242000
jffs2_scan_eraseblock(): Scanning block at 0x242000
Empty flash detected from 0x00242000 to 0x00244000
jffs2_scan_eraseblock(): Scanning block at 0x244000
Empty flash detected from 0x00244000 to 0x00246000
jffs2_scan_eraseblock(): Scanning block at 0x246000
Empty flash detected from 0x00246000 to 0x00248000
jffs2_scan_eraseblock(): Scanning block at 0x248000
Empty flash detected from 0x00248000 to 0x0024a000
jffs2_scan_eraseblock(): Scanning block at 0x24a000
Empty flash detected from 0x0024a000 to 0x0024c000
jffs2_scan_eraseblock(): Scanning block at 0x24c000
Empty flash detected from 0x0024c000 to 0x0024e000
jffs2_scan_eraseblock(): Scanning block at 0x24e000
Empty flash detected from 0x0024e000 to 0x00250000
jffs2_scan_eraseblock(): Scanning block at 0x250000
Empty flash detected from 0x00250000 to 0x00252000
jffs2_scan_eraseblock(): Scanning block at 0x252000
Empty flash detected from 0x00252000 to 0x00254000
jffs2_scan_eraseblock(): Scanning block at 0x254000
Empty flash detected from 0x00254000 to 0x00256000
jffs2_scan_eraseblock(): Scanning block at 0x256000
Empty flash detected from 0x00256000 to 0x00258000
jffs2_scan_eraseblock(): Scanning block at 0x258000
Empty flash detected from 0x00258000 to 0x0025a000
jffs2_scan_eraseblock(): Scanning block at 0x25a000
Empty flash detected from 0x0025a000 to 0x0025c000
jffs2_scan_eraseblock(): Scanning block at 0x25c000
Empty flash detected from 0x0025c000 to 0x0025e000
jffs2_scan_eraseblock(): Scanning block at 0x25e000
Empty flash detected from 0x0025e000 to 0x00260000
jffs2_scan_eraseblock(): Scanning block at 0x260000
Empty flash detected from 0x00260000 to 0x00262000
jffs2_scan_eraseblock(): Scanning block at 0x262000
Empty flash detected from 0x00262000 to 0x00264000
jffs2_scan_eraseblock(): Scanning block at 0x264000
Empty flash detected from 0x00264000 to 0x00266000
jffs2_scan_eraseblock(): Scanning block at 0x266000
Empty flash detected from 0x00266000 to 0x00268000
jffs2_scan_eraseblock(): Scanning block at 0x268000
Empty flash detected from 0x00268000 to 0x0026a000
jffs2_scan_eraseblock(): Scanning block at 0x26a000
Empty flash detected from 0x0026a000 to 0x0026c000
jffs2_scan_eraseblock(): Scanning block at 0x26c000
Empty flash detected from 0x0026c000 to 0x0026e000
jffs2_scan_eraseblock(): Scanning block at 0x26e000
Empty flash detected from 0x0026e000 to 0x00270000
jffs2_scan_eraseblock(): Scanning block at 0x270000
Empty flash detected from 0x00270000 to 0x00272000
jffs2_scan_eraseblock(): Scanning block at 0x272000
Empty flash detected from 0x00272000 to 0x00274000
jffs2_scan_eraseblock(): Scanning block at 0x274000
Empty flash detected from 0x00274000 to 0x00276000
jffs2_scan_eraseblock(): Scanning block at 0x276000
Empty flash detected from 0x00276000 to 0x00278000
jffs2_scan_eraseblock(): Scanning block at 0x278000
Empty flash detected from 0x00278000 to 0x0027a000
jffs2_scan_eraseblock(): Scanning block at 0x27a000
Empty flash detected from 0x0027a000 to 0x0027c000
jffs2_scan_eraseblock(): Scanning block at 0x27c000
Empty flash detected from 0x0027c000 to 0x0027e000
jffs2_scan_eraseblock(): Scanning block at 0x27e000
Empty flash detected from 0x0027e000 to 0x00280000
jffs2_scan_eraseblock(): Scanning block at 0x280000
Empty flash detected from 0x00280000 to 0x00282000
jffs2_scan_eraseblock(): Scanning block at 0x282000
Empty flash detected from 0x00282000 to 0x00284000
jffs2_scan_eraseblock(): Scanning block at 0x284000
Empty flash detected from 0x00284000 to 0x00286000
jffs2_scan_eraseblock(): Scanning block at 0x286000
Empty flash detected from 0x00286000 to 0x00288000
jffs2_scan_eraseblock(): Scanning block at 0x288000
Empty flash detected from 0x00288000 to 0x0028a000
jffs2_scan_eraseblock(): Scanning block at 0x28a000
Empty flash detected from 0x0028a000 to 0x0028c000
jffs2_scan_eraseblock(): Scanning block at 0x28c000
Empty flash detected from 0x0028c000 to 0x0028e000
jffs2_scan_eraseblock(): Scanning block at 0x28e000
Empty flash detected from 0x0028e000 to 0x00290000
jffs2_scan_eraseblock(): Scanning block at 0x290000
Empty flash detected from 0x00290000 to 0x00292000
jffs2_scan_eraseblock(): Scanning block at 0x292000
Empty flash detected from 0x00292000 to 0x00294000
jffs2_scan_eraseblock(): Scanning block at 0x294000
Empty flash detected from 0x00294000 to 0x00296000
jffs2_scan_eraseblock(): Scanning block at 0x296000
Empty flash detected from 0x00296000 to 0x00298000
jffs2_scan_eraseblock(): Scanning block at 0x298000
Empty flash detected from 0x00298000 to 0x0029a000
jffs2_scan_eraseblock(): Scanning block at 0x29a000
Empty flash detected from 0x0029a000 to 0x0029c000
jffs2_scan_eraseblock(): Scanning block at 0x29c000
Empty flash detected from 0x0029c000 to 0x0029e000
jffs2_scan_eraseblock(): Scanning block at 0x29e000
Empty flash detected from 0x0029e000 to 0x002a0000
jffs2_scan_eraseblock(): Scanning block at 0x2a0000
Empty flash detected from 0x002a0000 to 0x002a2000
jffs2_scan_eraseblock(): Scanning block at 0x2a2000
Empty flash detected from 0x002a2000 to 0x002a4000
jffs2_scan_eraseblock(): Scanning block at 0x2a4000
Empty flash detected from 0x002a4000 to 0x002a6000
jffs2_scan_eraseblock(): Scanning block at 0x2a6000
Empty flash detected from 0x002a6000 to 0x002a8000
jffs2_scan_eraseblock(): Scanning block at 0x2a8000
Empty flash detected from 0x002a8000 to 0x002aa000
jffs2_scan_eraseblock(): Scanning block at 0x2aa000
Empty flash detected from 0x002aa000 to 0x002ac000
jffs2_scan_eraseblock(): Scanning block at 0x2ac000
Empty flash detected from 0x002ac000 to 0x002ae000
jffs2_scan_eraseblock(): Scanning block at 0x2ae000
Empty flash detected from 0x002ae000 to 0x002b0000
jffs2_scan_eraseblock(): Scanning block at 0x2b0000
Empty flash detected from 0x002b0000 to 0x002b2000
jffs2_scan_eraseblock(): Scanning block at 0x2b2000
Empty flash detected from 0x002b2000 to 0x002b4000
jffs2_scan_eraseblock(): Scanning block at 0x2b4000
Empty flash detected from 0x002b4000 to 0x002b6000
jffs2_scan_eraseblock(): Scanning block at 0x2b6000
Empty flash detected from 0x002b6000 to 0x002b8000
jffs2_scan_eraseblock(): Scanning block at 0x2b8000
Empty flash detected from 0x002b8000 to 0x002ba000
jffs2_scan_eraseblock(): Scanning block at 0x2ba000
Empty flash detected from 0x002ba000 to 0x002bc000
jffs2_scan_eraseblock(): Scanning block at 0x2bc000
Empty flash detected from 0x002bc000 to 0x002be000
jffs2_scan_eraseblock(): Scanning block at 0x2be000
Empty flash detected from 0x002be000 to 0x002c0000
jffs2_scan_eraseblock(): Scanning block at 0x2c0000
Empty flash detected from 0x002c0000 to 0x002c2000
jffs2_scan_eraseblock(): Scanning block at 0x2c2000
Empty flash detected from 0x002c2000 to 0x002c4000
jffs2_scan_eraseblock(): Scanning block at 0x2c4000
Empty flash detected from 0x002c4000 to 0x002c6000
jffs2_scan_eraseblock(): Scanning block at 0x2c6000
Empty flash detected from 0x002c6000 to 0x002c8000
jffs2_scan_eraseblock(): Scanning block at 0x2c8000
Empty flash detected from 0x002c8000 to 0x002ca000
jffs2_scan_eraseblock(): Scanning block at 0x2ca000
Empty flash detected from 0x002ca000 to 0x002cc000
jffs2_scan_eraseblock(): Scanning block at 0x2cc000
Empty flash detected from 0x002cc000 to 0x002ce000
jffs2_scan_eraseblock(): Scanning block at 0x2ce000
Empty flash detected from 0x002ce000 to 0x002d0000
jffs2_scan_eraseblock(): Scanning block at 0x2d0000
Empty flash detected from 0x002d0000 to 0x002d2000
jffs2_scan_eraseblock(): Scanning block at 0x2d2000
Empty flash detected from 0x002d2000 to 0x002d4000
jffs2_scan_eraseblock(): Scanning block at 0x2d4000
Empty flash detected from 0x002d4000 to 0x002d6000
jffs2_scan_eraseblock(): Scanning block at 0x2d6000
Empty flash detected from 0x002d6000 to 0x002d8000
jffs2_scan_eraseblock(): Scanning block at 0x2d8000
Empty flash detected from 0x002d8000 to 0x002da000
jffs2_scan_eraseblock(): Scanning block at 0x2da000
Empty flash detected from 0x002da000 to 0x002dc000
jffs2_scan_eraseblock(): Scanning block at 0x2dc000
Empty flash detected from 0x002dc000 to 0x002de000
jffs2_scan_eraseblock(): Scanning block at 0x2de000
Empty flash detected from 0x002de000 to 0x002e0000
jffs2_scan_eraseblock(): Scanning block at 0x2e0000
Empty flash detected from 0x002e0000 to 0x002e2000
jffs2_scan_eraseblock(): Scanning block at 0x2e2000
Empty flash detected from 0x002e2000 to 0x002e4000
jffs2_scan_eraseblock(): Scanning block at 0x2e4000
Empty flash detected from 0x002e4000 to 0x002e6000
jffs2_scan_eraseblock(): Scanning block at 0x2e6000
Empty flash detected from 0x002e6000 to 0x002e8000
jffs2_scan_eraseblock(): Scanning block at 0x2e8000
Empty flash detected from 0x002e8000 to 0x002ea000
jffs2_scan_eraseblock(): Scanning block at 0x2ea000
Empty flash detected from 0x002ea000 to 0x002ec000
jffs2_scan_eraseblock(): Scanning block at 0x2ec000
Empty flash detected from 0x002ec000 to 0x002ee000
jffs2_scan_eraseblock(): Scanning block at 0x2ee000
Empty flash detected from 0x002ee000 to 0x002f0000
jffs2_scan_eraseblock(): Scanning block at 0x2f0000
Empty flash detected from 0x002f0000 to 0x002f2000
jffs2_scan_eraseblock(): Scanning block at 0x2f2000
Empty flash detected from 0x002f2000 to 0x002f4000
jffs2_scan_eraseblock(): Scanning block at 0x2f4000
Empty flash detected from 0x002f4000 to 0x002f6000
jffs2_scan_eraseblock(): Scanning block at 0x2f6000
Empty flash detected from 0x002f6000 to 0x002f8000
jffs2_scan_eraseblock(): Scanning block at 0x2f8000
Empty flash detected from 0x002f8000 to 0x002fa000
jffs2_scan_eraseblock(): Scanning block at 0x2fa000
Empty flash detected from 0x002fa000 to 0x002fc000
jffs2_scan_eraseblock(): Scanning block at 0x2fc000
Empty flash detected from 0x002fc000 to 0x002fe000
jffs2_scan_eraseblock(): Scanning block at 0x2fe000
Empty flash detected from 0x002fe000 to 0x00300000
jffs2_scan_eraseblock(): Scanning block at 0x300000
Empty flash detected from 0x00300000 to 0x00302000
jffs2_scan_eraseblock(): Scanning block at 0x302000
Empty flash detected from 0x00302000 to 0x00304000
jffs2_scan_eraseblock(): Scanning block at 0x304000
Empty flash detected from 0x00304000 to 0x00306000
jffs2_scan_eraseblock(): Scanning block at 0x306000
Empty flash detected from 0x00306000 to 0x00308000
jffs2_scan_eraseblock(): Scanning block at 0x308000
Empty flash detected from 0x00308000 to 0x0030a000
jffs2_scan_eraseblock(): Scanning block at 0x30a000
Empty flash detected from 0x0030a000 to 0x0030c000
jffs2_scan_eraseblock(): Scanning block at 0x30c000
Empty flash detected from 0x0030c000 to 0x0030e000
jffs2_scan_eraseblock(): Scanning block at 0x30e000
Empty flash detected from 0x0030e000 to 0x00310000
jffs2_scan_eraseblock(): Scanning block at 0x310000
Empty flash detected from 0x00310000 to 0x00312000
jffs2_scan_eraseblock(): Scanning block at 0x312000
Empty flash detected from 0x00312000 to 0x00314000
jffs2_scan_eraseblock(): Scanning block at 0x314000
Empty flash detected from 0x00314000 to 0x00316000
jffs2_scan_eraseblock(): Scanning block at 0x316000
Empty flash detected from 0x00316000 to 0x00318000
jffs2_scan_eraseblock(): Scanning block at 0x318000
Empty flash detected from 0x00318000 to 0x0031a000
jffs2_scan_eraseblock(): Scanning block at 0x31a000
Empty flash detected from 0x0031a000 to 0x0031c000
jffs2_scan_eraseblock(): Scanning block at 0x31c000
Empty flash detected from 0x0031c000 to 0x0031e000
jffs2_scan_eraseblock(): Scanning block at 0x31e000
Empty flash detected from 0x0031e000 to 0x00320000
jffs2_scan_eraseblock(): Scanning block at 0x320000
Empty flash detected from 0x00320000 to 0x00322000
jffs2_scan_eraseblock(): Scanning block at 0x322000
Empty flash detected from 0x00322000 to 0x00324000
jffs2_scan_eraseblock(): Scanning block at 0x324000
Empty flash detected from 0x00324000 to 0x00326000
jffs2_scan_eraseblock(): Scanning block at 0x326000
Empty flash detected from 0x00326000 to 0x00328000
jffs2_scan_eraseblock(): Scanning block at 0x328000
Empty flash detected from 0x00328000 to 0x0032a000
jffs2_scan_eraseblock(): Scanning block at 0x32a000
Empty flash detected from 0x0032a000 to 0x0032c000
jffs2_scan_eraseblock(): Scanning block at 0x32c000
Empty flash detected from 0x0032c000 to 0x0032e000
jffs2_scan_eraseblock(): Scanning block at 0x32e000
Empty flash detected from 0x0032e000 to 0x00330000
jffs2_scan_eraseblock(): Scanning block at 0x330000
Empty flash detected from 0x00330000 to 0x00332000
jffs2_scan_eraseblock(): Scanning block at 0x332000
Empty flash detected from 0x00332000 to 0x00334000
jffs2_scan_eraseblock(): Scanning block at 0x334000
Empty flash detected from 0x00334000 to 0x00336000
jffs2_scan_eraseblock(): Scanning block at 0x336000
Empty flash detected from 0x00336000 to 0x00338000
jffs2_scan_eraseblock(): Scanning block at 0x338000
Empty flash detected from 0x00338000 to 0x0033a000
jffs2_scan_eraseblock(): Scanning block at 0x33a000
Empty flash detected from 0x0033a000 to 0x0033c000
jffs2_scan_eraseblock(): Scanning block at 0x33c000
Empty flash detected from 0x0033c000 to 0x0033e000
jffs2_scan_eraseblock(): Scanning block at 0x33e000
Empty flash detected from 0x0033e000 to 0x00340000
jffs2_scan_eraseblock(): Scanning block at 0x340000
Empty flash detected from 0x00340000 to 0x00342000
jffs2_scan_eraseblock(): Scanning block at 0x342000
Empty flash detected from 0x00342000 to 0x00344000
jffs2_scan_eraseblock(): Scanning block at 0x344000
Empty flash detected from 0x00344000 to 0x00346000
jffs2_scan_eraseblock(): Scanning block at 0x346000
Empty flash detected from 0x00346000 to 0x00348000
jffs2_scan_eraseblock(): Scanning block at 0x348000
Empty flash detected from 0x00348000 to 0x0034a000
jffs2_scan_eraseblock(): Scanning block at 0x34a000
Empty flash detected from 0x0034a000 to 0x0034c000
jffs2_scan_eraseblock(): Scanning block at 0x34c000
Empty flash detected from 0x0034c000 to 0x0034e000
jffs2_scan_eraseblock(): Scanning block at 0x34e000
Empty flash detected from 0x0034e000 to 0x00350000
jffs2_scan_eraseblock(): Scanning block at 0x350000
Empty flash detected from 0x00350000 to 0x00352000
jffs2_scan_eraseblock(): Scanning block at 0x352000
Empty flash detected from 0x00352000 to 0x00354000
jffs2_scan_eraseblock(): Scanning block at 0x354000
Empty flash detected from 0x00354000 to 0x00356000
jffs2_scan_eraseblock(): Scanning block at 0x356000
Empty flash detected from 0x00356000 to 0x00358000
jffs2_scan_eraseblock(): Scanning block at 0x358000
Empty flash detected from 0x00358000 to 0x0035a000
jffs2_scan_eraseblock(): Scanning block at 0x35a000
Empty flash detected from 0x0035a000 to 0x0035c000
jffs2_scan_eraseblock(): Scanning block at 0x35c000
Empty flash detected from 0x0035c000 to 0x0035e000
jffs2_scan_eraseblock(): Scanning block at 0x35e000
Empty flash detected from 0x0035e000 to 0x00360000
jffs2_scan_eraseblock(): Scanning block at 0x360000
Empty flash detected from 0x00360000 to 0x00362000
jffs2_scan_eraseblock(): Scanning block at 0x362000
Empty flash detected from 0x00362000 to 0x00364000
jffs2_scan_eraseblock(): Scanning block at 0x364000
Empty flash detected from 0x00364000 to 0x00366000
jffs2_scan_eraseblock(): Scanning block at 0x366000
Empty flash detected from 0x00366000 to 0x00368000
jffs2_scan_eraseblock(): Scanning block at 0x368000
Empty flash detected from 0x00368000 to 0x0036a000
jffs2_scan_eraseblock(): Scanning block at 0x36a000
Empty flash detected from 0x0036a000 to 0x0036c000
jffs2_scan_eraseblock(): Scanning block at 0x36c000
Empty flash detected from 0x0036c000 to 0x0036e000
jffs2_scan_eraseblock(): Scanning block at 0x36e000
Empty flash detected from 0x0036e000 to 0x00370000
jffs2_scan_eraseblock(): Scanning block at 0x370000
Empty flash detected from 0x00370000 to 0x00372000
jffs2_scan_eraseblock(): Scanning block at 0x372000
Empty flash detected from 0x00372000 to 0x00374000
jffs2_scan_eraseblock(): Scanning block at 0x374000
Empty flash detected from 0x00374000 to 0x00376000
jffs2_scan_eraseblock(): Scanning block at 0x376000
Empty flash detected from 0x00376000 to 0x00378000
jffs2_scan_eraseblock(): Scanning block at 0x378000
Empty flash detected from 0x00378000 to 0x0037a000
jffs2_scan_eraseblock(): Scanning block at 0x37a000
Empty flash detected from 0x0037a000 to 0x0037c000
jffs2_scan_eraseblock(): Scanning block at 0x37c000
Empty flash detected from 0x0037c000 to 0x0037e000
jffs2_scan_eraseblock(): Scanning block at 0x37e000
Empty flash detected from 0x0037e000 to 0x00380000
jffs2_scan_eraseblock(): Scanning block at 0x380000
Empty flash detected from 0x00380000 to 0x00382000
jffs2_scan_eraseblock(): Scanning block at 0x382000
Empty flash detected from 0x00382000 to 0x00384000
jffs2_scan_eraseblock(): Scanning block at 0x384000
Empty flash detected from 0x00384000 to 0x00386000
jffs2_scan_eraseblock(): Scanning block at 0x386000
Empty flash detected from 0x00386000 to 0x00388000
jffs2_scan_eraseblock(): Scanning block at 0x388000
Empty flash detected from 0x00388000 to 0x0038a000
jffs2_scan_eraseblock(): Scanning block at 0x38a000
Empty flash detected from 0x0038a000 to 0x0038c000
jffs2_scan_eraseblock(): Scanning block at 0x38c000
Empty flash detected from 0x0038c000 to 0x0038e000
jffs2_scan_eraseblock(): Scanning block at 0x38e000
Empty flash detected from 0x0038e000 to 0x00390000
jffs2_scan_eraseblock(): Scanning block at 0x390000
Empty flash detected from 0x00390000 to 0x00392000
jffs2_scan_eraseblock(): Scanning block at 0x392000
Empty flash detected from 0x00392000 to 0x00394000
jffs2_scan_eraseblock(): Scanning block at 0x394000
Empty flash detected from 0x00394000 to 0x00396000
jffs2_scan_eraseblock(): Scanning block at 0x396000
Empty flash detected from 0x00396000 to 0x00398000
jffs2_scan_eraseblock(): Scanning block at 0x398000
Empty flash detected from 0x00398000 to 0x0039a000
jffs2_scan_eraseblock(): Scanning block at 0x39a000
Empty flash detected from 0x0039a000 to 0x0039c000
jffs2_scan_eraseblock(): Scanning block at 0x39c000
Empty flash detected from 0x0039c000 to 0x0039e000
jffs2_scan_eraseblock(): Scanning block at 0x39e000
Empty flash detected from 0x0039e000 to 0x003a0000
jffs2_scan_eraseblock(): Scanning block at 0x3a0000
Empty flash detected from 0x003a0000 to 0x003a2000
jffs2_scan_eraseblock(): Scanning block at 0x3a2000
Empty flash detected from 0x003a2000 to 0x003a4000
jffs2_scan_eraseblock(): Scanning block at 0x3a4000
Empty flash detected from 0x003a4000 to 0x003a6000
jffs2_scan_eraseblock(): Scanning block at 0x3a6000
Empty flash detected from 0x003a6000 to 0x003a8000
jffs2_scan_eraseblock(): Scanning block at 0x3a8000
Empty flash detected from 0x003a8000 to 0x003aa000
jffs2_scan_eraseblock(): Scanning block at 0x3aa000
Empty flash detected from 0x003aa000 to 0x003ac000
jffs2_scan_eraseblock(): Scanning block at 0x3ac000
Empty flash detected from 0x003ac000 to 0x003ae000
jffs2_scan_eraseblock(): Scanning block at 0x3ae000
Empty flash detected from 0x003ae000 to 0x003b0000
jffs2_scan_eraseblock(): Scanning block at 0x3b0000
Empty flash detected from 0x003b0000 to 0x003b2000
jffs2_scan_eraseblock(): Scanning block at 0x3b2000
Empty flash detected from 0x003b2000 to 0x003b4000
jffs2_scan_eraseblock(): Scanning block at 0x3b4000
Empty flash detected from 0x003b4000 to 0x003b6000
jffs2_scan_eraseblock(): Scanning block at 0x3b6000
Empty flash detected from 0x003b6000 to 0x003b8000
jffs2_scan_eraseblock(): Scanning block at 0x3b8000
Empty flash detected from 0x003b8000 to 0x003ba000
jffs2_scan_eraseblock(): Scanning block at 0x3ba000
Empty flash detected from 0x003ba000 to 0x003bc000
jffs2_scan_eraseblock(): Scanning block at 0x3bc000
Empty flash detected from 0x003bc000 to 0x003be000
jffs2_scan_eraseblock(): Scanning block at 0x3be000
Empty flash detected from 0x003be000 to 0x003c0000
jffs2_scan_eraseblock(): Scanning block at 0x3c0000
Empty flash detected from 0x003c0000 to 0x003c2000
jffs2_scan_eraseblock(): Scanning block at 0x3c2000
Empty flash detected from 0x003c2000 to 0x003c4000
jffs2_scan_eraseblock(): Scanning block at 0x3c4000
Empty flash detected from 0x003c4000 to 0x003c6000
jffs2_scan_eraseblock(): Scanning block at 0x3c6000
Empty flash detected from 0x003c6000 to 0x003c8000
jffs2_scan_eraseblock(): Scanning block at 0x3c8000
Empty flash detected from 0x003c8000 to 0x003ca000
jffs2_scan_eraseblock(): Scanning block at 0x3ca000
Empty flash detected from 0x003ca000 to 0x003cc000
jffs2_scan_eraseblock(): Scanning block at 0x3cc000
Empty flash detected from 0x003cc000 to 0x003ce000
jffs2_scan_eraseblock(): Scanning block at 0x3ce000
Empty flash detected from 0x003ce000 to 0x003d0000
jffs2_scan_eraseblock(): Scanning block at 0x3d0000
Empty flash detected from 0x003d0000 to 0x003d2000
jffs2_scan_eraseblock(): Scanning block at 0x3d2000
Empty flash detected from 0x003d2000 to 0x003d4000
jffs2_scan_eraseblock(): Scanning block at 0x3d4000
Empty flash detected from 0x003d4000 to 0x003d6000
jffs2_scan_eraseblock(): Scanning block at 0x3d6000
Empty flash detected from 0x003d6000 to 0x003d8000
jffs2_scan_eraseblock(): Scanning block at 0x3d8000
Empty flash detected from 0x003d8000 to 0x003da000
jffs2_scan_eraseblock(): Scanning block at 0x3da000
Empty flash detected from 0x003da000 to 0x003dc000
jffs2_scan_eraseblock(): Scanning block at 0x3dc000
Empty flash detected from 0x003dc000 to 0x003de000
jffs2_scan_eraseblock(): Scanning block at 0x3de000
Empty flash detected from 0x003de000 to 0x003e0000
jffs2_scan_eraseblock(): Scanning block at 0x3e0000
Empty flash detected from 0x003e0000 to 0x003e2000
jffs2_scan_eraseblock(): Scanning block at 0x3e2000
Empty flash detected from 0x003e2000 to 0x003e4000
jffs2_scan_eraseblock(): Scanning block at 0x3e4000
Empty flash detected from 0x003e4000 to 0x003e6000
jffs2_scan_eraseblock(): Scanning block at 0x3e6000
Empty flash detected from 0x003e6000 to 0x003e8000
jffs2_scan_eraseblock(): Scanning block at 0x3e8000
Empty flash detected from 0x003e8000 to 0x003ea000
jffs2_scan_eraseblock(): Scanning block at 0x3ea000
Empty flash detected from 0x003ea000 to 0x003ec000
jffs2_scan_eraseblock(): Scanning block at 0x3ec000
Empty flash detected from 0x003ec000 to 0x003ee000
jffs2_scan_eraseblock(): Scanning block at 0x3ee000
Empty flash detected from 0x003ee000 to 0x003f0000
jffs2_scan_eraseblock(): Scanning block at 0x3f0000
Empty flash detected from 0x003f0000 to 0x003f2000
jffs2_scan_eraseblock(): Scanning block at 0x3f2000
Empty flash detected from 0x003f2000 to 0x003f4000
jffs2_scan_eraseblock(): Scanning block at 0x3f4000
Empty flash detected from 0x003f4000 to 0x003f6000
jffs2_scan_eraseblock(): Scanning block at 0x3f6000
Empty flash detected from 0x003f6000 to 0x003f8000
jffs2_scan_eraseblock(): Scanning block at 0x3f8000
Empty flash detected from 0x003f8000 to 0x003fa000
jffs2_scan_eraseblock(): Scanning block at 0x3fa000
Empty flash detected from 0x003fa000 to 0x003fc000
jffs2_scan_eraseblock(): Scanning block at 0x3fc000
Empty flash detected from 0x003fc000 to 0x003fe000
jffs2_scan_eraseblock(): Scanning block at 0x3fe000
Empty flash detected from 0x003fe000 to 0x00400000
jffs2_scan_eraseblock(): Scanning block at 0x400000
Empty flash detected from 0x00400000 to 0x00402000
jffs2_scan_eraseblock(): Scanning block at 0x402000
Empty flash detected from 0x00402000 to 0x00404000
jffs2_scan_eraseblock(): Scanning block at 0x404000
Empty flash detected from 0x00404000 to 0x00406000
jffs2_scan_eraseblock(): Scanning block at 0x406000
Empty flash detected from 0x00406000 to 0x00408000
jffs2_scan_eraseblock(): Scanning block at 0x408000
Empty flash detected from 0x00408000 to 0x0040a000
jffs2_scan_eraseblock(): Scanning block at 0x40a000
Empty flash detected from 0x0040a000 to 0x0040c000
jffs2_scan_eraseblock(): Scanning block at 0x40c000
Empty flash detected from 0x0040c000 to 0x0040e000
jffs2_scan_eraseblock(): Scanning block at 0x40e000
Empty flash detected from 0x0040e000 to 0x00410000
jffs2_scan_eraseblock(): Scanning block at 0x410000
Empty flash detected from 0x00410000 to 0x00412000
jffs2_scan_eraseblock(): Scanning block at 0x412000
Empty flash detected from 0x00412000 to 0x00414000
jffs2_scan_eraseblock(): Scanning block at 0x414000
Empty flash detected from 0x00414000 to 0x00416000
jffs2_scan_eraseblock(): Scanning block at 0x416000
Empty flash detected from 0x00416000 to 0x00418000
jffs2_scan_eraseblock(): Scanning block at 0x418000
Empty flash detected from 0x00418000 to 0x0041a000
jffs2_scan_eraseblock(): Scanning block at 0x41a000
Empty flash detected from 0x0041a000 to 0x0041c000
jffs2_scan_eraseblock(): Scanning block at 0x41c000
Empty flash detected from 0x0041c000 to 0x0041e000
jffs2_scan_eraseblock(): Scanning block at 0x41e000
Empty flash detected from 0x0041e000 to 0x00420000
jffs2_scan_eraseblock(): Scanning block at 0x420000
Empty flash detected from 0x00420000 to 0x00422000
jffs2_scan_eraseblock(): Scanning block at 0x422000
Empty flash detected from 0x00422000 to 0x00424000
jffs2_scan_eraseblock(): Scanning block at 0x424000
Empty flash detected from 0x00424000 to 0x00426000
jffs2_scan_eraseblock(): Scanning block at 0x426000
Empty flash detected from 0x00426000 to 0x00428000
jffs2_scan_eraseblock(): Scanning block at 0x428000
Empty flash detected from 0x00428000 to 0x0042a000
jffs2_scan_eraseblock(): Scanning block at 0x42a000
Empty flash detected from 0x0042a000 to 0x0042c000
jffs2_scan_eraseblock(): Scanning block at 0x42c000
Empty flash detected from 0x0042c000 to 0x0042e000
jffs2_scan_eraseblock(): Scanning block at 0x42e000
Empty flash detected from 0x0042e000 to 0x00430000
jffs2_scan_eraseblock(): Scanning block at 0x430000
Empty flash detected from 0x00430000 to 0x00432000
jffs2_scan_eraseblock(): Scanning block at 0x432000
Empty flash detected from 0x00432000 to 0x00434000
jffs2_scan_eraseblock(): Scanning block at 0x434000
Empty flash detected from 0x00434000 to 0x00436000
jffs2_scan_eraseblock(): Scanning block at 0x436000
Empty flash detected from 0x00436000 to 0x00438000
jffs2_scan_eraseblock(): Scanning block at 0x438000
Empty flash detected from 0x00438000 to 0x0043a000
jffs2_scan_eraseblock(): Scanning block at 0x43a000
Empty flash detected from 0x0043a000 to 0x0043c000
jffs2_scan_eraseblock(): Scanning block at 0x43c000
Empty flash detected from 0x0043c000 to 0x0043e000
jffs2_scan_eraseblock(): Scanning block at 0x43e000
Empty flash detected from 0x0043e000 to 0x00440000
jffs2_scan_eraseblock(): Scanning block at 0x440000
Empty flash detected from 0x00440000 to 0x00442000
jffs2_scan_eraseblock(): Scanning block at 0x442000
Empty flash detected from 0x00442000 to 0x00444000
jffs2_scan_eraseblock(): Scanning block at 0x444000
Empty flash detected from 0x00444000 to 0x00446000
jffs2_scan_eraseblock(): Scanning block at 0x446000
Empty flash detected from 0x00446000 to 0x00448000
jffs2_scan_eraseblock(): Scanning block at 0x448000
Empty flash detected from 0x00448000 to 0x0044a000
jffs2_scan_eraseblock(): Scanning block at 0x44a000
Empty flash detected from 0x0044a000 to 0x0044c000
jffs2_scan_eraseblock(): Scanning block at 0x44c000
Empty flash detected from 0x0044c000 to 0x0044e000
jffs2_scan_eraseblock(): Scanning block at 0x44e000
Empty flash detected from 0x0044e000 to 0x00450000
jffs2_scan_eraseblock(): Scanning block at 0x450000
Empty flash detected from 0x00450000 to 0x00452000
jffs2_scan_eraseblock(): Scanning block at 0x452000
Empty flash detected from 0x00452000 to 0x00454000
jffs2_scan_eraseblock(): Scanning block at 0x454000
Empty flash detected from 0x00454000 to 0x00456000
jffs2_scan_eraseblock(): Scanning block at 0x456000
Empty flash detected from 0x00456000 to 0x00458000
jffs2_scan_eraseblock(): Scanning block at 0x458000
Empty flash detected from 0x00458000 to 0x0045a000
jffs2_scan_eraseblock(): Scanning block at 0x45a000
Empty flash detected from 0x0045a000 to 0x0045c000
jffs2_scan_eraseblock(): Scanning block at 0x45c000
Empty flash detected from 0x0045c000 to 0x0045e000
jffs2_scan_eraseblock(): Scanning block at 0x45e000
Empty flash detected from 0x0045e000 to 0x00460000
jffs2_scan_eraseblock(): Scanning block at 0x460000
Empty flash detected from 0x00460000 to 0x00462000
jffs2_scan_eraseblock(): Scanning block at 0x462000
Empty flash detected from 0x00462000 to 0x00464000
jffs2_scan_eraseblock(): Scanning block at 0x464000
Empty flash detected from 0x00464000 to 0x00466000
jffs2_scan_eraseblock(): Scanning block at 0x466000
Empty flash detected from 0x00466000 to 0x00468000
jffs2_scan_eraseblock(): Scanning block at 0x468000
Empty flash detected from 0x00468000 to 0x0046a000
jffs2_scan_eraseblock(): Scanning block at 0x46a000
Empty flash detected from 0x0046a000 to 0x0046c000
jffs2_scan_eraseblock(): Scanning block at 0x46c000
Empty flash detected from 0x0046c000 to 0x0046e000
jffs2_scan_eraseblock(): Scanning block at 0x46e000
Empty flash detected from 0x0046e000 to 0x00470000
jffs2_scan_eraseblock(): Scanning block at 0x470000
Empty flash detected from 0x00470000 to 0x00472000
jffs2_scan_eraseblock(): Scanning block at 0x472000
Empty flash detected from 0x00472000 to 0x00474000
jffs2_scan_eraseblock(): Scanning block at 0x474000
Empty flash detected from 0x00474000 to 0x00476000
jffs2_scan_eraseblock(): Scanning block at 0x476000
Empty flash detected from 0x00476000 to 0x00478000
jffs2_scan_eraseblock(): Scanning block at 0x478000
Empty flash detected from 0x00478000 to 0x0047a000
jffs2_scan_eraseblock(): Scanning block at 0x47a000
Empty flash detected from 0x0047a000 to 0x0047c000
jffs2_scan_eraseblock(): Scanning block at 0x47c000
Empty flash detected from 0x0047c000 to 0x0047e000
jffs2_scan_eraseblock(): Scanning block at 0x47e000
Empty flash detected from 0x0047e000 to 0x00480000
jffs2_scan_eraseblock(): Scanning block at 0x480000
Empty flash detected from 0x00480000 to 0x00482000
jffs2_scan_eraseblock(): Scanning block at 0x482000
Empty flash detected from 0x00482000 to 0x00484000
jffs2_scan_eraseblock(): Scanning block at 0x484000
Empty flash detected from 0x00484000 to 0x00486000
jffs2_scan_eraseblock(): Scanning block at 0x486000
Empty flash detected from 0x00486000 to 0x00488000
jffs2_scan_eraseblock(): Scanning block at 0x488000
Empty flash detected from 0x00488000 to 0x0048a000
jffs2_scan_eraseblock(): Scanning block at 0x48a000
Empty flash detected from 0x0048a000 to 0x0048c000
jffs2_scan_eraseblock(): Scanning block at 0x48c000
Empty flash detected from 0x0048c000 to 0x0048e000
jffs2_scan_eraseblock(): Scanning block at 0x48e000
Empty flash detected from 0x0048e000 to 0x00490000
jffs2_scan_eraseblock(): Scanning block at 0x490000
Empty flash detected from 0x00490000 to 0x00492000
jffs2_scan_eraseblock(): Scanning block at 0x492000
Empty flash detected from 0x00492000 to 0x00494000
jffs2_scan_eraseblock(): Scanning block at 0x494000
Empty flash detected from 0x00494000 to 0x00496000
jffs2_scan_eraseblock(): Scanning block at 0x496000
Empty flash detected from 0x00496000 to 0x00498000
jffs2_scan_eraseblock(): Scanning block at 0x498000
Empty flash detected from 0x00498000 to 0x0049a000
jffs2_scan_eraseblock(): Scanning block at 0x49a000
Empty flash detected from 0x0049a000 to 0x0049c000
jffs2_scan_eraseblock(): Scanning block at 0x49c000
Empty flash detected from 0x0049c000 to 0x0049e000
jffs2_scan_eraseblock(): Scanning block at 0x49e000
Empty flash detected from 0x0049e000 to 0x004a0000
jffs2_scan_eraseblock(): Scanning block at 0x4a0000
Empty flash detected from 0x004a0000 to 0x004a2000
jffs2_scan_eraseblock(): Scanning block at 0x4a2000
Empty flash detected from 0x004a2000 to 0x004a4000
jffs2_scan_eraseblock(): Scanning block at 0x4a4000
Empty flash detected from 0x004a4000 to 0x004a6000
jffs2_scan_eraseblock(): Scanning block at 0x4a6000
Empty flash detected from 0x004a6000 to 0x004a8000
jffs2_scan_eraseblock(): Scanning block at 0x4a8000
Empty flash detected from 0x004a8000 to 0x004aa000
jffs2_scan_eraseblock(): Scanning block at 0x4aa000
Empty flash detected from 0x004aa000 to 0x004ac000
jffs2_scan_eraseblock(): Scanning block at 0x4ac000
Empty flash detected from 0x004ac000 to 0x004ae000
jffs2_scan_eraseblock(): Scanning block at 0x4ae000
Empty flash detected from 0x004ae000 to 0x004b0000
jffs2_scan_eraseblock(): Scanning block at 0x4b0000
Empty flash detected from 0x004b0000 to 0x004b2000
jffs2_scan_eraseblock(): Scanning block at 0x4b2000
Empty flash detected from 0x004b2000 to 0x004b4000
jffs2_scan_eraseblock(): Scanning block at 0x4b4000
Empty flash detected from 0x004b4000 to 0x004b6000
jffs2_scan_eraseblock(): Scanning block at 0x4b6000
Empty flash detected from 0x004b6000 to 0x004b8000
jffs2_scan_eraseblock(): Scanning block at 0x4b8000
Empty flash detected from 0x004b8000 to 0x004ba000
jffs2_scan_eraseblock(): Scanning block at 0x4ba000
Empty flash detected from 0x004ba000 to 0x004bc000
jffs2_scan_eraseblock(): Scanning block at 0x4bc000
Empty flash detected from 0x004bc000 to 0x004be000
jffs2_scan_eraseblock(): Scanning block at 0x4be000
Empty flash detected from 0x004be000 to 0x004c0000
jffs2_scan_eraseblock(): Scanning block at 0x4c0000
Empty flash detected from 0x004c0000 to 0x004c2000
jffs2_scan_eraseblock(): Scanning block at 0x4c2000
Empty flash detected from 0x004c2000 to 0x004c4000
jffs2_scan_eraseblock(): Scanning block at 0x4c4000
Empty flash detected from 0x004c4000 to 0x004c6000
jffs2_scan_eraseblock(): Scanning block at 0x4c6000
Empty flash detected from 0x004c6000 to 0x004c8000
jffs2_scan_eraseblock(): Scanning block at 0x4c8000
Empty flash detected from 0x004c8000 to 0x004ca000
jffs2_scan_eraseblock(): Scanning block at 0x4ca000
Empty flash detected from 0x004ca000 to 0x004cc000
jffs2_scan_eraseblock(): Scanning block at 0x4cc000
jffs2_scan_inode_node(): Node at 0x004cc000
Allocated inocache at 001c32c0
Node is ino #54, version 15. Range 0xa982-0xb000
jffs2_scan_inode_node(): Node at 0x004cc3c0
Node is ino #54, version 16. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x004ccb44
Node is ino #54, version 17. Range 0xc000-0xcbe8
jffs2_scan_inode_node(): Node at 0x004cd400
Allocated inocache at 001c32d4
Node is ino #29, version 22. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd444
Allocated inocache at 001c32e8
Node is ino #30, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd488
Allocated inocache at 001c32fc
Node is ino #31, version 32. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd4cc
Allocated inocache at 001c3310
Node is ino #32, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd510
Allocated inocache at 001c3324
Node is ino #33, version 13. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd554
Allocated inocache at 001c3338
Node is ino #34, version 10. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd598
Allocated inocache at 001c334c
Node is ino #35, version 36. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd5dc
Allocated inocache at 001c3360
Node is ino #36, version 35. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd620
Allocated inocache at 001c3374
Node is ino #37, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd664
Allocated inocache at 001c3388
Node is ino #38, version 22. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd6a8
Allocated inocache at 001c339c
Node is ino #39, version 13. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd6ec
Allocated inocache at 001c33b0
Node is ino #40, version 10. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd730
Allocated inocache at 001c33c4
Node is ino #41, version 25. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd774
Allocated inocache at 001c33d8
Node is ino #42, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd7b8
Allocated inocache at 001c33ec
Node is ino #43, version 21. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd7fc
Allocated inocache at 001c3400
Node is ino #44, version 20. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd840
Allocated inocache at 001c3414
Node is ino #45, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd884
Allocated inocache at 001c3428
Node is ino #46, version 41. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd8c8
Allocated inocache at 001c343c
Node is ino #47, version 14. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd90c
Allocated inocache at 001c3450
Node is ino #48, version 24. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd950
Allocated inocache at 001c3464
Node is ino #49, version 38. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd994
Allocated inocache at 001c3478
Node is ino #50, version 17. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cd9d8
Allocated inocache at 001c348c
Node is ino #51, version 11. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cda1c
Allocated inocache at 001c34a0
Node is ino #52, version 24. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cda60
Allocated inocache at 001c34b4
Node is ino #53, version 42. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cdaa4
Node is ino #54, version 18. Range 0x0-0x0
jffs2_scan_inode_node(): Node at 0x004cdc00
Allocated inocache at 001c34c8
Node is ino #55, version 1. Range 0x0-0x2
jffs2_scan_dirent_node(): Node at 0x004cdc48
Allocated inocache at 001c34dc
jffs2_add_fd_to_list( 001b97a0, 001b97c0 (->00000000))
jffs2_scan_inode_node(): Node at 0x004cde00
Allocated inocache at 001c34f0
Node is ino #56, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004cde44
jffs2_add_fd_to_list( 001b9800, 001b97c0 (->001b97a0))
jffs2_scan_inode_node(): Node at 0x004cde70
Allocated inocache at 001c3504
Node is ino #57, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004cdeb4
jffs2_add_fd_to_list( 001b9840, 001b97c0 (->001b9800))
jffs2_scan_inode_node(): Node at 0x004cdee0
Allocated inocache at 001c3518
Node is ino #58, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004cdf24
jffs2_add_fd_to_list( 001b9880, 001b97c0 (->001b9840))
jffs2_scan_inode_node(): Node at 0x004cdf50
Allocated inocache at 001c352c
Node is ino #59, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004cdf94
jffs2_add_fd_to_list( 001b98c0, 001b97c0 (->001b9880))
Block at 0x004cc000: free 0x00000000, dirty 0x0000047c, used 0x00001b84
jffs2_scan_eraseblock(): Scanning block at 0x4ce000
jffs2_scan_inode_node(): Node at 0x004ce000
Node is ino #54, version 11. Range 0x7314-0x8000
jffs2_scan_inode_node(): Node at 0x004ce7bc
Node is ino #54, version 12. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x004cf11c
Node is ino #54, version 13. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x004cf9b8
Node is ino #54, version 14. Range 0xa000-0xa982
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004ce000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4d0000
jffs2_scan_inode_node(): Node at 0x004d0000
Node is ino #54, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x004d091c
Node is ino #54, version 8. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x004d1358
Node is ino #54, version 9. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x004d1d9c
Node is ino #54, version 10. Range 0x7000-0x7314
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004d0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4d2000
jffs2_scan_inode_node(): Node at 0x004d2000
Node is ino #54, version 3. Range 0xd83-0x1000
jffs2_scan_inode_node(): Node at 0x004d2228
Node is ino #54, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x004d2b74
Node is ino #54, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x004d3540
Node is ino #54, version 6. Range 0x3000-0x4000
Block at 0x004d2000: free 0x00000000, dirty 0x000000b0, used 0x00001f50
jffs2_scan_eraseblock(): Scanning block at 0x4d4000
jffs2_scan_inode_node(): Node at 0x004d4000
Node is ino #53, version 38. Range 0x1bbf3-0x1c000
jffs2_scan_inode_node(): Node at 0x004d426c
Node is ino #53, version 39. Range 0x1c000-0x1d000
jffs2_scan_inode_node(): Node at 0x004d4bb4
Node is ino #53, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x004d555c
Node is ino #53, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x004d5674
Node is ino #54, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004d56b8
Allocated inocache at 001c3540
jffs2_add_fd_to_list( 001b98e0, 001b9900 (->00000000))
jffs2_scan_inode_node(): Node at 0x004d56e4
Node is ino #54, version 2. Range 0x0-0xd83
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004d4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4d6000
jffs2_scan_inode_node(): Node at 0x004d6000
Node is ino #53, version 34. Range 0x18208-0x19000
jffs2_scan_inode_node(): Node at 0x004d67e8
Node is ino #53, version 35. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x004d7070
Node is ino #53, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x004d79f0
Node is ino #53, version 37. Range 0x1b000-0x1bbf3
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004d6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4d8000
jffs2_scan_inode_node(): Node at 0x004d8000
Node is ino #53, version 29. Range 0x14ea7-0x15000
jffs2_scan_inode_node(): Node at 0x004d8184
Node is ino #53, version 30. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x004d8b38
Node is ino #53, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x004d94c0
Node is ino #53, version 32. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x004d9e10
Node is ino #53, version 33. Range 0x18000-0x18208
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004d8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4da000
jffs2_scan_inode_node(): Node at 0x004da000
Node is ino #53, version 25. Range 0x11780-0x12000
jffs2_scan_inode_node(): Node at 0x004da45c
Node is ino #53, version 26. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x004dab94
Node is ino #53, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x004db608
Node is ino #53, version 28. Range 0x14000-0x14ea7
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004da000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4dc000
jffs2_scan_inode_node(): Node at 0x004dc000
Node is ino #53, version 21. Range 0xe11c-0xf000
jffs2_scan_inode_node(): Node at 0x004dc804
Node is ino #53, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x004dd05c
Node is ino #53, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x004dda34
Node is ino #53, version 24. Range 0x11000-0x11780
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004dc000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4de000
jffs2_scan_inode_node(): Node at 0x004de000
Node is ino #53, version 16. Range 0xafd8-0xb000
jffs2_scan_inode_node(): Node at 0x004de06c
Node is ino #53, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x004dea1c
Node is ino #53, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x004df418
Node is ino #53, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x004dfea4
Node is ino #53, version 20. Range 0xe000-0xe11c
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004de000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4e0000
jffs2_scan_inode_node(): Node at 0x004e0000
Node is ino #53, version 13. Range 0x8080-0x9000
jffs2_scan_inode_node(): Node at 0x004e0a68
Node is ino #53, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x004e1578
Node is ino #53, version 15. Range 0xa000-0xafd8
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004e0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4e2000
jffs2_scan_inode_node(): Node at 0x004e2000
Node is ino #53, version 8. Range 0x4eb5-0x5000
jffs2_scan_inode_node(): Node at 0x004e2164
Node is ino #53, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x004e2abc
Node is ino #53, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x004e34b8
Node is ino #53, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x004e3f3c
Node is ino #53, version 12. Range 0x8000-0x8080
Block at 0x004e2000: free 0x00000000, dirty 0x00000000, used 0x00002000
jffs2_scan_eraseblock(): Scanning block at 0x4e4000
jffs2_scan_inode_node(): Node at 0x004e4000
Node is ino #53, version 4. Range 0x1c1a-0x2000
jffs2_scan_inode_node(): Node at 0x004e4274
Node is ino #53, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x004e4cf0
Node is ino #53, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x004e5704
Node is ino #53, version 7. Range 0x4000-0x4eb5
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004e4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4e6000
jffs2_scan_inode_node(): Node at 0x004e6000
Node is ino #52, version 22. Range 0x10807-0x11000
jffs2_scan_inode_node(): Node at 0x004e6438
Node is ino #52, version 23. Range 0x11000-0x11f44
jffs2_scan_inode_node(): Node at 0x004e6d54
Node is ino #53, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004e6d98
jffs2_add_fd_to_list( 001b9920, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x004e6dc8
Node is ino #53, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x004e77b0
Node is ino #53, version 3. Range 0x1000-0x1c1a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004e6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4e8000
jffs2_scan_inode_node(): Node at 0x004e8000
Node is ino #52, version 18. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x004e8924
Node is ino #52, version 19. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x004e91b4
Node is ino #52, version 20. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x004e9b78
Node is ino #52, version 21. Range 0x10000-0x10807
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004e8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4ea000
jffs2_scan_inode_node(): Node at 0x004ea000
Node is ino #52, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x004eaab8
Node is ino #52, version 16. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x004eb50c
Node is ino #52, version 17. Range 0xc000-0xd000
Block at 0x004ea000: free 0x00000000, dirty 0x00000074, used 0x00001f8c
jffs2_scan_eraseblock(): Scanning block at 0x4ec000
jffs2_scan_inode_node(): Node at 0x004ec000
Node is ino #52, version 11. Range 0x669e-0x7000
jffs2_scan_inode_node(): Node at 0x004ec618
Node is ino #52, version 12. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x004ecf90
Node is ino #52, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x004ed61c
Node is ino #52, version 14. Range 0x9000-0xa000
Block at 0x004ec000: free 0x00000000, dirty 0x00000060, used 0x00001fa0
jffs2_scan_eraseblock(): Scanning block at 0x4ee000
jffs2_scan_inode_node(): Node at 0x004ee000
Node is ino #52, version 7. Range 0x3701-0x4000
jffs2_scan_inode_node(): Node at 0x004ee6e0
Node is ino #52, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x004ef164
Node is ino #52, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x004efc2c
Node is ino #52, version 10. Range 0x6000-0x669e
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004ee000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4f0000
jffs2_scan_inode_node(): Node at 0x004f0000
Node is ino #52, version 3. Range 0x5eb-0x1000
jffs2_scan_inode_node(): Node at 0x004f065c
Node is ino #52, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x004f1098
Node is ino #52, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x004f1ab8
Node is ino #52, version 6. Range 0x3000-0x3701
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004f0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4f2000
jffs2_scan_inode_node(): Node at 0x004f2000
Node is ino #51, version 7. Range 0x3baf-0x4000
jffs2_scan_inode_node(): Node at 0x004f235c
Node is ino #51, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x004f2c7c
Node is ino #51, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x004f34cc
Node is ino #51, version 10. Range 0x6000-0x6ae4
jffs2_scan_inode_node(): Node at 0x004f3ae4
Node is ino #52, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004f3b28
jffs2_add_fd_to_list( 001b73a0, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x004f3b5c
Node is ino #52, version 2. Range 0x0-0x5eb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004f2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4f4000
jffs2_scan_inode_node(): Node at 0x004f4000
Node is ino #51, version 3. Range 0xc06-0x1000
jffs2_scan_inode_node(): Node at 0x004f4308
Node is ino #51, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x004f4d5c
Node is ino #51, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x004f57b4
Node is ino #51, version 6. Range 0x3000-0x3baf
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004f4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4f6000
jffs2_scan_inode_node(): Node at 0x004f6000
Node is ino #50, version 13. Range 0x878d-0x9000
jffs2_scan_inode_node(): Node at 0x004f6478
Node is ino #50, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x004f6d5c
Node is ino #50, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x004f76c0
Node is ino #50, version 16. Range 0xb000-0xb1f8
jffs2_scan_inode_node(): Node at 0x004f781c
Node is ino #51, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004f7860
jffs2_add_fd_to_list( 001b9940, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x004f788c
Node is ino #51, version 2. Range 0x0-0xc06
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004f6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4f8000
jffs2_scan_inode_node(): Node at 0x004f8000
Node is ino #50, version 9. Range 0x5629-0x6000
jffs2_scan_inode_node(): Node at 0x004f8724
Node is ino #50, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x004f9108
Node is ino #50, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x004f9b68
Node is ino #50, version 12. Range 0x8000-0x878d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004f8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4fa000
jffs2_scan_inode_node(): Node at 0x004fa000
Node is ino #50, version 4. Range 0x1fbb-0x2000
jffs2_scan_inode_node(): Node at 0x004fa08c
Node is ino #50, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x004fa988
Node is ino #50, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x004fb2e0
Node is ino #50, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x004fbb50
Node is ino #50, version 8. Range 0x5000-0x5629
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004fa000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4fc000
jffs2_scan_inode_node(): Node at 0x004fc000
Node is ino #49, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x004fc99c
Node is ino #49, version 37. Range 0x1b000-0x1b7bc
jffs2_scan_inode_node(): Node at 0x004fcdf0
Node is ino #50, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x004fce34
jffs2_add_fd_to_list( 001b9960, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x004fce64
Node is ino #50, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x004fd794
Node is ino #50, version 3. Range 0x1000-0x1fbb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x004fc000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x4fe000
jffs2_scan_inode_node(): Node at 0x004fe000
Node is ino #49, version 30. Range 0x15fb3-0x15ffc
jffs2_scan_inode_node(): Node at 0x004fe08c
Node is ino #49, version 31. Range 0x15ffc-0x16000
jffs2_scan_inode_node(): Node at 0x004fe0d4
Node is ino #49, version 32. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x004fe8a8
Node is ino #49, version 33. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x004ff0e0
Node is ino #49, version 34. Range 0x18000-0x19000
jffs2_scan_inode_node(): Node at 0x004ff868
Node is ino #49, version 35. Range 0x19000-0x1a000
Block at 0x004fe000: free 0x00000000, dirty 0x00000040, used 0x00001fc0
jffs2_scan_eraseblock(): Scanning block at 0x500000
jffs2_scan_inode_node(): Node at 0x00500000
Node is ino #49, version 26. Range 0x1221c-0x13000
jffs2_scan_inode_node(): Node at 0x005008e4
Node is ino #49, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x00501228
Node is ino #49, version 28. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x00501994
Node is ino #49, version 29. Range 0x15000-0x15fb3
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00500000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x502000
jffs2_scan_inode_node(): Node at 0x00502000
Node is ino #49, version 22. Range 0xf227-0x10000
jffs2_scan_inode_node(): Node at 0x00502978
Node is ino #49, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x00503400
Node is ino #49, version 24. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x00503df4
Node is ino #49, version 25. Range 0x12000-0x1221c
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00502000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x504000
jffs2_scan_inode_node(): Node at 0x00504000
Node is ino #49, version 17. Range 0xbcdb-0xc000
jffs2_scan_inode_node(): Node at 0x00504280
Node is ino #49, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x00504bc8
Node is ino #49, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0050546c
Node is ino #49, version 20. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x00505dec
Node is ino #49, version 21. Range 0xf000-0xf227
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00504000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x506000
jffs2_scan_inode_node(): Node at 0x00506000
Node is ino #49, version 13. Range 0x895a-0x9000
jffs2_scan_inode_node(): Node at 0x0050648c
Node is ino #49, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x00506de4
Node is ino #49, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x005077c4
Node is ino #49, version 16. Range 0xb000-0xbcdb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00506000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x508000
jffs2_scan_inode_node(): Node at 0x00508000
Node is ino #49, version 8. Range 0x4f7f-0x5000
jffs2_scan_inode_node(): Node at 0x005080c8
Node is ino #49, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x00508940
Node is ino #49, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x005091dc
Node is ino #49, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x00509b58
Node is ino #49, version 12. Range 0x8000-0x895a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00508000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x50a000
jffs2_scan_inode_node(): Node at 0x0050a000
Node is ino #49, version 4. Range 0x1c2b-0x2000
jffs2_scan_inode_node(): Node at 0x0050a2b0
Node is ino #49, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x0050ad00
Node is ino #49, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x0050b69c
Node is ino #49, version 7. Range 0x4000-0x4f7f
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0050a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x50c000
jffs2_scan_inode_node(): Node at 0x0050c000
Node is ino #48, version 21. Range 0xefeb-0xf000
jffs2_scan_inode_node(): Node at 0x0050c05c
Node is ino #48, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x0050c75c
Node is ino #48, version 23. Range 0x10000-0x10bb0
jffs2_scan_inode_node(): Node at 0x0050ce60
Node is ino #49, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x0050cea4
jffs2_add_fd_to_list( 001b9980, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x0050ced4
Node is ino #49, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x0050d874
Node is ino #49, version 3. Range 0x1000-0x1c2b
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0050c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x50e000
jffs2_scan_inode_node(): Node at 0x0050e000
Node is ino #48, version 17. Range 0xb866-0xc000
jffs2_scan_inode_node(): Node at 0x0050e4f0
Node is ino #48, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0050ede8
Node is ino #48, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0050f6fc
Node is ino #48, version 20. Range 0xe000-0xefeb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0050e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x510000
jffs2_scan_inode_node(): Node at 0x00510000
Node is ino #48, version 13. Range 0x80fc-0x9000
jffs2_scan_inode_node(): Node at 0x00510868
Node is ino #48, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x00510f04
Node is ino #48, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x005119c8
Node is ino #48, version 16. Range 0xb000-0xb866
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00510000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x512000
jffs2_scan_inode_node(): Node at 0x00512000
Node is ino #48, version 8. Range 0x4fc3-0x5000
jffs2_scan_inode_node(): Node at 0x00512084
Node is ino #48, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x00512b44
Node is ino #48, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x00513514
Node is ino #48, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x00513ed0
Node is ino #48, version 12. Range 0x8000-0x80fc
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00512000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x514000
jffs2_scan_inode_node(): Node at 0x00514000
Node is ino #48, version 4. Range 0x1e4d-0x2000
jffs2_scan_inode_node(): Node at 0x00514154
Node is ino #48, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x00514b10
Node is ino #48, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x00515550
Node is ino #48, version 7. Range 0x4000-0x4fc3
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00514000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x516000
jffs2_scan_inode_node(): Node at 0x00516000
Node is ino #47, version 12. Range 0x7298-0x8000
jffs2_scan_inode_node(): Node at 0x00516754
Node is ino #47, version 13. Range 0x8000-0x8a34
jffs2_scan_inode_node(): Node at 0x00516d3c
Node is ino #48, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00516d80
jffs2_add_fd_to_list( 001b99a0, 001b9900 (->001b98e0))
jffs2_scan_inode_node(): Node at 0x00516dac
Node is ino #48, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x00517764
Node is ino #48, version 3. Range 0x1000-0x1e4d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00516000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x518000
jffs2_scan_inode_node(): Node at 0x00518000
Node is ino #47, version 7. Range 0x3e1b-0x4000
jffs2_scan_inode_node(): Node at 0x005181a0
Node is ino #47, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x00518b80
Node is ino #47, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x00519564
Node is ino #47, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x00519dd0
Node is ino #47, version 11. Range 0x7000-0x7298
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00518000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x51a000
jffs2_scan_inode_node(): Node at 0x0051a000
Node is ino #47, version 3. Range 0xe18-0x1000
jffs2_scan_inode_node(): Node at 0x0051a208
Node is ino #47, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x0051ab58
Node is ino #47, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x0051b608
Node is ino #47, version 6. Range 0x3000-0x3e1b
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0051a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x51c000
jffs2_scan_inode_node(): Node at 0x0051c000
Node is ino #46, version 37. Range 0x1bd37-0x1c000
jffs2_scan_inode_node(): Node at 0x0051c1c8
Node is ino #46, version 38. Range 0x1c000-0x1d000
jffs2_scan_inode_node(): Node at 0x0051cb10
Node is ino #46, version 39. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x0051d4b8
Node is ino #46, version 40. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x0051d5d0
Node is ino #47, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x0051d614
jffs2_add_fd_to_list( 001b99c0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x0051d640
Node is ino #47, version 2. Range 0x0-0xe18
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0051c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x51e000
jffs2_scan_inode_node(): Node at 0x0051e000
Node is ino #46, version 33. Range 0x182e6-0x19000
jffs2_scan_inode_node(): Node at 0x0051e74c
Node is ino #46, version 34. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x0051efd4
Node is ino #46, version 35. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x0051f93c
Node is ino #46, version 36. Range 0x1b000-0x1bd37
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0051e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x520000
jffs2_scan_inode_node(): Node at 0x00520000
Node is ino #46, version 28. Range 0x14f65-0x15000
jffs2_scan_inode_node(): Node at 0x005200e0
Node is ino #46, version 29. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x00520a94
Node is ino #46, version 30. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x0052141c
Node is ino #46, version 31. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x00521d60
Node is ino #46, version 32. Range 0x18000-0x182e6
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00520000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x522000
jffs2_scan_inode_node(): Node at 0x00522000
Node is ino #46, version 24. Range 0x1187a-0x12000
jffs2_scan_inode_node(): Node at 0x005223d4
Node is ino #46, version 25. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x00522b0c
Node is ino #46, version 26. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x00523580
Node is ino #46, version 27. Range 0x14000-0x14f65
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00522000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x524000
jffs2_scan_inode_node(): Node at 0x00524000
Node is ino #46, version 20. Range 0xe1af-0xf000
jffs2_scan_inode_node(): Node at 0x00524794
Node is ino #46, version 21. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x00524fec
Node is ino #46, version 22. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x005259b8
Node is ino #46, version 23. Range 0x11000-0x1187a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00524000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x526000
jffs2_scan_inode_node(): Node at 0x00526000
Node is ino #46, version 16. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005269b0
Node is ino #46, version 17. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x005273ac
Node is ino #46, version 18. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x00527e34
Node is ino #46, version 19. Range 0xe000-0xe1af
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00526000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x528000
jffs2_scan_inode_node(): Node at 0x00528000
Node is ino #46, version 13. Range 0x8109-0x9000
jffs2_scan_inode_node(): Node at 0x00528a24
Node is ino #46, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x00529534
Node is ino #46, version 15. Range 0xa000-0xb000
Block at 0x00528000: free 0x00000000, dirty 0x00000040, used 0x00001fc0
jffs2_scan_eraseblock(): Scanning block at 0x52a000
jffs2_scan_inode_node(): Node at 0x0052a000
Node is ino #46, version 8. Range 0x4f50-0x5000
jffs2_scan_inode_node(): Node at 0x0052a0f4
Node is ino #46, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x0052aa4c
Node is ino #46, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0052b448
Node is ino #46, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x0052bec4
Node is ino #46, version 12. Range 0x8000-0x8109
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0052a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x52c000
jffs2_scan_inode_node(): Node at 0x0052c000
Node is ino #46, version 4. Range 0x1cce-0x2000
jffs2_scan_inode_node(): Node at 0x0052c218
Node is ino #46, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x0052cc94
Node is ino #46, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x0052d6a8
Node is ino #46, version 7. Range 0x4000-0x4f50
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0052c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x52e000
jffs2_scan_inode_node(): Node at 0x0052e000
Node is ino #45, version 39. Range 0x1cc6e-0x1d000
jffs2_scan_inode_node(): Node at 0x0052e22c
Node is ino #45, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x0052ebd4
Node is ino #45, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x0052ecec
Node is ino #46, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x0052ed30
jffs2_add_fd_to_list( 001b99e0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x0052ed60
Node is ino #46, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x0052f748
Node is ino #46, version 3. Range 0x1000-0x1cce
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0052e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x530000
jffs2_scan_inode_node(): Node at 0x00530000
Node is ino #45, version 35. Range 0x19198-0x1a000
jffs2_scan_inode_node(): Node at 0x005307c4
Node is ino #45, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x0053112c
Node is ino #45, version 37. Range 0x1b000-0x1c000
jffs2_scan_inode_node(): Node at 0x005318d0
Node is ino #45, version 38. Range 0x1c000-0x1cc6e
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00530000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x532000
jffs2_scan_inode_node(): Node at 0x00532000
Node is ino #45, version 30. Range 0x15c01-0x16000
jffs2_scan_inode_node(): Node at 0x005322e4
Node is ino #45, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x00532c6c
Node is ino #45, version 32. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x00533580
Node is ino #45, version 33. Range 0x18000-0x19000
jffs2_scan_inode_node(): Node at 0x00533eac
Node is ino #45, version 34. Range 0x19000-0x19198
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00532000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x534000
jffs2_scan_inode_node(): Node at 0x00534000
Node is ino #45, version 26. Range 0x12be1-0x13000
jffs2_scan_inode_node(): Node at 0x00534334
Node is ino #45, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x00534da8
Node is ino #45, version 28. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x00535830
Node is ino #45, version 29. Range 0x15000-0x15c01
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00534000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x536000
jffs2_scan_inode_node(): Node at 0x00536000
Node is ino #45, version 22. Range 0xf147-0x10000
jffs2_scan_inode_node(): Node at 0x0053680c
Node is ino #45, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x005371d0
Node is ino #45, version 24. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x00537af0
Node is ino #45, version 25. Range 0x12000-0x12be1
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00536000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x538000
jffs2_scan_inode_node(): Node at 0x00538000
Node is ino #45, version 17. Range 0xbe80-0xc000
jffs2_scan_inode_node(): Node at 0x0053818c
Node is ino #45, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x00538b88
Node is ino #45, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x005395e8
Node is ino #45, version 20. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x00539ef4
Node is ino #45, version 21. Range 0xf000-0xf147
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00538000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x53a000
jffs2_scan_inode_node(): Node at 0x0053a000
Node is ino #45, version 13. Range 0x8e9d-0x9000
jffs2_scan_inode_node(): Node at 0x0053a190
Node is ino #45, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0053aca0
Node is ino #45, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x0053b6d0
Node is ino #45, version 16. Range 0xb000-0xbe80
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0053a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x53c000
jffs2_scan_inode_node(): Node at 0x0053c000
Node is ino #45, version 9. Range 0x5e43-0x6000
jffs2_scan_inode_node(): Node at 0x0053c198
Node is ino #45, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0053cb94
Node is ino #45, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x0053d5cc
Node is ino #45, version 12. Range 0x8000-0x8e9d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0053c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x53e000
jffs2_scan_inode_node(): Node at 0x0053e000
Node is ino #45, version 5. Range 0x2adb-0x3000
jffs2_scan_inode_node(): Node at 0x0053e3e8
Node is ino #45, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x0053edfc
Node is ino #45, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x0053f72c
Node is ino #45, version 8. Range 0x5000-0x5e43
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0053e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x540000
jffs2_scan_inode_node(): Node at 0x00540000
Node is ino #44, version 19. Range 0xd000-0xd6b0
jffs2_scan_inode_node(): Node at 0x00540414
Node is ino #45, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00540458
jffs2_add_fd_to_list( 001b9a00, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00540488
Node is ino #45, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x00540e70
Node is ino #45, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x0054183c
Node is ino #45, version 4. Range 0x2000-0x2adb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00540000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x542000
jffs2_scan_inode_node(): Node at 0x00542000
Node is ino #44, version 15. Range 0x95a4-0xa000
jffs2_scan_inode_node(): Node at 0x00542650
Node is ino #44, version 16. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x00542ea8
Node is ino #44, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005436f0
Node is ino #44, version 18. Range 0xc000-0xd000
Block at 0x00542000: free 0x00000000, dirty 0x000000bc, used 0x00001f44
jffs2_scan_eraseblock(): Scanning block at 0x544000
jffs2_scan_inode_node(): Node at 0x00544000
Node is ino #44, version 11. Range 0x649e-0x7000
jffs2_scan_inode_node(): Node at 0x0054478c
Node is ino #44, version 12. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x00545190
Node is ino #44, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x00545b78
Node is ino #44, version 14. Range 0x9000-0x95a4
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00544000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x546000
jffs2_scan_inode_node(): Node at 0x00546000
Node is ino #44, version 7. Range 0x327d-0x4000
jffs2_scan_inode_node(): Node at 0x00546830
Node is ino #44, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x00547178
Node is ino #44, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x00547bec
Node is ino #44, version 10. Range 0x6000-0x649e
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00546000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x548000
jffs2_scan_inode_node(): Node at 0x00548000
Node is ino #44, version 3. Range 0x195-0x1000
jffs2_scan_inode_node(): Node at 0x00548998
Node is ino #44, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005493a0
Node is ino #44, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x00549dcc
Node is ino #44, version 6. Range 0x3000-0x327d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00548000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x54a000
jffs2_scan_inode_node(): Node at 0x0054a000
Node is ino #43, version 17. Range 0xb19a-0xc000
jffs2_scan_inode_node(): Node at 0x0054a86c
Node is ino #43, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0054b108
Node is ino #43, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0054b8dc
Node is ino #43, version 20. Range 0xe000-0xe91c
jffs2_scan_inode_node(): Node at 0x0054be28
Node is ino #44, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x0054be6c
jffs2_add_fd_to_list( 001b9a20, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x0054be98
Node is ino #44, version 2. Range 0x0-0x195
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0054a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x54c000
jffs2_scan_inode_node(): Node at 0x0054c000
Node is ino #43, version 12. Range 0x7f47-0x8000
jffs2_scan_inode_node(): Node at 0x0054c0ec
Node is ino #43, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0054cb04
Node is ino #43, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0054d520
Node is ino #43, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x0054de74
Node is ino #43, version 16. Range 0xb000-0xb19a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0054c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x54e000
jffs2_scan_inode_node(): Node at 0x0054e000
Node is ino #43, version 8. Range 0x4a74-0x5000
jffs2_scan_inode_node(): Node at 0x0054e3cc
Node is ino #43, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x0054eae0
Node is ino #43, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0054f548
Node is ino #43, version 11. Range 0x7000-0x7f47
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0054e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x550000
jffs2_scan_inode_node(): Node at 0x00550000
Node is ino #43, version 4. Range 0x17c1-0x2000
jffs2_scan_inode_node(): Node at 0x0055058c
Node is ino #43, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x00550f9c
Node is ino #43, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x00551948
Node is ino #43, version 7. Range 0x4000-0x4a74
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00550000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x552000
jffs2_scan_inode_node(): Node at 0x00552000
Node is ino #42, version 39. Range 0x1c78a-0x1d000
jffs2_scan_inode_node(): Node at 0x00552560
Node is ino #42, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x00552f08
Node is ino #42, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x00553020
Node is ino #43, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00553064
jffs2_add_fd_to_list( 001b73e0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00553094
Node is ino #43, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x00553a78
Node is ino #43, version 3. Range 0x1000-0x17c1
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00552000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x554000
jffs2_scan_inode_node(): Node at 0x00554000
Node is ino #42, version 34. Range 0x18d6f-0x19000
jffs2_scan_inode_node(): Node at 0x00554220
Node is ino #42, version 35. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x00554aa8
Node is ino #42, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x00555410
Node is ino #42, version 37. Range 0x1b000-0x1c000
jffs2_scan_inode_node(): Node at 0x00555bb8
Node is ino #42, version 38. Range 0x1c000-0x1c78a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00554000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x556000
jffs2_scan_inode_node(): Node at 0x00556000
Node is ino #42, version 30. Range 0x156eb-0x16000
jffs2_scan_inode_node(): Node at 0x0055658c
Node is ino #42, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x00556f14
Node is ino #42, version 32. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x00557828
Node is ino #42, version 33. Range 0x18000-0x18d6f
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00556000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x558000
jffs2_scan_inode_node(): Node at 0x00558000
Node is ino #42, version 26. Range 0x12664-0x13000
jffs2_scan_inode_node(): Node at 0x005585d0
Node is ino #42, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x00559044
Node is ino #42, version 28. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x00559adc
Node is ino #42, version 29. Range 0x15000-0x156eb
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00558000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x55a000
jffs2_scan_inode_node(): Node at 0x0055a000
Node is ino #42, version 21. Range 0xeae0-0xf000
jffs2_scan_inode_node(): Node at 0x0055a27c
Node is ino #42, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x0055aad4
Node is ino #42, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x0055b498
Node is ino #42, version 24. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x0055bdd4
Node is ino #42, version 25. Range 0x12000-0x12664
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0055a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x55c000
jffs2_scan_inode_node(): Node at 0x0055c000
Node is ino #42, version 17. Range 0xba05-0xc000
jffs2_scan_inode_node(): Node at 0x0055c458
Node is ino #42, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0055ce54
Node is ino #42, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0055d8b4
Node is ino #42, version 20. Range 0xe000-0xeae0
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0055c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x55e000
jffs2_scan_inode_node(): Node at 0x0055e000
Node is ino #42, version 13. Range 0x8aab-0x9000
jffs2_scan_inode_node(): Node at 0x0055e458
Node is ino #42, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0055ef68
Node is ino #42, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x0055f998
Node is ino #42, version 16. Range 0xb000-0xba05
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0055e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x560000
jffs2_scan_inode_node(): Node at 0x00560000
Node is ino #42, version 9. Range 0x5994-0x6000
jffs2_scan_inode_node(): Node at 0x0056043c
Node is ino #42, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x00560e38
Node is ino #42, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x00561870
Node is ino #42, version 12. Range 0x8000-0x8aab
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00560000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x562000
jffs2_scan_inode_node(): Node at 0x00562000
Node is ino #42, version 5. Range 0x26b8-0x3000
jffs2_scan_inode_node(): Node at 0x00562648
Node is ino #42, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x0056305c
Node is ino #42, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x00563994
Node is ino #42, version 8. Range 0x5000-0x5994
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00562000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x564000
jffs2_scan_inode_node(): Node at 0x00564000
Node is ino #41, version 24. Range 0x1146d-0x11f44
jffs2_scan_inode_node(): Node at 0x0056467c
Node is ino #42, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005646c0
jffs2_add_fd_to_list( 001b9a40, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005646f0
Node is ino #42, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005650d8
Node is ino #42, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x00565ac4
Node is ino #42, version 4. Range 0x2000-0x26b8
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00564000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x566000
jffs2_scan_inode_node(): Node at 0x00566000
Node is ino #41, version 19. Range 0xdc63-0xe000
jffs2_scan_inode_node(): Node at 0x005662c8
Node is ino #41, version 20. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x00566b58
Node is ino #41, version 21. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x00567528
Node is ino #41, version 22. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x00567d1c
Node is ino #41, version 23. Range 0x11000-0x1146d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00566000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x568000
jffs2_scan_inode_node(): Node at 0x00568000
Node is ino #41, version 15. Range 0xaae5-0xb000
jffs2_scan_inode_node(): Node at 0x00568418
Node is ino #41, version 16. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x00568e6c
Node is ino #41, version 17. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x00569890
Node is ino #41, version 18. Range 0xd000-0xdc63
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00568000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x56a000
jffs2_scan_inode_node(): Node at 0x0056a000
Node is ino #41, version 11. Range 0x7190-0x8000
jffs2_scan_inode_node(): Node at 0x0056a8ac
Node is ino #41, version 12. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0056af38
Node is ino #41, version 13. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0056b860
Node is ino #41, version 14. Range 0xa000-0xaae5
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0056a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x56c000
jffs2_scan_inode_node(): Node at 0x0056c000
Node is ino #41, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x0056ca84
Node is ino #41, version 8. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x0056d52c
Node is ino #41, version 9. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0056de68
Node is ino #41, version 10. Range 0x7000-0x7190
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0056c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x56e000
jffs2_scan_inode_node(): Node at 0x0056e000
Node is ino #41, version 3. Range 0xfe2-0x1000
jffs2_scan_inode_node(): Node at 0x0056e064
Node is ino #41, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x0056eaa0
Node is ino #41, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x0056f4a0
Node is ino #41, version 6. Range 0x3000-0x4000
Found empty flash at 0x56fff4
Empty flash detected from 0x0056fff4 to 0x00570000
Block at 0x0056e000: free 0x0000000c, dirty 0x00000000, used 0x00001ff4
jffs2_scan_eraseblock(): Scanning block at 0x570000
jffs2_scan_inode_node(): Node at 0x00570000
Node is ino #40, version 7. Range 0x3b21-0x4000
jffs2_scan_inode_node(): Node at 0x00570364
Node is ino #40, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x00570ab4
Node is ino #40, version 9. Range 0x5000-0x5fac
jffs2_scan_inode_node(): Node at 0x0057150c
Node is ino #41, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00571550
jffs2_add_fd_to_list( 001b9a60, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00571580
Node is ino #41, version 2. Range 0x0-0xfe2
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00570000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x572000
jffs2_scan_inode_node(): Node at 0x00572000
Node is ino #40, version 3. Range 0xae2-0x1000
jffs2_scan_inode_node(): Node at 0x00572398
Node is ino #40, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x00572eac
Node is ino #40, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005738a4
Node is ino #40, version 6. Range 0x3000-0x3b21
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00572000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x574000
jffs2_scan_inode_node(): Node at 0x00574000
Node is ino #39, version 9. Range 0x5734-0x6000
jffs2_scan_inode_node(): Node at 0x005744e0
Node is ino #39, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x00574e28
Node is ino #39, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x0057562c
Node is ino #39, version 12. Range 0x8000-0x8310
jffs2_scan_inode_node(): Node at 0x0057581c
Node is ino #40, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00575860
jffs2_add_fd_to_list( 001b9a80, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x0057588c
Node is ino #40, version 2. Range 0x0-0xae2
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00574000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x576000
jffs2_scan_inode_node(): Node at 0x00576000
Node is ino #39, version 5. Range 0x2744-0x3000
jffs2_scan_inode_node(): Node at 0x00576534
Node is ino #39, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x00576fec
Node is ino #39, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x00577aac
Node is ino #39, version 8. Range 0x5000-0x5734
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00576000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x578000
jffs2_scan_inode_node(): Node at 0x00578000
Node is ino #38, version 20. Range 0xdd61-0xe000
jffs2_scan_inode_node(): Node at 0x00578104
Node is ino #38, version 21. Range 0xe000-0xebfc
jffs2_scan_inode_node(): Node at 0x005787c4
Node is ino #39, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00578808
jffs2_add_fd_to_list( 001b9aa0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00578838
Node is ino #39, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x00579258
Node is ino #39, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x00579c1c
Node is ino #39, version 4. Range 0x2000-0x2744
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00578000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x57a000
jffs2_scan_inode_node(): Node at 0x0057a000
Node is ino #38, version 16. Range 0xa18a-0xb000
jffs2_scan_inode_node(): Node at 0x0057a830
Node is ino #38, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x0057b148
Node is ino #38, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0057b940
Node is ino #38, version 19. Range 0xd000-0xdd61
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0057a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x57c000
jffs2_scan_inode_node(): Node at 0x0057c000
Node is ino #38, version 12. Range 0x7125-0x8000
jffs2_scan_inode_node(): Node at 0x0057c9f4
Node is ino #38, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0057d41c
Node is ino #38, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0057de58
Node is ino #38, version 15. Range 0xa000-0xa18a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0057c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x57e000
jffs2_scan_inode_node(): Node at 0x0057e000
Node is ino #38, version 7. Range 0x3f0f-0x4000
jffs2_scan_inode_node(): Node at 0x0057e118
Node is ino #38, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x0057eafc
Node is ino #38, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x0057f450
Node is ino #38, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x0057fe98
Node is ino #38, version 11. Range 0x7000-0x7125
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0057e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x580000
jffs2_scan_inode_node(): Node at 0x00580000
Node is ino #38, version 3. Range 0x8fe-0x1000
jffs2_scan_inode_node(): Node at 0x00580464
Node is ino #38, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x00580d3c
Node is ino #38, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005816c4
Node is ino #38, version 6. Range 0x3000-0x3f0f
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00580000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x582000
jffs2_scan_inode_node(): Node at 0x00582000
Node is ino #37, version 38. Range 0x1b468-0x1c000
jffs2_scan_inode_node(): Node at 0x005825f4
Node is ino #37, version 39. Range 0x1c000-0x1d000
jffs2_scan_inode_node(): Node at 0x00582f3c
Node is ino #37, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x005838e4
Node is ino #37, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x005839fc
Node is ino #38, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00583a40
jffs2_add_fd_to_list( 001b7420, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00583a70
Node is ino #38, version 2. Range 0x0-0x8fe
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00582000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x584000
jffs2_scan_inode_node(): Node at 0x00584000
Node is ino #37, version 33. Range 0x17b68-0x18000
jffs2_scan_inode_node(): Node at 0x00584254
Node is ino #37, version 34. Range 0x18000-0x19000
jffs2_scan_inode_node(): Node at 0x00584b6c
Node is ino #37, version 35. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x005853f4
Node is ino #37, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x00585d60
Node is ino #37, version 37. Range 0x1b000-0x1b468
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00584000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x586000
jffs2_scan_inode_node(): Node at 0x00586000
Node is ino #37, version 29. Range 0x1495b-0x15000
jffs2_scan_inode_node(): Node at 0x005864e0
Node is ino #37, version 30. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x00586e94
Node is ino #37, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x0058781c
Node is ino #37, version 32. Range 0x17000-0x17b68
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00586000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x588000
jffs2_scan_inode_node(): Node at 0x00588000
Node is ino #37, version 25. Range 0x11235-0x12000
jffs2_scan_inode_node(): Node at 0x005887a8
Node is ino #37, version 26. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x00588ee0
Node is ino #37, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x00589954
Node is ino #37, version 28. Range 0x14000-0x1495b
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00588000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x58a000
jffs2_scan_inode_node(): Node at 0x0058a000
Node is ino #37, version 20. Range 0xdced-0xe000
jffs2_scan_inode_node(): Node at 0x0058a2c4
Node is ino #37, version 21. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x0058ab9c
Node is ino #37, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x0058b3f4
Node is ino #37, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x0058bdec
Node is ino #37, version 24. Range 0x11000-0x11235
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0058a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x58c000
jffs2_scan_inode_node(): Node at 0x0058c000
Node is ino #37, version 16. Range 0xab53-0xb000
jffs2_scan_inode_node(): Node at 0x0058c398
Node is ino #37, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x0058cd48
Node is ino #37, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x0058d744
Node is ino #37, version 19. Range 0xd000-0xdced
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0058c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x58e000
jffs2_scan_inode_node(): Node at 0x0058e000
Node is ino #37, version 12. Range 0x7c84-0x8000
jffs2_scan_inode_node(): Node at 0x0058e28c
Node is ino #37, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0058ed48
Node is ino #37, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x0058f858
Node is ino #37, version 15. Range 0xa000-0xab53
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0058e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x590000
jffs2_scan_inode_node(): Node at 0x00590000
Node is ino #37, version 8. Range 0x4a84-0x5000
jffs2_scan_inode_node(): Node at 0x005903dc
Node is ino #37, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x00590d34
Node is ino #37, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x00591730
Node is ino #37, version 11. Range 0x7000-0x7c84
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00590000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x592000
jffs2_scan_inode_node(): Node at 0x00592000
Node is ino #37, version 4. Range 0x1800-0x2000
jffs2_scan_inode_node(): Node at 0x005924f8
Node is ino #37, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x00592f74
Node is ino #37, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x00593988
Node is ino #37, version 7. Range 0x4000-0x4a84
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00592000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x594000
jffs2_scan_inode_node(): Node at 0x00594000
Node is ino #36, version 32. Range 0x16ca4-0x17000
jffs2_scan_inode_node(): Node at 0x00594268
Node is ino #36, version 33. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x00594c58
Node is ino #36, version 34. Range 0x18000-0x185dc
jffs2_scan_inode_node(): Node at 0x00594fd4
Node is ino #37, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x00595018
jffs2_add_fd_to_list( 001b7460, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x00595048
Node is ino #37, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x00595a40
Node is ino #37, version 3. Range 0x1000-0x1800
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00594000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x596000
jffs2_scan_inode_node(): Node at 0x00596000
Node is ino #36, version 28. Range 0x13094-0x14000
jffs2_scan_inode_node(): Node at 0x005968ac
Node is ino #36, version 29. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x00597078
Node is ino #36, version 30. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x0059791c
Node is ino #36, version 31. Range 0x16000-0x16ca4
Fewer than 12 bytes left to end of block. Not reading
Block at 0x00596000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x598000
jffs2_scan_inode_node(): Node at 0x00598000
Node is ino #36, version 23. Range 0xffbe-0x10000
jffs2_scan_inode_node(): Node at 0x00598088
Node is ino #36, version 24. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x00598b88
Node is ino #36, version 25. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x005995c4
Node is ino #36, version 26. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x00599f28
Node is ino #36, version 27. Range 0x13000-0x13094
Block at 0x00598000: free 0x00000000, dirty 0x00000000, used 0x00002000
jffs2_scan_eraseblock(): Scanning block at 0x59a000
jffs2_scan_inode_node(): Node at 0x0059a000
Node is ino #36, version 19. Range 0xcf91-0xd000
jffs2_scan_inode_node(): Node at 0x0059a0b4
Node is ino #36, version 20. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x0059ab88
Node is ino #36, version 21. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x0059b5fc
Node is ino #36, version 22. Range 0xf000-0xffbe
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0059a000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x59c000
jffs2_scan_inode_node(): Node at 0x0059c000
Node is ino #36, version 15. Range 0x95aa-0xa000
jffs2_scan_inode_node(): Node at 0x0059c64c
Node is ino #36, version 16. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x0059d050
Node is ino #36, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x0059d5d4
Node is ino #36, version 18. Range 0xc000-0xcf91
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0059c000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x59e000
jffs2_scan_inode_node(): Node at 0x0059e000
Node is ino #36, version 11. Range 0x6572-0x7000
jffs2_scan_inode_node(): Node at 0x0059e6d4
Node is ino #36, version 12. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x0059f194
Node is ino #36, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x0059fb94
Node is ino #36, version 14. Range 0x9000-0x95aa
Fewer than 12 bytes left to end of block. Not reading
Block at 0x0059e000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5a0000
jffs2_scan_inode_node(): Node at 0x005a0000
Node is ino #36, version 7. Range 0x3282-0x4000
jffs2_scan_inode_node(): Node at 0x005a0818
Node is ino #36, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005a1244
Node is ino #36, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005a1bbc
Node is ino #36, version 10. Range 0x6000-0x6572
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005a0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5a2000
jffs2_scan_inode_node(): Node at 0x005a2000
Node is ino #36, version 3. Range 0xd7-0x1000
jffs2_scan_inode_node(): Node at 0x005a2908
Node is ino #36, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005a3320
Node is ino #36, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005a3d98
Node is ino #36, version 6. Range 0x3000-0x3282
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005a2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5a4000
jffs2_scan_inode_node(): Node at 0x005a4000
Node is ino #35, version 32. Range 0x17232-0x18000
jffs2_scan_inode_node(): Node at 0x005a4740
Node is ino #35, version 33. Range 0x18000-0x19000
jffs2_scan_inode_node(): Node at 0x005a4f4c
Node is ino #35, version 34. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x005a58d4
Node is ino #35, version 35. Range 0x1a000-0x1aa38
jffs2_scan_inode_node(): Node at 0x005a5e90
Node is ino #36, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005a5ed4
jffs2_add_fd_to_list( 001b9ac0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005a5f00
Node is ino #36, version 2. Range 0x0-0xd7
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005a4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5a6000
jffs2_scan_inode_node(): Node at 0x005a6000
Node is ino #35, version 27. Range 0x13544-0x14000
jffs2_scan_inode_node(): Node at 0x005a6690
Node is ino #35, version 28. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x005a6ec8
Node is ino #35, version 29. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x005a76d4
Node is ino #35, version 30. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x005a7e20
Node is ino #35, version 31. Range 0x17000-0x17232
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005a6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5a8000
jffs2_scan_inode_node(): Node at 0x005a8000
Node is ino #35, version 23. Range 0x104c1-0x11000
jffs2_scan_inode_node(): Node at 0x005a87c0
Node is ino #35, version 24. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x005a9258
Node is ino #35, version 25. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x005a9ba4
Node is ino #35, version 26. Range 0x13000-0x13544
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005a8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5aa000
jffs2_scan_inode_node(): Node at 0x005aa000
Node is ino #35, version 18. Range 0xce66-0xd000
jffs2_scan_inode_node(): Node at 0x005aa160
Node is ino #35, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x005aaac4
Node is ino #35, version 20. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x005ab250
Node is ino #35, version 21. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x005abc38
Node is ino #35, version 22. Range 0x10000-0x104c1
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005aa000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ac000
jffs2_scan_inode_node(): Node at 0x005ac000
Node is ino #35, version 14. Range 0x9c2d-0xa000
jffs2_scan_inode_node(): Node at 0x005ac2d0
Node is ino #35, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x005acc98
Node is ino #35, version 16. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005ad660
Node is ino #35, version 17. Range 0xc000-0xce66
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ac000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ae000
jffs2_scan_inode_node(): Node at 0x005ae000
Node is ino #35, version 10. Range 0x69c6-0x7000
jffs2_scan_inode_node(): Node at 0x005ae45c
Node is ino #35, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x005aee00
Node is ino #35, version 12. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x005af7f8
Node is ino #35, version 13. Range 0x9000-0x9c2d
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ae000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5b0000
jffs2_scan_inode_node(): Node at 0x005b0000
Node is ino #35, version 6. Range 0x3624-0x4000
jffs2_scan_inode_node(): Node at 0x005b0618
Node is ino #35, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005b0fb8
Node is ino #35, version 8. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005b19dc
Node is ino #35, version 9. Range 0x6000-0x69c6
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005b0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5b2000
jffs2_scan_dirent_node(): Node at 0x005b2000
jffs2_add_fd_to_list( 001b9ae0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005b202c
Node is ino #35, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005b2998
Node is ino #35, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005b3390
Node is ino #35, version 4. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005b3c64
Node is ino #35, version 5. Range 0x3000-0x3624
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005b2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5b4000
jffs2_scan_inode_node(): Node at 0x005b4000
Node is ino #34, version 5. Range 0x2b34-0x3000
jffs2_scan_inode_node(): Node at 0x005b43bc
Node is ino #34, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x005b4cd4
Node is ino #34, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005b5624
Node is ino #34, version 8. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005b5e3c
Node is ino #34, version 9. Range 0x6000-0x6224
jffs2_scan_inode_node(): Node at 0x005b5f9c
Node is ino #35, version 1. Range 0x0-0x0
Block at 0x005b4000: free 0x00000000, dirty 0x00000020, used 0x00001fe0
jffs2_scan_eraseblock(): Scanning block at 0x5b6000
jffs2_scan_inode_node(): Node at 0x005b6000
Node is ino #33, version 11. Range 0x6cd3-0x7000
jffs2_scan_inode_node(): Node at 0x005b6214
Node is ino #33, version 12. Range 0x7000-0x733c
jffs2_scan_inode_node(): Node at 0x005b641c
Node is ino #34, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005b6460
jffs2_add_fd_to_list( 001b9b00, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005b6490
Node is ino #34, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005b6d64
Node is ino #34, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005b77f4
Node is ino #34, version 4. Range 0x2000-0x2b34
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005b6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5b8000
jffs2_scan_inode_node(): Node at 0x005b8000
Node is ino #33, version 7. Range 0x3557-0x4000
jffs2_scan_inode_node(): Node at 0x005b8768
Node is ino #33, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005b90c8
Node is ino #33, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005b999c
Node is ino #33, version 10. Range 0x6000-0x6cd3
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005b8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ba000
jffs2_scan_inode_node(): Node at 0x005ba000
Node is ino #33, version 3. Range 0x411-0x1000
jffs2_scan_inode_node(): Node at 0x005ba6e4
Node is ino #33, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005bb128
Node is ino #33, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005bbc18
Node is ino #33, version 6. Range 0x3000-0x3557
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ba000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5bc000
jffs2_scan_inode_node(): Node at 0x005bc000
Node is ino #32, version 37. Range 0x1af21-0x1b000
jffs2_scan_inode_node(): Node at 0x005bc0f4
Node is ino #32, version 38. Range 0x1b000-0x1c000
jffs2_scan_inode_node(): Node at 0x005bc890
Node is ino #32, version 39. Range 0x1c000-0x1d000
jffs2_scan_inode_node(): Node at 0x005bd1d8
Node is ino #32, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x005bdb4c
Node is ino #32, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x005bdc64
Node is ino #33, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005bdca8
jffs2_add_fd_to_list( 001b74a0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005bdcd8
Node is ino #33, version 2. Range 0x0-0x411
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005bc000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5be000
jffs2_scan_inode_node(): Node at 0x005be000
Node is ino #32, version 33. Range 0x1765c-0x18000
jffs2_scan_inode_node(): Node at 0x005be54c
Node is ino #32, version 34. Range 0x18000-0x19000
jffs2_scan_inode_node(): Node at 0x005bee64
Node is ino #32, version 35. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x005bf6ec
Node is ino #32, version 36. Range 0x1a000-0x1af21
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005be000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5c0000
jffs2_scan_inode_node(): Node at 0x005c0000
Node is ino #32, version 29. Range 0x1441e-0x15000
jffs2_scan_inode_node(): Node at 0x005c07c0
Node is ino #32, version 30. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x005c1174
Node is ino #32, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x005c1b20
Node is ino #32, version 32. Range 0x17000-0x1765c
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005c0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5c2000
jffs2_scan_inode_node(): Node at 0x005c2000
Node is ino #32, version 24. Range 0x10e76-0x11000
jffs2_scan_inode_node(): Node at 0x005c2194
Node is ino #32, version 25. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x005c2aa8
Node is ino #32, version 26. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x005c31e0
Node is ino #32, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x005c3c84
Node is ino #32, version 28. Range 0x14000-0x1441e
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005c2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5c4000
jffs2_scan_inode_node(): Node at 0x005c4000
Node is ino #32, version 20. Range 0xd8a6-0xe000
jffs2_scan_inode_node(): Node at 0x005c4594
Node is ino #32, version 21. Range 0xe000-0xf000
jffs2_scan_inode_node(): Node at 0x005c4e6c
Node is ino #32, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x005c56c4
Node is ino #32, version 23. Range 0x10000-0x10e76
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005c4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5c6000
jffs2_scan_inode_node(): Node at 0x005c6000
Node is ino #32, version 16. Range 0xa6b7-0xb000
jffs2_scan_inode_node(): Node at 0x005c6640
Node is ino #32, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005c6ff0
Node is ino #32, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x005c79f4
Node is ino #32, version 19. Range 0xd000-0xd8a6
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005c6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5c8000
jffs2_scan_inode_node(): Node at 0x005c8000
Node is ino #32, version 12. Range 0x7808-0x8000
jffs2_scan_inode_node(): Node at 0x005c8530
Node is ino #32, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x005c8fec
Node is ino #32, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x005c9b04
Node is ino #32, version 15. Range 0xa000-0xa6b7
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005c8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ca000
jffs2_scan_inode_node(): Node at 0x005ca000
Node is ino #32, version 8. Range 0x45b3-0x5000
jffs2_scan_inode_node(): Node at 0x005ca688
Node is ino #32, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005cafe0
Node is ino #32, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x005cb9e4
Node is ino #32, version 11. Range 0x7000-0x7808
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ca000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5cc000
jffs2_scan_inode_node(): Node at 0x005cc000
Node is ino #32, version 4. Range 0x13f8-0x2000
jffs2_scan_inode_node(): Node at 0x005cc790
Node is ino #32, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005cd20c
Node is ino #32, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x005cdc50
Node is ino #32, version 7. Range 0x4000-0x45b3
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005cc000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ce000
jffs2_scan_inode_node(): Node at 0x005ce000
Node is ino #31, version 29. Range 0x14c78-0x15000
jffs2_scan_inode_node(): Node at 0x005ce218
Node is ino #31, version 30. Range 0x15000-0x16000
jffs2_scan_inode_node(): Node at 0x005ceaac
Node is ino #31, version 31. Range 0x16000-0x16c8c
jffs2_scan_inode_node(): Node at 0x005cf24c
Node is ino #32, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005cf290
jffs2_add_fd_to_list( 001b9b20, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005cf2c0
Node is ino #32, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005cfcd0
Node is ino #32, version 3. Range 0x1000-0x13f8
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ce000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5d0000
jffs2_scan_inode_node(): Node at 0x005d0000
Node is ino #31, version 25. Range 0x113ce-0x12000
jffs2_scan_inode_node(): Node at 0x005d06c4
Node is ino #31, version 26. Range 0x12000-0x13000
jffs2_scan_inode_node(): Node at 0x005d0fe0
Node is ino #31, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x005d1708
Node is ino #31, version 28. Range 0x14000-0x14c78
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005d0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5d2000
jffs2_scan_inode_node(): Node at 0x005d2000
Node is ino #31, version 21. Range 0xe3af-0xf000
jffs2_scan_inode_node(): Node at 0x005d286c
Node is ino #31, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x005d32c4
Node is ino #31, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x005d3cb8
Node is ino #31, version 24. Range 0x11000-0x113ce
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005d2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5d4000
jffs2_scan_inode_node(): Node at 0x005d4000
Node is ino #31, version 16. Range 0xaea9-0xb000
jffs2_scan_inode_node(): Node at 0x005d4174
Node is ino #31, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005d4a74
Node is ino #31, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x005d5228
Node is ino #31, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x005d5cf4
Node is ino #31, version 20. Range 0xe000-0xe3af
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005d4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5d6000
jffs2_scan_inode_node(): Node at 0x005d6000
Node is ino #31, version 12. Range 0x7dab-0x8000
jffs2_scan_inode_node(): Node at 0x005d6224
Node is ino #31, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x005d6cdc
Node is ino #31, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x005d76e8
Node is ino #31, version 15. Range 0xa000-0xaea9
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005d6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5d8000
jffs2_scan_inode_node(): Node at 0x005d8000
Node is ino #31, version 8. Range 0x4b83-0x5000
jffs2_scan_inode_node(): Node at 0x005d827c
Node is ino #31, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005d8ba8
Node is ino #31, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x005d9698
Node is ino #31, version 11. Range 0x7000-0x7dab
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005d8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5da000
jffs2_scan_inode_node(): Node at 0x005da000
Node is ino #31, version 4. Range 0x1637-0x2000
jffs2_scan_inode_node(): Node at 0x005da600
Node is ino #31, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005daf8c
Node is ino #31, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x005db894
Node is ino #31, version 7. Range 0x4000-0x4b83
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005da000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5dc000
jffs2_scan_inode_node(): Node at 0x005dc000
Node is ino #30, version 39. Range 0x1c51e-0x1d000
jffs2_scan_inode_node(): Node at 0x005dc670
Node is ino #30, version 40. Range 0x1d000-0x1e000
jffs2_scan_inode_node(): Node at 0x005dd018
Node is ino #30, version 41. Range 0x1e000-0x1e164
jffs2_scan_inode_node(): Node at 0x005dd130
Node is ino #31, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005dd174
jffs2_add_fd_to_list( 001b9b40, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005dd1a0
Node is ino #31, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005ddb60
Node is ino #31, version 3. Range 0x1000-0x1637
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005dc000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5de000
jffs2_scan_inode_node(): Node at 0x005de000
Node is ino #30, version 34. Range 0x18b3c-0x19000
jffs2_scan_inode_node(): Node at 0x005de330
Node is ino #30, version 35. Range 0x19000-0x1a000
jffs2_scan_inode_node(): Node at 0x005debb8
Node is ino #30, version 36. Range 0x1a000-0x1b000
jffs2_scan_inode_node(): Node at 0x005df520
Node is ino #30, version 37. Range 0x1b000-0x1c000
jffs2_scan_inode_node(): Node at 0x005dfcc4
Node is ino #30, version 38. Range 0x1c000-0x1c51e
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005de000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5e0000
jffs2_scan_inode_node(): Node at 0x005e0000
Node is ino #30, version 30. Range 0x155d0-0x16000
jffs2_scan_inode_node(): Node at 0x005e0648
Node is ino #30, version 31. Range 0x16000-0x17000
jffs2_scan_inode_node(): Node at 0x005e0fd0
Node is ino #30, version 32. Range 0x17000-0x18000
jffs2_scan_inode_node(): Node at 0x005e18e8
Node is ino #30, version 33. Range 0x18000-0x18b3c
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005e0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5e2000
jffs2_scan_inode_node(): Node at 0x005e2000
Node is ino #30, version 26. Range 0x124d7-0x13000
jffs2_scan_inode_node(): Node at 0x005e2660
Node is ino #30, version 27. Range 0x13000-0x14000
jffs2_scan_inode_node(): Node at 0x005e30d4
Node is ino #30, version 28. Range 0x14000-0x15000
jffs2_scan_inode_node(): Node at 0x005e3b80
Node is ino #30, version 29. Range 0x15000-0x155d0
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005e2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5e4000
jffs2_scan_inode_node(): Node at 0x005e4000
Node is ino #30, version 21. Range 0xea10-0xf000
jffs2_scan_inode_node(): Node at 0x005e42dc
Node is ino #30, version 22. Range 0xf000-0x10000
jffs2_scan_inode_node(): Node at 0x005e4b34
Node is ino #30, version 23. Range 0x10000-0x11000
jffs2_scan_inode_node(): Node at 0x005e54f8
Node is ino #30, version 24. Range 0x11000-0x12000
jffs2_scan_inode_node(): Node at 0x005e5e38
Node is ino #30, version 25. Range 0x12000-0x124d7
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005e4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5e6000
jffs2_scan_inode_node(): Node at 0x005e6000
Node is ino #30, version 17. Range 0xb964-0xc000
jffs2_scan_inode_node(): Node at 0x005e64b4
Node is ino #30, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x005e6eb0
Node is ino #30, version 19. Range 0xd000-0xe000
jffs2_scan_inode_node(): Node at 0x005e7910
Node is ino #30, version 20. Range 0xe000-0xea10
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005e6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5e8000
jffs2_scan_inode_node(): Node at 0x005e8000
Node is ino #30, version 13. Range 0x8a4a-0x9000
jffs2_scan_inode_node(): Node at 0x005e84a4
Node is ino #30, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x005e8fb4
Node is ino #30, version 15. Range 0xa000-0xb000
jffs2_scan_inode_node(): Node at 0x005e99e4
Node is ino #30, version 16. Range 0xb000-0xb964
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005e8000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ea000
jffs2_scan_inode_node(): Node at 0x005ea000
Node is ino #30, version 9. Range 0x5915-0x6000
jffs2_scan_inode_node(): Node at 0x005ea488
Node is ino #30, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x005eae84
Node is ino #30, version 11. Range 0x7000-0x8000
jffs2_scan_inode_node(): Node at 0x005eb8bc
Node is ino #30, version 12. Range 0x8000-0x8a4a
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ea000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ec000
jffs2_scan_inode_node(): Node at 0x005ec000
Node is ino #30, version 5. Range 0x2668-0x3000
jffs2_scan_inode_node(): Node at 0x005ec688
Node is ino #30, version 6. Range 0x3000-0x4000
jffs2_scan_inode_node(): Node at 0x005ed09c
Node is ino #30, version 7. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005ed9dc
Node is ino #30, version 8. Range 0x5000-0x5915
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ec000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5ee000
jffs2_scan_inode_node(): Node at 0x005ee000
Node is ino #29, version 20. Range 0xdf28-0xe000
jffs2_scan_inode_node(): Node at 0x005ee0d0
Node is ino #29, version 21. Range 0xe000-0xea04
jffs2_scan_inode_node(): Node at 0x005ee6bc
Node is ino #30, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005ee700
jffs2_add_fd_to_list( 001b74e0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005ee730
Node is ino #30, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005ef118
Node is ino #30, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005efb00
Node is ino #30, version 4. Range 0x2000-0x2668
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005ee000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5f0000
jffs2_scan_inode_node(): Node at 0x005f0000
Node is ino #29, version 16. Range 0xa1e2-0xb000
jffs2_scan_inode_node(): Node at 0x005f082c
Node is ino #29, version 17. Range 0xb000-0xc000
jffs2_scan_inode_node(): Node at 0x005f1124
Node is ino #29, version 18. Range 0xc000-0xd000
jffs2_scan_inode_node(): Node at 0x005f18f4
Node is ino #29, version 19. Range 0xd000-0xdf28
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005f0000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5f2000
jffs2_scan_inode_node(): Node at 0x005f2000
Node is ino #29, version 12. Range 0x7129-0x8000
jffs2_scan_inode_node(): Node at 0x005f29d4
Node is ino #29, version 13. Range 0x8000-0x9000
jffs2_scan_inode_node(): Node at 0x005f33b0
Node is ino #29, version 14. Range 0x9000-0xa000
jffs2_scan_inode_node(): Node at 0x005f3e28
Node is ino #29, version 15. Range 0xa000-0xa1e2
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005f2000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5f4000
jffs2_scan_inode_node(): Node at 0x005f4000
Node is ino #29, version 7. Range 0x3fcc-0x4000
jffs2_scan_inode_node(): Node at 0x005f4078
Node is ino #29, version 8. Range 0x4000-0x5000
jffs2_scan_inode_node(): Node at 0x005f4a88
Node is ino #29, version 9. Range 0x5000-0x6000
jffs2_scan_inode_node(): Node at 0x005f53c0
Node is ino #29, version 10. Range 0x6000-0x7000
jffs2_scan_inode_node(): Node at 0x005f5ea8
Node is ino #29, version 11. Range 0x7000-0x7129
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005f4000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5f6000
jffs2_scan_inode_node(): Node at 0x005f6000
Node is ino #29, version 3. Range 0xc0c-0x1000
jffs2_scan_inode_node(): Node at 0x005f6308
Node is ino #29, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005f6c54
Node is ino #29, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005f75b8
Node is ino #29, version 6. Range 0x3000-0x3fcc
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005f6000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5f8000
jffs2_scan_inode_node(): Node at 0x005f8000
Allocated inocache at 001c3554
Node is ino #27, version 3. Range 0x469-0x1000
jffs2_scan_inode_node(): Node at 0x005f853c
Node is ino #27, version 4. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005f8ca8
Node is ino #27, version 5. Range 0x2000-0x3000
jffs2_scan_inode_node(): Node at 0x005f93a0
Node is ino #27, version 6. Range 0x3000-0x33f2
jffs2_scan_inode_node(): Node at 0x005f959c
Allocated inocache at 001c3568
Node is ino #28, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005f95e0
Allocated inocache at 001c357c
jffs2_add_fd_to_list( 001b9ba0, 001b9bc0 (->00000000))
jffs2_scan_inode_node(): Node at 0x005f9610
Node is ino #28, version 2. Range 0x0-0x3c
jffs2_scan_inode_node(): Node at 0x005f9800
Node is ino #29, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005f9844
jffs2_add_fd_to_list( 001b9be0, 001b9900 (->001b99a0))
jffs2_scan_inode_node(): Node at 0x005f9870
Node is ino #29, version 2. Range 0x0-0xc0c
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005f8000: free 0x00000000, dirty 0x00000174, used 0x00001e8c
jffs2_scan_eraseblock(): Scanning block at 0x5fa000
jffs2_scan_inode_node(): Node at 0x005fa000
Allocated inocache at 001c3590
Node is ino #16, version 2. Range 0x0-0x614
jffs2_scan_inode_node(): Node at 0x005fa29c
Allocated inocache at 001c35a4
Node is ino #17, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fa2e0
jffs2_add_fd_to_list( 001b9c40, 001b9bc0 (->001b9ba0))
jffs2_scan_inode_node(): Node at 0x005fa310
Node is ino #17, version 2. Range 0x0-0x7c
jffs2_scan_inode_node(): Node at 0x005fa3b4
Allocated inocache at 001c35b8
Node is ino #18, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fa3f8
jffs2_add_fd_to_list( 001b9c80, 001b9bc0 (->001b9ba0))
jffs2_scan_inode_node(): Node at 0x005fa428
Node is ino #18, version 2. Range 0x0-0x7c
jffs2_scan_inode_node(): Node at 0x005fa4cc
Allocated inocache at 001c35cc
Node is ino #19, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fa510
jffs2_add_fd_to_list( 001b7520, 001b9bc0 (->001b9ba0))
jffs2_scan_inode_node(): Node at 0x005fa544
Node is ino #19, version 2. Range 0x0-0xb3a
jffs2_scan_inode_node(): Node at 0x005fa7a0
Allocated inocache at 001c35e0
Node is ino #20, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fa7e4
jffs2_add_fd_to_list( 001b7560, 001b9bc0 (->001b9ba0))
jffs2_scan_inode_node(): Node at 0x005fa81c
Node is ino #20, version 2. Range 0x0-0xa84
jffs2_scan_inode_node(): Node at 0x005faa70
Allocated inocache at 001c35f4
Node is ino #21, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005faab4
jffs2_add_fd_to_list( 001b9d00, 001b9bc0 (->001b9ba0))
jffs2_scan_inode_node(): Node at 0x005faae0
Node is ino #21, version 2. Range 0x0-0x120
jffs2_scan_inode_node(): Node at 0x005fabd4
Allocated inocache at 001c3608
Node is ino #22, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fac18
jffs2_add_fd_to_list( 001b75a0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fac4c
Node is ino #22, version 2. Range 0x0-0x2a
jffs2_scan_inode_node(): Node at 0x005facbc
Allocated inocache at 001c361c
Node is ino #23, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fad00
jffs2_add_fd_to_list( 001b75e0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fad30
Node is ino #23, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005fb394
Node is ino #23, version 3. Range 0x1000-0x2000
jffs2_scan_inode_node(): Node at 0x005fb9d4
Node is ino #23, version 4. Range 0x2000-0x200d
jffs2_scan_inode_node(): Node at 0x005fba28
Allocated inocache at 001c3630
Node is ino #24, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fba6c
jffs2_add_fd_to_list( 001b7620, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fbaa0
Node is ino #24, version 2. Range 0x0-0x1
jffs2_scan_inode_node(): Node at 0x005fbae8
Allocated inocache at 001c3644
Node is ino #25, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fbb2c
jffs2_add_fd_to_list( 001b7660, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fbb60
Node is ino #25, version 2. Range 0x0-0x2
jffs2_scan_inode_node(): Node at 0x005fbba8
Allocated inocache at 001c3658
Node is ino #26, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fbbec
jffs2_add_fd_to_list( 001b76a0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fbc20
Node is ino #26, version 2. Range 0x0-0xf
jffs2_scan_inode_node(): Node at 0x005fbc74
Node is ino #27, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fbcb8
jffs2_add_fd_to_list( 001b9dc0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fbce8
Node is ino #27, version 2. Range 0x0-0x469
Fewer than 12 bytes left to end of block. Not reading
Block at 0x005fa000: free 0x00000000, dirty 0x00000004, used 0x00001ffc
jffs2_scan_eraseblock(): Scanning block at 0x5fc000
jffs2_scan_inode_node(): Node at 0x005fc000
Node is ino #2, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fc044
Allocated inocache at 001c366c
jffs2_add_fd_to_list( 001b9de0, 001b9e00 (->00000000))
jffs2_scan_inode_node(): Node at 0x005fc200
Node is ino #3, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fc244
jffs2_add_fd_to_list( 001b9e20, 001b9e00 (->001b9de0))
jffs2_scan_inode_node(): Node at 0x005fc400
Allocated inocache at 001c3680
Node is ino #4, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fc444
jffs2_add_fd_to_list( 001b9e60, 001b9e00 (->001b9de0))
jffs2_scan_inode_node(): Node at 0x005fc600
Allocated inocache at 001c3694
Node is ino #5, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fc644
jffs2_add_fd_to_list( 001b9ea0, 001b9e00 (->001b9de0))
jffs2_scan_inode_node(): Node at 0x005fc800
Node is ino #6, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fc844
jffs2_add_fd_to_list( 001b9ec0, 001b9e00 (->001b9de0))
jffs2_scan_inode_node(): Node at 0x005fca00
Allocated inocache at 001c36a8
Node is ino #7, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fca44
jffs2_add_fd_to_list( 001b9f00, 001b9e00 (->001b9de0))
jffs2_scan_inode_node(): Node at 0x005fcc00
Allocated inocache at 001c36bc
Node is ino #8, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fcc44
jffs2_add_fd_to_list( 001b9f40, 001b9ee0 (->00000000))
jffs2_scan_inode_node(): Node at 0x005fce00
Allocated inocache at 001c36d0
Node is ino #9, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fce44
jffs2_add_fd_to_list( 001b76e0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fce74
Node is ino #9, version 2. Range 0x0-0x1000
jffs2_scan_inode_node(): Node at 0x005fd5b4
Node is ino #9, version 3. Range 0x1000-0x1753
jffs2_scan_inode_node(): Node at 0x005fd994
Allocated inocache at 001c36e4
Node is ino #10, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fd9d8
jffs2_add_fd_to_list( 001b7720, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fda08
Node is ino #10, version 2. Range 0x0-0xa
jffs2_scan_inode_node(): Node at 0x005fda58
Allocated inocache at 001c36f8
Node is ino #11, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fda9c
jffs2_add_fd_to_list( 001b9fc0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fdacc
Node is ino #11, version 2. Range 0x0-0x25
jffs2_scan_inode_node(): Node at 0x005fdb38
Allocated inocache at 001c370c
Node is ino #12, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fdb7c
jffs2_add_fd_to_list( 00ff21e0, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fdbac
Node is ino #12, version 2. Range 0x0-0x1
jffs2_scan_inode_node(): Node at 0x005fdbf4
Allocated inocache at 001c3720
Node is ino #13, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fdc38
jffs2_add_fd_to_list( 00ff2220, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fdc64
Node is ino #13, version 2. Range 0x0-0xdd
jffs2_scan_inode_node(): Node at 0x005fdd30
Allocated inocache at 001c3734
Node is ino #14, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fdd74
jffs2_add_fd_to_list( 001b7760, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fdda8
Node is ino #14, version 2. Range 0x0-0x52
jffs2_scan_inode_node(): Node at 0x005fde30
Allocated inocache at 001c3748
Node is ino #15, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fde74
jffs2_add_fd_to_list( 00ff2280, 001b9bc0 (->001b9d00))
jffs2_scan_inode_node(): Node at 0x005fdea4
Node is ino #15, version 2. Range 0x0-0x2d
jffs2_scan_inode_node(): Node at 0x005fdf18
Node is ino #16, version 1. Range 0x0-0x0
jffs2_scan_dirent_node(): Node at 0x005fdf5c
jffs2_add_fd_to_list( 001b77a0, 001b9bc0 (->001b9d00))
Block at 0x005fc000: free 0x00000000, dirty 0x00000b5c, used 0x000014a4
jffs2_scan_eraseblock(): Scanning block at 0x5fe000
Empty flash detected from 0x005fe000 to 0x00600000
Scanned flash completely
Pass 1: ino #1
jffs2_build_inode building inode #1
Increased nlink for child "bin" (ino #2)
Increased nlink for child "dev" (ino #3)
Increased nlink for child "etc" (ino #6)
Increased nlink for child "var" (ino #5)
Increased nlink for child "home" (ino #7)
Increased nlink for child "proc" (ino #4)
Pass 1: ino #2
jffs2_build_inode building inode #2
Increased nlink for child "sh" (ino #48)
Increased nlink for child "vi" (ino #54)
Increased nlink for child "arp" (ino #29)
Increased nlink for child "boa" (ino #31)
Increased nlink for child "ftp" (ino #35)
Increased nlink for child "rtc" (ino #47)
Increased nlink for child "ftpd" (ino #36)
Increased nlink for child "init" (ino #40)
Increased nlink for child "ping" (ino #44)
Increased nlink for child "test" (ino #51)
Increased nlink for child "inetd" (ino #39)
Increased nlink for child "login" (ino #41)
Increased nlink for child "mount" (ino #42)
Increased nlink for child "rmdir" (ino #45)
Increased nlink for child "route" (ino #46)
Increased nlink for child "telnetd" (ino #50)
Increased nlink for child "hostname" (ino #37)
Increased nlink for child "ifconfig" (ino #38)
Increased nlink for child "netflash" (ino #43)
Increased nlink for child "basename" (ino #30)
Increased nlink for child "expand" (ino #34)
Increased nlink for child "tinylogin" (ino #52)
Increased nlink for child "telnet" (ino #49)
Increased nlink for child "umount" (ino #53)
Increased nlink for child "eraseall" (ino #33)
Increased nlink for child "busybox" (ino #32)
Pass 1: ino #3
jffs2_build_inode building inode #3
Increased nlink for child "0" (ino #59)
Increased nlink for child "1" (ino #58)
Increased nlink for child "b" (ino #57)
Increased nlink for child "ram0" (ino #56)
Increased nlink for child "console" (ino #55)
Pass 1: ino #4
jffs2_build_inode building inode #4
Pass 1: ino #5
jffs2_build_inode building inode #5
Pass 1: ino #6
jffs2_build_inode building inode #6
Increased nlink for child "rc" (ino #21)
Increased nlink for child "ifup" (ino #13)
Increased nlink for child "ftphosts" (ino #10)
Increased nlink for child "group" (ino #11)
Increased nlink for child "hosts" (ino #12)
Increased nlink for child "termcap" (ino #27)
Increased nlink for child "boa.conf" (ino #9)
Increased nlink for child "version" (ino #28)
Increased nlink for child "services" (ino #23)
Increased nlink for child "sntp.conf" (ino #26)
Increased nlink for child "inetd.conf" (ino #14)
Increased nlink for child "inittab" (ino #15)
Increased nlink for child "ramfs1024.img" (ino #20)
Increased nlink for child "smtp.conf" (ino #24)
Increased nlink for child "ramfs.img" (ino #19)
Increased nlink for child "passwd" (ino #17)
Increased nlink for child "snmpd.conf" (ino #25)
Increased nlink for child "passwd-" (ino #18)
Increased nlink for child "resolv.conf" (ino #22)
Increased nlink for child "mime.types" (ino #16)
Pass 1: ino #7
jffs2_build_inode building inode #7
Increased nlink for child "httpd" (ino #8)
Pass 1: ino #8
jffs2_build_inode building inode #8
Pass 1: ino #9
jffs2_build_inode building inode #9
jffs2_build_inode_pass1 ignoring old metadata at 0x005fce00
jffs2_build_inode_pass1 truncating fraglist to 0x00001753
Truncating fraglist to 0x00001753 bytes
Pass 1: ino #10
jffs2_build_inode building inode #10
jffs2_build_inode_pass1 ignoring old metadata at 0x005fd994
jffs2_build_inode_pass1 truncating fraglist to 0x0000000a
Truncating fraglist to 0x0000000a bytes
Pass 1: ino #11
jffs2_build_inode building inode #11
jffs2_build_inode_pass1 ignoring old metadata at 0x005fda58
jffs2_build_inode_pass1 truncating fraglist to 0x00000025
Truncating fraglist to 0x00000025 bytes
Pass 1: ino #12
jffs2_build_inode building inode #12
jffs2_build_inode_pass1 ignoring old metadata at 0x005fdb38
jffs2_build_inode_pass1 truncating fraglist to 0x00000001
Truncating fraglist to 0x00000001 bytes
Pass 1: ino #13
jffs2_build_inode building inode #13
jffs2_build_inode_pass1 ignoring old metadata at 0x005fdbf4
jffs2_build_inode_pass1 truncating fraglist to 0x000000dd
Truncating fraglist to 0x000000dd bytes
Pass 1: ino #14
jffs2_build_inode building inode #14
jffs2_build_inode_pass1 ignoring old metadata at 0x005fdd30
jffs2_build_inode_pass1 truncating fraglist to 0x00000052
Truncating fraglist to 0x00000052 bytes
Pass 1: ino #15
jffs2_build_inode building inode #15
jffs2_build_inode_pass1 ignoring old metadata at 0x005fde30
jffs2_build_inode_pass1 truncating fraglist to 0x0000002d
Truncating fraglist to 0x0000002d bytes
Pass 1: ino #16
jffs2_build_inode building inode #16
jffs2_build_inode_pass1 ignoring old metadata at 0x005fdf18
jffs2_build_inode_pass1 truncating fraglist to 0x00000614
Truncating fraglist to 0x00000614 bytes
Pass 1: ino #17
jffs2_build_inode building inode #17
jffs2_build_inode_pass1 ignoring old metadata at 0x005fa29c
jffs2_build_inode_pass1 truncating fraglist to 0x0000007c
Truncating fraglist to 0x0000007c bytes
Pass 1: ino #18
jffs2_build_inode building inode #18
jffs2_build_inode_pass1 ignoring old metadata at 0x005fa3b4
jffs2_build_inode_pass1 truncating fraglist to 0x0000007c
Truncating fraglist to 0x0000007c bytes
Pass 1: ino #19
jffs2_build_inode building inode #19
jffs2_build_inode_pass1 ignoring old metadata at 0x005fa4cc
jffs2_build_inode_pass1 truncating fraglist to 0x00000b3a
Truncating fraglist to 0x00000b3a bytes
Pass 1: ino #20
jffs2_build_inode building inode #20
jffs2_build_inode_pass1 ignoring old metadata at 0x005fa7a0
jffs2_build_inode_pass1 truncating fraglist to 0x00000a84
Truncating fraglist to 0x00000a84 bytes
Pass 1: ino #21
jffs2_build_inode building inode #21
jffs2_build_inode_pass1 ignoring old metadata at 0x005faa70
jffs2_build_inode_pass1 truncating fraglist to 0x00000120
Truncating fraglist to 0x00000120 bytes
Pass 1: ino #22
jffs2_build_inode building inode #22
jffs2_build_inode_pass1 ignoring old metadata at 0x005fabd4
jffs2_build_inode_pass1 truncating fraglist to 0x0000002a
Truncating fraglist to 0x0000002a bytes
Pass 1: ino #23
jffs2_build_inode building inode #23
jffs2_build_inode_pass1 ignoring old metadata at 0x005facbc
jffs2_build_inode_pass1 truncating fraglist to 0x0000200d
Truncating fraglist to 0x0000200d bytes
Pass 1: ino #24
jffs2_build_inode building inode #24
jffs2_build_inode_pass1 ignoring old metadata at 0x005fba28
jffs2_build_inode_pass1 truncating fraglist to 0x00000001
Truncating fraglist to 0x00000001 bytes
Pass 1: ino #25
jffs2_build_inode building inode #25
jffs2_build_inode_pass1 ignoring old metadata at 0x005fbae8
jffs2_build_inode_pass1 truncating fraglist to 0x00000002
Truncating fraglist to 0x00000002 bytes
Pass 1: ino #26
jffs2_build_inode building inode #26
jffs2_build_inode_pass1 ignoring old metadata at 0x005fbba8
jffs2_build_inode_pass1 truncating fraglist to 0x0000000f
Truncating fraglist to 0x0000000f bytes
Pass 1: ino #27
jffs2_build_inode building inode #27
jffs2_build_inode_pass1 ignoring old metadata at 0x005fbc74
jffs2_build_inode_pass1 truncating fraglist to 0x000033f2
Truncating fraglist to 0x000033f2 bytes
Pass 1: ino #28
jffs2_build_inode building inode #28
jffs2_build_inode_pass1 ignoring old metadata at 0x005f959c
jffs2_build_inode_pass1 truncating fraglist to 0x0000003c
Truncating fraglist to 0x0000003c bytes
Pass 1: ino #29
jffs2_build_inode building inode #29
jffs2_build_inode_pass1 ignoring old metadata at 0x005f9800
jffs2_build_inode_pass1 truncating fraglist to 0x0000ea04
Truncating fraglist to 0x0000ea04 bytes
Pass 1: ino #30
jffs2_build_inode building inode #30
jffs2_build_inode_pass1 ignoring old metadata at 0x005ee6bc
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #31
jffs2_build_inode building inode #31
jffs2_build_inode_pass1 ignoring old metadata at 0x005dd130
jffs2_build_inode_pass1 truncating fraglist to 0x00016c8c
Truncating fraglist to 0x00016c8c bytes
Pass 1: ino #32
jffs2_build_inode building inode #32
jffs2_build_inode_pass1 ignoring old metadata at 0x005cf24c
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #33
jffs2_build_inode building inode #33
jffs2_build_inode_pass1 ignoring old metadata at 0x005bdc64
jffs2_build_inode_pass1 truncating fraglist to 0x0000733c
Truncating fraglist to 0x0000733c bytes
Pass 1: ino #34
jffs2_build_inode building inode #34
jffs2_build_inode_pass1 ignoring old metadata at 0x005b641c
jffs2_build_inode_pass1 truncating fraglist to 0x00006224
Truncating fraglist to 0x00006224 bytes
Pass 1: ino #35
jffs2_build_inode building inode #35
jffs2_build_inode_pass1 ignoring old metadata at 0x005b5f9c
jffs2_build_inode_pass1 truncating fraglist to 0x0001aa38
Truncating fraglist to 0x0001aa38 bytes
Pass 1: ino #36
jffs2_build_inode building inode #36
jffs2_build_inode_pass1 ignoring old metadata at 0x005a5e90
jffs2_build_inode_pass1 truncating fraglist to 0x000185dc
Truncating fraglist to 0x000185dc bytes
Pass 1: ino #37
jffs2_build_inode building inode #37
jffs2_build_inode_pass1 ignoring old metadata at 0x00594fd4
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #38
jffs2_build_inode building inode #38
jffs2_build_inode_pass1 ignoring old metadata at 0x005839fc
jffs2_build_inode_pass1 truncating fraglist to 0x0000ebfc
Truncating fraglist to 0x0000ebfc bytes
Pass 1: ino #39
jffs2_build_inode building inode #39
jffs2_build_inode_pass1 ignoring old metadata at 0x005787c4
jffs2_build_inode_pass1 truncating fraglist to 0x00008310
Truncating fraglist to 0x00008310 bytes
Pass 1: ino #40
jffs2_build_inode building inode #40
jffs2_build_inode_pass1 ignoring old metadata at 0x0057581c
jffs2_build_inode_pass1 truncating fraglist to 0x00005fac
Truncating fraglist to 0x00005fac bytes
Pass 1: ino #41
jffs2_build_inode building inode #41
jffs2_build_inode_pass1 ignoring old metadata at 0x0057150c
jffs2_build_inode_pass1 truncating fraglist to 0x00011f44
Truncating fraglist to 0x00011f44 bytes
Pass 1: ino #42
jffs2_build_inode building inode #42
jffs2_build_inode_pass1 ignoring old metadata at 0x0056467c
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #43
jffs2_build_inode building inode #43
jffs2_build_inode_pass1 ignoring old metadata at 0x00553020
jffs2_build_inode_pass1 truncating fraglist to 0x0000e91c
Truncating fraglist to 0x0000e91c bytes
Pass 1: ino #44
jffs2_build_inode building inode #44
jffs2_build_inode_pass1 ignoring old metadata at 0x0054be28
jffs2_build_inode_pass1 truncating fraglist to 0x0000d6b0
Truncating fraglist to 0x0000d6b0 bytes
Pass 1: ino #45
jffs2_build_inode building inode #45
jffs2_build_inode_pass1 ignoring old metadata at 0x00540414
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #46
jffs2_build_inode building inode #46
jffs2_build_inode_pass1 ignoring old metadata at 0x0052ecec
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #47
jffs2_build_inode building inode #47
jffs2_build_inode_pass1 ignoring old metadata at 0x0051d5d0
jffs2_build_inode_pass1 truncating fraglist to 0x00008a34
Truncating fraglist to 0x00008a34 bytes
Pass 1: ino #48
jffs2_build_inode building inode #48
jffs2_build_inode_pass1 ignoring old metadata at 0x00516d3c
jffs2_build_inode_pass1 truncating fraglist to 0x00010bb0
Truncating fraglist to 0x00010bb0 bytes
Pass 1: ino #49
jffs2_build_inode building inode #49
jffs2_build_inode_pass1 ignoring old metadata at 0x0050ce60
jffs2_build_inode_pass1 truncating fraglist to 0x0001b7bc
Truncating fraglist to 0x0001b7bc bytes
Pass 1: ino #50
jffs2_build_inode building inode #50
jffs2_build_inode_pass1 ignoring old metadata at 0x004fcdf0
jffs2_build_inode_pass1 truncating fraglist to 0x0000b1f8
Truncating fraglist to 0x0000b1f8 bytes
Pass 1: ino #51
jffs2_build_inode building inode #51
jffs2_build_inode_pass1 ignoring old metadata at 0x004f781c
jffs2_build_inode_pass1 truncating fraglist to 0x00006ae4
Truncating fraglist to 0x00006ae4 bytes
Pass 1: ino #52
jffs2_build_inode building inode #52
jffs2_build_inode_pass1 ignoring old metadata at 0x004f3ae4
jffs2_build_inode_pass1 truncating fraglist to 0x00011f44
Truncating fraglist to 0x00011f44 bytes
Pass 1: ino #53
jffs2_build_inode building inode #53
jffs2_build_inode_pass1 ignoring old metadata at 0x004e6d54
jffs2_build_inode_pass1 truncating fraglist to 0x0001e164
Truncating fraglist to 0x0001e164 bytes
Pass 1: ino #54
jffs2_build_inode building inode #54
jffs2_build_inode_pass1 ignoring old metadata at 0x004d5674
jffs2_build_inode_pass1 truncating fraglist to 0x0000cbe8
Truncating fraglist to 0x0000cbe8 bytes
Pass 1: ino #55
jffs2_build_inode building inode #55
Pass 1: ino #56
jffs2_build_inode building inode #56
Pass 1: ino #57
jffs2_build_inode building inode #57
Pass 1: ino #58
jffs2_build_inode building inode #58
Pass 1: ino #59
jffs2_build_inode building inode #59
Pass 1 complete
Pass 2 (re)starting
Pass 2: ino #1, nlink 1, ic 001c366c, nodes 00ff4ea0
Pass 2: ino #2, nlink 1, ic 001c3540, nodes 00ff4df0
Pass 2: ino #3, nlink 1, ic 001c34dc, nodes 00ff4e10
Pass 2: ino #4, nlink 1, ic 001c3680, nodes 00ff4e30
Pass 2: ino #5, nlink 1, ic 001c3694, nodes 00ff4e50
Pass 2: ino #6, nlink 1, ic 001c357c, nodes 00ff13a0
Pass 2: ino #7, nlink 1, ic 001c36a8, nodes 00ff4ec0
Pass 2: ino #8, nlink 1, ic 001c36bc, nodes 00ff4eb0
Pass 2: ino #9, nlink 1, ic 001c36d0, nodes 00ff4f00
Pass 2: ino #10, nlink 1, ic 001c36e4, nodes 00ff4f30
Pass 2: ino #11, nlink 1, ic 001c36f8, nodes 00ff4f60
Pass 2: ino #12, nlink 1, ic 001c370c, nodes 00ff4f90
Pass 2: ino #13, nlink 1, ic 001c3720, nodes 00ff4fc0
Pass 2: ino #14, nlink 1, ic 001c3734, nodes 00ff1350
Pass 2: ino #15, nlink 1, ic 001c3748, nodes 00ff1380
Pass 2: ino #16, nlink 1, ic 001c3590, nodes 00ff1390
Pass 2: ino #17, nlink 1, ic 001c35a4, nodes 00ff4be0
Pass 2: ino #18, nlink 1, ic 001c35b8, nodes 00ff4c10
Pass 2: ino #19, nlink 1, ic 001c35cc, nodes 00ff4c40
Pass 2: ino #20, nlink 1, ic 001c35e0, nodes 00ff4c70
Pass 2: ino #21, nlink 1, ic 001c35f4, nodes 00ff4ca0
Pass 2: ino #22, nlink 1, ic 001c3608, nodes 00ff4cd0
Pass 2: ino #23, nlink 1, ic 001c361c, nodes 00ff4d20
Pass 2: ino #24, nlink 1, ic 001c3630, nodes 00ff4d50
Pass 2: ino #25, nlink 1, ic 001c3644, nodes 00ff4d80
Pass 2: ino #26, nlink 1, ic 001c3658, nodes 00ff4db0
Pass 2: ino #27, nlink 1, ic 001c3554, nodes 00ff4de0
Pass 2: ino #28, nlink 1, ic 001c3568, nodes 00ff4b70
Pass 2: ino #29, nlink 1, ic 001c32d4, nodes 00ff4ba0
Pass 2: ino #30, nlink 1, ic 001c32e8, nodes 00ff49f0
Pass 2: ino #31, nlink 1, ic 001c32fc, nodes 00ff4760
Pass 2: ino #32, nlink 1, ic 001c3310, nodes 00ff4560
Pass 2: ino #33, nlink 1, ic 001c3324, nodes 00ff7f80
Pass 2: ino #34, nlink 1, ic 001c3338, nodes 00ff7e80
Pass 2: ino #35, nlink 1, ic 001c334c, nodes 00ff7e10
Pass 2: ino #36, nlink 1, ic 001c3360, nodes 00ff7bc0
Pass 2: ino #37, nlink 1, ic 001c3374, nodes 00ff7980
Pass 2: ino #38, nlink 1, ic 001c3388, nodes 00ff76f0
Pass 2: ino #39, nlink 1, ic 001c339c, nodes 00ff7570
Pass 2: ino #40, nlink 1, ic 001c33b0, nodes 00ff74c0
Pass 2: ino #41, nlink 1, ic 001c33c4, nodes 00ff7410
Pass 2: ino #42, nlink 1, ic 001c33d8, nodes 001c2f00
Pass 2: ino #43, nlink 1, ic 001c33ec, nodes 001c2c80
Pass 2: ino #44, nlink 1, ic 001c3400, nodes 001c2b40
Pass 2: ino #45, nlink 1, ic 001c3414, nodes 001c29d0
Pass 2: ino #46, nlink 1, ic 001c3428, nodes 001c2750
Pass 2: ino #47, nlink 1, ic 001c343c, nodes 001c24d0
Pass 2: ino #48, nlink 1, ic 001c3450, nodes 001c23d0
Pass 2: ino #49, nlink 1, ic 001c3464, nodes 001c6f00
Pass 2: ino #50, nlink 1, ic 001c3478, nodes 001c6c90
Pass 2: ino #51, nlink 1, ic 001c348c, nodes 001c6ba0
Pass 2: ino #52, nlink 1, ic 001c34a0, nodes 001c6af0
Pass 2: ino #53, nlink 1, ic 001c34b4, nodes 001c6950
Pass 2: ino #54, nlink 1, ic 001c32c0, nodes 001c66d0
Pass 2: ino #55, nlink 1, ic 001c34c8, nodes 001c6510
Pass 2: ino #56, nlink 1, ic 001c34f0, nodes 001c6530
Pass 2: ino #57, nlink 1, ic 001c3504, nodes 001c6550
Pass 2: ino #58, nlink 1, ic 001c3518, nodes 001c6570
Pass 2: ino #59, nlink 1, ic 001c352c, nodes 001c6590
Pass 2 complete
Pass 3: ino #1, ic 001c366c, nodes 00ff4ea0
Pass 3: ino #2, ic 001c3540, nodes 00ff4df0
Pass 3: ino #3, ic 001c34dc, nodes 00ff4e10
Pass 3: ino #4, ic 001c3680, nodes 00ff4e30
Pass 3: ino #5, ic 001c3694, nodes 00ff4e50
Pass 3: ino #6, ic 001c357c, nodes 00ff13a0
Pass 3: ino #7, ic 001c36a8, nodes 00ff4ec0
Pass 3: ino #8, ic 001c36bc, nodes 00ff4eb0
Pass 3: ino #9, ic 001c36d0, nodes 00ff4f00
Pass 3: ino #10, ic 001c36e4, nodes 00ff4f30
Pass 3: ino #11, ic 001c36f8, nodes 00ff4f60
Pass 3: ino #12, ic 001c370c, nodes 00ff4f90
Pass 3: ino #13, ic 001c3720, nodes 00ff4fc0
Pass 3: ino #14, ic 001c3734, nodes 00ff1350
Pass 3: ino #15, ic 001c3748, nodes 00ff1380
Pass 3: ino #16, ic 001c3590, nodes 00ff1390
Pass 3: ino #17, ic 001c35a4, nodes 00ff4be0
Pass 3: ino #18, ic 001c35b8, nodes 00ff4c10
Pass 3: ino #19, ic 001c35cc, nodes 00ff4c40
Pass 3: ino #20, ic 001c35e0, nodes 00ff4c70
Pass 3: ino #21, ic 001c35f4, nodes 00ff4ca0
Pass 3: ino #22, ic 001c3608, nodes 00ff4cd0
Pass 3: ino #23, ic 001c361c, nodes 00ff4d20
Pass 3: ino #24, ic 001c3630, nodes 00ff4d50
Pass 3: ino #25, ic 001c3644, nodes 00ff4d80
Pass 3: ino #26, ic 001c3658, nodes 00ff4db0
Pass 3: ino #27, ic 001c3554, nodes 00ff4de0
Pass 3: ino #28, ic 001c3568, nodes 00ff4b70
Pass 3: ino #29, ic 001c32d4, nodes 00ff4ba0
Pass 3: ino #30, ic 001c32e8, nodes 00ff49f0
Pass 3: ino #31, ic 001c32fc, nodes 00ff4760
Pass 3: ino #32, ic 001c3310, nodes 00ff4560
Pass 3: ino #33, ic 001c3324, nodes 00ff7f80
Pass 3: ino #34, ic 001c3338, nodes 00ff7e80
Pass 3: ino #35, ic 001c334c, nodes 00ff7e10
Pass 3: ino #36, ic 001c3360, nodes 00ff7bc0
Pass 3: ino #37, ic 001c3374, nodes 00ff7980
Pass 3: ino #38, ic 001c3388, nodes 00ff76f0
Pass 3: ino #39, ic 001c339c, nodes 00ff7570
Pass 3: ino #40, ic 001c33b0, nodes 00ff74c0
Pass 3: ino #41, ic 001c33c4, nodes 00ff7410
Pass 3: ino #42, ic 001c33d8, nodes 001c2f00
Pass 3: ino #43, ic 001c33ec, nodes 001c2c80
Pass 3: ino #44, ic 001c3400, nodes 001c2b40
Pass 3: ino #45, ic 001c3414, nodes 001c29d0
Pass 3: ino #46, ic 001c3428, nodes 001c2750
Pass 3: ino #47, ic 001c343c, nodes 001c24d0
Pass 3: ino #48, ic 001c3450, nodes 001c23d0
Pass 3: ino #49, ic 001c3464, nodes 001c6f00
Pass 3: ino #50, ic 001c3478, nodes 001c6c90
Pass 3: ino #51, ic 001c348c, nodes 001c6ba0
Pass 3: ino #52, ic 001c34a0, nodes 001c6af0
Pass 3: ino #53, ic 001c34b4, nodes 001c6950
Pass 3: ino #54, ic 001c32c0, nodes 001c66d0
Pass 3: ino #55, ic 001c34c8, nodes 001c6510
Pass 3: ino #56, ic 001c34f0, nodes 001c6530
Pass 3: ino #57, ic 001c3504, nodes 001c6550
Pass 3: ino #58, ic 001c3518, nodes 001c6570
Pass 3: ino #59, ic 001c352c, nodes 001c6590
Pass 3 complete
Rotating clean_list by 117
Erase block at front of clean_list is at 0050a000
Not rotating empty very_dirty_list
Rotating dirty_list by 3
Erase block at front of dirty_list is at 004cc000
Not rotating empty erasable_list
Not rotating empty erase_pending_list
Rotating free_list by 568
Erase block at front of free_list is at 0005a000
jffs2_do_fill_super(): Getting root inode
jffs2_read_inode(): inode->i_ino =3D=3D 1
jffs2_do_read_inode(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
Node at 005fca44 is a dirent node
Adding fd "home", ino #7
jffs2_add_fd_to_list( 001b98a0, 001fbd24 (->00000000))
Node at 005fc844 is a dirent node
Adding fd "etc", ino #6
jffs2_add_fd_to_list( 001b9860, 001fbd24 (->001b98a0))
Node at 005fc644 is a dirent node
Adding fd "var", ino #5
jffs2_add_fd_to_list( 001b9820, 001fbd24 (->001b9860))
Node at 005fc444 is a dirent node
Adding fd "proc", ino #4
jffs2_add_fd_to_list( 001b97e0, 001fbd24 (->001b9860))
Node at 005fc244 is a dirent node
Adding fd "dev", ino #3
jffs2_add_fd_to_list( 001b9780, 001fbd24 (->001b9860))
Node at 005fc044 is a dirent node
Adding fd "bin", ino #2
jffs2_add_fd_to_list( 001b9440, 001fbd24 (->001b9780))
jffs2_read_inode() returning
jffs2_do_fill_super(): d_alloc_root()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
jffs2_garbage_collect_thread sleeping...
JFFS2: Garbage collect thread is pid 8
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 40K
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 3
jffs2_do_read_inode(): ino #3 nlink is 1
jffs2_get_inode_nodes(): ino #3
Node at 005fc200 is a data node
version 1, highest_version now 1
dnode @005fc200: ver 1, offset 0000, dsize 0000
Node at 004cdf94 is a dirent node
Adding fd "0", ino #59
jffs2_add_fd_to_list( 001b9740, 001fbd1c (->00000000))
Node at 004cdf24 is a dirent node
Adding fd "1", ino #58
jffs2_add_fd_to_list( 001b9720, 001fbd1c (->001b9740))
Node at 004cdeb4 is a dirent node
Adding fd "b", ino #57
jffs2_add_fd_to_list( 001b9700, 001fbd1c (->001b9740))
Node at 004cde44 is a dirent node
Adding fd "ram0", ino #56
jffs2_add_fd_to_list( 001b96e0, 001fbd1c (->001b9740))
Node at 004cdc48 is a dirent node
Adding fd "console", ino #55
jffs2_add_fd_to_list( 001b96c0, 001fbd1c (->001b9740))
metadata @005fc200: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 55
jffs2_do_read_inode(): ino #55 nlink is 1
jffs2_get_inode_nodes(): ino #55
Node at 004cdc00 is a data node
version 1, highest_version now 1
dnode @004cdc00: ver 1, offset 0000, dsize 0002
jffs2_add_full_dnode_to_inode(ino #55, f 00fef540, fn 001c4540)
Reading device numbers from flash
Node read from 004cdc00: node_crc 634a8b77, calculated CRC 634a8b77. =
dsize 2, cs
ize 2, offset 0, buf 001fbdf2
jffs2_read_inode() returning
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 6
jffs2_do_read_inode(): ino #6 nlink is 1
jffs2_get_inode_nodes(): ino #6
Node at 005fdf5c is a dirent node
Adding fd "mime.types", ino #16
jffs2_add_fd_to_list( 001b7660, 001fbb8c (->00000000))
Node at 005fde74 is a dirent node
Adding fd "inittab", ino #15
jffs2_add_fd_to_list( 001b9660, 001fbb8c (->001b7660))
Node at 005fdd74 is a dirent node
Adding fd "inetd.conf", ino #14
jffs2_add_fd_to_list( 001b7520, 001fbb8c (->001b9660))
Node at 005fdc38 is a dirent node
Adding fd "ifup", ino #13
jffs2_add_fd_to_list( 001b9640, 001fbb8c (->001b7520))
Node at 005fdb7c is a dirent node
Adding fd "hosts", ino #12
jffs2_add_fd_to_list( 001b9620, 001fbb8c (->001b9640))
Node at 005fda9c is a dirent node
Adding fd "group", ino #11
jffs2_add_fd_to_list( 001b9600, 001fbb8c (->001b9640))
Node at 005fd9d8 is a dirent node
Adding fd "ftphosts", ino #10
jffs2_add_fd_to_list( 001b7620, 001fbb8c (->001b9640))
Node at 005fce44 is a dirent node
Adding fd "boa.conf", ino #9
jffs2_add_fd_to_list( 001b7560, 001fbb8c (->001b9640))
Node at 005fc800 is a data node
version 1, highest_version now 9
dnode @005fc800: ver 1, offset 0000, dsize 0000
Node at 005fbcb8 is a dirent node
Adding fd "termcap", ino #27
jffs2_add_fd_to_list( 001b95e0, 001fbb8c (->001b9640))
Node at 005fbbec is a dirent node
Adding fd "sntp.conf", ino #26
jffs2_add_fd_to_list( 001b7760, 001fbb8c (->001b9640))
Node at 005fbb2c is a dirent node
Adding fd "snmpd.conf", ino #25
jffs2_add_fd_to_list( 001b76a0, 001fbb8c (->001b9640))
Node at 005fba6c is a dirent node
Adding fd "smtp.conf", ino #24
jffs2_add_fd_to_list( 001b75e0, 001fbb8c (->001b9640))
Node at 005fad00 is a dirent node
Adding fd "services", ino #23
jffs2_add_fd_to_list( 001b76e0, 001fbb8c (->001b9640))
Node at 005fac18 is a dirent node
Adding fd "resolv.conf", ino #22
jffs2_add_fd_to_list( 001b7720, 001fbb8c (->001b9640))
Node at 005faab4 is a dirent node
Adding fd "rc", ino #21
jffs2_add_fd_to_list( 001b95c0, 001fbb8c (->001b9640))
Node at 005fa7e4 is a dirent node
Adding fd "ramfs1024.img", ino #20
jffs2_add_fd_to_list( 001b74a0, 001fbb8c (->001b95c0))
Node at 005fa510 is a dirent node
Adding fd "ramfs.img", ino #19
jffs2_add_fd_to_list( 001b73a0, 001fbb8c (->001b95c0))
Node at 005fa3f8 is a dirent node
Adding fd "passwd-", ino #18
jffs2_add_fd_to_list( 001b95a0, 001fbb8c (->001b95c0))
Node at 005fa2e0 is a dirent node
Adding fd "passwd", ino #17
jffs2_add_fd_to_list( 001b9580, 001fbb8c (->001b95c0))
Node at 005f95e0 is a dirent node
Adding fd "version", ino #28
jffs2_add_fd_to_list( 001b9560, 001fbb8c (->001b95c0))
metadata @005fc800: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 2
jffs2_do_read_inode(): ino #2 nlink is 1
jffs2_get_inode_nodes(): ino #2
Node at 005fc000 is a data node
version 1, highest_version now 1
dnode @005fc000: ver 1, offset 0000, dsize 0000
Node at 005f9844 is a dirent node
Adding fd "arp", ino #29
jffs2_add_fd_to_list( 001b9540, 001fbb8c (->00000000))
Node at 005ee700 is a dirent node
Adding fd "basename", ino #30
jffs2_add_fd_to_list( 001b74e0, 001fbb8c (->001b9540))
Node at 005dd174 is a dirent node
Adding fd "boa", ino #31
jffs2_add_fd_to_list( 001b9520, 001fbb8c (->001b9540))
Node at 005cf290 is a dirent node
Adding fd "busybox", ino #32
jffs2_add_fd_to_list( 001b9500, 001fbb8c (->001b9540))
Node at 005bdca8 is a dirent node
Adding fd "eraseall", ino #33
jffs2_add_fd_to_list( 001b73e0, 001fbb8c (->001b9540))
Node at 005b6460 is a dirent node
Adding fd "expand", ino #34
jffs2_add_fd_to_list( 001b94e0, 001fbb8c (->001b9540))
Node at 005b2000 is a dirent node
Adding fd "ftp", ino #35
jffs2_add_fd_to_list( 001b94c0, 001fbb8c (->001b9540))
Node at 005a5ed4 is a dirent node
Adding fd "ftpd", ino #36
jffs2_add_fd_to_list( 001b94a0, 001fbb8c (->001b9540))
Node at 00595018 is a dirent node
Adding fd "hostname", ino #37
jffs2_add_fd_to_list( 001b7420, 001fbb8c (->001b9540))
Node at 00583a40 is a dirent node
Adding fd "ifconfig", ino #38
jffs2_add_fd_to_list( 001b7460, 001fbb8c (->001b9540))
Node at 00578808 is a dirent node
Adding fd "inetd", ino #39
jffs2_add_fd_to_list( 001b9480, 001fbb8c (->001b9540))
Node at 00575860 is a dirent node
Adding fd "init", ino #40
jffs2_add_fd_to_list( 001b9460, 001fbb8c (->001b9540))
Node at 00571550 is a dirent node
Adding fd "login", ino #41
jffs2_add_fd_to_list( 001b9b80, 001fbb8c (->001b9540))
Node at 005646c0 is a dirent node
Adding fd "mount", ino #42
jffs2_add_fd_to_list( 001b9b60, 001fbb8c (->001b9540))
Node at 00553064 is a dirent node
Adding fd "netflash", ino #43
jffs2_add_fd_to_list( 001b77e0, 001fbb8c (->001b9540))
Node at 0054be6c is a dirent node
Adding fd "ping", ino #44
jffs2_add_fd_to_list( 001b9da0, 001fbb8c (->001b9540))
Node at 00540458 is a dirent node
Adding fd "rmdir", ino #45
jffs2_add_fd_to_list( 001b9d80, 001fbb8c (->001b9540))
Node at 0052ed30 is a dirent node
Adding fd "route", ino #46
jffs2_add_fd_to_list( 001b9d60, 001fbb8c (->001b9540))
Node at 0051d614 is a dirent node
Adding fd "rtc", ino #47
jffs2_add_fd_to_list( 001b9d40, 001fbb8c (->001b9540))
Node at 00516d80 is a dirent node
Adding fd "sh", ino #48
jffs2_add_fd_to_list( 001b9d20, 001fbb8c (->001b9540))
Node at 0050cea4 is a dirent node
Adding fd "telnet", ino #49
jffs2_add_fd_to_list( 001b9ce0, 001fbb8c (->001b9d20))
Node at 004fce34 is a dirent node
Adding fd "telnetd", ino #50
jffs2_add_fd_to_list( 001b9cc0, 001fbb8c (->001b9d20))
Node at 004f7860 is a dirent node
Adding fd "test", ino #51
jffs2_add_fd_to_list( 001b9ca0, 001fbb8c (->001b9d20))
Node at 004f3b28 is a dirent node
Adding fd "tinylogin", ino #52
jffs2_add_fd_to_list( 001b7820, 001fbb8c (->001b9d20))
Node at 004e6d98 is a dirent node
Adding fd "umount", ino #53
jffs2_add_fd_to_list( 001b9c60, 001fbb8c (->001b9d20))
Node at 004d56b8 is a dirent node
Adding fd "vi", ino #54
jffs2_add_fd_to_list( 001b9c20, 001fbb8c (->001b9d20))
metadata @005fc000: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 40
jffs2_do_read_inode(): ino #40 nlink is 1
jffs2_get_inode_nodes(): ino #40
Node at 0057588c is a data node
version 2, highest_version now 2
dnode @0057588c: ver 2, offset 0000, dsize 0ae2
node at 0x0057581c is obsoleted. Ignoring.
Node at 005738a4 is a data node
version 6, highest_version now 6
dnode @005738a4: ver 6, offset 3000, dsize 0b21
Node at 00572eac is a data node
version 5, highest_version now 6
dnode @00572eac: ver 5, offset 2000, dsize 1000
Node at 00572398 is a data node
version 4, highest_version now 6
dnode @00572398: ver 4, offset 1000, dsize 1000
Node at 00572000 is a data node
version 3, highest_version now 6
dnode @00572000: ver 3, offset 0ae2, dsize 051e
Node at 00570ab4 is a data node
version 9, highest_version now 9
dnode @00570ab4: ver 9, offset 5000, dsize 0fac
Node at 00570364 is a data node
version 8, highest_version now 9
dnode @00570364: ver 8, offset 4000, dsize 1000
Node at 00570000 is a data node
version 7, highest_version now 9
dnode @00570000: ver 7, offset 3b21, dsize 04df
Node at 004cd6ec is a data node
version 10, highest_version now 10
dnode @004cd6ec: ver 10, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4510)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4590)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4340)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4350)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4360)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4560)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4570)
jffs2_add_full_dnode_to_inode(ino #40, f 00fefae0, fn 001c4580)
metadata @004cd6ec: ver 10
Truncating fraglist to 0x00005fac bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #40, page at offset 0x0
jffs2_read_inode_range: ino #40, range 0x00000000-0x00001000
Reading 0-2786 from node at 0x57588c
Node read from 0057588c: node_crc a0eea8f4, calculated CRC a0eea8f4. =
dsize ae2,
csize 72b, offset 0, buf 00fe8000
Reading 2786-4096 from node at 0x572000
Node read from 00572000: node_crc 4134178a, calculated CRC 4134178a. =
dsize 51e,
csize 352, offset ae2, buf 00fe8ae2
readpage finished
jffs2_do_readpage_nolock(): ino #40, page at offset 0x1000
jffs2_read_inode_range: ino #40, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x572398
Node read from 00572398: node_crc f1fe746a, calculated CRC f1fe746a. =
dsize 1000,
 csize ad0, offset 1000, buf 00009000
readpage finished
jffs2_do_readpage_nolock(): ino #40, page at offset 0x2000
jffs2_read_inode_range: ino #40, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x572eac
Node read from 00572eac: node_crc 4bb951bf, calculated CRC 4bb951bf. =
dsize 1000,
 csize 9b4, offset 2000, buf 00008000
readpage finished
jffs2_do_readpage_nolock(): ino #40, page at offset 0x3000
jffs2_read_inode_range: ino #40, range 0x00003000-0x00004000
Reading 12288-15137 from node at 0x5738a4
Node read from 005738a4: node_crc 4b64b1d7, calculated CRC 4b64b1d7. =
dsize b21,
csize 712, offset 3000, buf 00fbf000
Reading 15137-16384 from node at 0x570000
Node read from 00570000: node_crc 919e51f5, calculated CRC 919e51f5. =
dsize 4df,
csize 31d, offset 3b21, buf 00fbfb21
readpage finished
jffs2_do_readpage_nolock(): ino #40, page at offset 0x4000
jffs2_read_inode_range: ino #40, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x570364
Node read from 00570364: node_crc fd6a4aef, calculated CRC fd6a4aef. =
dsize 1000,
 csize 70c, offset 4000, buf 00fbd000
readpage finished
jffs2_do_readpage_nolock(): ino #40, page at offset 0x5000
jffs2_read_inode_range: ino #40, range 0x00005000-0x00006000
Reading 20480-24492 from node at 0x570ab4
Node read from 00570ab4: node_crc 572394f7, calculated CRC 572394f7. =
dsize fac,
csize a13, offset 5000, buf 00fbc000
Filling non-frag hole from 24492-24576
readpage finished
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 48
jffs2_do_read_inode(): ino #48 nlink is 1
jffs2_get_inode_nodes(): ino #48
Node at 00517764 is a data node
version 3, highest_version now 3
dnode @00517764: ver 3, offset 1000, dsize 0e4d
Node at 00516dac is a data node
version 2, highest_version now 3
dnode @00516dac: ver 2, offset 0000, dsize 1000
node at 0x00516d3c is obsoleted. Ignoring.
Node at 00515550 is a data node
version 7, highest_version now 7
dnode @00515550: ver 7, offset 4000, dsize 0fc3
Node at 00514b10 is a data node
version 6, highest_version now 7
dnode @00514b10: ver 6, offset 3000, dsize 1000
Node at 00514154 is a data node
version 5, highest_version now 7
dnode @00514154: ver 5, offset 2000, dsize 1000
Node at 00514000 is a data node
version 4, highest_version now 7
dnode @00514000: ver 4, offset 1e4d, dsize 01b3
Node at 00513ed0 is a data node
version 12, highest_version now 12
dnode @00513ed0: ver 12, offset 8000, dsize 00fc
Node at 00513514 is a data node
version 11, highest_version now 12
dnode @00513514: ver 11, offset 7000, dsize 1000
Node at 00512b44 is a data node
version 10, highest_version now 12
dnode @00512b44: ver 10, offset 6000, dsize 1000
Node at 00512084 is a data node
version 9, highest_version now 12
dnode @00512084: ver 9, offset 5000, dsize 1000
Node at 00512000 is a data node
version 8, highest_version now 12
dnode @00512000: ver 8, offset 4fc3, dsize 003d
Node at 005119c8 is a data node
version 16, highest_version now 16
dnode @005119c8: ver 16, offset b000, dsize 0866
Node at 00510f04 is a data node
version 15, highest_version now 16
dnode @00510f04: ver 15, offset a000, dsize 1000
Node at 00510868 is a data node
version 14, highest_version now 16
dnode @00510868: ver 14, offset 9000, dsize 1000
Node at 00510000 is a data node
version 13, highest_version now 16
dnode @00510000: ver 13, offset 80fc, dsize 0f04
Node at 0050f6fc is a data node
version 20, highest_version now 20
dnode @0050f6fc: ver 20, offset e000, dsize 0feb
Node at 0050ede8 is a data node
version 19, highest_version now 20
dnode @0050ede8: ver 19, offset d000, dsize 1000
Node at 0050e4f0 is a data node
version 18, highest_version now 20
dnode @0050e4f0: ver 18, offset c000, dsize 1000
Node at 0050e000 is a data node
version 17, highest_version now 20
dnode @0050e000: ver 17, offset b866, dsize 079a
Node at 0050c75c is a data node
version 23, highest_version now 23
dnode @0050c75c: ver 23, offset 10000, dsize 0bb0
Node at 0050c05c is a data node
version 22, highest_version now 23
dnode @0050c05c: ver 22, offset f000, dsize 1000
Node at 0050c000 is a data node
version 21, highest_version now 23
dnode @0050c000: ver 21, offset efeb, dsize 0015
Node at 004cd90c is a data node
version 24, highest_version now 24
dnode @004cd90c: ver 24, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c45b0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c45c0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c45f0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4600)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4610)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c45a0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4650)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4660)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4500)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4670)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c45e0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c46b0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4620)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4630)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4640)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4700)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4680)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c4690)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c46a0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c46d0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c46e0)
jffs2_add_full_dnode_to_inode(ino #48, f 00fefcc0, fn 001c46f0)
metadata @004cd90c: ver 24
Truncating fraglist to 0x00010bb0 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #48, page at offset 0x0
jffs2_read_inode_range: ino #48, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x516dac
Node read from 00516dac: node_crc 8572d242, calculated CRC 8572d242. =
dsize 1000,
 csize 971, offset 0, buf 00fb7000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x1000
jffs2_read_inode_range: ino #48, range 0x00001000-0x00002000
Reading 4096-7757 from node at 0x517764
Node read from 00517764: node_crc 1c8b7b79, calculated CRC 1c8b7b79. =
dsize e4d,
csize 853, offset 1000, buf 00fb5000
Reading 7757-8192 from node at 0x514000
Node read from 00514000: node_crc 6b985818, calculated CRC 6b985818. =
dsize 1b3,
csize 10e, offset 1e4d, buf 00fb5e4d
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x2000
jffs2_read_inode_range: ino #48, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x514154
Node read from 00514154: node_crc 3a12c190, calculated CRC 3a12c190. =
dsize 1000,
 csize 975, offset 2000, buf 00fb3000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x3000
jffs2_read_inode_range: ino #48, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x514b10
Node read from 00514b10: node_crc 6f140334, calculated CRC 6f140334. =
dsize 1000,
 csize 9fb, offset 3000, buf 00fb2000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x4000
jffs2_read_inode_range: ino #48, range 0x00004000-0x00005000
Reading 16384-20419 from node at 0x515550
Node read from 00515550: node_crc 3b69035b, calculated CRC 3b69035b. =
dsize fc3,
csize a68, offset 4000, buf 00fb1000
Reading 20419-20480 from node at 0x512000
Node read from 00512000: node_crc f0b0ca6c, calculated CRC f0b0ca6c. =
dsize 3d, c
size 3d, offset 4fc3, buf 00fb1fc3
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x5000
jffs2_read_inode_range: ino #48, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x512084
Node read from 00512084: node_crc 82e21314, calculated CRC 82e21314. =
dsize 1000,
 csize a7a, offset 5000, buf 00fb0000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x6000
jffs2_read_inode_range: ino #48, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x512b44
Node read from 00512b44: node_crc 91458eea, calculated CRC 91458eea. =
dsize 1000,
 csize 989, offset 6000, buf 00faf000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x7000
jffs2_read_inode_range: ino #48, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x513514
Node read from 00513514: node_crc aa69ccfa, calculated CRC aa69ccfa. =
dsize 1000,
 csize 977, offset 7000, buf 00fae000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x8000
jffs2_read_inode_range: ino #48, range 0x00008000-0x00009000
Reading 32768-33020 from node at 0x513ed0
Node read from 00513ed0: node_crc b4ada049, calculated CRC b4ada049. =
dsize fc, c
size e8, offset 8000, buf 00fad000
Reading 33020-36864 from node at 0x510000
Node read from 00510000: node_crc 4b32c275, calculated CRC 4b32c275. =
dsize f04,
csize 824, offset 80fc, buf 00fad0fc
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x9000
jffs2_read_inode_range: ino #48, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x510868
Node read from 00510868: node_crc b14fee4d, calculated CRC b14fee4d. =
dsize 1000,
 csize 655, offset 9000, buf 00fac000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xa000
jffs2_read_inode_range: ino #48, range 0x0000a000-0x0000b000
Reading 40960-45056 from node at 0x510f04
Node read from 00510f04: node_crc 41a25bb0, calculated CRC 41a25bb0. =
dsize 1000,
 csize a7f, offset a000, buf 00fab000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xb000
jffs2_read_inode_range: ino #48, range 0x0000b000-0x0000c000
Reading 45056-47206 from node at 0x5119c8
Node read from 005119c8: node_crc 5a0d1eed, calculated CRC 5a0d1eed. =
dsize 866,
csize 5ef, offset b000, buf 00faa000
Reading 47206-49152 from node at 0x50e000
Node read from 0050e000: node_crc 75f3fed5, calculated CRC 75f3fed5. =
dsize 79a,
csize 4aa, offset b866, buf 00faa866
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xc000
jffs2_read_inode_range: ino #48, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x50e4f0
Node read from 0050e4f0: node_crc 500dcc0b, calculated CRC 500dcc0b. =
dsize 1000,
 csize 8b4, offset c000, buf 00fa9000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xd000
jffs2_read_inode_range: ino #48, range 0x0000d000-0x0000e000
Reading 53248-57344 from node at 0x50ede8
Node read from 0050ede8: node_crc 19c893c2, calculated CRC 19c893c2. =
dsize 1000,
 csize 8ce, offset d000, buf 00fa8000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xe000
jffs2_read_inode_range: ino #48, range 0x0000e000-0x0000f000
Reading 57344-61419 from node at 0x50f6fc
Node read from 0050f6fc: node_crc bb4805cc, calculated CRC bb4805cc. =
dsize feb,
csize 8ba, offset e000, buf 00fa7000
Reading 61419-61440 from node at 0x50c000
Node read from 0050c000: node_crc 4d0d2ae6, calculated CRC 4d0d2ae6. =
dsize 15, c
size 15, offset efeb, buf 00fa7feb
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0xf000
jffs2_read_inode_range: ino #48, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x50c05c
Node read from 0050c05c: node_crc efb0e353, calculated CRC efb0e353. =
dsize 1000,
 csize 6b9, offset f000, buf 00fa6000
readpage finished
jffs2_do_readpage_nolock(): ino #48, page at offset 0x10000
jffs2_read_inode_range: ino #48, range 0x00010000-0x00011000
Reading 65536-68528 from node at 0x50c75c
Node read from 0050c75c: node_crc e56910ab, calculated CRC e56910ab. =
dsize bb0,
csize 6bf, offset 10000, buf 00fa5000
Filling non-frag hole from 68528-69632
readpage finished
Shell invoked to run file: /etc/rc
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 21
jffs2_do_read_inode(): ino #21 nlink is 1
jffs2_get_inode_nodes(): ino #21
Node at 005faae0 is a data node
version 2, highest_version now 2
dnode @005faae0: ver 2, offset 0000, dsize 0120
node at 0x005faa70 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #21, f 00fefea0, fn 001c4740)
Truncating fraglist to 0x00000120 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #21, page at offset 0x0
jffs2_read_inode_range: ino #21, range 0x00000000-0x00001000
Reading 0-288 from node at 0x5faae0
Node read from 005faae0: node_crc 04f81f34, calculated CRC 04f81f34. =
dsize 120,
csize af, offset 0, buf 00fb6000
Filling non-frag hole from 288-4096
readpage finished
Command: hostname board
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 37
jffs2_do_read_inode(): ino #37 nlink is 1
jffs2_get_inode_nodes(): ino #37
Node at 00595a40 is a data node
version 3, highest_version now 3
dnode @00595a40: ver 3, offset 1000, dsize 0800
Node at 00595048 is a data node
version 2, highest_version now 3
dnode @00595048: ver 2, offset 0000, dsize 1000
node at 0x00594fd4 is obsoleted. Ignoring.
Node at 00593988 is a data node
version 7, highest_version now 7
dnode @00593988: ver 7, offset 4000, dsize 0a84
Node at 00592f74 is a data node
version 6, highest_version now 7
dnode @00592f74: ver 6, offset 3000, dsize 1000
Node at 005924f8 is a data node
version 5, highest_version now 7
dnode @005924f8: ver 5, offset 2000, dsize 1000
Node at 00592000 is a data node
version 4, highest_version now 7
dnode @00592000: ver 4, offset 1800, dsize 0800
Node at 00591730 is a data node
version 11, highest_version now 11
dnode @00591730: ver 11, offset 7000, dsize 0c84
Node at 00590d34 is a data node
version 10, highest_version now 11
dnode @00590d34: ver 10, offset 6000, dsize 1000
Node at 005903dc is a data node
version 9, highest_version now 11
dnode @005903dc: ver 9, offset 5000, dsize 1000
Node at 00590000 is a data node
version 8, highest_version now 11
dnode @00590000: ver 8, offset 4a84, dsize 057c
Node at 0058f858 is a data node
version 15, highest_version now 15
dnode @0058f858: ver 15, offset a000, dsize 0b53
Node at 0058ed48 is a data node
version 14, highest_version now 15
dnode @0058ed48: ver 14, offset 9000, dsize 1000
Node at 0058e28c is a data node
version 13, highest_version now 15
dnode @0058e28c: ver 13, offset 8000, dsize 1000
Node at 0058e000 is a data node
version 12, highest_version now 15
dnode @0058e000: ver 12, offset 7c84, dsize 037c
Node at 0058d744 is a data node
version 19, highest_version now 19
dnode @0058d744: ver 19, offset d000, dsize 0ced
Node at 0058cd48 is a data node
version 18, highest_version now 19
dnode @0058cd48: ver 18, offset c000, dsize 1000
Node at 0058c398 is a data node
version 17, highest_version now 19
dnode @0058c398: ver 17, offset b000, dsize 1000
Node at 0058c000 is a data node
version 16, highest_version now 19
dnode @0058c000: ver 16, offset ab53, dsize 04ad
Node at 0058bdec is a data node
version 24, highest_version now 24
dnode @0058bdec: ver 24, offset 11000, dsize 0235
Node at 0058b3f4 is a data node
version 23, highest_version now 24
dnode @0058b3f4: ver 23, offset 10000, dsize 1000
Node at 0058ab9c is a data node
version 22, highest_version now 24
dnode @0058ab9c: ver 22, offset f000, dsize 1000
Node at 0058a2c4 is a data node
version 21, highest_version now 24
dnode @0058a2c4: ver 21, offset e000, dsize 1000
Node at 0058a000 is a data node
version 20, highest_version now 24
dnode @0058a000: ver 20, offset dced, dsize 0313
Node at 00589954 is a data node
version 28, highest_version now 28
dnode @00589954: ver 28, offset 14000, dsize 095b
Node at 00588ee0 is a data node
version 27, highest_version now 28
dnode @00588ee0: ver 27, offset 13000, dsize 1000
Node at 005887a8 is a data node
version 26, highest_version now 28
dnode @005887a8: ver 26, offset 12000, dsize 1000
Node at 00588000 is a data node
version 25, highest_version now 28
dnode @00588000: ver 25, offset 11235, dsize 0dcb
Node at 0058781c is a data node
version 32, highest_version now 32
dnode @0058781c: ver 32, offset 17000, dsize 0b68
Node at 00586e94 is a data node
version 31, highest_version now 32
dnode @00586e94: ver 31, offset 16000, dsize 1000
Node at 005864e0 is a data node
version 30, highest_version now 32
dnode @005864e0: ver 30, offset 15000, dsize 1000
Node at 00586000 is a data node
version 29, highest_version now 32
dnode @00586000: ver 29, offset 1495b, dsize 06a5
Node at 00585d60 is a data node
version 37, highest_version now 37
dnode @00585d60: ver 37, offset 1b000, dsize 0468
Node at 005853f4 is a data node
version 36, highest_version now 37
dnode @005853f4: ver 36, offset 1a000, dsize 1000
Node at 00584b6c is a data node
version 35, highest_version now 37
dnode @00584b6c: ver 35, offset 19000, dsize 1000
Node at 00584254 is a data node
version 34, highest_version now 37
dnode @00584254: ver 34, offset 18000, dsize 1000
Node at 00584000 is a data node
version 33, highest_version now 37
dnode @00584000: ver 33, offset 17b68, dsize 0498
Node at 005838e4 is a data node
version 41, highest_version now 41
dnode @005838e4: ver 41, offset 1e000, dsize 0164
Node at 00582f3c is a data node
version 40, highest_version now 41
dnode @00582f3c: ver 40, offset 1d000, dsize 1000
Node at 005825f4 is a data node
version 39, highest_version now 41
dnode @005825f4: ver 39, offset 1c000, dsize 1000
Node at 00582000 is a data node
version 38, highest_version now 41
dnode @00582000: ver 38, offset 1b468, dsize 0b98
Node at 004cd620 is a data node
version 42, highest_version now 42
dnode @004cd620: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4720)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4730)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4760)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4770)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4780)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4710)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47b0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47c0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47d0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4750)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47f0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4800)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4790)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47a0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4830)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4840)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4850)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c47e0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4870)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4880)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4890)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4810)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4820)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c44f0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48d0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48e0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4860)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4920)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48a0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48b0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48c0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4940)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4950)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c48f0)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4900)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4910)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4970)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4980)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4990)
jffs2_add_full_dnode_to_inode(ino #37, f 00fa41a0, fn 001c4930)
metadata @004cd620: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #37, page at offset 0x0
jffs2_read_inode_range: ino #37, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x595048
Node read from 00595048: node_crc 802a5494, calculated CRC 802a5494. =
dsize 1000,
 csize 9b1, offset 0, buf 00fa1000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1000
jffs2_read_inode_range: ino #37, range 0x00001000-0x00002000
Reading 4096-6144 from node at 0x595a40
Node read from 00595a40: node_crc 78ed88af, calculated CRC 78ed88af. =
dsize 800,
csize 577, offset 1000, buf 00f3f000
Reading 6144-8192 from node at 0x592000
Node read from 00592000: node_crc 6d5d0650, calculated CRC 6d5d0650. =
dsize 800,
csize 4b3, offset 1800, buf 00f3f800
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x2000
jffs2_read_inode_range: ino #37, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x5924f8
Node read from 005924f8: node_crc a16fdcee, calculated CRC a16fdcee. =
dsize 1000,
 csize a36, offset 2000, buf 00f3e000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x3000
jffs2_read_inode_range: ino #37, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x592f74
Node read from 00592f74: node_crc a6fc5c5f, calculated CRC a6fc5c5f. =
dsize 1000,
 csize 9ce, offset 3000, buf 00f3d000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x4000
jffs2_read_inode_range: ino #37, range 0x00004000-0x00005000
Reading 16384-19076 from node at 0x593988
Node read from 00593988: node_crc cad91444, calculated CRC cad91444. =
dsize a84,
csize 62f, offset 4000, buf 00f3c000
Reading 19076-20480 from node at 0x590000
Node read from 00590000: node_crc 24eb6327, calculated CRC 24eb6327. =
dsize 57c,
csize 396, offset 4a84, buf 00f3ca84
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x5000
jffs2_read_inode_range: ino #37, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x5903dc
Node read from 005903dc: node_crc 9842fedc, calculated CRC 9842fedc. =
dsize 1000,
 csize 913, offset 5000, buf 00f3b000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x6000
jffs2_read_inode_range: ino #37, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x590d34
Node read from 00590d34: node_crc cd878aad, calculated CRC cd878aad. =
dsize 1000,
 csize 9b8, offset 6000, buf 00f3a000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x7000
jffs2_read_inode_range: ino #37, range 0x00007000-0x00008000
Reading 28672-31876 from node at 0x591730
Node read from 00591730: node_crc 40a85123, calculated CRC 40a85123. =
dsize c84,
csize 888, offset 7000, buf 00f39000
Reading 31876-32768 from node at 0x58e000
Node read from 0058e000: node_crc 1cbf5f81, calculated CRC 1cbf5f81. =
dsize 37c,
csize 248, offset 7c84, buf 00f39c84
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x8000
jffs2_read_inode_range: ino #37, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x58e28c
Node read from 0058e28c: node_crc b719cea0, calculated CRC b719cea0. =
dsize 1000,
 csize a76, offset 8000, buf 00f38000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x9000
jffs2_read_inode_range: ino #37, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x58ed48
Node read from 0058ed48: node_crc f0e23f21, calculated CRC f0e23f21. =
dsize 1000,
 csize aca, offset 9000, buf 00f37000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xa000
jffs2_read_inode_range: ino #37, range 0x0000a000-0x0000b000
Reading 40960-43859 from node at 0x58f858
Node read from 0058f858: node_crc c964ccee, calculated CRC c964ccee. =
dsize b53,
csize 75e, offset a000, buf 00f36000
Reading 43859-45056 from node at 0x58c000
Node read from 0058c000: node_crc 90574361, calculated CRC 90574361. =
dsize 4ad,
csize 351, offset ab53, buf 00f36b53
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xb000
jffs2_read_inode_range: ino #37, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x58c398
Node read from 0058c398: node_crc ed62b279, calculated CRC ed62b279. =
dsize 1000,
 csize 96c, offset b000, buf 00f35000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xc000
jffs2_read_inode_range: ino #37, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x58cd48
Node read from 0058cd48: node_crc 38da932b, calculated CRC 38da932b. =
dsize 1000,
 csize 9b6, offset c000, buf 00f34000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xd000
jffs2_read_inode_range: ino #37, range 0x0000d000-0x0000e000
Reading 53248-56557 from node at 0x58d744
Node read from 0058d744: node_crc 6d4a5dea, calculated CRC 6d4a5dea. =
dsize ced,
csize 873, offset d000, buf 00f33000
Reading 56557-57344 from node at 0x58a000
Node read from 0058a000: node_crc 0a9752c9, calculated CRC 0a9752c9. =
dsize 313,
csize 27f, offset dced, buf 00f33ced
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xe000
jffs2_read_inode_range: ino #37, range 0x0000e000-0x0000f000
Reading 57344-61440 from node at 0x58a2c4
Node read from 0058a2c4: node_crc c5a0c8ae, calculated CRC c5a0c8ae. =
dsize 1000,
 csize 893, offset e000, buf 00f32000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0xf000
jffs2_read_inode_range: ino #37, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x58ab9c
Node read from 0058ab9c: node_crc c06207f7, calculated CRC c06207f7. =
dsize 1000,
 csize 812, offset f000, buf 00f31000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x10000
jffs2_read_inode_range: ino #37, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x58b3f4
Node read from 0058b3f4: node_crc 87a5b7dc, calculated CRC 87a5b7dc. =
dsize 1000,
 csize 9b4, offset 10000, buf 00f30000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x11000
jffs2_read_inode_range: ino #37, range 0x00011000-0x00012000
Reading 69632-70197 from node at 0x58bdec
Node read from 0058bdec: node_crc 207f747c, calculated CRC 207f747c. =
dsize 235,
csize 1cb, offset 11000, buf 00f2f000
Reading 70197-73728 from node at 0x588000
Node read from 00588000: node_crc 1ccb69b9, calculated CRC 1ccb69b9. =
dsize dcb,
csize 761, offset 11235, buf 00f2f235
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x12000
jffs2_read_inode_range: ino #37, range 0x00012000-0x00013000
Reading 73728-77824 from node at 0x5887a8
Node read from 005887a8: node_crc ef39df09, calculated CRC ef39df09. =
dsize 1000,
 csize 6f1, offset 12000, buf 00f2e000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x13000
jffs2_read_inode_range: ino #37, range 0x00013000-0x00014000
Reading 77824-81920 from node at 0x588ee0
Node read from 00588ee0: node_crc 43abe9cd, calculated CRC 43abe9cd. =
dsize 1000,
 csize a2e, offset 13000, buf 00f2d000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x14000
jffs2_read_inode_range: ino #37, range 0x00014000-0x00015000
Reading 81920-84315 from node at 0x589954
Node read from 00589954: node_crc 13eb6c98, calculated CRC 13eb6c98. =
dsize 95b,
csize 663, offset 14000, buf 00f2c000
Reading 84315-86016 from node at 0x586000
Node read from 00586000: node_crc e2dda386, calculated CRC e2dda386. =
dsize 6a5,
csize 499, offset 1495b, buf 00f2c95b
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x15000
jffs2_read_inode_range: ino #37, range 0x00015000-0x00016000
Reading 86016-90112 from node at 0x5864e0
Node read from 005864e0: node_crc 2dce25ca, calculated CRC 2dce25ca. =
dsize 1000,
 csize 970, offset 15000, buf 00f2b000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x16000
jffs2_read_inode_range: ino #37, range 0x00016000-0x00017000
Reading 90112-94208 from node at 0x586e94
Node read from 00586e94: node_crc aab34b02, calculated CRC aab34b02. =
dsize 1000,
 csize 941, offset 16000, buf 00f2a000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x17000
jffs2_read_inode_range: ino #37, range 0x00017000-0x00018000
Reading 94208-97128 from node at 0x58781c
Node read from 0058781c: node_crc 87ee60fb, calculated CRC 87ee60fb. =
dsize b68,
csize 79b, offset 17000, buf 00f29000
Reading 97128-98304 from node at 0x584000
Node read from 00584000: node_crc 1ec368c3, calculated CRC 1ec368c3. =
dsize 498,
csize 20f, offset 17b68, buf 00f29b68
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x18000
jffs2_read_inode_range: ino #37, range 0x00018000-0x00019000
Reading 98304-102400 from node at 0x584254
Node read from 00584254: node_crc 1df0484b, calculated CRC 1df0484b. =
dsize 1000,
 csize 8d2, offset 18000, buf 00f28000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x19000
jffs2_read_inode_range: ino #37, range 0x00019000-0x0001a000
Reading 102400-106496 from node at 0x584b6c
Node read from 00584b6c: node_crc 64fe8d87, calculated CRC 64fe8d87. =
dsize 1000,
 csize 841, offset 19000, buf 00f27000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1a000
jffs2_read_inode_range: ino #37, range 0x0001a000-0x0001b000
Reading 106496-110592 from node at 0x5853f4
Node read from 005853f4: node_crc 0dbb522f, calculated CRC 0dbb522f. =
dsize 1000,
 csize 926, offset 1a000, buf 00f26000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1b000
jffs2_read_inode_range: ino #37, range 0x0001b000-0x0001c000
Reading 110592-111720 from node at 0x585d60
Node read from 00585d60: node_crc f8fc4d68, calculated CRC f8fc4d68. =
dsize 468,
csize 257, offset 1b000, buf 00f25000
Reading 111720-114688 from node at 0x582000
Node read from 00582000: node_crc 5585c37a, calculated CRC 5585c37a. =
dsize b98,
csize 5af, offset 1b468, buf 00f25468
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1c000
jffs2_read_inode_range: ino #37, range 0x0001c000-0x0001d000
Reading 114688-118784 from node at 0x5825f4
Node read from 005825f4: node_crc ab25b2ba, calculated CRC ab25b2ba. =
dsize 1000,
 csize 903, offset 1c000, buf 00f24000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1d000
jffs2_read_inode_range: ino #37, range 0x0001d000-0x0001e000
Reading 118784-122880 from node at 0x582f3c
Node read from 00582f3c: node_crc 0697557c, calculated CRC 0697557c. =
dsize 1000,
 csize 964, offset 1d000, buf 00f23000
readpage finished
jffs2_do_readpage_nolock(): ino #37, page at offset 0x1e000
jffs2_read_inode_range: ino #37, range 0x0001e000-0x0001f000
Reading 122880-123236 from node at 0x5838e4
Node read from 005838e4: node_crc 3e91ef97, calculated CRC 3e91ef97. =
dsize 164,
csize d3, offset 1e000, buf 00f22000
Filling non-frag hole from 123236-126976
readpage finished
Command: /bin/expand /etc/ramfs1024.img /dev/ram0
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 34
jffs2_do_read_inode(): ino #34 nlink is 1
jffs2_get_inode_nodes(): ino #34
Node at 005b77f4 is a data node
version 4, highest_version now 4
dnode @005b77f4: ver 4, offset 2000, dsize 0b34
Node at 005b6d64 is a data node
version 3, highest_version now 4
dnode @005b6d64: ver 3, offset 1000, dsize 1000
Node at 005b6490 is a data node
version 2, highest_version now 4
dnode @005b6490: ver 2, offset 0000, dsize 1000
node at 0x005b641c is obsoleted. Ignoring.
Node at 005b5e3c is a data node
version 9, highest_version now 9
dnode @005b5e3c: ver 9, offset 6000, dsize 0224
Node at 005b5624 is a data node
version 8, highest_version now 9
dnode @005b5624: ver 8, offset 5000, dsize 1000
Node at 005b4cd4 is a data node
version 7, highest_version now 9
dnode @005b4cd4: ver 7, offset 4000, dsize 1000
Node at 005b43bc is a data node
version 6, highest_version now 9
dnode @005b43bc: ver 6, offset 3000, dsize 1000
Node at 005b4000 is a data node
version 5, highest_version now 9
dnode @005b4000: ver 5, offset 2b34, dsize 04cc
Node at 004cd554 is a data node
version 10, highest_version now 10
dnode @004cd554: ver 10, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49b0)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49c0)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49d0)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49e0)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49f0)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c4a00)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c4a10)
jffs2_add_full_dnode_to_inode(ino #34, f 00fa4380, fn 001c49a0)
metadata @004cd554: ver 10
Truncating fraglist to 0x00006224 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #34, page at offset 0x0
jffs2_read_inode_range: ino #34, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5b6490
Node read from 005b6490: node_crc 6925f65a, calculated CRC 6925f65a. =
dsize 1000,
 csize 88e, offset 0, buf 00fa0000
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x1000
jffs2_read_inode_range: ino #34, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x5b6d64
Node read from 005b6d64: node_crc e5539aa8, calculated CRC e5539aa8. =
dsize 1000,
 csize a4a, offset 1000, buf 00f20000
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x2000
jffs2_read_inode_range: ino #34, range 0x00002000-0x00003000
Reading 8192-11060 from node at 0x5b77f4
Node read from 005b77f4: node_crc f9b8456c, calculated CRC f9b8456c. =
dsize b34,
csize 7c4, offset 2000, buf 00f0f000
Reading 11060-12288 from node at 0x5b4000
Node read from 005b4000: node_crc 71119071, calculated CRC 71119071. =
dsize 4cc,
csize 375, offset 2b34, buf 00f0fb34
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x3000
jffs2_read_inode_range: ino #34, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x5b43bc
Node read from 005b43bc: node_crc b075a337, calculated CRC b075a337. =
dsize 1000,
 csize 8d1, offset 3000, buf 00f0e000
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x4000
jffs2_read_inode_range: ino #34, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x5b4cd4
Node read from 005b4cd4: node_crc 057acea4, calculated CRC 057acea4. =
dsize 1000,
 csize 90b, offset 4000, buf 00f0d000
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x5000
jffs2_read_inode_range: ino #34, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x5b5624
Node read from 005b5624: node_crc 82962be2, calculated CRC 82962be2. =
dsize 1000,
 csize 7d2, offset 5000, buf 00f0c000
readpage finished
jffs2_do_readpage_nolock(): ino #34, page at offset 0x6000
jffs2_read_inode_range: ino #34, range 0x00006000-0x00007000
Reading 24576-25124 from node at 0x5b5e3c
Node read from 005b5e3c: node_crc 9a2b6d82, calculated CRC 9a2b6d82. =
dsize 224,
csize 11b, offset 6000, buf 00f0b000
Filling non-frag hole from 25124-28672
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 20
jffs2_do_read_inode(): ino #20 nlink is 1
jffs2_get_inode_nodes(): ino #20
Node at 005fa81c is a data node
version 2, highest_version now 2
dnode @005fa81c: ver 2, offset 0000, dsize 0a84
node at 0x005fa7a0 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #20, f 00fa4560, fn 001c44e0)
Truncating fraglist to 0x00000a84 bytes
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 56
jffs2_do_read_inode(): ino #56 nlink is 1
jffs2_get_inode_nodes(): ino #56
Node at 004cde00 is a data node
version 1, highest_version now 1
dnode @004cde00: ver 1, offset 0000, dsize 0000
metadata @004cde00: ver 1
jffs2_read_inode() returning
Can't open expanded file /dev/ram0
pid 11: failed 768
Command: mount -t proc proc /proc
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 42
jffs2_do_read_inode(): ino #42 nlink is 1
jffs2_get_inode_nodes(): ino #42
Node at 00565ac4 is a data node
version 4, highest_version now 4
dnode @00565ac4: ver 4, offset 2000, dsize 06b8
Node at 005650d8 is a data node
version 3, highest_version now 4
dnode @005650d8: ver 3, offset 1000, dsize 1000
Node at 005646f0 is a data node
version 2, highest_version now 4
dnode @005646f0: ver 2, offset 0000, dsize 1000
node at 0x0056467c is obsoleted. Ignoring.
Node at 00563994 is a data node
version 8, highest_version now 8
dnode @00563994: ver 8, offset 5000, dsize 0994
Node at 0056305c is a data node
version 7, highest_version now 8
dnode @0056305c: ver 7, offset 4000, dsize 1000
Node at 00562648 is a data node
version 6, highest_version now 8
dnode @00562648: ver 6, offset 3000, dsize 1000
Node at 00562000 is a data node
version 5, highest_version now 8
dnode @00562000: ver 5, offset 26b8, dsize 0948
Node at 00561870 is a data node
version 12, highest_version now 12
dnode @00561870: ver 12, offset 8000, dsize 0aab
Node at 00560e38 is a data node
version 11, highest_version now 12
dnode @00560e38: ver 11, offset 7000, dsize 1000
Node at 0056043c is a data node
version 10, highest_version now 12
dnode @0056043c: ver 10, offset 6000, dsize 1000
Node at 00560000 is a data node
version 9, highest_version now 12
dnode @00560000: ver 9, offset 5994, dsize 066c
Node at 0055f998 is a data node
version 16, highest_version now 16
dnode @0055f998: ver 16, offset b000, dsize 0a05
Node at 0055ef68 is a data node
version 15, highest_version now 16
dnode @0055ef68: ver 15, offset a000, dsize 1000
Node at 0055e458 is a data node
version 14, highest_version now 16
dnode @0055e458: ver 14, offset 9000, dsize 1000
Node at 0055e000 is a data node
version 13, highest_version now 16
dnode @0055e000: ver 13, offset 8aab, dsize 0555
Node at 0055d8b4 is a data node
version 20, highest_version now 20
dnode @0055d8b4: ver 20, offset e000, dsize 0ae0
Node at 0055ce54 is a data node
version 19, highest_version now 20
dnode @0055ce54: ver 19, offset d000, dsize 1000
Node at 0055c458 is a data node
version 18, highest_version now 20
dnode @0055c458: ver 18, offset c000, dsize 1000
Node at 0055c000 is a data node
version 17, highest_version now 20
dnode @0055c000: ver 17, offset ba05, dsize 05fb
Node at 0055bdd4 is a data node
version 25, highest_version now 25
dnode @0055bdd4: ver 25, offset 12000, dsize 0664
Node at 0055b498 is a data node
version 24, highest_version now 25
dnode @0055b498: ver 24, offset 11000, dsize 1000
Node at 0055aad4 is a data node
version 23, highest_version now 25
dnode @0055aad4: ver 23, offset 10000, dsize 1000
Node at 0055a27c is a data node
version 22, highest_version now 25
dnode @0055a27c: ver 22, offset f000, dsize 1000
Node at 0055a000 is a data node
version 21, highest_version now 25
dnode @0055a000: ver 21, offset eae0, dsize 0520
Node at 00559adc is a data node
version 29, highest_version now 29
dnode @00559adc: ver 29, offset 15000, dsize 06eb
Node at 00559044 is a data node
version 28, highest_version now 29
dnode @00559044: ver 28, offset 14000, dsize 1000
Node at 005585d0 is a data node
version 27, highest_version now 29
dnode @005585d0: ver 27, offset 13000, dsize 1000
Node at 00558000 is a data node
version 26, highest_version now 29
dnode @00558000: ver 26, offset 12664, dsize 099c
Node at 00557828 is a data node
version 33, highest_version now 33
dnode @00557828: ver 33, offset 18000, dsize 0d6f
Node at 00556f14 is a data node
version 32, highest_version now 33
dnode @00556f14: ver 32, offset 17000, dsize 1000
Node at 0055658c is a data node
version 31, highest_version now 33
dnode @0055658c: ver 31, offset 16000, dsize 1000
Node at 00556000 is a data node
version 30, highest_version now 33
dnode @00556000: ver 30, offset 156eb, dsize 0915
Node at 00555bb8 is a data node
version 38, highest_version now 38
dnode @00555bb8: ver 38, offset 1c000, dsize 078a
Node at 00555410 is a data node
version 37, highest_version now 38
dnode @00555410: ver 37, offset 1b000, dsize 1000
Node at 00554aa8 is a data node
version 36, highest_version now 38
dnode @00554aa8: ver 36, offset 1a000, dsize 1000
Node at 00554220 is a data node
version 35, highest_version now 38
dnode @00554220: ver 35, offset 19000, dsize 1000
Node at 00554000 is a data node
version 34, highest_version now 38
dnode @00554000: ver 34, offset 18d6f, dsize 0291
Node at 00552f08 is a data node
version 41, highest_version now 41
dnode @00552f08: ver 41, offset 1e000, dsize 0164
Node at 00552560 is a data node
version 40, highest_version now 41
dnode @00552560: ver 40, offset 1d000, dsize 1000
Node at 00552000 is a data node
version 39, highest_version now 41
dnode @00552000: ver 39, offset 1c78a, dsize 0876
Node at 004cd774 is a data node
version 42, highest_version now 42
dnode @004cd774: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a30)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a40)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a50)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a90)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4aa0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4ab0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a20)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b00)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c44d0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b10)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4a80)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4ac0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4ad0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4ae0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4af0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b20)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b30)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b40)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b50)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b60)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b70)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b80)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4b90)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4ba0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4bd0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c44c0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4be0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4bf0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c40)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c50)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4bb0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4bc0)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c90)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c00)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c10)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c20)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c30)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c60)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c70)
jffs2_add_full_dnode_to_inode(ino #42, f 00fa4920, fn 001c4c80)
metadata @004cd774: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #42, page at offset 0x0
jffs2_read_inode_range: ino #42, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5646f0
Node read from 005646f0: node_crc a5188660, calculated CRC a5188660. =
dsize 1000,
 csize 9a4, offset 0, buf 00f21000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1000
jffs2_read_inode_range: ino #42, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x5650d8
Node read from 005650d8: node_crc ce9b2ea3, calculated CRC ce9b2ea3. =
dsize 1000,
 csize 9a6, offset 1000, buf 00f09000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x2000
jffs2_read_inode_range: ino #42, range 0x00002000-0x00003000
Reading 8192-9912 from node at 0x565ac4
Node read from 00565ac4: node_crc b2d1a060, calculated CRC b2d1a060. =
dsize 6b8,
csize 4f3, offset 2000, buf 00f08000
Reading 9912-12288 from node at 0x562000
Node read from 00562000: node_crc 0c880b60, calculated CRC 0c880b60. =
dsize 948,
csize 602, offset 26b8, buf 00f086b8
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x3000
jffs2_read_inode_range: ino #42, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x562648
Node read from 00562648: node_crc 07eb54fe, calculated CRC 07eb54fe. =
dsize 1000,
 csize 9ce, offset 3000, buf 00f07000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x4000
jffs2_read_inode_range: ino #42, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x56305c
Node read from 0056305c: node_crc 8ee9d30a, calculated CRC 8ee9d30a. =
dsize 1000,
 csize 8f3, offset 4000, buf 00f06000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x5000
jffs2_read_inode_range: ino #42, range 0x00005000-0x00006000
Reading 20480-22932 from node at 0x563994
Node read from 00563994: node_crc 50295fbe, calculated CRC 50295fbe. =
dsize 994,
csize 622, offset 5000, buf 00f05000
Reading 22932-24576 from node at 0x560000
Node read from 00560000: node_crc 1b244255, calculated CRC 1b244255. =
dsize 66c,
csize 3f7, offset 5994, buf 00f05994
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x6000
jffs2_read_inode_range: ino #42, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x56043c
Node read from 0056043c: node_crc 7c0ec2b5, calculated CRC 7c0ec2b5. =
dsize 1000,
 csize 9b8, offset 6000, buf 00f04000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x7000
jffs2_read_inode_range: ino #42, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x560e38
Node read from 00560e38: node_crc dff747de, calculated CRC dff747de. =
dsize 1000,
 csize 9f4, offset 7000, buf 00f03000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x8000
jffs2_read_inode_range: ino #42, range 0x00008000-0x00009000
Reading 32768-35499 from node at 0x561870
Node read from 00561870: node_crc 239a61f9, calculated CRC 239a61f9. =
dsize aab,
csize 748, offset 8000, buf 00f02000
Reading 35499-36864 from node at 0x55e000
Node read from 0055e000: node_crc bd6212ef, calculated CRC bd6212ef. =
dsize 555,
csize 414, offset 8aab, buf 00f02aab
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x9000
jffs2_read_inode_range: ino #42, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x55e458
Node read from 0055e458: node_crc d747176a, calculated CRC d747176a. =
dsize 1000,
 csize aca, offset 9000, buf 00f01000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xa000
jffs2_read_inode_range: ino #42, range 0x0000a000-0x0000b000
Reading 40960-45056 from node at 0x55ef68
Node read from 0055ef68: node_crc 27747b83, calculated CRC 27747b83. =
dsize 1000,
 csize 9ec, offset a000, buf 00f00000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xb000
jffs2_read_inode_range: ino #42, range 0x0000b000-0x0000c000
Reading 45056-47621 from node at 0x55f998
Node read from 0055f998: node_crc 31eb893c, calculated CRC 31eb893c. =
dsize a05,
csize 61f, offset b000, buf 00eff000
Reading 47621-49152 from node at 0x55c000
Node read from 0055c000: node_crc 4b10b296, calculated CRC 4b10b296. =
dsize 5fb,
csize 413, offset ba05, buf 00effa05
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xc000
jffs2_read_inode_range: ino #42, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x55c458
Node read from 0055c458: node_crc 7c3a38f6, calculated CRC 7c3a38f6. =
dsize 1000,
 csize 9b6, offset c000, buf 00efe000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xd000
jffs2_read_inode_range: ino #42, range 0x0000d000-0x0000e000
Reading 53248-57344 from node at 0x55ce54
Node read from 0055ce54: node_crc 8df5e0be, calculated CRC 8df5e0be. =
dsize 1000,
 csize a19, offset d000, buf 00efd000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xe000
jffs2_read_inode_range: ino #42, range 0x0000e000-0x0000f000
Reading 57344-60128 from node at 0x55d8b4
Node read from 0055d8b4: node_crc 413b29a1, calculated CRC 413b29a1. =
dsize ae0,
csize 704, offset e000, buf 00efc000
Reading 60128-61440 from node at 0x55a000
Node read from 0055a000: node_crc a4a8e7bb, calculated CRC a4a8e7bb. =
dsize 520,
csize 238, offset eae0, buf 00efcae0
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0xf000
jffs2_read_inode_range: ino #42, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x55a27c
Node read from 0055a27c: node_crc 71eb4fef, calculated CRC 71eb4fef. =
dsize 1000,
 csize 812, offset f000, buf 00efb000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x10000
jffs2_read_inode_range: ino #42, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x55aad4
Node read from 0055aad4: node_crc 2103f2bf, calculated CRC 2103f2bf. =
dsize 1000,
 csize 980, offset 10000, buf 00efa000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x11000
jffs2_read_inode_range: ino #42, range 0x00011000-0x00012000
Reading 69632-73728 from node at 0x55b498
Node read from 0055b498: node_crc da826b2a, calculated CRC da826b2a. =
dsize 1000,
 csize 8f6, offset 11000, buf 00ef9000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x12000
jffs2_read_inode_range: ino #42, range 0x00012000-0x00013000
Reading 73728-75364 from node at 0x55bdd4
Node read from 0055bdd4: node_crc 0a36150c, calculated CRC 0a36150c. =
dsize 664,
csize 1e4, offset 12000, buf 00ef8000
Reading 75364-77824 from node at 0x558000
Node read from 00558000: node_crc e6cb7870, calculated CRC e6cb7870. =
dsize 99c,
csize 58a, offset 12664, buf 00ef8664
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x13000
jffs2_read_inode_range: ino #42, range 0x00013000-0x00014000
Reading 77824-81920 from node at 0x5585d0
Node read from 005585d0: node_crc c380601e, calculated CRC c380601e. =
dsize 1000,
 csize a2e, offset 13000, buf 00ef7000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x14000
jffs2_read_inode_range: ino #42, range 0x00014000-0x00015000
Reading 81920-86016 from node at 0x559044
Node read from 00559044: node_crc 086f304e, calculated CRC 086f304e. =
dsize 1000,
 csize a52, offset 14000, buf 00ef6000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x15000
jffs2_read_inode_range: ino #42, range 0x00015000-0x00016000
Reading 86016-87787 from node at 0x559adc
Node read from 00559adc: node_crc ce56cf6b, calculated CRC ce56cf6b. =
dsize 6eb,
csize 4dc, offset 15000, buf 00ef5000
Reading 87787-90112 from node at 0x556000
Node read from 00556000: node_crc 2d6c59f0, calculated CRC 2d6c59f0. =
dsize 915,
csize 547, offset 156eb, buf 00ef56eb
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x16000
jffs2_read_inode_range: ino #42, range 0x00016000-0x00017000
Reading 90112-94208 from node at 0x55658c
Node read from 0055658c: node_crc 1b3a031a, calculated CRC 1b3a031a. =
dsize 1000,
 csize 941, offset 16000, buf 00ef4000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x17000
jffs2_read_inode_range: ino #42, range 0x00017000-0x00018000
Reading 94208-98304 from node at 0x556f14
Node read from 00556f14: node_crc dca57b3b, calculated CRC dca57b3b. =
dsize 1000,
 csize 8cf, offset 17000, buf 00ef3000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x18000
jffs2_read_inode_range: ino #42, range 0x00018000-0x00019000
Reading 98304-101743 from node at 0x557828
Node read from 00557828: node_crc 441e28cb, calculated CRC 441e28cb. =
dsize d6f,
csize 78f, offset 18000, buf 00ef2000
Reading 101743-102400 from node at 0x554000
Node read from 00554000: node_crc eef67b58, calculated CRC eef67b58. =
dsize 291,
csize 1d9, offset 18d6f, buf 00ef2d6f
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x19000
jffs2_read_inode_range: ino #42, range 0x00019000-0x0001a000
Reading 102400-106496 from node at 0x554220
Node read from 00554220: node_crc d577c59f, calculated CRC d577c59f. =
dsize 1000,
 csize 841, offset 19000, buf 00ef1000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1a000
jffs2_read_inode_range: ino #42, range 0x0001a000-0x0001b000
Reading 106496-110592 from node at 0x554aa8
Node read from 00554aa8: node_crc c8aaf3b8, calculated CRC c8aaf3b8. =
dsize 1000,
 csize 921, offset 1a000, buf 00ef0000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1b000
jffs2_read_inode_range: ino #42, range 0x0001b000-0x0001c000
Reading 110592-114688 from node at 0x555410
Node read from 00555410: node_crc 221f61d0, calculated CRC 221f61d0. =
dsize 1000,
 csize 761, offset 1b000, buf 00eef000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1c000
jffs2_read_inode_range: ino #42, range 0x0001c000-0x0001d000
Reading 114688-116618 from node at 0x555bb8
Node read from 00555bb8: node_crc 09015ad0, calculated CRC 09015ad0. =
dsize 78a,
csize 400, offset 1c000, buf 00eee000
Reading 116618-118784 from node at 0x552000
Node read from 00552000: node_crc 71a56d0f, calculated CRC 71a56d0f. =
dsize 876,
csize 51c, offset 1c78a, buf 00eee78a
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1d000
jffs2_read_inode_range: ino #42, range 0x0001d000-0x0001e000
Reading 118784-122880 from node at 0x552560
Node read from 00552560: node_crc 4037db83, calculated CRC 4037db83. =
dsize 1000,
 csize 964, offset 1d000, buf 00eed000
readpage finished
jffs2_do_readpage_nolock(): ino #42, page at offset 0x1e000
jffs2_read_inode_range: ino #42, range 0x0001e000-0x0001f000
Reading 122880-123236 from node at 0x552f08
Node read from 00552f08: node_crc 78316168, calculated CRC 78316168. =
dsize 164,
csize d3, offset 1e000, buf 00eec000
Filling non-frag hole from 123236-126976
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 4
jffs2_do_read_inode(): ino #4 nlink is 1
jffs2_get_inode_nodes(): ino #4
Node at 005fc400 is a data node
version 1, highest_version now 1
dnode @005fc400: ver 1, offset 0000, dsize 0000
metadata @005fc400: ver 1
jffs2_read_inode() returning
Command: mount -t ext2 /dev/ram0 /var
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 5
jffs2_do_read_inode(): ino #5 nlink is 1
jffs2_get_inode_nodes(): ino #5
Node at 005fc600 is a data node
version 1, highest_version now 1
dnode @005fc600: ver 1, offset 0000, dsize 0000
metadata @005fc600: ver 1
jffs2_read_inode() returning
mount: Mounting /dev/ram0 on /var failed: Block device required
pid 13: failed 256
Command: mkdir /var/config
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x5a000
jffs2_new_inode(): dir_i 5, mode 0x41ed
Allocated inocache at 001c375c
jffs2_do_new_inode(): Assigned ino# 60
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a000, size 0x44
jffs2_write_dnode wrote node at 0x0005a000 with dsize 0x0, csize 0x0, =
node_crc 0
x94196323, data_crc 0x00000000, totlen 0x00000044
jffs2_write_dirent(ino #5, name at *0x001b5dfc "config"->ino #60, =
name_crc 0x654
88edf)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a044, size 0x30
jffs2_add_fd_to_list( 001b9e40, 00fa4d00 (->00000000))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
Command: mkdir /var/tmp
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1f8c bytes at 0x5a074
jffs2_new_inode(): dir_i 5, mode 0x41ed
Allocated inocache at 001c3770
jffs2_do_new_inode(): Assigned ino# 61
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a074, size 0x44
jffs2_write_dnode wrote node at 0x0005a074 with dsize 0x0, csize 0x0, =
node_crc 0
xa9a88fff, data_crc 0x00000000, totlen 0x00000044
jffs2_write_dirent(ino #5, name at *0x001b5e7c "tmp"->ino #61, name_crc =
0xd3aea4
5a)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a0b8, size 0x2c
jffs2_add_fd_to_list( 001b97c0, 00fa4d00 (->001b9e40))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
Command: mkdir /var/log
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1f1c bytes at 0x5a0e4
jffs2_new_inode(): dir_i 5, mode 0x41ed
Allocated inocache at 001c3784
jffs2_do_new_inode(): Assigned ino# 62
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a0e4, size 0x44
jffs2_write_dnode wrote node at 0x0005a0e4 with dsize 0x0, csize 0x0, =
node_crc 0
x1a13595e, data_crc 0x00000000, totlen 0x00000044
jffs2_write_dirent(ino #5, name at *0x001b5efc "log"->ino #62, name_crc =
0x707eb1
d7)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a128, size 0x2c
jffs2_add_fd_to_list( 001b9840, 00fa4d00 (->001b97c0))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
Command: mkdir /var/run
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1eac bytes at 0x5a154
jffs2_new_inode(): dir_i 5, mode 0x41ed
Allocated inocache at 001c3798
jffs2_do_new_inode(): Assigned ino# 63
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a154, size 0x44
jffs2_write_dnode wrote node at 0x0005a154 with dsize 0x0, csize 0x0, =
node_crc 0
x27a2b582, data_crc 0x00000000, totlen 0x00000044
jffs2_write_dirent(ino #5, name at *0x001b5f7c "run"->ino #63, name_crc =
0xaf377d
d2)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a198, size 0x2c
jffs2_add_fd_to_list( 001b9880, 00fa4d00 (->001b9840))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
Command: mkdir /var/lock
jffs2_lookup()
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1e3c bytes at 0x5a1c4
jffs2_new_inode(): dir_i 5, mode 0x41ed
Allocated inocache at 001c37ac
jffs2_do_new_inode(): Assigned ino# 64
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a1c4, size 0x44
jffs2_write_dnode wrote node at 0x0005a1c4 with dsize 0x0, csize 0x0, =
node_crc 0
x7bce13b8, data_crc 0x00000000, totlen 0x00000044
jffs2_write_dirent(ino #5, name at *0x00eea11c "lock"->ino #64, name_crc =
0xa6cb4
412)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a208, size 0x2c
jffs2_add_fd_to_list( 001b98c0, 00fa4d00 (->001b9840))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
Command: ifconfig lo 127.0.0.1
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 38
jffs2_do_read_inode(): ino #38 nlink is 1
jffs2_get_inode_nodes(): ino #38
Node at 00583a70 is a data node
version 2, highest_version now 2
dnode @00583a70: ver 2, offset 0000, dsize 08fe
node at 0x005839fc is obsoleted. Ignoring.
Node at 005816c4 is a data node
version 6, highest_version now 6
dnode @005816c4: ver 6, offset 3000, dsize 0f0f
Node at 00580d3c is a data node
version 5, highest_version now 6
dnode @00580d3c: ver 5, offset 2000, dsize 1000
Node at 00580464 is a data node
version 4, highest_version now 6
dnode @00580464: ver 4, offset 1000, dsize 1000
Node at 00580000 is a data node
version 3, highest_version now 6
dnode @00580000: ver 3, offset 08fe, dsize 0702
Node at 0057fe98 is a data node
version 11, highest_version now 11
dnode @0057fe98: ver 11, offset 7000, dsize 0125
Node at 0057f450 is a data node
version 10, highest_version now 11
dnode @0057f450: ver 10, offset 6000, dsize 1000
Node at 0057eafc is a data node
version 9, highest_version now 11
dnode @0057eafc: ver 9, offset 5000, dsize 1000
Node at 0057e118 is a data node
version 8, highest_version now 11
dnode @0057e118: ver 8, offset 4000, dsize 1000
Node at 0057e000 is a data node
version 7, highest_version now 11
dnode @0057e000: ver 7, offset 3f0f, dsize 00f1
Node at 0057de58 is a data node
version 15, highest_version now 15
dnode @0057de58: ver 15, offset a000, dsize 018a
Node at 0057d41c is a data node
version 14, highest_version now 15
dnode @0057d41c: ver 14, offset 9000, dsize 1000
Node at 0057c9f4 is a data node
version 13, highest_version now 15
dnode @0057c9f4: ver 13, offset 8000, dsize 1000
Node at 0057c000 is a data node
version 12, highest_version now 15
dnode @0057c000: ver 12, offset 7125, dsize 0edb
Node at 0057b940 is a data node
version 19, highest_version now 19
dnode @0057b940: ver 19, offset d000, dsize 0d61
Node at 0057b148 is a data node
version 18, highest_version now 19
dnode @0057b148: ver 18, offset c000, dsize 1000
Node at 0057a830 is a data node
version 17, highest_version now 19
dnode @0057a830: ver 17, offset b000, dsize 1000
Node at 0057a000 is a data node
version 16, highest_version now 19
dnode @0057a000: ver 16, offset a18a, dsize 0e76
Node at 00578104 is a data node
version 21, highest_version now 21
dnode @00578104: ver 21, offset e000, dsize 0bfc
Node at 00578000 is a data node
version 20, highest_version now 21
dnode @00578000: ver 20, offset dd61, dsize 029f
Node at 004cd664 is a data node
version 22, highest_version now 22
dnode @004cd664: ver 22, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4ce0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d30)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d40)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d50)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d60)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d70)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d80)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4d90)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4da0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4db0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4dc0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4dd0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4de0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4df0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4e30)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c44b0)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4e40)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4e50)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4e10)
jffs2_add_full_dnode_to_inode(ino #38, f 00eeb940, fn 001c4e20)
metadata @004cd664: ver 22
Truncating fraglist to 0x0000ebfc bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #38, page at offset 0x0
jffs2_read_inode_range: ino #38, range 0x00000000-0x00001000
Reading 0-2302 from node at 0x583a70
Node read from 00583a70: node_crc 8587e0fd, calculated CRC 8587e0fd. =
dsize 8fe,
csize 548, offset 0, buf 00ee9000
Reading 2302-4096 from node at 0x580000
Node read from 00580000: node_crc 73baa84a, calculated CRC 73baa84a. =
dsize 702,
csize 41d, offset 8fe, buf 00ee98fe
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x1000
jffs2_read_inode_range: ino #38, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x580464
Node read from 00580464: node_crc 9c77acf0, calculated CRC 9c77acf0. =
dsize 1000,
 csize 892, offset 1000, buf 00ee7000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x2000
jffs2_read_inode_range: ino #38, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x580d3c
Node read from 00580d3c: node_crc 6778fdd5, calculated CRC 6778fdd5. =
dsize 1000,
 csize 943, offset 2000, buf 00ee6000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x3000
jffs2_read_inode_range: ino #38, range 0x00003000-0x00004000
Reading 12288-16143 from node at 0x5816c4
Node read from 005816c4: node_crc d0254162, calculated CRC d0254162. =
dsize f0f,
csize 8f4, offset 3000, buf 00ee5000
Reading 16143-16384 from node at 0x57e000
Node read from 0057e000: node_crc 93ea67a6, calculated CRC 93ea67a6. =
dsize f1, c
size d2, offset 3f0f, buf 00ee5f0f
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x4000
jffs2_read_inode_range: ino #38, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x57e118
Node read from 0057e118: node_crc ff96f24a, calculated CRC ff96f24a. =
dsize 1000,
 csize 9a0, offset 4000, buf 00ee4000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x5000
jffs2_read_inode_range: ino #38, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x57eafc
Node read from 0057eafc: node_crc e9e9a310, calculated CRC e9e9a310. =
dsize 1000,
 csize 90e, offset 5000, buf 00ee3000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x6000
jffs2_read_inode_range: ino #38, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x57f450
Node read from 0057f450: node_crc c69d4917, calculated CRC c69d4917. =
dsize 1000,
 csize a04, offset 6000, buf 00ee2000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x7000
jffs2_read_inode_range: ino #38, range 0x00007000-0x00008000
Reading 28672-28965 from node at 0x57fe98
Node read from 0057fe98: node_crc 3246f147, calculated CRC 3246f147. =
dsize 125,
csize 11f, offset 7000, buf 00ee1000
Reading 28965-32768 from node at 0x57c000
Node read from 0057c000: node_crc 35fd5501, calculated CRC 35fd5501. =
dsize edb,
csize 9ae, offset 7125, buf 00ee1125
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x8000
jffs2_read_inode_range: ino #38, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x57c9f4
Node read from 0057c9f4: node_crc 0f7a0718, calculated CRC 0f7a0718. =
dsize 1000,
 csize 9e4, offset 8000, buf 00ee0000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0x9000
jffs2_read_inode_range: ino #38, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x57d41c
Node read from 0057d41c: node_crc 4b2fe013, calculated CRC 4b2fe013. =
dsize 1000,
 csize 9f5, offset 9000, buf 00ebf000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0xa000
jffs2_read_inode_range: ino #38, range 0x0000a000-0x0000b000
Reading 40960-41354 from node at 0x57de58
Node read from 0057de58: node_crc 5cfacf50, calculated CRC 5cfacf50. =
dsize 18a,
csize 15f, offset a000, buf 00ebe000
Reading 41354-45056 from node at 0x57a000
Node read from 0057a000: node_crc cee55100, calculated CRC cee55100. =
dsize e76,
csize 7eb, offset a18a, buf 00ebe18a
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0xb000
jffs2_read_inode_range: ino #38, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x57a830
Node read from 0057a830: node_crc 10565479, calculated CRC 10565479. =
dsize 1000,
 csize 8d2, offset b000, buf 00ebd000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0xc000
jffs2_read_inode_range: ino #38, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x57b148
Node read from 0057b148: node_crc a6039fc2, calculated CRC a6039fc2. =
dsize 1000,
 csize 7b3, offset c000, buf 00ebc000
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0xd000
jffs2_read_inode_range: ino #38, range 0x0000d000-0x0000e000
Reading 53248-56673 from node at 0x57b940
Node read from 0057b940: node_crc 490ed46f, calculated CRC 490ed46f. =
dsize d61,
csize 677, offset d000, buf 00ebb000
Reading 56673-57344 from node at 0x578000
Node read from 00578000: node_crc afc66048, calculated CRC afc66048. =
dsize 29f,
csize bd, offset dd61, buf 00ebbd61
readpage finished
jffs2_do_readpage_nolock(): ino #38, page at offset 0xe000
jffs2_read_inode_range: ino #38, range 0x0000e000-0x0000f000
Reading 57344-60412 from node at 0x578104
Node read from 00578104: node_crc 84ea0504, calculated CRC 84ea0504. =
dsize bfc,
csize 67c, offset e000, buf 00eba000
jffs2_wbuf_timeout(): timer expired
Filling non-frag hole from 60412-61440
readpage finished
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Command: route add -net 127.0.0.0 netmask 255.255.255.0 lo
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 46
jffs2_do_read_inode(): ino #46 nlink is 1
jffs2_get_inode_nodes(): ino #46
Node at 0052f748 is a data node
version 3, highest_version now 3
dnode @0052f748: ver 3, offset 1000, dsize 0cce
Node at 0052ed60 is a data node
version 2, highest_version now 3
dnode @0052ed60: ver 2, offset 0000, dsize 1000
node at 0x0052ecec is obsoleted. Ignoring.
Node at 0052d6a8 is a data node
version 7, highest_version now 7
dnode @0052d6a8: ver 7, offset 4000, dsize 0f50
Node at 0052cc94 is a data node
version 6, highest_version now 7
dnode @0052cc94: ver 6, offset 3000, dsize 1000
Node at 0052c218 is a data node
version 5, highest_version now 7
dnode @0052c218: ver 5, offset 2000, dsize 1000
Node at 0052c000 is a data node
version 4, highest_version now 7
dnode @0052c000: ver 4, offset 1cce, dsize 0332
Node at 0052bec4 is a data node
version 12, highest_version now 12
dnode @0052bec4: ver 12, offset 8000, dsize 0109
Node at 0052b448 is a data node
version 11, highest_version now 12
dnode @0052b448: ver 11, offset 7000, dsize 1000
Node at 0052aa4c is a data node
version 10, highest_version now 12
dnode @0052aa4c: ver 10, offset 6000, dsize 1000
Node at 0052a0f4 is a data node
version 9, highest_version now 12
dnode @0052a0f4: ver 9, offset 5000, dsize 1000
Node at 0052a000 is a data node
version 8, highest_version now 12
dnode @0052a000: ver 8, offset 4f50, dsize 00b0
Node at 00529534 is a data node
version 15, highest_version now 15
dnode @00529534: ver 15, offset a000, dsize 1000
Node at 00528a24 is a data node
version 14, highest_version now 15
dnode @00528a24: ver 14, offset 9000, dsize 1000
Node at 00528000 is a data node
version 13, highest_version now 15
dnode @00528000: ver 13, offset 8109, dsize 0ef7
Node at 00527e34 is a data node
version 19, highest_version now 19
dnode @00527e34: ver 19, offset e000, dsize 01af
Node at 005273ac is a data node
version 18, highest_version now 19
dnode @005273ac: ver 18, offset d000, dsize 1000
Node at 005269b0 is a data node
version 17, highest_version now 19
dnode @005269b0: ver 17, offset c000, dsize 1000
Node at 00526000 is a data node
version 16, highest_version now 19
dnode @00526000: ver 16, offset b000, dsize 1000
Node at 005259b8 is a data node
version 23, highest_version now 23
dnode @005259b8: ver 23, offset 11000, dsize 087a
Node at 00524fec is a data node
version 22, highest_version now 23
dnode @00524fec: ver 22, offset 10000, dsize 1000
Node at 00524794 is a data node
version 21, highest_version now 23
dnode @00524794: ver 21, offset f000, dsize 1000
Node at 00524000 is a data node
version 20, highest_version now 23
dnode @00524000: ver 20, offset e1af, dsize 0e51
Node at 00523580 is a data node
version 27, highest_version now 27
dnode @00523580: ver 27, offset 14000, dsize 0f65
Node at 00522b0c is a data node
version 26, highest_version now 27
dnode @00522b0c: ver 26, offset 13000, dsize 1000
Node at 005223d4 is a data node
version 25, highest_version now 27
dnode @005223d4: ver 25, offset 12000, dsize 1000
Node at 00522000 is a data node
version 24, highest_version now 27
dnode @00522000: ver 24, offset 1187a, dsize 0786
Node at 00521d60 is a data node
version 32, highest_version now 32
dnode @00521d60: ver 32, offset 18000, dsize 02e6
Node at 0052141c is a data node
version 31, highest_version now 32
dnode @0052141c: ver 31, offset 17000, dsize 1000
Node at 00520a94 is a data node
version 30, highest_version now 32
dnode @00520a94: ver 30, offset 16000, dsize 1000
Node at 005200e0 is a data node
version 29, highest_version now 32
dnode @005200e0: ver 29, offset 15000, dsize 1000
Node at 00520000 is a data node
version 28, highest_version now 32
dnode @00520000: ver 28, offset 14f65, dsize 009b
Node at 0051f93c is a data node
version 36, highest_version now 36
dnode @0051f93c: ver 36, offset 1b000, dsize 0d37
Node at 0051efd4 is a data node
version 35, highest_version now 36
dnode @0051efd4: ver 35, offset 1a000, dsize 1000
Node at 0051e74c is a data node
version 34, highest_version now 36
dnode @0051e74c: ver 34, offset 19000, dsize 1000
Node at 0051e000 is a data node
version 33, highest_version now 36
dnode @0051e000: ver 33, offset 182e6, dsize 0d1a
Node at 0051d4b8 is a data node
version 40, highest_version now 40
dnode @0051d4b8: ver 40, offset 1e000, dsize 0164
Node at 0051cb10 is a data node
version 39, highest_version now 40
dnode @0051cb10: ver 39, offset 1d000, dsize 1000
Node at 0051c1c8 is a data node
version 38, highest_version now 40
dnode @0051c1c8: ver 38, offset 1c000, dsize 1000
Node at 0051c000 is a data node
version 37, highest_version now 40
dnode @0051c000: ver 37, offset 1bd37, dsize 02c9
Node at 004cd884 is a data node
version 41, highest_version now 41
dnode @004cd884: ver 41, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4e80)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4e90)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4ec0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4ed0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4e60)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4e70)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f00)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f10)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f20)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4ea0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4eb0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f60)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4ee0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4ef0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4fb0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f30)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f40)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f50)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f80)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f90)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c44a0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4fa0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4490)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4fc0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4fd0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4f70)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4440)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4450)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4460)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4470)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4480)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4400)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4410)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4420)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c4430)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c43c0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c43d0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c43e0)
jffs2_add_full_dnode_to_inode(ino #46, f 00eebb20, fn 001c43f0)
metadata @004cd884: ver 41
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #46, page at offset 0x0
jffs2_read_inode_range: ino #46, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x52ed60
Node read from 0052ed60: node_crc f6cefd21, calculated CRC f6cefd21. =
dsize 1000,
 csize 9a4, offset 0, buf 00eb8000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1000
jffs2_read_inode_range: ino #46, range 0x00001000-0x00002000
Reading 4096-7374 from node at 0x52f748
Node read from 0052f748: node_crc ce3b5026, calculated CRC ce3b5026. =
dsize cce,
csize 86f, offset 1000, buf 00eb6000
Reading 7374-8192 from node at 0x52c000
Node read from 0052c000: node_crc bf0d94f0, calculated CRC bf0d94f0. =
dsize 332,
csize 1d4, offset 1cce, buf 00eb6cce
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x2000
jffs2_read_inode_range: ino #46, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x52c218
Node read from 0052c218: node_crc 20756c21, calculated CRC 20756c21. =
dsize 1000,
 csize a36, offset 2000, buf 00eb5000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x3000
jffs2_read_inode_range: ino #46, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x52cc94
Node read from 0052cc94: node_crc 27e6ec90, calculated CRC 27e6ec90. =
dsize 1000,
 csize 9ce, offset 3000, buf 00eb4000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x4000
jffs2_read_inode_range: ino #46, range 0x00004000-0x00005000
Reading 16384-20304 from node at 0x52d6a8
Node read from 0052d6a8: node_crc 33978c32, calculated CRC 33978c32. =
dsize f50,
csize 90f, offset 4000, buf 00eb3000
Reading 20304-20480 from node at 0x52a000
Node read from 0052a000: node_crc 07a09d12, calculated CRC 07a09d12. =
dsize b0, c
size b0, offset 4f50, buf 00eb3f50
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x5000
jffs2_read_inode_range: ino #46, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x52a0f4
Node read from 0052a0f4: node_crc 19584e13, calculated CRC 19584e13. =
dsize 1000,
 csize 913, offset 5000, buf 00eb2000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x6000
jffs2_read_inode_range: ino #46, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x52aa4c
Node read from 0052aa4c: node_crc 4c9d3a62, calculated CRC 4c9d3a62. =
dsize 1000,
 csize 9b8, offset 6000, buf 00eb1000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x7000
jffs2_read_inode_range: ino #46, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x52b448
Node read from 0052b448: node_crc d641af5c, calculated CRC d641af5c. =
dsize 1000,
 csize a38, offset 7000, buf 00eb0000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x8000
jffs2_read_inode_range: ino #46, range 0x00008000-0x00009000
Reading 32768-33033 from node at 0x52bec4
Node read from 0052bec4: node_crc 3d8cb40e, calculated CRC 3d8cb40e. =
dsize 109,
csize f4, offset 8000, buf 00eaf000
Reading 33033-36864 from node at 0x528000
Node read from 00528000: node_crc e98993f2, calculated CRC e98993f2. =
dsize ef7,
csize 9e0, offset 8109, buf 00eaf109
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x9000
jffs2_read_inode_range: ino #46, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x528a24
Node read from 00528a24: node_crc 12bd0c78, calculated CRC 12bd0c78. =
dsize 1000,
 csize aca, offset 9000, buf 00eae000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xa000
jffs2_read_inode_range: ino #46, range 0x0000a000-0x0000b000
Reading 40960-45056 from node at 0x529534
Node read from 00529534: node_crc 081fe84a, calculated CRC 081fe84a. =
dsize 1000,
 csize a45, offset a000, buf 00ead000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xb000
jffs2_read_inode_range: ino #46, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x526000
Node read from 00526000: node_crc 2515b942, calculated CRC 2515b942. =
dsize 1000,
 csize 96c, offset b000, buf 00eac000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xc000
jffs2_read_inode_range: ino #46, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x5269b0
Node read from 005269b0: node_crc 51940b11, calculated CRC 51940b11. =
dsize 1000,
 csize 9b6, offset c000, buf 00eab000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xd000
jffs2_read_inode_range: ino #46, range 0x0000d000-0x0000e000
Reading 53248-57344 from node at 0x5273ac
Node read from 005273ac: node_crc 13e5d03b, calculated CRC 13e5d03b. =
dsize 1000,
 csize a43, offset d000, buf 00eaa000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xe000
jffs2_read_inode_range: ino #46, range 0x0000e000-0x0000f000
Reading 57344-57775 from node at 0x527e34
Node read from 00527e34: node_crc b134100c, calculated CRC b134100c. =
dsize 1af,
csize 183, offset e000, buf 00ea9000
Reading 57775-61440 from node at 0x524000
Node read from 00524000: node_crc 3dd7cd3f, calculated CRC 3dd7cd3f. =
dsize e51,
csize 74d, offset e1af, buf 00ea91af
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0xf000
jffs2_read_inode_range: ino #46, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x524794
Node read from 00524794: node_crc 7d79fd7a, calculated CRC 7d79fd7a. =
dsize 1000,
 csize 812, offset f000, buf 00ea8000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x10000
jffs2_read_inode_range: ino #46, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x524fec
Node read from 00524fec: node_crc e16247fe, calculated CRC e16247fe. =
dsize 1000,
 csize 985, offset 10000, buf 00ea7000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x11000
jffs2_read_inode_range: ino #46, range 0x00011000-0x00012000
Reading 69632-71802 from node at 0x5259b8
Node read from 005259b8: node_crc dc8e3326, calculated CRC dc8e3326. =
dsize 87a,
csize 5ff, offset 11000, buf 00ea6000
Reading 71802-73728 from node at 0x522000
Node read from 00522000: node_crc 7a7e0af8, calculated CRC 7a7e0af8. =
dsize 786,
csize 38e, offset 1187a, buf 00ea687a
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x12000
jffs2_read_inode_range: ino #46, range 0x00012000-0x00013000
Reading 73728-77824 from node at 0x5223d4
Node read from 005223d4: node_crc 731ea4f6, calculated CRC 731ea4f6. =
dsize 1000,
 csize 6f1, offset 12000, buf 00ea5000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x13000
jffs2_read_inode_range: ino #46, range 0x00013000-0x00014000
Reading 77824-81920 from node at 0x522b0c
Node read from 00522b0c: node_crc 8bdce2f6, calculated CRC 8bdce2f6. =
dsize 1000,
 csize a2e, offset 13000, buf 00ea4000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x14000
jffs2_read_inode_range: ino #46, range 0x00014000-0x00015000
Reading 81920-85861 from node at 0x523580
Node read from 00523580: node_crc af8b30e4, calculated CRC af8b30e4. =
dsize f65,
csize a37, offset 14000, buf 00ea3000
Reading 85861-86016 from node at 0x520000
Node read from 00520000: node_crc b623aacf, calculated CRC b623aacf. =
dsize 9b, c
size 9b, offset 14f65, buf 00ea3f65
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x15000
jffs2_read_inode_range: ino #46, range 0x00015000-0x00016000
Reading 86016-90112 from node at 0x5200e0
Node read from 005200e0: node_crc b1e95e35, calculated CRC b1e95e35. =
dsize 1000,
 csize 970, offset 15000, buf 00ea2000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x16000
jffs2_read_inode_range: ino #46, range 0x00016000-0x00017000
Reading 90112-94208 from node at 0x520a94
Node read from 00520a94: node_crc 62c44039, calculated CRC 62c44039. =
dsize 1000,
 csize 941, offset 16000, buf 00ea1000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x17000
jffs2_read_inode_range: ino #46, range 0x00017000-0x00018000
Reading 94208-98304 from node at 0x52141c
Node read from 0052141c: node_crc 33a02676, calculated CRC 33a02676. =
dsize 1000,
 csize 8fe, offset 17000, buf 00ea0000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x18000
jffs2_read_inode_range: ino #46, range 0x00018000-0x00019000
Reading 98304-99046 from node at 0x521d60
Node read from 00521d60: node_crc 673a7a21, calculated CRC 673a7a21. =
dsize 2e6,
csize 256, offset 18000, buf 00e9f000
Reading 99046-102400 from node at 0x51e000
Node read from 0051e000: node_crc a865f5a4, calculated CRC a865f5a4. =
dsize d1a,
csize 705, offset 182e6, buf 00e9f2e6
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x19000
jffs2_read_inode_range: ino #46, range 0x00019000-0x0001a000
Reading 102400-106496 from node at 0x51e74c
Node read from 0051e74c: node_crc aec9a39e, calculated CRC aec9a39e. =
dsize 1000,
 csize 841, offset 19000, buf 00e9e000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1a000
jffs2_read_inode_range: ino #46, range 0x0001a000-0x0001b000
Reading 106496-110592 from node at 0x51efd4
Node read from 0051efd4: node_crc d74773e5, calculated CRC d74773e5. =
dsize 1000,
 csize 924, offset 1a000, buf 00e9d000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1b000
jffs2_read_inode_range: ino #46, range 0x0001b000-0x0001c000
Reading 110592-113975 from node at 0x51f93c
Node read from 0051f93c: node_crc 5dbd3515, calculated CRC 5dbd3515. =
dsize d37,
csize 67c, offset 1b000, buf 00e9c000
Reading 113975-114688 from node at 0x51c000
Node read from 0051c000: node_crc 53194b05, calculated CRC 53194b05. =
dsize 2c9,
csize 181, offset 1bd37, buf 00e9cd37
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1c000
jffs2_read_inode_range: ino #46, range 0x0001c000-0x0001d000
Reading 114688-118784 from node at 0x51c1c8
Node read from 0051c1c8: node_crc 963b5a44, calculated CRC 963b5a44. =
dsize 1000,
 csize 903, offset 1c000, buf 00e9b000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1d000
jffs2_read_inode_range: ino #46, range 0x0001d000-0x0001e000
Reading 118784-122880 from node at 0x51cb10
Node read from 0051cb10: node_crc b8200a5a, calculated CRC b8200a5a. =
dsize 1000,
 csize 964, offset 1d000, buf 00e9a000
readpage finished
jffs2_do_readpage_nolock(): ino #46, page at offset 0x1e000
jffs2_read_inode_range: ino #46, range 0x0001e000-0x0001f000
Reading 122880-123236 from node at 0x51d4b8
Node read from 0051d4b8: node_crc f6e6e4ac, calculated CRC f6e6e4ac. =
dsize 164,
csize d3, offset 1e000, buf 00e99000
Filling non-frag hole from 123236-126976
readpage finished
Command: ifconfig eth0 192.168.1.18
Execution Finished, Exiting
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 15
jffs2_do_read_inode(): ino #15 nlink is 1
jffs2_get_inode_nodes(): ino #15
Node at 005fdea4 is a data node
version 2, highest_version now 2
dnode @005fdea4: ver 2, offset 0000, dsize 002d
node at 0x005fde30 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #15, f 00eebd00, fn 001c43a0)
Truncating fraglist to 0x0000002d bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #15, page at offset 0x0
jffs2_read_inode_range: ino #15, range 0x00000000-0x00001000
Reading 0-45 from node at 0x5fdea4
Node read from 005fdea4: node_crc 098a761b, calculated CRC 098a761b. =
dsize 2d, c
size 2d, offset 0, buf 00e98000
Filling non-frag hole from 45-4096
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 41
jffs2_do_read_inode(): ino #41 nlink is 1
jffs2_get_inode_nodes(): ino #41
Node at 00571580 is a data node
version 2, highest_version now 2
dnode @00571580: ver 2, offset 0000, dsize 0fe2
node at 0x0057150c is obsoleted. Ignoring.
Node at 0056f4a0 is a data node
version 6, highest_version now 6
dnode @0056f4a0: ver 6, offset 3000, dsize 1000
Node at 0056eaa0 is a data node
version 5, highest_version now 6
dnode @0056eaa0: ver 5, offset 2000, dsize 1000
Node at 0056e064 is a data node
version 4, highest_version now 6
dnode @0056e064: ver 4, offset 1000, dsize 1000
Node at 0056e000 is a data node
version 3, highest_version now 6
dnode @0056e000: ver 3, offset 0fe2, dsize 001e
Node at 0056de68 is a data node
version 10, highest_version now 10
dnode @0056de68: ver 10, offset 7000, dsize 0190
Node at 0056d52c is a data node
version 9, highest_version now 10
dnode @0056d52c: ver 9, offset 6000, dsize 1000
Node at 0056ca84 is a data node
version 8, highest_version now 10
dnode @0056ca84: ver 8, offset 5000, dsize 1000
Node at 0056c000 is a data node
version 7, highest_version now 10
dnode @0056c000: ver 7, offset 4000, dsize 1000
Node at 0056b860 is a data node
version 14, highest_version now 14
dnode @0056b860: ver 14, offset a000, dsize 0ae5
Node at 0056af38 is a data node
version 13, highest_version now 14
dnode @0056af38: ver 13, offset 9000, dsize 1000
Node at 0056a8ac is a data node
version 12, highest_version now 14
dnode @0056a8ac: ver 12, offset 8000, dsize 1000
Node at 0056a000 is a data node
version 11, highest_version now 14
dnode @0056a000: ver 11, offset 7190, dsize 0e70
Node at 00569890 is a data node
version 18, highest_version now 18
dnode @00569890: ver 18, offset d000, dsize 0c63
Node at 00568e6c is a data node
version 17, highest_version now 18
dnode @00568e6c: ver 17, offset c000, dsize 1000
Node at 00568418 is a data node
version 16, highest_version now 18
dnode @00568418: ver 16, offset b000, dsize 1000
Node at 00568000 is a data node
version 15, highest_version now 18
dnode @00568000: ver 15, offset aae5, dsize 051b
Node at 00567d1c is a data node
version 23, highest_version now 23
dnode @00567d1c: ver 23, offset 11000, dsize 046d
Node at 00567528 is a data node
version 22, highest_version now 23
dnode @00567528: ver 22, offset 10000, dsize 1000
Node at 00566b58 is a data node
version 21, highest_version now 23
dnode @00566b58: ver 21, offset f000, dsize 1000
Node at 005662c8 is a data node
version 20, highest_version now 23
dnode @005662c8: ver 20, offset e000, dsize 1000
Node at 00566000 is a data node
version 19, highest_version now 23
dnode @00566000: ver 19, offset dc63, dsize 039d
Node at 00564000 is a data node
version 24, highest_version now 24
dnode @00564000: ver 24, offset 1146d, dsize 0ad7
Node at 004cd730 is a data node
version 25, highest_version now 25
dnode @004cd730: ver 25, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c4390)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1350)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1360)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c4370)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c4380)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1380)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1390)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13a0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1340)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13e0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13f0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1400)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1370)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1440)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13b0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13c0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c13d0)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1480)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1490)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1410)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1420)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1430)
jffs2_add_full_dnode_to_inode(ino #41, f 00eebee0, fn 001c1470)
metadata @004cd730: ver 25
Truncating fraglist to 0x00011f44 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #41, page at offset 0x0
jffs2_read_inode_range: ino #41, range 0x00000000-0x00001000
Reading 0-4066 from node at 0x571580
Node read from 00571580: node_crc ecccafd7, calculated CRC ecccafd7. =
dsize fe2,
csize a37, offset 0, buf 00e96000
Reading 4066-4096 from node at 0x56e000
Node read from 0056e000: node_crc 408fcb61, calculated CRC 408fcb61. =
dsize 1e, c
size 1e, offset fe2, buf 00e96fe2
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x1000
jffs2_read_inode_range: ino #41, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x56e064
Node read from 0056e064: node_crc 08a60d0b, calculated CRC 08a60d0b. =
dsize 1000,
 csize 9f7, offset 1000, buf 00e94000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x2000
jffs2_read_inode_range: ino #41, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x56eaa0
Node read from 0056eaa0: node_crc b4cfe993, calculated CRC b4cfe993. =
dsize 1000,
 csize 9bc, offset 2000, buf 00e93000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x3000
jffs2_read_inode_range: ino #41, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x56f4a0
Node read from 0056f4a0: node_crc 3323a51c, calculated CRC 3323a51c. =
dsize 1000,
 csize b0f, offset 3000, buf 00e92000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x4000
jffs2_read_inode_range: ino #41, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x56c000
Node read from 0056c000: node_crc 72503d83, calculated CRC 72503d83. =
dsize 1000,
 csize a40, offset 4000, buf 00e91000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x5000
jffs2_read_inode_range: ino #41, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x56ca84
Node read from 0056ca84: node_crc 0970f5b6, calculated CRC 0970f5b6. =
dsize 1000,
 csize a63, offset 5000, buf 00e90000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x6000
jffs2_read_inode_range: ino #41, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x56d52c
Node read from 0056d52c: node_crc da0f7f28, calculated CRC da0f7f28. =
dsize 1000,
 csize 8f5, offset 6000, buf 00e8f000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x7000
jffs2_read_inode_range: ino #41, range 0x00007000-0x00008000
Reading 28672-29072 from node at 0x56de68
Node read from 0056de68: node_crc 6c5187b7, calculated CRC 6c5187b7. =
dsize 190,
csize 150, offset 7000, buf 00e8e000
Reading 29072-32768 from node at 0x56a000
Node read from 0056a000: node_crc 2a932a96, calculated CRC 2a932a96. =
dsize e70,
csize 867, offset 7190, buf 00e8e190
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x8000
jffs2_read_inode_range: ino #41, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x56a8ac
Node read from 0056a8ac: node_crc 3ae65dfb, calculated CRC 3ae65dfb. =
dsize 1000,
 csize 648, offset 8000, buf 00e8d000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x9000
jffs2_read_inode_range: ino #41, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x56af38
Node read from 0056af38: node_crc e64c50b7, calculated CRC e64c50b7. =
dsize 1000,
 csize 8e3, offset 9000, buf 00e8b000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xa000
jffs2_read_inode_range: ino #41, range 0x0000a000-0x0000b000
Reading 40960-43749 from node at 0x56b860
Node read from 0056b860: node_crc f7a15e8c, calculated CRC f7a15e8c. =
dsize ae5,
csize 757, offset a000, buf 00e8a000
Reading 43749-45056 from node at 0x568000
Node read from 00568000: node_crc bf880a1a, calculated CRC bf880a1a. =
dsize 51b,
csize 3d4, offset aae5, buf 00e8aae5
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xb000
jffs2_read_inode_range: ino #41, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x568418
Node read from 00568418: node_crc 2f3dfc8b, calculated CRC 2f3dfc8b. =
dsize 1000,
 csize a10, offset b000, buf 00e88000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xc000
jffs2_read_inode_range: ino #41, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x568e6c
Node read from 00568e6c: node_crc 56e5b235, calculated CRC 56e5b235. =
dsize 1000,
 csize 9df, offset c000, buf 00e87000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xd000
jffs2_read_inode_range: ino #41, range 0x0000d000-0x0000e000
Reading 53248-56419 from node at 0x569890
Node read from 00569890: node_crc bd13ef12, calculated CRC bd13ef12. =
dsize c63,
csize 727, offset d000, buf 00e86000
Reading 56419-57344 from node at 0x566000
Node read from 00566000: node_crc 6c76444e, calculated CRC 6c76444e. =
dsize 39d,
csize 282, offset dc63, buf 00e86c63
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xe000
jffs2_read_inode_range: ino #41, range 0x0000e000-0x0000f000
Reading 57344-61440 from node at 0x5662c8
Node read from 005662c8: node_crc ec2152d9, calculated CRC ec2152d9. =
dsize 1000,
 csize 849, offset e000, buf 00e85000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0xf000
jffs2_read_inode_range: ino #41, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x566b58
Node read from 00566b58: node_crc a0651beb, calculated CRC a0651beb. =
dsize 1000,
 csize 98a, offset f000, buf 00e84000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x10000
jffs2_read_inode_range: ino #41, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x567528
Node read from 00567528: node_crc d2a431ae, calculated CRC d2a431ae. =
dsize 1000,
 csize 7af, offset 10000, buf 00e83000
readpage finished
jffs2_do_readpage_nolock(): ino #41, page at offset 0x11000
jffs2_read_inode_range: ino #41, range 0x00011000-0x00012000
Reading 69632-70765 from node at 0x567d1c
Node read from 00567d1c: node_crc 617d3d64, calculated CRC 617d3d64. =
dsize 46d,
csize 29c, offset 11000, buf 00e82000
Reading 70765-73540 from node at 0x564000
Node read from 00564000: node_crc 653dbad7, calculated CRC 653dbad7. =
dsize ad7,
csize 637, offset 1146d, buf 00e8246d
Filling non-frag hole from 73540-73728
readpage finished
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 39
jffs2_do_read_inode(): ino #39 nlink is 1
jffs2_get_inode_nodes(): ino #39
Node at 00579c1c is a data node
version 4, highest_version now 4
dnode @00579c1c: ver 4, offset 2000, dsize 0744
Node at 00579258 is a data node
version 3, highest_version now 4
dnode @00579258: ver 3, offset 1000, dsize 1000
Node at 00578838 is a data node
version 2, highest_version now 4
dnode @00578838: ver 2, offset 0000, dsize 1000
node at 0x005787c4 is obsoleted. Ignoring.
Node at 00577aac is a data node
version 8, highest_version now 8
dnode @00577aac: ver 8, offset 5000, dsize 0734
Node at 00576fec is a data node
version 7, highest_version now 8
dnode @00576fec: ver 7, offset 4000, dsize 1000
Node at 00576534 is a data node
version 6, highest_version now 8
dnode @00576534: ver 6, offset 3000, dsize 1000
Node at 00576000 is a data node
version 5, highest_version now 8
dnode @00576000: ver 5, offset 2744, dsize 08bc
Node at 0057562c is a data node
version 12, highest_version now 12
dnode @0057562c: ver 12, offset 8000, dsize 0310
Node at 00574e28 is a data node
version 11, highest_version now 12
dnode @00574e28: ver 11, offset 7000, dsize 1000
Node at 005744e0 is a data node
version 10, highest_version now 12
dnode @005744e0: ver 10, offset 6000, dsize 1000
Node at 00574000 is a data node
version 9, highest_version now 12
dnode @00574000: ver 9, offset 5734, dsize 08cc
Node at 004cd6a8 is a data node
version 13, highest_version now 13
dnode @004cd6a8: ver 13, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14c0)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14d0)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c1450)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c1500)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c1510)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14a0)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14b0)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c1540)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c1550)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14e0)
jffs2_add_full_dnode_to_inode(ino #39, f 00e951e0, fn 001c14f0)
metadata @004cd6a8: ver 13
Truncating fraglist to 0x00008310 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #39, page at offset 0x0
jffs2_read_inode_range: ino #39, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x578838
Node read from 00578838: node_crc ad404c34, calculated CRC ad404c34. =
dsize 1000,
 csize 9db, offset 0, buf 00e81000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x1000
jffs2_read_inode_range: ino #39, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x579258
Node read from 00579258: node_crc 5108f50f, calculated CRC 5108f50f. =
dsize 1000,
 csize 97f, offset 1000, buf 00e7f000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x2000
jffs2_read_inode_range: ino #39, range 0x00002000-0x00003000
Reading 8192-10052 from node at 0x579c1c
Node read from 00579c1c: node_crc b5252182, calculated CRC b5252182. =
dsize 744,
csize 39c, offset 2000, buf 00e7e000
Reading 10052-12288 from node at 0x576000
Node read from 00576000: node_crc 9c4c23bf, calculated CRC 9c4c23bf. =
dsize 8bc,
csize 4ef, offset 2744, buf 00e7e744
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x3000
jffs2_read_inode_range: ino #39, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x576534
Node read from 00576534: node_crc c2b03164, calculated CRC c2b03164. =
dsize 1000,
 csize a72, offset 3000, buf 00e7d000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x4000
jffs2_read_inode_range: ino #39, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x576fec
Node read from 00576fec: node_crc 7128fab4, calculated CRC 7128fab4. =
dsize 1000,
 csize a79, offset 4000, buf 00e7c000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x5000
jffs2_read_inode_range: ino #39, range 0x00005000-0x00006000
Reading 20480-22324 from node at 0x577aac
Node read from 00577aac: node_crc 7e6c643b, calculated CRC 7e6c643b. =
dsize 734,
csize 50c, offset 5000, buf 00e7b000
Reading 22324-24576 from node at 0x574000
Node read from 00574000: node_crc e5e27f5a, calculated CRC e5e27f5a. =
dsize 8cc,
csize 49a, offset 5734, buf 00e7b734
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x6000
jffs2_read_inode_range: ino #39, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x5744e0
Node read from 005744e0: node_crc df142477, calculated CRC df142477. =
dsize 1000,
 csize 902, offset 6000, buf 00e7a000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x7000
jffs2_read_inode_range: ino #39, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x574e28
Node read from 00574e28: node_crc 5204d521, calculated CRC 5204d521. =
dsize 1000,
 csize 7c0, offset 7000, buf 00e79000
readpage finished
jffs2_do_readpage_nolock(): ino #39, page at offset 0x8000
jffs2_read_inode_range: ino #39, range 0x00008000-0x00009000
Reading 32768-33552 from node at 0x57562c
Node read from 0057562c: node_crc b5b52a20, calculated CRC b5b52a20. =
dsize 310,
csize 1a9, offset 8000, buf 00e78000
Filling non-frag hole from 33552-36864
readpage finished
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_lookup()
jffs2_readdir() for dir_i #3
Dirent 0: ".", ino #3
Dirent 1: "..", ino #1
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 59
jffs2_do_read_inode(): ino #59 nlink is 1
jffs2_get_inode_nodes(): ino #59
Node at 004cdf50 is a data node
version 1, highest_version now 1
dnode @004cdf50: ver 1, offset 0000, dsize 0000
metadata @004cdf50: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 31
jffs2_do_read_inode(): ino #31 nlink is 1
jffs2_get_inode_nodes(): ino #31
Node at 005ddb60 is a data node
version 3, highest_version now 3
dnode @005ddb60: ver 3, offset 1000, dsize 0637
Node at 005dd1a0 is a data node
version 2, highest_version now 3
dnode @005dd1a0: ver 2, offset 0000, dsize 1000
node at 0x005dd130 is obsoleted. Ignoring.
Node at 005db894 is a data node
version 7, highest_version now 7
dnode @005db894: ver 7, offset 4000, dsize 0b83
Node at 005daf8c is a data node
version 6, highest_version now 7
dnode @005daf8c: ver 6, offset 3000, dsize 1000
Node at 005da600 is a data node
version 5, highest_version now 7
dnode @005da600: ver 5, offset 2000, dsize 1000
Node at 005da000 is a data node
version 4, highest_version now 7
dnode @005da000: ver 4, offset 1637, dsize 09c9
Node at 005d9698 is a data node
version 11, highest_version now 11
dnode @005d9698: ver 11, offset 7000, dsize 0dab
Node at 005d8ba8 is a data node
version 10, highest_version now 11
dnode @005d8ba8: ver 10, offset 6000, dsize 1000
Node at 005d827c is a data node
version 9, highest_version now 11
dnode @005d827c: ver 9, offset 5000, dsize 1000
Node at 005d8000 is a data node
version 8, highest_version now 11
dnode @005d8000: ver 8, offset 4b83, dsize 047d
Node at 005d76e8 is a data node
version 15, highest_version now 15
dnode @005d76e8: ver 15, offset a000, dsize 0ea9
Node at 005d6cdc is a data node
version 14, highest_version now 15
dnode @005d6cdc: ver 14, offset 9000, dsize 1000
Node at 005d6224 is a data node
version 13, highest_version now 15
dnode @005d6224: ver 13, offset 8000, dsize 1000
Node at 005d6000 is a data node
version 12, highest_version now 15
dnode @005d6000: ver 12, offset 7dab, dsize 0255
Node at 005d5cf4 is a data node
version 20, highest_version now 20
dnode @005d5cf4: ver 20, offset e000, dsize 03af
Node at 005d5228 is a data node
version 19, highest_version now 20
dnode @005d5228: ver 19, offset d000, dsize 1000
Node at 005d4a74 is a data node
version 18, highest_version now 20
dnode @005d4a74: ver 18, offset c000, dsize 1000
Node at 005d4174 is a data node
version 17, highest_version now 20
dnode @005d4174: ver 17, offset b000, dsize 1000
Node at 005d4000 is a data node
version 16, highest_version now 20
dnode @005d4000: ver 16, offset aea9, dsize 0157
Node at 005d3cb8 is a data node
version 24, highest_version now 24
dnode @005d3cb8: ver 24, offset 11000, dsize 03ce
Node at 005d32c4 is a data node
version 23, highest_version now 24
dnode @005d32c4: ver 23, offset 10000, dsize 1000
Node at 005d286c is a data node
version 22, highest_version now 24
dnode @005d286c: ver 22, offset f000, dsize 1000
Node at 005d2000 is a data node
version 21, highest_version now 24
dnode @005d2000: ver 21, offset e3af, dsize 0c51
Node at 005d1708 is a data node
version 28, highest_version now 28
dnode @005d1708: ver 28, offset 14000, dsize 0c78
Node at 005d0fe0 is a data node
version 27, highest_version now 28
dnode @005d0fe0: ver 27, offset 13000, dsize 1000
Node at 005d06c4 is a data node
version 26, highest_version now 28
dnode @005d06c4: ver 26, offset 12000, dsize 1000
Node at 005d0000 is a data node
version 25, highest_version now 28
dnode @005d0000: ver 25, offset 113ce, dsize 0c32
Node at 005ceaac is a data node
version 31, highest_version now 31
dnode @005ceaac: ver 31, offset 16000, dsize 0c8c
Node at 005ce218 is a data node
version 30, highest_version now 31
dnode @005ce218: ver 30, offset 15000, dsize 1000
Node at 005ce000 is a data node
version 29, highest_version now 31
dnode @005ce000: ver 29, offset 14c78, dsize 0388
Node at 004cd488 is a data node
version 32, highest_version now 32
dnode @004cd488: ver 32, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1570)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1580)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15b0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15c0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15d0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1560)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1600)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1610)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1590)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15a0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1660)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1670)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15e0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c15f0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16b0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1620)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1630)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1640)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1650)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1700)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1680)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1690)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16a0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16c0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16d0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16e0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c16f0)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1720)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1730)
jffs2_add_full_dnode_to_inode(ino #31, f 00e955a0, fn 001c1740)
metadata @004cd488: ver 32
Truncating fraglist to 0x00016c8c bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #31, page at offset 0x0
jffs2_read_inode_range: ino #31, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5dd1a0
Node read from 005dd1a0: node_crc 2b16c6a8, calculated CRC 2b16c6a8. =
dsize 1000,
 csize 97b, offset 0, buf 00e80000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x1000
jffs2_read_inode_range: ino #31, range 0x00001000-0x00002000
Reading 4096-5687 from node at 0x5ddb60
Node read from 005ddb60: node_crc a1db9a23, calculated CRC a1db9a23. =
dsize 637,
csize 457, offset 1000, buf 00e74000
Reading 5687-8192 from node at 0x5da000
Node read from 005da000: node_crc 02d9b307, calculated CRC 02d9b307. =
dsize 9c9,
csize 5ba, offset 1637, buf 00e74637
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x2000
jffs2_read_inode_range: ino #31, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x5da600
Node read from 005da600: node_crc 6e2d1ac0, calculated CRC 6e2d1ac0. =
dsize 1000,
 csize 946, offset 2000, buf 00e73000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x3000
jffs2_read_inode_range: ino #31, range 0x00003000-0x00004000
Reading 12288-16384 from node at 0x5daf8c
Node read from 005daf8c: node_crc 670c3d35, calculated CRC 670c3d35. =
dsize 1000,
 csize 8c1, offset 3000, buf 00e72000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x4000
jffs2_read_inode_range: ino #31, range 0x00004000-0x00005000
Reading 16384-19331 from node at 0x5db894
Node read from 005db894: node_crc f71815c4, calculated CRC f71815c4. =
dsize b83,
csize 724, offset 4000, buf 00e71000
Reading 19331-20480 from node at 0x5d8000
Node read from 005d8000: node_crc 2451a2ef, calculated CRC 2451a2ef. =
dsize 47d,
csize 236, offset 4b83, buf 00e71b83
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x5000
jffs2_read_inode_range: ino #31, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x5d827c
Node read from 005d827c: node_crc 80964b33, calculated CRC 80964b33. =
dsize 1000,
 csize 8e5, offset 5000, buf 00e70000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x6000
jffs2_read_inode_range: ino #31, range 0x00006000-0x00007000
Reading 24576-28672 from node at 0x5d8ba8
Node read from 005d8ba8: node_crc 5d09f27b, calculated CRC 5d09f27b. =
dsize 1000,
 csize aab, offset 6000, buf 00e6f000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x7000
jffs2_read_inode_range: ino #31, range 0x00007000-0x00008000
Reading 28672-32171 from node at 0x5d9698
Node read from 005d9698: node_crc 078686c4, calculated CRC 078686c4. =
dsize dab,
csize 920, offset 7000, buf 00e6e000
Reading 32171-32768 from node at 0x5d6000
Node read from 005d6000: node_crc ecd54538, calculated CRC ecd54538. =
dsize 255,
csize 1df, offset 7dab, buf 00e6edab
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x8000
jffs2_read_inode_range: ino #31, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x5d6224
Node read from 005d6224: node_crc 4a8df272, calculated CRC 4a8df272. =
dsize 1000,
 csize a74, offset 8000, buf 00e6c000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x9000
jffs2_read_inode_range: ino #31, range 0x00009000-0x0000a000
Reading 36864-40960 from node at 0x5d6cdc
Node read from 005d6cdc: node_crc 949465f2, calculated CRC 949465f2. =
dsize 1000,
 csize 9c8, offset 9000, buf 00e6b000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xa000
jffs2_read_inode_range: ino #31, range 0x0000a000-0x0000b000
Reading 40960-44713 from node at 0x5d76e8
Node read from 005d76e8: node_crc a8ba0cbd, calculated CRC a8ba0cbd. =
dsize ea9,
csize 8d0, offset a000, buf 00e6a000
Reading 44713-45056 from node at 0x5d4000
Node read from 005d4000: node_crc f7763b07, calculated CRC f7763b07. =
dsize 157,
csize 12e, offset aea9, buf 00e6aea9
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xb000
jffs2_read_inode_range: ino #31, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x5d4174
Node read from 005d4174: node_crc 61fffa18, calculated CRC 61fffa18. =
dsize 1000,
 csize 8bc, offset b000, buf 00e69000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xc000
jffs2_read_inode_range: ino #31, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x5d4a74
Node read from 005d4a74: node_crc e5a6e6e2, calculated CRC e5a6e6e2. =
dsize 1000,
 csize 770, offset c000, buf 00e68000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xd000
jffs2_read_inode_range: ino #31, range 0x0000d000-0x0000e000
Reading 53248-57344 from node at 0x5d5228
Node read from 005d5228: node_crc 023ad64d, calculated CRC 023ad64d. =
dsize 1000,
 csize a86, offset d000, buf 00e67000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xe000
jffs2_read_inode_range: ino #31, range 0x0000e000-0x0000f000
Reading 57344-58287 from node at 0x5d5cf4
Node read from 005d5cf4: node_crc b7cd394c, calculated CRC b7cd394c. =
dsize 3af,
csize 2c3, offset e000, buf 00e66000
Reading 58287-61440 from node at 0x5d2000
Node read from 005d2000: node_crc 66b02ac1, calculated CRC 66b02ac1. =
dsize c51,
csize 825, offset e3af, buf 00e663af
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0xf000
jffs2_read_inode_range: ino #31, range 0x0000f000-0x00010000
Reading 61440-65536 from node at 0x5d286c
Node read from 005d286c: node_crc a89d9d09, calculated CRC a89d9d09. =
dsize 1000,
 csize a12, offset f000, buf 00e65000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x10000
jffs2_read_inode_range: ino #31, range 0x00010000-0x00011000
Reading 65536-69632 from node at 0x5d32c4
Node read from 005d32c4: node_crc 5119917e, calculated CRC 5119917e. =
dsize 1000,
 csize 9ae, offset 10000, buf 00e64000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x11000
jffs2_read_inode_range: ino #31, range 0x00011000-0x00012000
Reading 69632-70606 from node at 0x5d3cb8
Node read from 005d3cb8: node_crc d2abf6cb, calculated CRC d2abf6cb. =
dsize 3ce,
csize 2ff, offset 11000, buf 00e63000
Reading 70606-73728 from node at 0x5d0000
Node read from 005d0000: node_crc fa42637e, calculated CRC fa42637e. =
dsize c32,
csize 67f, offset 113ce, buf 00e633ce
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x12000
jffs2_read_inode_range: ino #31, range 0x00012000-0x00013000
Reading 73728-77824 from node at 0x5d06c4
Node read from 005d06c4: node_crc c0496435, calculated CRC c0496435. =
dsize 1000,
 csize 8d6, offset 12000, buf 00e62000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x13000
jffs2_read_inode_range: ino #31, range 0x00013000-0x00014000
Reading 77824-81920 from node at 0x5d0fe0
Node read from 005d0fe0: node_crc e28de936, calculated CRC e28de936. =
dsize 1000,
 csize 6e4, offset 13000, buf 00e61000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x14000
jffs2_read_inode_range: ino #31, range 0x00014000-0x00015000
Reading 81920-85112 from node at 0x5d1708
Node read from 005d1708: node_crc e688a4a8, calculated CRC e688a4a8. =
dsize c78,
csize 8af, offset 14000, buf 00e60000
Reading 85112-86016 from node at 0x5ce000
Node read from 005ce000: node_crc feef9753, calculated CRC feef9753. =
dsize 388,
csize 1d2, offset 14c78, buf 00e60c78
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x15000
jffs2_read_inode_range: ino #31, range 0x00015000-0x00016000
Reading 86016-90112 from node at 0x5ce218
Node read from 005ce218: node_crc 9b52f132, calculated CRC 9b52f132. =
dsize 1000,
 csize 84f, offset 15000, buf 00e5f000
readpage finished
jffs2_do_readpage_nolock(): ino #31, page at offset 0x16000
jffs2_read_inode_range: ino #31, range 0x00016000-0x00017000
Reading 90112-93324 from node at 0x5ceaac
Node read from 005ceaac: node_crc 71249011, calculated CRC 71249011. =
dsize c8c,
csize 75b, offset 16000, buf 00e5e000
Filling non-frag hole from 93324-94208
readpage finished
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 63, mode 0x81a4
Allocated inocache at 001c37c0
jffs2_do_new_inode(): Assigned ino# 65
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1c00 bytes at 0x5a400
jffs2_do_create(): reserved 0x1c00 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a400, size 0x44
jffs2_write_dnode wrote node at 0x0005a400 with dsize 0x0, csize 0x0, =
node_crc 0
x92df1afb, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81a4
jffs2_write_dirent(ino #63, name at *0x00eea81c "boa.pid"->ino #65, =
name_crc 0xa
b257b4c)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a444, size 0x30
jffs2_add_fd_to_list( 001b9e20, 00eeb5a0 (->00000000))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2294
 (mod 0x2294): no
jffs2_create: Created ino #65 with mode 100644, nlink 1(1). nrpages 0
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 14
jffs2_do_read_inode(): ino #14 nlink is 1
jffs2_get_inode_nodes(): ino #14
Node at 005fdda8 is a data node
version 2, highest_version now 2
dnode @005fdda8: ver 2, offset 0000, dsize 0052
node at 0x005fdd30 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #14, f 00e95960, fn 001c1770)
Truncating fraglist to 0x00000052 bytes
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 58
jffs2_do_read_inode(): ino #58 nlink is 1
jffs2_get_inode_nodes(): ino #58
Node at 004cdee0 is a data node
version 1, highest_version now 1
dnode @004cdee0: ver 1, offset 0000, dsize 0000
metadata @004cdee0: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 57
jffs2_do_read_inode(): ino #57 nlink is 1
jffs2_get_inode_nodes(): ino #57
Node at 004cde70 is a data node
version 1, highest_version now 1
dnode @004cde70: ver 1, offset 0000, dsize 0000
metadata @004cde70: ver 1
jffs2_read_inode() returning
jffs2_readdir() for dir_i #3
Dirent 0: ".", ino #3
Dirent 1: "..", ino #1

board login: jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #65, page at offset 0x0
jffs2_read_inode_range: ino #65, range 0x00000000-0x00001000
Filling non-frag hole from 0-4096
readpage finished
end prepare_write()
jffs2_commit_write(): ino #65, page at 0x0, range 0-3
jffs2_write_inode_range(): Ino #65, ofs 0x0, len 0x3
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1b8c bytes at 0x5a474
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a474, size 0x48
jffs2_write_dnode wrote node at 0x0005a474 with dsize 0x3, csize 0x3, =
node_crc 0
xdca98ff1, data_crc 0xcbf8eb03, totlen 0x00000047
jffs2_add_full_dnode_to_inode(ino #65, f 00e95780, fn 001c17d0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x22d8
 (mod 0x22d8): no
increasing writtenlen by 3
jffs2_commit_write() returning 3
jffs2_do_readpage_nolock(): ino #14, page at offset 0x0
jffs2_read_inode_range: ino #14, range 0x00000000-0x00001000
Reading 0-82 from node at 0x5fdda8
Node read from 005fdda8: node_crc 407749f0, calculated CRC 407749f0. =
dsize 52, c
size 41, offset 0, buf 00e5d000
Filling non-frag hole from 82-4096
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 23
jffs2_do_read_inode(): ino #23 nlink is 1
jffs2_get_inode_nodes(): ino #23
Node at 005fb9d4 is a data node
version 4, highest_version now 4
dnode @005fb9d4: ver 4, offset 2000, dsize 000d
Node at 005fb394 is a data node
version 3, highest_version now 4
dnode @005fb394: ver 3, offset 1000, dsize 1000
Node at 005fad30 is a data node
version 2, highest_version now 4
dnode @005fad30: ver 2, offset 0000, dsize 1000
node at 0x005facbc is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #23, f 00e95f00, fn 001c17b0)
jffs2_add_full_dnode_to_inode(ino #23, f 00e95f00, fn 001c17c0)
jffs2_add_full_dnode_to_inode(ino #23, f 00e95f00, fn 001c1780)
Truncating fraglist to 0x0000200d bytes
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 7
jffs2_do_read_inode(): ino #7 nlink is 1
jffs2_get_inode_nodes(): ino #7
Node at 005fcc44 is a dirent node
Adding fd "httpd", ino #8
jffs2_add_fd_to_list( 001b9ec0, 00e77d2c (->00000000))
Node at 005fca00 is a data node
version 1, highest_version now 2
dnode @005fca00: ver 1, offset 0000, dsize 0000
metadata @005fca00: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 8
jffs2_do_read_inode(): ino #8 nlink is 1
jffs2_get_inode_nodes(): ino #8
Node at 005fcc00 is a data node
version 1, highest_version now 1
dnode @005fcc00: ver 1, offset 0000, dsize 0000
metadata @005fcc00: ver 1
jffs2_read_inode() returning
jffs2_lookup()
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 9
jffs2_do_read_inode(): ino #9 nlink is 1
jffs2_get_inode_nodes(): ino #9
Node at 005fd5b4 is a data node
version 3, highest_version now 3
dnode @005fd5b4: ver 3, offset 1000, dsize 0753
Node at 005fce74 is a data node
version 2, highest_version now 3
dnode @005fce74: ver 2, offset 0000, dsize 1000
node at 0x005fce00 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #9, f 00e5c5c0, fn 001c1800)
jffs2_add_full_dnode_to_inode(ino #9, f 00e5c5c0, fn 001c1810)
Truncating fraglist to 0x00001753 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #23, page at offset 0x0
jffs2_read_inode_range: ino #23, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5fad30
Node read from 005fad30: node_crc 1866654e, calculated CRC 1866654e. =
dsize 1000,
 csize 61d, offset 0, buf 00e5b000
readpage finished
jffs2_do_readpage_nolock(): ino #9, page at offset 0x0
jffs2_read_inode_range: ino #9, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5fce74
Node read from 005fce74: node_crc 22dd376a, calculated CRC 22dd376a. =
dsize 1000,
 csize 6f9, offset 0, buf 00e58000
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 17
jffs2_do_read_inode(): ino #17 nlink is 1
jffs2_get_inode_nodes(): ino #17
Node at 005fa310 is a data node
version 2, highest_version now 2
dnode @005fa310: ver 2, offset 0000, dsize 007c
node at 0x005fa29c is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #17, f 00e5cb60, fn 001c17f0)
Truncating fraglist to 0x0000007c bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #17, page at offset 0x0
jffs2_read_inode_range: ino #17, range 0x00000000-0x00001000
Reading 0-124 from node at 0x5fa310
Node read from 005fa310: node_crc 4c0e312b, calculated CRC 4c0e312b. =
dsize 7c, c
size 5e, offset 0, buf 00e57000
Filling non-frag hole from 124-4096
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 11
jffs2_do_read_inode(): ino #11 nlink is 1
jffs2_get_inode_nodes(): ino #11
Node at 005fdacc is a data node
version 2, highest_version now 2
dnode @005fdacc: ver 2, offset 0000, dsize 0025
node at 0x005fda58 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #11, f 00e5cd40, fn 001c17e0)
Truncating fraglist to 0x00000025 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #11, page at offset 0x0
jffs2_read_inode_range: ino #11, range 0x00000000-0x00001000
Reading 0-37 from node at 0x5fdacc
Node read from 005fdacc: node_crc d92edccd, calculated CRC d92edccd. =
dsize 25, c
size 25, offset 0, buf 00e56000
Filling non-frag hole from 37-4096
readpage finished
jffs2_do_readpage_nolock(): ino #9, page at offset 0x1000
jffs2_read_inode_range: ino #9, range 0x00001000-0x00002000
Reading 4096-5971 from node at 0x5fd5b4
Node read from 005fd5b4: node_crc 09eddf32, calculated CRC 09eddf32. =
dsize 753,
csize 39b, offset 1000, buf 00e55000
Filling non-frag hole from 5971-8192
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 22
jffs2_do_read_inode(): ino #22 nlink is 1
jffs2_get_inode_nodes(): ino #22
Node at 005fac4c is a data node
version 2, highest_version now 2
dnode @005fac4c: ver 2, offset 0000, dsize 002a
node at 0x005fabd4 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #22, f 00e5cf20, fn 001c1850)
Truncating fraglist to 0x0000002a bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #22, page at offset 0x0
jffs2_read_inode_range: ino #22, range 0x00000000-0x00001000
Reading 0-42 from node at 0x5fac4c
Node read from 005fac4c: node_crc 7da4ab90, calculated CRC 7da4ab90. =
dsize 2a, c
size 2a, offset 0, buf 00e54000
Filling non-frag hole from 42-4096
readpage finished
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 12
jffs2_do_read_inode(): ino #12 nlink is 1
jffs2_get_inode_nodes(): ino #12
Node at 005fdbac is a data node
version 2, highest_version now 2
dnode @005fdbac: ver 2, offset 0000, dsize 0001
node at 0x005fdb38 is obsoleted. Ignoring.
jffs2_add_full_dnode_to_inode(ino #12, f 00e53160, fn 001c1840)
Truncating fraglist to 0x00000001 bytes
jffs2_read_inode() returning
jffs2_do_readpage_nolock(): ino #12, page at offset 0x0
jffs2_read_inode_range: ino #12, range 0x00000000-0x00001000
Reading 0-1 from node at 0x5fdbac
Node read from 005fdbac: node_crc a1ffb276, calculated CRC a1ffb276. =
dsize 1, cs
ize 1, offset 0, buf 00e52000
Filling non-frag hole from 1-4096
readpage finished
jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

jffs2_lookup()
Password:
Jan  1 00:01:29 login[17]: invalid password for `UNKNOWN' on `console'

Login incorrect

board login: root
Password:
jffs2_lookup()
jffs2_lookup()
jffs2_setattr(): ino #55
jffs2_setattr(): Writing 2 bytes of kdev_t
jffs2_reserve_space(): Requested 0x48 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1a00 bytes at 0x5a600
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a600, size 0x48
jffs2_write_dnode wrote node at 0x0005a600 with dsize 0x2, csize 0x2, =
node_crc 0
xb4418ea9, data_crc 0x6971c5ce, totlen 0x00000046
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2320
 (mod 0x2320): no
jffs2_setattr(): ino #55
jffs2_setattr(): Writing 2 bytes of kdev_t
jffs2_reserve_space(): Requested 0x48 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x19b8 bytes at 0x5a648
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a648, size 0x48
jffs2_write_dnode wrote node at 0x0005a648 with dsize 0x2, csize 0x2, =
node_crc 0
x7c57f4a9, data_crc 0x6971c5ce, totlen 0x00000046
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2368
 (mod 0x2368): no
jffs2_lookup()
Jan  1 00:01:37 login[17]: root login  on `console'


Sash command shell (version 1.1.1)
/home>
/home> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/home> cd /bin
jffs2_lookup()
/bin> ls
jffs2_lookup()
jffs2_readdir() for dir_i #2
Dirent 0: ".", ino #2
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #2
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 29
jffs2_do_read_inode(): ino #29 nlink is 1
jffs2_get_inode_nodes(): ino #29
Node at 005f9870 is a data node
version 2, highest_version now 2
dnode @005f9870: ver 2, offset 0000, dsize 0c0c
node at 0x005f9800 is obsoleted. Ignoring.
Node at 005f75b8 is a data node
version 6, highest_version now 6
dnode @005f75b8: ver 6, offset 3000, dsize 0fcc
Node at 005f6c54 is a data node
version 5, highest_version now 6
dnode @005f6c54: ver 5, offset 2000, dsize 1000
Node at 005f6308 is a data node
version 4, highest_version now 6
dnode @005f6308: ver 4, offset 1000, dsize 1000
Node at 005f6000 is a data node
version 3, highest_version now 6
dnode @005f6000: ver 3, offset 0c0c, dsize 03f4
Node at 005f5ea8 is a data node
version 11, highest_version now 11
dnode @005f5ea8: ver 11, offset 7000, dsize 0129
Node at 005f53c0 is a data node
version 10, highest_version now 11
dnode @005f53c0: ver 10, offset 6000, dsize 1000
Node at 005f4a88 is a data node
version 9, highest_version now 11
dnode @005f4a88: ver 9, offset 5000, dsize 1000
Node at 005f4078 is a data node
version 8, highest_version now 11
dnode @005f4078: ver 8, offset 4000, dsize 1000
Node at 005f4000 is a data node
version 7, highest_version now 11
dnode @005f4000: ver 7, offset 3fcc, dsize 0034
Node at 005f3e28 is a data node
version 15, highest_version now 15
dnode @005f3e28: ver 15, offset a000, dsize 01e2
Node at 005f33b0 is a data node
version 14, highest_version now 15
dnode @005f33b0: ver 14, offset 9000, dsize 1000
Node at 005f29d4 is a data node
version 13, highest_version now 15
dnode @005f29d4: ver 13, offset 8000, dsize 1000
Node at 005f2000 is a data node
version 12, highest_version now 15
dnode @005f2000: ver 12, offset 7129, dsize 0ed7
Node at 005f18f4 is a data node
version 19, highest_version now 19
dnode @005f18f4: ver 19, offset d000, dsize 0f28
Node at 005f1124 is a data node
version 18, highest_version now 19
dnode @005f1124: ver 18, offset c000, dsize 1000
Node at 005f082c is a data node
version 17, highest_version now 19
dnode @005f082c: ver 17, offset b000, dsize 1000
Node at 005f0000 is a data node
version 16, highest_version now 19
dnode @005f0000: ver 16, offset a1e2, dsize 0e1e
Node at 005ee0d0 is a data node
version 21, highest_version now 21
dnode @005ee0d0: ver 21, offset e000, dsize 0a04
Node at 005ee000 is a data node
version 20, highest_version now 21
dnode @005ee000: ver 20, offset df28, dsize 00d8
Node at 004cd400 is a data node
version 22, highest_version now 22
dnode @004cd400: ver 22, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1830)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1870)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1880)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1890)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1820)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18b0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18c0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18d0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18e0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1860)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1900)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1910)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1920)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18a0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1940)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1950)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1960)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c18f0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c19a0)
jffs2_add_full_dnode_to_inode(ino #29, f 00e53520, fn 001c1930)
metadata @004cd400: ver 22
Truncating fraglist to 0x0000ea04 bytes
jffs2_read_inode() returning
arp
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 30
jffs2_do_read_inode(): ino #30 nlink is 1
jffs2_get_inode_nodes(): ino #30
Node at 005efb00 is a data node
version 4, highest_version now 4
dnode @005efb00: ver 4, offset 2000, dsize 0668
Node at 005ef118 is a data node
version 3, highest_version now 4
dnode @005ef118: ver 3, offset 1000, dsize 1000
Node at 005ee730 is a data node
version 2, highest_version now 4
dnode @005ee730: ver 2, offset 0000, dsize 1000
node at 0x005ee6bc is obsoleted. Ignoring.
Node at 005ed9dc is a data node
version 8, highest_version now 8
dnode @005ed9dc: ver 8, offset 5000, dsize 0915
Node at 005ed09c is a data node
version 7, highest_version now 8
dnode @005ed09c: ver 7, offset 4000, dsize 1000
Node at 005ec688 is a data node
version 6, highest_version now 8
dnode @005ec688: ver 6, offset 3000, dsize 1000
Node at 005ec000 is a data node
version 5, highest_version now 8
dnode @005ec000: ver 5, offset 2668, dsize 0998
Node at 005eb8bc is a data node
version 12, highest_version now 12
dnode @005eb8bc: ver 12, offset 8000, dsize 0a4a
Node at 005eae84 is a data node
version 11, highest_version now 12
dnode @005eae84: ver 11, offset 7000, dsize 1000
Node at 005ea488 is a data node
version 10, highest_version now 12
dnode @005ea488: ver 10, offset 6000, dsize 1000
Node at 005ea000 is a data node
version 9, highest_version now 12
dnode @005ea000: ver 9, offset 5915, dsize 06eb
Node at 005e99e4 is a data node
version 16, highest_version now 16
dnode @005e99e4: ver 16, offset b000, dsize 0964
Node at 005e8fb4 is a data node
version 15, highest_version now 16
dnode @005e8fb4: ver 15, offset a000, dsize 1000
Node at 005e84a4 is a data node
version 14, highest_version now 16
dnode @005e84a4: ver 14, offset 9000, dsize 1000
Node at 005e8000 is a data node
version 13, highest_version now 16
dnode @005e8000: ver 13, offset 8a4a, dsize 05b6
Node at 005e7910 is a data node
version 20, highest_version now 20
dnode @005e7910: ver 20, offset e000, dsize 0a10
Node at 005e6eb0 is a data node
version 19, highest_version now 20
dnode @005e6eb0: ver 19, offset d000, dsize 1000
Node at 005e64b4 is a data node
version 18, highest_version now 20
dnode @005e64b4: ver 18, offset c000, dsize 1000
Node at 005e6000 is a data node
version 17, highest_version now 20
dnode @005e6000: ver 17, offset b964, dsize 069c
Node at 005e5e38 is a data node
version 25, highest_version now 25
dnode @005e5e38: ver 25, offset 12000, dsize 04d7
Node at 005e54f8 is a data node
version 24, highest_version now 25
dnode @005e54f8: ver 24, offset 11000, dsize 1000
Node at 005e4b34 is a data node
version 23, highest_version now 25
dnode @005e4b34: ver 23, offset 10000, dsize 1000
Node at 005e42dc is a data node
version 22, highest_version now 25
dnode @005e42dc: ver 22, offset f000, dsize 1000
Node at 005e4000 is a data node
version 21, highest_version now 25
dnode @005e4000: ver 21, offset ea10, dsize 05f0
Node at 005e3b80 is a data node
version 29, highest_version now 29
dnode @005e3b80: ver 29, offset 15000, dsize 05d0
Node at 005e30d4 is a data node
version 28, highest_version now 29
dnode @005e30d4: ver 28, offset 14000, dsize 1000
Node at 005e2660 is a data node
version 27, highest_version now 29
dnode @005e2660: ver 27, offset 13000, dsize 1000
Node at 005e2000 is a data node
version 26, highest_version now 29
dnode @005e2000: ver 26, offset 124d7, dsize 0b29
Node at 005e18e8 is a data node
version 33, highest_version now 33
dnode @005e18e8: ver 33, offset 18000, dsize 0b3c
Node at 005e0fd0 is a data node
version 32, highest_version now 33
dnode @005e0fd0: ver 32, offset 17000, dsize 1000
Node at 005e0648 is a data node
version 31, highest_version now 33
dnode @005e0648: ver 31, offset 16000, dsize 1000
Node at 005e0000 is a data node
version 30, highest_version now 33
dnode @005e0000: ver 30, offset 155d0, dsize 0a30
Node at 005dfcc4 is a data node
version 38, highest_version now 38
dnode @005dfcc4: ver 38, offset 1c000, dsize 051e
Node at 005df520 is a data node
version 37, highest_version now 38
dnode @005df520: ver 37, offset 1b000, dsize 1000
Node at 005debb8 is a data node
version 36, highest_version now 38
dnode @005debb8: ver 36, offset 1a000, dsize 1000
Node at 005de330 is a data node
version 35, highest_version now 38
dnode @005de330: ver 35, offset 19000, dsize 1000
Node at 005de000 is a data node
version 34, highest_version now 38
dnode @005de000: ver 34, offset 18b3c, dsize 04c4
Node at 005dd018 is a data node
version 41, highest_version now 41
dnode @005dd018: ver 41, offset 1e000, dsize 0164
Node at 005dc670 is a data node
version 40, highest_version now 41
dnode @005dc670: ver 40, offset 1d000, dsize 1000
Node at 005dc000 is a data node
version 39, highest_version now 41
dnode @005dc000: ver 39, offset 1c51e, dsize 0ae2
Node at 004cd444 is a data node
version 42, highest_version now 42
dnode @004cd444: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c19e0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1970)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1980)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a40)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c19b0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c19c0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c19d0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a00)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a10)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a20)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a30)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a70)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a80)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a90)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c19f0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1ac0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1ad0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a50)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1a60)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1af0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b00)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b10)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1aa0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1ab0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b50)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b60)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b70)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1ae0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1bc0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b20)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b30)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b40)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1c00)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b80)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1b90)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1ba0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1bb0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1bd0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1be0)
jffs2_add_full_dnode_to_inode(ino #30, f 00e53700, fn 001c1bf0)
metadata @004cd444: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
basename
boa
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 32
jffs2_do_read_inode(): ino #32 nlink is 1
jffs2_get_inode_nodes(): ino #32
Node at 005cfcd0 is a data node
version 3, highest_version now 3
dnode @005cfcd0: ver 3, offset 1000, dsize 03f8
Node at 005cf2c0 is a data node
version 2, highest_version now 3
dnode @005cf2c0: ver 2, offset 0000, dsize 1000
node at 0x005cf24c is obsoleted. Ignoring.
Node at 005cdc50 is a data node
version 7, highest_version now 7
dnode @005cdc50: ver 7, offset 4000, dsize 05b3
Node at 005cd20c is a data node
version 6, highest_version now 7
dnode @005cd20c: ver 6, offset 3000, dsize 1000
Node at 005cc790 is a data node
version 5, highest_version now 7
dnode @005cc790: ver 5, offset 2000, dsize 1000
Node at 005cc000 is a data node
version 4, highest_version now 7
dnode @005cc000: ver 4, offset 13f8, dsize 0c08
Node at 005cb9e4 is a data node
version 11, highest_version now 11
dnode @005cb9e4: ver 11, offset 7000, dsize 0808
Node at 005cafe0 is a data node
version 10, highest_version now 11
dnode @005cafe0: ver 10, offset 6000, dsize 1000
Node at 005ca688 is a data node
version 9, highest_version now 11
dnode @005ca688: ver 9, offset 5000, dsize 1000
Node at 005ca000 is a data node
version 8, highest_version now 11
dnode @005ca000: ver 8, offset 45b3, dsize 0a4d
Node at 005c9b04 is a data node
version 15, highest_version now 15
dnode @005c9b04: ver 15, offset a000, dsize 06b7
Node at 005c8fec is a data node
version 14, highest_version now 15
dnode @005c8fec: ver 14, offset 9000, dsize 1000
Node at 005c8530 is a data node
version 13, highest_version now 15
dnode @005c8530: ver 13, offset 8000, dsize 1000
Node at 005c8000 is a data node
version 12, highest_version now 15
dnode @005c8000: ver 12, offset 7808, dsize 07f8
Node at 005c79f4 is a data node
version 19, highest_version now 19
dnode @005c79f4: ver 19, offset d000, dsize 08a6
Node at 005c6ff0 is a data node
version 18, highest_version now 19
dnode @005c6ff0: ver 18, offset c000, dsize 1000
Node at 005c6640 is a data node
version 17, highest_version now 19
dnode @005c6640: ver 17, offset b000, dsize 1000
Node at 005c6000 is a data node
version 16, highest_version now 19
dnode @005c6000: ver 16, offset a6b7, dsize 0949
Node at 005c56c4 is a data node
version 23, highest_version now 23
dnode @005c56c4: ver 23, offset 10000, dsize 0e76
Node at 005c4e6c is a data node
version 22, highest_version now 23
dnode @005c4e6c: ver 22, offset f000, dsize 1000
Node at 005c4594 is a data node
version 21, highest_version now 23
dnode @005c4594: ver 21, offset e000, dsize 1000
Node at 005c4000 is a data node
version 20, highest_version now 23
dnode @005c4000: ver 20, offset d8a6, dsize 075a
Node at 005c3c84 is a data node
version 28, highest_version now 28
dnode @005c3c84: ver 28, offset 14000, dsize 041e
Node at 005c31e0 is a data node
version 27, highest_version now 28
dnode @005c31e0: ver 27, offset 13000, dsize 1000
Node at 005c2aa8 is a data node
version 26, highest_version now 28
dnode @005c2aa8: ver 26, offset 12000, dsize 1000
Node at 005c2194 is a data node
version 25, highest_version now 28
dnode @005c2194: ver 25, offset 11000, dsize 1000
Node at 005c2000 is a data node
version 24, highest_version now 28
dnode @005c2000: ver 24, offset 10e76, dsize 018a
Node at 005c1b20 is a data node
version 32, highest_version now 32
dnode @005c1b20: ver 32, offset 17000, dsize 065c
Node at 005c1174 is a data node
version 31, highest_version now 32
dnode @005c1174: ver 31, offset 16000, dsize 1000
Node at 005c07c0 is a data node
version 30, highest_version now 32
dnode @005c07c0: ver 30, offset 15000, dsize 1000
Node at 005c0000 is a data node
version 29, highest_version now 32
dnode @005c0000: ver 29, offset 1441e, dsize 0be2
Node at 005bf6ec is a data node
version 36, highest_version now 36
dnode @005bf6ec: ver 36, offset 1a000, dsize 0f21
Node at 005bee64 is a data node
version 35, highest_version now 36
dnode @005bee64: ver 35, offset 19000, dsize 1000
Node at 005be54c is a data node
version 34, highest_version now 36
dnode @005be54c: ver 34, offset 18000, dsize 1000
Node at 005be000 is a data node
version 33, highest_version now 36
dnode @005be000: ver 33, offset 1765c, dsize 09a4
Node at 005bdb4c is a data node
version 41, highest_version now 41
dnode @005bdb4c: ver 41, offset 1e000, dsize 0164
Node at 005bd1d8 is a data node
version 40, highest_version now 41
dnode @005bd1d8: ver 40, offset 1d000, dsize 1000
Node at 005bc890 is a data node
version 39, highest_version now 41
dnode @005bc890: ver 39, offset 1c000, dsize 1000
Node at 005bc0f4 is a data node
version 38, highest_version now 41
dnode @005bc0f4: ver 38, offset 1b000, dsize 1000
Node at 005bc000 is a data node
version 37, highest_version now 41
dnode @005bc000: ver 37, offset 1af21, dsize 00df
Node at 004cd4cc is a data node
version 42, highest_version now 42
dnode @004cd4cc: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c20)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c30)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c70)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c80)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c90)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c10)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1cc0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1cd0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c50)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1c60)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d00)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d10)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1ca0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1cb0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d40)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d50)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1ce0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1cf0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d80)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d90)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d20)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d30)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1dc0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1dd0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1de0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d60)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1d70)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e20)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e30)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1da0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1db0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e70)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1df0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e00)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e10)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1ea0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1eb0)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e40)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e50)
jffs2_add_full_dnode_to_inode(ino #32, f 00e538e0, fn 001c1e60)
metadata @004cd4cc: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
busybox
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 33
jffs2_do_read_inode(): ino #33 nlink is 1
jffs2_get_inode_nodes(): ino #33
Node at 005bdcd8 is a data node
version 2, highest_version now 2
dnode @005bdcd8: ver 2, offset 0000, dsize 0411
node at 0x005bdc64 is obsoleted. Ignoring.
Node at 005bbc18 is a data node
version 6, highest_version now 6
dnode @005bbc18: ver 6, offset 3000, dsize 0557
Node at 005bb128 is a data node
version 5, highest_version now 6
dnode @005bb128: ver 5, offset 2000, dsize 1000
Node at 005ba6e4 is a data node
version 4, highest_version now 6
dnode @005ba6e4: ver 4, offset 1000, dsize 1000
Node at 005ba000 is a data node
version 3, highest_version now 6
dnode @005ba000: ver 3, offset 0411, dsize 0bef
Node at 005b999c is a data node
version 10, highest_version now 10
dnode @005b999c: ver 10, offset 6000, dsize 0cd3
Node at 005b90c8 is a data node
version 9, highest_version now 10
dnode @005b90c8: ver 9, offset 5000, dsize 1000
Node at 005b8768 is a data node
version 8, highest_version now 10
dnode @005b8768: ver 8, offset 4000, dsize 1000
Node at 005b8000 is a data node
version 7, highest_version now 10
dnode @005b8000: ver 7, offset 3557, dsize 0aa9
Node at 005b6214 is a data node
version 12, highest_version now 12
dnode @005b6214: ver 12, offset 7000, dsize 033c
Node at 005b6000 is a data node
version 11, highest_version now 12
dnode @005b6000: ver 11, offset 6cd3, dsize 032d
Node at 004cd510 is a data node
version 13, highest_version now 13
dnode @004cd510: ver 13, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1e80)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1ec0)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1ed0)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1ee0)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1ef0)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f00)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f10)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f20)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f30)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f70)
jffs2_add_full_dnode_to_inode(ino #33, f 00e53ac0, fn 001c1f80)
metadata @004cd510: ver 13
Truncating fraglist to 0x0000733c bytes
jffs2_read_inode() returning
eraseall
expand
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 35
jffs2_do_read_inode(): ino #35 nlink is 1
jffs2_get_inode_nodes(): ino #35
node at 0x005b5f9c is obsoleted. Ignoring.
Node at 005b3c64 is a data node
version 5, highest_version now 5
dnode @005b3c64: ver 5, offset 3000, dsize 0624
Node at 005b3390 is a data node
version 4, highest_version now 5
dnode @005b3390: ver 4, offset 2000, dsize 1000
Node at 005b2998 is a data node
version 3, highest_version now 5
dnode @005b2998: ver 3, offset 1000, dsize 1000
Node at 005b202c is a data node
version 2, highest_version now 5
dnode @005b202c: ver 2, offset 0000, dsize 1000
Node at 005b19dc is a data node
version 9, highest_version now 9
dnode @005b19dc: ver 9, offset 6000, dsize 09c6
Node at 005b0fb8 is a data node
version 8, highest_version now 9
dnode @005b0fb8: ver 8, offset 5000, dsize 1000
Node at 005b0618 is a data node
version 7, highest_version now 9
dnode @005b0618: ver 7, offset 4000, dsize 1000
Node at 005b0000 is a data node
version 6, highest_version now 9
dnode @005b0000: ver 6, offset 3624, dsize 09dc
Node at 005af7f8 is a data node
version 13, highest_version now 13
dnode @005af7f8: ver 13, offset 9000, dsize 0c2d
Node at 005aee00 is a data node
version 12, highest_version now 13
dnode @005aee00: ver 12, offset 8000, dsize 1000
Node at 005ae45c is a data node
version 11, highest_version now 13
dnode @005ae45c: ver 11, offset 7000, dsize 1000
Node at 005ae000 is a data node
version 10, highest_version now 13
dnode @005ae000: ver 10, offset 69c6, dsize 063a
Node at 005ad660 is a data node
version 17, highest_version now 17
dnode @005ad660: ver 17, offset c000, dsize 0e66
Node at 005acc98 is a data node
version 16, highest_version now 17
dnode @005acc98: ver 16, offset b000, dsize 1000
Node at 005ac2d0 is a data node
version 15, highest_version now 17
dnode @005ac2d0: ver 15, offset a000, dsize 1000
Node at 005ac000 is a data node
version 14, highest_version now 17
dnode @005ac000: ver 14, offset 9c2d, dsize 03d3
Node at 005abc38 is a data node
version 22, highest_version now 22
dnode @005abc38: ver 22, offset 10000, dsize 04c1
Node at 005ab250 is a data node
version 21, highest_version now 22
dnode @005ab250: ver 21, offset f000, dsize 1000
Node at 005aaac4 is a data node
version 20, highest_version now 22
dnode @005aaac4: ver 20, offset e000, dsize 1000
Node at 005aa160 is a data node
version 19, highest_version now 22
dnode @005aa160: ver 19, offset d000, dsize 1000
Node at 005aa000 is a data node
version 18, highest_version now 22
dnode @005aa000: ver 18, offset ce66, dsize 019a
Node at 005a9ba4 is a data node
version 26, highest_version now 26
dnode @005a9ba4: ver 26, offset 13000, dsize 0544
Node at 005a9258 is a data node
version 25, highest_version now 26
dnode @005a9258: ver 25, offset 12000, dsize 1000
Node at 005a87c0 is a data node
version 24, highest_version now 26
dnode @005a87c0: ver 24, offset 11000, dsize 1000
Node at 005a8000 is a data node
version 23, highest_version now 26
dnode @005a8000: ver 23, offset 104c1, dsize 0b3f
Node at 005a7e20 is a data node
version 31, highest_version now 31
dnode @005a7e20: ver 31, offset 17000, dsize 0232
Node at 005a76d4 is a data node
version 30, highest_version now 31
dnode @005a76d4: ver 30, offset 16000, dsize 1000
Node at 005a6ec8 is a data node
version 29, highest_version now 31
dnode @005a6ec8: ver 29, offset 15000, dsize 1000
Node at 005a6690 is a data node
version 28, highest_version now 31
dnode @005a6690: ver 28, offset 14000, dsize 1000
Node at 005a6000 is a data node
version 27, highest_version now 31
dnode @005a6000: ver 27, offset 13544, dsize 0abc
Node at 005a58d4 is a data node
version 35, highest_version now 35
dnode @005a58d4: ver 35, offset 1a000, dsize 0a38
Node at 005a4f4c is a data node
version 34, highest_version now 35
dnode @005a4f4c: ver 34, offset 19000, dsize 1000
Node at 005a4740 is a data node
version 33, highest_version now 35
dnode @005a4740: ver 33, offset 18000, dsize 1000
Node at 005a4000 is a data node
version 32, highest_version now 35
dnode @005a4000: ver 32, offset 17232, dsize 0dce
Node at 004cd598 is a data node
version 36, highest_version now 36
dnode @004cd598: ver 36, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1fb0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1fc0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1f40)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1f50)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6380)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1fd0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1f90)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 001c1fa0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6340)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6350)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6360)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6370)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6390)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63a0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63b0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63c0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63e0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63f0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6400)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6410)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6420)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6440)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6450)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6460)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff63d0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6470)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6480)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6490)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff64a0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff6430)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff64c0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff64d0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff64e0)
jffs2_add_full_dnode_to_inode(ino #35, f 00e53ca0, fn 00ff64f0)
metadata @004cd598: ver 36
Truncating fraglist to 0x0001aa38 bytes
jffs2_read_inode() returning
ftp
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 36
jffs2_do_read_inode(): ino #36 nlink is 1
jffs2_get_inode_nodes(): ino #36
Node at 005a5f00 is a data node
version 2, highest_version now 2
dnode @005a5f00: ver 2, offset 0000, dsize 00d7
node at 0x005a5e90 is obsoleted. Ignoring.
Node at 005a3d98 is a data node
version 6, highest_version now 6
dnode @005a3d98: ver 6, offset 3000, dsize 0282
Node at 005a3320 is a data node
version 5, highest_version now 6
dnode @005a3320: ver 5, offset 2000, dsize 1000
Node at 005a2908 is a data node
version 4, highest_version now 6
dnode @005a2908: ver 4, offset 1000, dsize 1000
Node at 005a2000 is a data node
version 3, highest_version now 6
dnode @005a2000: ver 3, offset 00d7, dsize 0f29
Node at 005a1bbc is a data node
version 10, highest_version now 10
dnode @005a1bbc: ver 10, offset 6000, dsize 0572
Node at 005a1244 is a data node
version 9, highest_version now 10
dnode @005a1244: ver 9, offset 5000, dsize 1000
Node at 005a0818 is a data node
version 8, highest_version now 10
dnode @005a0818: ver 8, offset 4000, dsize 1000
Node at 005a0000 is a data node
version 7, highest_version now 10
dnode @005a0000: ver 7, offset 3282, dsize 0d7e
Node at 0059fb94 is a data node
version 14, highest_version now 14
dnode @0059fb94: ver 14, offset 9000, dsize 05aa
Node at 0059f194 is a data node
version 13, highest_version now 14
dnode @0059f194: ver 13, offset 8000, dsize 1000
Node at 0059e6d4 is a data node
version 12, highest_version now 14
dnode @0059e6d4: ver 12, offset 7000, dsize 1000
Node at 0059e000 is a data node
version 11, highest_version now 14
dnode @0059e000: ver 11, offset 6572, dsize 0a8e
Node at 0059d5d4 is a data node
version 18, highest_version now 18
dnode @0059d5d4: ver 18, offset c000, dsize 0f91
Node at 0059d050 is a data node
version 17, highest_version now 18
dnode @0059d050: ver 17, offset b000, dsize 1000
Node at 0059c64c is a data node
version 16, highest_version now 18
dnode @0059c64c: ver 16, offset a000, dsize 1000
Node at 0059c000 is a data node
version 15, highest_version now 18
dnode @0059c000: ver 15, offset 95aa, dsize 0a56
Node at 0059b5fc is a data node
version 22, highest_version now 22
dnode @0059b5fc: ver 22, offset f000, dsize 0fbe
Node at 0059ab88 is a data node
version 21, highest_version now 22
dnode @0059ab88: ver 21, offset e000, dsize 1000
Node at 0059a0b4 is a data node
version 20, highest_version now 22
dnode @0059a0b4: ver 20, offset d000, dsize 1000
Node at 0059a000 is a data node
version 19, highest_version now 22
dnode @0059a000: ver 19, offset cf91, dsize 006f
Node at 00599f28 is a data node
version 27, highest_version now 27
dnode @00599f28: ver 27, offset 13000, dsize 0094
Node at 005995c4 is a data node
version 26, highest_version now 27
dnode @005995c4: ver 26, offset 12000, dsize 1000
Node at 00598b88 is a data node
version 25, highest_version now 27
dnode @00598b88: ver 25, offset 11000, dsize 1000
Node at 00598088 is a data node
version 24, highest_version now 27
dnode @00598088: ver 24, offset 10000, dsize 1000
Node at 00598000 is a data node
version 23, highest_version now 27
dnode @00598000: ver 23, offset ffbe, dsize 0042
Node at 0059791c is a data node
version 31, highest_version now 31
dnode @0059791c: ver 31, offset 16000, dsize 0ca4
Node at 00597078 is a data node
version 30, highest_version now 31
dnode @00597078: ver 30, offset 15000, dsize 1000
Node at 005968ac is a data node
version 29, highest_version now 31
dnode @005968ac: ver 29, offset 14000, dsize 1000
Node at 00596000 is a data node
version 28, highest_version now 31
dnode @00596000: ver 28, offset 13094, dsize 0f6c
Node at 00594c58 is a data node
version 34, highest_version now 34
dnode @00594c58: ver 34, offset 18000, dsize 05dc
Node at 00594268 is a data node
version 33, highest_version now 34
dnode @00594268: ver 33, offset 17000, dsize 1000
Node at 00594000 is a data node
version 32, highest_version now 34
dnode @00594000: ver 32, offset 16ca4, dsize 035c
Node at 004cd5dc is a data node
version 35, highest_version now 35
dnode @004cd5dc: ver 35, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6530)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6590)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6500)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6510)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6520)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6550)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6560)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6570)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6580)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65c0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65d0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65e0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6540)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6610)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6620)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65a0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65b0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6650)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6660)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff65f0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6600)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6690)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66a0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66b0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6630)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6640)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66e0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66f0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6670)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6680)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff6730)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66c0)
jffs2_add_full_dnode_to_inode(ino #36, f 00e53e80, fn 00ff66d0)
metadata @004cd5dc: ver 35
Truncating fraglist to 0x000185dc bytes
jffs2_read_inode() returning
ftpd
hostname
ifconfig
inetd
init
login
mount
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 43
jffs2_do_read_inode(): ino #43 nlink is 1
jffs2_get_inode_nodes(): ino #43
Node at 00553a78 is a data node
version 3, highest_version now 3
dnode @00553a78: ver 3, offset 1000, dsize 07c1
Node at 00553094 is a data node
version 2, highest_version now 3
dnode @00553094: ver 2, offset 0000, dsize 1000
node at 0x00553020 is obsoleted. Ignoring.
Node at 00551948 is a data node
version 7, highest_version now 7
dnode @00551948: ver 7, offset 4000, dsize 0a74
Node at 00550f9c is a data node
version 6, highest_version now 7
dnode @00550f9c: ver 6, offset 3000, dsize 1000
Node at 0055058c is a data node
version 5, highest_version now 7
dnode @0055058c: ver 5, offset 2000, dsize 1000
Node at 00550000 is a data node
version 4, highest_version now 7
dnode @00550000: ver 4, offset 17c1, dsize 083f
Node at 0054f548 is a data node
version 11, highest_version now 11
dnode @0054f548: ver 11, offset 7000, dsize 0f47
Node at 0054eae0 is a data node
version 10, highest_version now 11
dnode @0054eae0: ver 10, offset 6000, dsize 1000
Node at 0054e3cc is a data node
version 9, highest_version now 11
dnode @0054e3cc: ver 9, offset 5000, dsize 1000
Node at 0054e000 is a data node
version 8, highest_version now 11
dnode @0054e000: ver 8, offset 4a74, dsize 058c
Node at 0054de74 is a data node
version 16, highest_version now 16
dnode @0054de74: ver 16, offset b000, dsize 019a
Node at 0054d520 is a data node
version 15, highest_version now 16
dnode @0054d520: ver 15, offset a000, dsize 1000
Node at 0054cb04 is a data node
version 14, highest_version now 16
dnode @0054cb04: ver 14, offset 9000, dsize 1000
Node at 0054c0ec is a data node
version 13, highest_version now 16
dnode @0054c0ec: ver 13, offset 8000, dsize 1000
Node at 0054c000 is a data node
version 12, highest_version now 16
dnode @0054c000: ver 12, offset 7f47, dsize 00b9
Node at 0054b8dc is a data node
version 20, highest_version now 20
dnode @0054b8dc: ver 20, offset e000, dsize 091c
Node at 0054b108 is a data node
version 19, highest_version now 20
dnode @0054b108: ver 19, offset d000, dsize 1000
Node at 0054a86c is a data node
version 18, highest_version now 20
dnode @0054a86c: ver 18, offset c000, dsize 1000
Node at 0054a000 is a data node
version 17, highest_version now 20
dnode @0054a000: ver 17, offset b19a, dsize 0e66
Node at 004cd7b8 is a data node
version 21, highest_version now 21
dnode @004cd7b8: ver 21, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6700)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6710)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6740)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6750)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6760)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6770)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6780)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6790)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67a0)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67b0)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67d0)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67e0)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67f0)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6800)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6810)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6830)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6840)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff6850)
jffs2_add_full_dnode_to_inode(ino #43, f 00e4a180, fn 00ff67c0)
metadata @004cd7b8: ver 21
Truncating fraglist to 0x0000e91c bytes
jffs2_read_inode() returning
netflash
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 44
jffs2_do_read_inode(): ino #44 nlink is 1
jffs2_get_inode_nodes(): ino #44
Node at 0054be98 is a data node
version 2, highest_version now 2
dnode @0054be98: ver 2, offset 0000, dsize 0195
node at 0x0054be28 is obsoleted. Ignoring.
Node at 00549dcc is a data node
version 6, highest_version now 6
dnode @00549dcc: ver 6, offset 3000, dsize 027d
Node at 005493a0 is a data node
version 5, highest_version now 6
dnode @005493a0: ver 5, offset 2000, dsize 1000
Node at 00548998 is a data node
version 4, highest_version now 6
dnode @00548998: ver 4, offset 1000, dsize 1000
Node at 00548000 is a data node
version 3, highest_version now 6
dnode @00548000: ver 3, offset 0195, dsize 0e6b
Node at 00547bec is a data node
version 10, highest_version now 10
dnode @00547bec: ver 10, offset 6000, dsize 049e
Node at 00547178 is a data node
version 9, highest_version now 10
dnode @00547178: ver 9, offset 5000, dsize 1000
Node at 00546830 is a data node
version 8, highest_version now 10
dnode @00546830: ver 8, offset 4000, dsize 1000
Node at 00546000 is a data node
version 7, highest_version now 10
dnode @00546000: ver 7, offset 327d, dsize 0d83
Node at 00545b78 is a data node
version 14, highest_version now 14
dnode @00545b78: ver 14, offset 9000, dsize 05a4
Node at 00545190 is a data node
version 13, highest_version now 14
dnode @00545190: ver 13, offset 8000, dsize 1000
Node at 0054478c is a data node
version 12, highest_version now 14
dnode @0054478c: ver 12, offset 7000, dsize 1000
Node at 00544000 is a data node
version 11, highest_version now 14
dnode @00544000: ver 11, offset 649e, dsize 0b62
Node at 005436f0 is a data node
version 18, highest_version now 18
dnode @005436f0: ver 18, offset c000, dsize 1000
Node at 00542ea8 is a data node
version 17, highest_version now 18
dnode @00542ea8: ver 17, offset b000, dsize 1000
Node at 00542650 is a data node
version 16, highest_version now 18
dnode @00542650: ver 16, offset a000, dsize 1000
Node at 00542000 is a data node
version 15, highest_version now 18
dnode @00542000: ver 15, offset 95a4, dsize 0a5c
Node at 00540000 is a data node
version 19, highest_version now 19
dnode @00540000: ver 19, offset d000, dsize 06b0
Node at 004cd7fc is a data node
version 20, highest_version now 20
dnode @004cd7fc: ver 20, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68a0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6860)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6870)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6880)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6890)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68b0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68c0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68d0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68e0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff68f0)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6900)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6910)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6920)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6930)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6940)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6950)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff6960)
jffs2_add_full_dnode_to_inode(ino #44, f 00e4a360, fn 00ff69a0)
metadata @004cd7fc: ver 20
Truncating fraglist to 0x0000d6b0 bytes
jffs2_read_inode() returning
ping
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 45
jffs2_do_read_inode(): ino #45 nlink is 1
jffs2_get_inode_nodes(): ino #45
Node at 0054183c is a data node
version 4, highest_version now 4
dnode @0054183c: ver 4, offset 2000, dsize 0adb
Node at 00540e70 is a data node
version 3, highest_version now 4
dnode @00540e70: ver 3, offset 1000, dsize 1000
Node at 00540488 is a data node
version 2, highest_version now 4
dnode @00540488: ver 2, offset 0000, dsize 1000
node at 0x00540414 is obsoleted. Ignoring.
Node at 0053f72c is a data node
version 8, highest_version now 8
dnode @0053f72c: ver 8, offset 5000, dsize 0e43
Node at 0053edfc is a data node
version 7, highest_version now 8
dnode @0053edfc: ver 7, offset 4000, dsize 1000
Node at 0053e3e8 is a data node
version 6, highest_version now 8
dnode @0053e3e8: ver 6, offset 3000, dsize 1000
Node at 0053e000 is a data node
version 5, highest_version now 8
dnode @0053e000: ver 5, offset 2adb, dsize 0525
Node at 0053d5cc is a data node
version 12, highest_version now 12
dnode @0053d5cc: ver 12, offset 8000, dsize 0e9d
Node at 0053cb94 is a data node
version 11, highest_version now 12
dnode @0053cb94: ver 11, offset 7000, dsize 1000
Node at 0053c198 is a data node
version 10, highest_version now 12
dnode @0053c198: ver 10, offset 6000, dsize 1000
Node at 0053c000 is a data node
version 9, highest_version now 12
dnode @0053c000: ver 9, offset 5e43, dsize 01bd
Node at 0053b6d0 is a data node
version 16, highest_version now 16
dnode @0053b6d0: ver 16, offset b000, dsize 0e80
Node at 0053aca0 is a data node
version 15, highest_version now 16
dnode @0053aca0: ver 15, offset a000, dsize 1000
Node at 0053a190 is a data node
version 14, highest_version now 16
dnode @0053a190: ver 14, offset 9000, dsize 1000
Node at 0053a000 is a data node
version 13, highest_version now 16
dnode @0053a000: ver 13, offset 8e9d, dsize 0163
Node at 00539ef4 is a data node
version 21, highest_version now 21
dnode @00539ef4: ver 21, offset f000, dsize 0147
Node at 005395e8 is a data node
version 20, highest_version now 21
dnode @005395e8: ver 20, offset e000, dsize 1000
Node at 00538b88 is a data node
version 19, highest_version now 21
dnode @00538b88: ver 19, offset d000, dsize 1000
Node at 0053818c is a data node
version 18, highest_version now 21
dnode @0053818c: ver 18, offset c000, dsize 1000
Node at 00538000 is a data node
version 17, highest_version now 21
dnode @00538000: ver 17, offset be80, dsize 0180
Node at 00537af0 is a data node
version 25, highest_version now 25
dnode @00537af0: ver 25, offset 12000, dsize 0be1
Node at 005371d0 is a data node
version 24, highest_version now 25
dnode @005371d0: ver 24, offset 11000, dsize 1000
Node at 0053680c is a data node
version 23, highest_version now 25
dnode @0053680c: ver 23, offset 10000, dsize 1000
Node at 00536000 is a data node
version 22, highest_version now 25
dnode @00536000: ver 22, offset f147, dsize 0eb9
Node at 00535830 is a data node
version 29, highest_version now 29
dnode @00535830: ver 29, offset 15000, dsize 0c01
Node at 00534da8 is a data node
version 28, highest_version now 29
dnode @00534da8: ver 28, offset 14000, dsize 1000
Node at 00534334 is a data node
version 27, highest_version now 29
dnode @00534334: ver 27, offset 13000, dsize 1000
Node at 00534000 is a data node
version 26, highest_version now 29
dnode @00534000: ver 26, offset 12be1, dsize 041f
Node at 00533eac is a data node
version 34, highest_version now 34
dnode @00533eac: ver 34, offset 19000, dsize 0198
Node at 00533580 is a data node
version 33, highest_version now 34
dnode @00533580: ver 33, offset 18000, dsize 1000
Node at 00532c6c is a data node
version 32, highest_version now 34
dnode @00532c6c: ver 32, offset 17000, dsize 1000
Node at 005322e4 is a data node
version 31, highest_version now 34
dnode @005322e4: ver 31, offset 16000, dsize 1000
Node at 00532000 is a data node
version 30, highest_version now 34
dnode @00532000: ver 30, offset 15c01, dsize 03ff
Node at 005318d0 is a data node
version 38, highest_version now 38
dnode @005318d0: ver 38, offset 1c000, dsize 0c6e
Node at 0053112c is a data node
version 37, highest_version now 38
dnode @0053112c: ver 37, offset 1b000, dsize 1000
Node at 005307c4 is a data node
version 36, highest_version now 38
dnode @005307c4: ver 36, offset 1a000, dsize 1000
Node at 00530000 is a data node
version 35, highest_version now 38
dnode @00530000: ver 35, offset 19198, dsize 0e68
Node at 0052ebd4 is a data node
version 41, highest_version now 41
dnode @0052ebd4: ver 41, offset 1e000, dsize 0164
Node at 0052e22c is a data node
version 40, highest_version now 41
dnode @0052e22c: ver 40, offset 1d000, dsize 1000
Node at 0052e000 is a data node
version 39, highest_version now 41
dnode @0052e000: ver 39, offset 1cc6e, dsize 0392
Node at 004cd840 is a data node
version 42, highest_version now 42
dnode @004cd840: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff69e0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6970)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6980)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a40)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff69b0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff69c0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff69d0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a00)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a10)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a20)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a30)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a70)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a80)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a90)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff69f0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6ab0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6ac0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6ad0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a50)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6a60)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b00)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b10)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b20)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6aa0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b50)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b60)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6ae0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6af0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b80)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b90)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6ba0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b30)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b40)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6bc0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6bd0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6be0)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6b70)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6c10)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6c20)
jffs2_add_full_dnode_to_inode(ino #45, f 00e4a540, fn 00ff6bb0)
metadata @004cd840: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
rmdir
route
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 47
jffs2_do_read_inode(): ino #47 nlink is 1
jffs2_get_inode_nodes(): ino #47
Node at 0051d640 is a data node
version 2, highest_version now 2
dnode @0051d640: ver 2, offset 0000, dsize 0e18
node at 0x0051d5d0 is obsoleted. Ignoring.
Node at 0051b608 is a data node
version 6, highest_version now 6
dnode @0051b608: ver 6, offset 3000, dsize 0e1b
Node at 0051ab58 is a data node
version 5, highest_version now 6
dnode @0051ab58: ver 5, offset 2000, dsize 1000
Node at 0051a208 is a data node
version 4, highest_version now 6
dnode @0051a208: ver 4, offset 1000, dsize 1000
Node at 0051a000 is a data node
version 3, highest_version now 6
dnode @0051a000: ver 3, offset 0e18, dsize 01e8
Node at 00519dd0 is a data node
version 11, highest_version now 11
dnode @00519dd0: ver 11, offset 7000, dsize 0298
Node at 00519564 is a data node
version 10, highest_version now 11
dnode @00519564: ver 10, offset 6000, dsize 1000
Node at 00518b80 is a data node
version 9, highest_version now 11
dnode @00518b80: ver 9, offset 5000, dsize 1000
Node at 005181a0 is a data node
version 8, highest_version now 11
dnode @005181a0: ver 8, offset 4000, dsize 1000
Node at 00518000 is a data node
version 7, highest_version now 11
dnode @00518000: ver 7, offset 3e1b, dsize 01e5
Node at 00516754 is a data node
version 13, highest_version now 13
dnode @00516754: ver 13, offset 8000, dsize 0a34
Node at 00516000 is a data node
version 12, highest_version now 13
dnode @00516000: ver 12, offset 7298, dsize 0d68
Node at 004cd8c8 is a data node
version 14, highest_version now 14
dnode @004cd8c8: ver 14, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6bf0)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c50)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c60)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c70)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c80)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6cc0)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6cd0)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6ce0)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c30)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6c40)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6ca0)
jffs2_add_full_dnode_to_inode(ino #47, f 00e4a720, fn 00ff6cb0)
metadata @004cd8c8: ver 14
Truncating fraglist to 0x00008a34 bytes
jffs2_read_inode() returning
rtc
sh
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 49
jffs2_do_read_inode(): ino #49 nlink is 1
jffs2_get_inode_nodes(): ino #49
Node at 0050d874 is a data node
version 3, highest_version now 3
dnode @0050d874: ver 3, offset 1000, dsize 0c2b
Node at 0050ced4 is a data node
version 2, highest_version now 3
dnode @0050ced4: ver 2, offset 0000, dsize 1000
node at 0x0050ce60 is obsoleted. Ignoring.
Node at 0050b69c is a data node
version 7, highest_version now 7
dnode @0050b69c: ver 7, offset 4000, dsize 0f7f
Node at 0050ad00 is a data node
version 6, highest_version now 7
dnode @0050ad00: ver 6, offset 3000, dsize 1000
Node at 0050a2b0 is a data node
version 5, highest_version now 7
dnode @0050a2b0: ver 5, offset 2000, dsize 1000
Node at 0050a000 is a data node
version 4, highest_version now 7
dnode @0050a000: ver 4, offset 1c2b, dsize 03d5
Node at 00509b58 is a data node
version 12, highest_version now 12
dnode @00509b58: ver 12, offset 8000, dsize 095a
Node at 005091dc is a data node
version 11, highest_version now 12
dnode @005091dc: ver 11, offset 7000, dsize 1000
Node at 00508940 is a data node
version 10, highest_version now 12
dnode @00508940: ver 10, offset 6000, dsize 1000
Node at 005080c8 is a data node
version 9, highest_version now 12
dnode @005080c8: ver 9, offset 5000, dsize 1000
Node at 00508000 is a data node
version 8, highest_version now 12
dnode @00508000: ver 8, offset 4f7f, dsize 0081
Node at 005077c4 is a data node
version 16, highest_version now 16
dnode @005077c4: ver 16, offset b000, dsize 0cdb
Node at 00506de4 is a data node
version 15, highest_version now 16
dnode @00506de4: ver 15, offset a000, dsize 1000
Node at 0050648c is a data node
version 14, highest_version now 16
dnode @0050648c: ver 14, offset 9000, dsize 1000
Node at 00506000 is a data node
version 13, highest_version now 16
dnode @00506000: ver 13, offset 895a, dsize 06a6
Node at 00505dec is a data node
version 21, highest_version now 21
dnode @00505dec: ver 21, offset f000, dsize 0227
Node at 0050546c is a data node
version 20, highest_version now 21
dnode @0050546c: ver 20, offset e000, dsize 1000
Node at 00504bc8 is a data node
version 19, highest_version now 21
dnode @00504bc8: ver 19, offset d000, dsize 1000
Node at 00504280 is a data node
version 18, highest_version now 21
dnode @00504280: ver 18, offset c000, dsize 1000
Node at 00504000 is a data node
version 17, highest_version now 21
dnode @00504000: ver 17, offset bcdb, dsize 0325
Node at 00503df4 is a data node
version 25, highest_version now 25
dnode @00503df4: ver 25, offset 12000, dsize 021c
Node at 00503400 is a data node
version 24, highest_version now 25
dnode @00503400: ver 24, offset 11000, dsize 1000
Node at 00502978 is a data node
version 23, highest_version now 25
dnode @00502978: ver 23, offset 10000, dsize 1000
Node at 00502000 is a data node
version 22, highest_version now 25
dnode @00502000: ver 22, offset f227, dsize 0dd9
Node at 00501994 is a data node
version 29, highest_version now 29
dnode @00501994: ver 29, offset 15000, dsize 0fb3
Node at 00501228 is a data node
version 28, highest_version now 29
dnode @00501228: ver 28, offset 14000, dsize 1000
Node at 005008e4 is a data node
version 27, highest_version now 29
dnode @005008e4: ver 27, offset 13000, dsize 1000
Node at 00500000 is a data node
version 26, highest_version now 29
dnode @00500000: ver 26, offset 1221c, dsize 0de4
Node at 004ff868 is a data node
version 35, highest_version now 35
dnode @004ff868: ver 35, offset 19000, dsize 1000
Node at 004ff0e0 is a data node
version 34, highest_version now 35
dnode @004ff0e0: ver 34, offset 18000, dsize 1000
Node at 004fe8a8 is a data node
version 33, highest_version now 35
dnode @004fe8a8: ver 33, offset 17000, dsize 1000
Node at 004fe0d4 is a data node
version 32, highest_version now 35
dnode @004fe0d4: ver 32, offset 16000, dsize 1000
Node at 004fe08c is a data node
version 31, highest_version now 35
dnode @004fe08c: ver 31, offset 15ffc, dsize 0004
Node at 004fe000 is a data node
version 30, highest_version now 35
dnode @004fe000: ver 30, offset 15fb3, dsize 0049
Node at 004fc99c is a data node
version 37, highest_version now 37
dnode @004fc99c: ver 37, offset 1b000, dsize 07bc
Node at 004fc000 is a data node
version 36, highest_version now 37
dnode @004fc000: ver 36, offset 1a000, dsize 1000
Node at 004cd950 is a data node
version 38, highest_version now 38
dnode @004cd950: ver 38, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d10)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d20)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d50)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d60)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6cf0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d00)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6db0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6dc0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6dd0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d30)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d40)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d70)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d80)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6d90)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6da0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e50)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6de0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6df0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e00)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e10)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6ea0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e20)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e30)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e40)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e60)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e70)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e80)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6e90)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6f10)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6f20)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6eb0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6ec0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6ed0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6ee0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6ef0)
jffs2_add_full_dnode_to_inode(ino #49, f 00e4a900, fn 00ff6f00)
metadata @004cd950: ver 38
Truncating fraglist to 0x0001b7bc bytes
jffs2_read_inode() returning
telnet
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 50
jffs2_do_read_inode(): ino #50 nlink is 1
jffs2_get_inode_nodes(): ino #50
Node at 004fd794 is a data node
version 3, highest_version now 3
dnode @004fd794: ver 3, offset 1000, dsize 0fbb
Node at 004fce64 is a data node
version 2, highest_version now 3
dnode @004fce64: ver 2, offset 0000, dsize 1000
node at 0x004fcdf0 is obsoleted. Ignoring.
Node at 004fbb50 is a data node
version 8, highest_version now 8
dnode @004fbb50: ver 8, offset 5000, dsize 0629
Node at 004fb2e0 is a data node
version 7, highest_version now 8
dnode @004fb2e0: ver 7, offset 4000, dsize 1000
Node at 004fa988 is a data node
version 6, highest_version now 8
dnode @004fa988: ver 6, offset 3000, dsize 1000
Node at 004fa08c is a data node
version 5, highest_version now 8
dnode @004fa08c: ver 5, offset 2000, dsize 1000
Node at 004fa000 is a data node
version 4, highest_version now 8
dnode @004fa000: ver 4, offset 1fbb, dsize 0045
Node at 004f9b68 is a data node
version 12, highest_version now 12
dnode @004f9b68: ver 12, offset 8000, dsize 078d
Node at 004f9108 is a data node
version 11, highest_version now 12
dnode @004f9108: ver 11, offset 7000, dsize 1000
Node at 004f8724 is a data node
version 10, highest_version now 12
dnode @004f8724: ver 10, offset 6000, dsize 1000
Node at 004f8000 is a data node
version 9, highest_version now 12
dnode @004f8000: ver 9, offset 5629, dsize 09d7
Node at 004f76c0 is a data node
version 16, highest_version now 16
dnode @004f76c0: ver 16, offset b000, dsize 01f8
Node at 004f6d5c is a data node
version 15, highest_version now 16
dnode @004f6d5c: ver 15, offset a000, dsize 1000
Node at 004f6478 is a data node
version 14, highest_version now 16
dnode @004f6478: ver 14, offset 9000, dsize 1000
Node at 004f6000 is a data node
version 13, highest_version now 16
dnode @004f6000: ver 13, offset 878d, dsize 0873
Node at 004cd994 is a data node
version 17, highest_version now 17
dnode @004cd994: ver 17, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f40)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f50)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f70)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f80)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f90)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6fa0)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6f30)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff3340)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6fb0)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6fc0)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff6fd0)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff3370)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff3380)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff3390)
jffs2_add_full_dnode_to_inode(ino #50, f 00e4aae0, fn 00ff33a0)
metadata @004cd994: ver 17
Truncating fraglist to 0x0000b1f8 bytes
jffs2_read_inode() returning
telnetd
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 51
jffs2_do_read_inode(): ino #51 nlink is 1
jffs2_get_inode_nodes(): ino #51
Node at 004f788c is a data node
version 2, highest_version now 2
dnode @004f788c: ver 2, offset 0000, dsize 0c06
node at 0x004f781c is obsoleted. Ignoring.
Node at 004f57b4 is a data node
version 6, highest_version now 6
dnode @004f57b4: ver 6, offset 3000, dsize 0baf
Node at 004f4d5c is a data node
version 5, highest_version now 6
dnode @004f4d5c: ver 5, offset 2000, dsize 1000
Node at 004f4308 is a data node
version 4, highest_version now 6
dnode @004f4308: ver 4, offset 1000, dsize 1000
Node at 004f4000 is a data node
version 3, highest_version now 6
dnode @004f4000: ver 3, offset 0c06, dsize 03fa
Node at 004f34cc is a data node
version 10, highest_version now 10
dnode @004f34cc: ver 10, offset 6000, dsize 0ae4
Node at 004f2c7c is a data node
version 9, highest_version now 10
dnode @004f2c7c: ver 9, offset 5000, dsize 1000
Node at 004f235c is a data node
version 8, highest_version now 10
dnode @004f235c: ver 8, offset 4000, dsize 1000
Node at 004f2000 is a data node
version 7, highest_version now 10
dnode @004f2000: ver 7, offset 3baf, dsize 0451
Node at 004cd9d8 is a data node
version 11, highest_version now 11
dnode @004cd9d8: ver 11, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff3350)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff33b0)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff33c0)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff33d0)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff33e0)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff33f0)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff3400)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff3410)
jffs2_add_full_dnode_to_inode(ino #51, f 00e4acc0, fn 00ff3420)
metadata @004cd9d8: ver 11
Truncating fraglist to 0x00006ae4 bytes
jffs2_read_inode() returning
test
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 52
jffs2_do_read_inode(): ino #52 nlink is 1
jffs2_get_inode_nodes(): ino #52
Node at 004f3b5c is a data node
version 2, highest_version now 2
dnode @004f3b5c: ver 2, offset 0000, dsize 05eb
node at 0x004f3ae4 is obsoleted. Ignoring.
Node at 004f1ab8 is a data node
version 6, highest_version now 6
dnode @004f1ab8: ver 6, offset 3000, dsize 0701
Node at 004f1098 is a data node
version 5, highest_version now 6
dnode @004f1098: ver 5, offset 2000, dsize 1000
Node at 004f065c is a data node
version 4, highest_version now 6
dnode @004f065c: ver 4, offset 1000, dsize 1000
Node at 004f0000 is a data node
version 3, highest_version now 6
dnode @004f0000: ver 3, offset 05eb, dsize 0a15
Node at 004efc2c is a data node
version 10, highest_version now 10
dnode @004efc2c: ver 10, offset 6000, dsize 069e
Node at 004ef164 is a data node
version 9, highest_version now 10
dnode @004ef164: ver 9, offset 5000, dsize 1000
Node at 004ee6e0 is a data node
version 8, highest_version now 10
dnode @004ee6e0: ver 8, offset 4000, dsize 1000
Node at 004ee000 is a data node
version 7, highest_version now 10
dnode @004ee000: ver 7, offset 3701, dsize 08ff
Node at 004ed61c is a data node
version 14, highest_version now 14
dnode @004ed61c: ver 14, offset 9000, dsize 1000
Node at 004ecf90 is a data node
version 13, highest_version now 14
dnode @004ecf90: ver 13, offset 8000, dsize 1000
Node at 004ec618 is a data node
version 12, highest_version now 14
dnode @004ec618: ver 12, offset 7000, dsize 1000
Node at 004ec000 is a data node
version 11, highest_version now 14
dnode @004ec000: ver 11, offset 669e, dsize 0962
Node at 004eb50c is a data node
version 17, highest_version now 17
dnode @004eb50c: ver 17, offset c000, dsize 1000
Node at 004eaab8 is a data node
version 16, highest_version now 17
dnode @004eaab8: ver 16, offset b000, dsize 1000
Node at 004ea000 is a data node
version 15, highest_version now 17
dnode @004ea000: ver 15, offset a000, dsize 1000
Node at 004e9b78 is a data node
version 21, highest_version now 21
dnode @004e9b78: ver 21, offset 10000, dsize 0807
Node at 004e91b4 is a data node
version 20, highest_version now 21
dnode @004e91b4: ver 20, offset f000, dsize 1000
Node at 004e8924 is a data node
version 19, highest_version now 21
dnode @004e8924: ver 19, offset e000, dsize 1000
Node at 004e8000 is a data node
version 18, highest_version now 21
dnode @004e8000: ver 18, offset d000, dsize 1000
Node at 004e6438 is a data node
version 23, highest_version now 23
dnode @004e6438: ver 23, offset 11000, dsize 0f44
Node at 004e6000 is a data node
version 22, highest_version now 23
dnode @004e6000: ver 22, offset 10807, dsize 07f9
Node at 004cda1c is a data node
version 24, highest_version now 24
dnode @004cda1c: ver 24, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3460)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34b0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3430)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3440)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3450)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34f0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3480)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3490)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34a0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3530)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34c0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34d0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff34e0)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3500)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3510)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3520)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3560)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3570)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3580)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3590)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3540)
jffs2_add_full_dnode_to_inode(ino #52, f 00e4aea0, fn 00ff3550)
metadata @004cda1c: ver 24
Truncating fraglist to 0x00011f44 bytes
jffs2_read_inode() returning
tinylogin
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 53
jffs2_do_read_inode(): ino #53 nlink is 1
jffs2_get_inode_nodes(): ino #53
Node at 004e77b0 is a data node
version 3, highest_version now 3
dnode @004e77b0: ver 3, offset 1000, dsize 0c1a
Node at 004e6dc8 is a data node
version 2, highest_version now 3
dnode @004e6dc8: ver 2, offset 0000, dsize 1000
node at 0x004e6d54 is obsoleted. Ignoring.
Node at 004e5704 is a data node
version 7, highest_version now 7
dnode @004e5704: ver 7, offset 4000, dsize 0eb5
Node at 004e4cf0 is a data node
version 6, highest_version now 7
dnode @004e4cf0: ver 6, offset 3000, dsize 1000
Node at 004e4274 is a data node
version 5, highest_version now 7
dnode @004e4274: ver 5, offset 2000, dsize 1000
Node at 004e4000 is a data node
version 4, highest_version now 7
dnode @004e4000: ver 4, offset 1c1a, dsize 03e6
Node at 004e3f3c is a data node
version 12, highest_version now 12
dnode @004e3f3c: ver 12, offset 8000, dsize 0080
Node at 004e34b8 is a data node
version 11, highest_version now 12
dnode @004e34b8: ver 11, offset 7000, dsize 1000
Node at 004e2abc is a data node
version 10, highest_version now 12
dnode @004e2abc: ver 10, offset 6000, dsize 1000
Node at 004e2164 is a data node
version 9, highest_version now 12
dnode @004e2164: ver 9, offset 5000, dsize 1000
Node at 004e2000 is a data node
version 8, highest_version now 12
dnode @004e2000: ver 8, offset 4eb5, dsize 014b
Node at 004e1578 is a data node
version 15, highest_version now 15
dnode @004e1578: ver 15, offset a000, dsize 0fd8
Node at 004e0a68 is a data node
version 14, highest_version now 15
dnode @004e0a68: ver 14, offset 9000, dsize 1000
Node at 004e0000 is a data node
version 13, highest_version now 15
dnode @004e0000: ver 13, offset 8080, dsize 0f80
Node at 004dfea4 is a data node
version 20, highest_version now 20
dnode @004dfea4: ver 20, offset e000, dsize 011c
Node at 004df418 is a data node
version 19, highest_version now 20
dnode @004df418: ver 19, offset d000, dsize 1000
Node at 004dea1c is a data node
version 18, highest_version now 20
dnode @004dea1c: ver 18, offset c000, dsize 1000
Node at 004de06c is a data node
version 17, highest_version now 20
dnode @004de06c: ver 17, offset b000, dsize 1000
Node at 004de000 is a data node
version 16, highest_version now 20
dnode @004de000: ver 16, offset afd8, dsize 0028
Node at 004dda34 is a data node
version 24, highest_version now 24
dnode @004dda34: ver 24, offset 11000, dsize 0780
Node at 004dd05c is a data node
version 23, highest_version now 24
dnode @004dd05c: ver 23, offset 10000, dsize 1000
Node at 004dc804 is a data node
version 22, highest_version now 24
dnode @004dc804: ver 22, offset f000, dsize 1000
Node at 004dc000 is a data node
version 21, highest_version now 24
dnode @004dc000: ver 21, offset e11c, dsize 0ee4
Node at 004db608 is a data node
version 28, highest_version now 28
dnode @004db608: ver 28, offset 14000, dsize 0ea7
Node at 004dab94 is a data node
version 27, highest_version now 28
dnode @004dab94: ver 27, offset 13000, dsize 1000
Node at 004da45c is a data node
version 26, highest_version now 28
dnode @004da45c: ver 26, offset 12000, dsize 1000
Node at 004da000 is a data node
version 25, highest_version now 28
dnode @004da000: ver 25, offset 11780, dsize 0880
Node at 004d9e10 is a data node
version 33, highest_version now 33
dnode @004d9e10: ver 33, offset 18000, dsize 0208
Node at 004d94c0 is a data node
version 32, highest_version now 33
dnode @004d94c0: ver 32, offset 17000, dsize 1000
Node at 004d8b38 is a data node
version 31, highest_version now 33
dnode @004d8b38: ver 31, offset 16000, dsize 1000
Node at 004d8184 is a data node
version 30, highest_version now 33
dnode @004d8184: ver 30, offset 15000, dsize 1000
Node at 004d8000 is a data node
version 29, highest_version now 33
dnode @004d8000: ver 29, offset 14ea7, dsize 0159
Node at 004d79f0 is a data node
version 37, highest_version now 37
dnode @004d79f0: ver 37, offset 1b000, dsize 0bf3
Node at 004d7070 is a data node
version 36, highest_version now 37
dnode @004d7070: ver 36, offset 1a000, dsize 1000
Node at 004d67e8 is a data node
version 35, highest_version now 37
dnode @004d67e8: ver 35, offset 19000, dsize 1000
Node at 004d6000 is a data node
version 34, highest_version now 37
dnode @004d6000: ver 34, offset 18208, dsize 0df8
Node at 004d555c is a data node
version 41, highest_version now 41
dnode @004d555c: ver 41, offset 1e000, dsize 0164
Node at 004d4bb4 is a data node
version 40, highest_version now 41
dnode @004d4bb4: ver 40, offset 1d000, dsize 1000
Node at 004d426c is a data node
version 39, highest_version now 41
dnode @004d426c: ver 39, offset 1c000, dsize 1000
Node at 004d4000 is a data node
version 38, highest_version now 41
dnode @004d4000: ver 38, offset 1bbf3, dsize 040d
Node at 004cda60 is a data node
version 42, highest_version now 42
dnode @004cda60: ver 42, offset 0000, dsize 0000
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff35c0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff35d0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3610)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3620)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff35a0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff35b0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3640)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3650)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3660)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff35f0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3600)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36a0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36b0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3630)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36e0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36f0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3670)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3680)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3690)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3720)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3730)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36c0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff36d0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3760)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3770)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3700)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3710)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3790)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37a0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37b0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3740)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3750)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37f0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3800)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3810)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3780)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff3850)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37c0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37d0)
jffs2_add_full_dnode_to_inode(ino #53, f 00e491a0, fn 00ff37e0)
metadata @004cda60: ver 42
Truncating fraglist to 0x0001e164 bytes
jffs2_read_inode() returning
umount
jffs2_lookup()
jffs2_read_inode(): inode->i_ino =3D=3D 54
jffs2_do_read_inode(): ino #54 nlink is 1
jffs2_get_inode_nodes(): ino #54
Node at 004d56e4 is a data node
version 2, highest_version now 2
dnode @004d56e4: ver 2, offset 0000, dsize 0d83
node at 0x004d5674 is obsoleted. Ignoring.
Node at 004d3540 is a data node
version 6, highest_version now 6
dnode @004d3540: ver 6, offset 3000, dsize 1000
Node at 004d2b74 is a data node
version 5, highest_version now 6
dnode @004d2b74: ver 5, offset 2000, dsize 1000
Node at 004d2228 is a data node
version 4, highest_version now 6
dnode @004d2228: ver 4, offset 1000, dsize 1000
Node at 004d2000 is a data node
version 3, highest_version now 6
dnode @004d2000: ver 3, offset 0d83, dsize 027d
Node at 004d1d9c is a data node
version 10, highest_version now 10
dnode @004d1d9c: ver 10, offset 7000, dsize 0314
Node at 004d1358 is a data node
version 9, highest_version now 10
dnode @004d1358: ver 9, offset 6000, dsize 1000
Node at 004d091c is a data node
version 8, highest_version now 10
dnode @004d091c: ver 8, offset 5000, dsize 1000
Node at 004d0000 is a data node
version 7, highest_version now 10
dnode @004d0000: ver 7, offset 4000, dsize 1000
Node at 004cf9b8 is a data node
version 14, highest_version now 14
dnode @004cf9b8: ver 14, offset a000, dsize 0982
Node at 004cf11c is a data node
version 13, highest_version now 14
dnode @004cf11c: ver 13, offset 9000, dsize 1000
Node at 004ce7bc is a data node
version 12, highest_version now 14
dnode @004ce7bc: ver 12, offset 8000, dsize 1000
Node at 004ce000 is a data node
version 11, highest_version now 14
dnode @004ce000: ver 11, offset 7314, dsize 0cec
Node at 004cdaa4 is a data node
version 18, highest_version now 18
dnode @004cdaa4: ver 18, offset 0000, dsize 0000
Node at 004ccb44 is a data node
version 17, highest_version now 18
dnode @004ccb44: ver 17, offset c000, dsize 0be8
Node at 004cc3c0 is a data node
version 16, highest_version now 18
dnode @004cc3c0: ver 16, offset b000, dsize 1000
Node at 004cc000 is a data node
version 15, highest_version now 18
dnode @004cc000: ver 15, offset a982, dsize 067e
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3830)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3870)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3880)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3890)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3820)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38c0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38d0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38e0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3860)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3910)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3920)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38a0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38b0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff3990)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff39a0)
jffs2_add_full_dnode_to_inode(ino #54, f 00e49380, fn 00ff38f0)
metadata @004cdaa4: ver 18
Truncating fraglist to 0x0000cbe8 bytes
jffs2_read_inode() returning
vi
/bin> cp ping po
jffs2_lookup()
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c37d4
jffs2_do_new_inode(): Assigned ino# 66
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1800 bytes at 0x5a800
jffs2_do_create(): reserved 0x1800 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a800, size 0x44
jffs2_write_dnode wrote node at 0x0005a800 with dsize 0x0, csize 0x0, =
node_crc 0
x22623b76, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #66, name_crc =
0xf232053
f)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a844, size 0x2c
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9d20))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x2368
 (mod 0x2368): no
jffs2_create: Created ino #66 with mode 100755, nlink 1(1). nrpages 0
jffs2_do_readpage_nolock(): ino #44, page at offset 0x0
jffs2_read_inode_range: ino #44, range 0x00000000-0x00001000
Reading 0-405 from node at 0x54be98
Node read from 0054be98: node_crc a958b716, calculated CRC a958b716. =
dsize 195,
csize 11e, offset 0, buf 00e47000
Reading 405-4096 from node at 0x548000
Node read from 00548000: node_crc fe5054a5, calculated CRC fe5054a5. =
dsize e6b,
csize 952, offset 195, buf 00e47195
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0x1000
jffs2_read_inode_range: ino #44, range 0x00001000-0x00002000
Reading 4096-8192 from node at 0x548998
Node read from 00548998: node_crc c5e25aa3, calculated CRC c5e25aa3. =
dsize 1000,
 csize 9c4, offset 1000, buf 00e46000
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1790 bytes at 0x5a870
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1521, total_in 4084, =
total_out 2563
calling deflate with avail_in 12, avail_out 1521
deflate returned with avail_in 0, avail_out 1509, total_in 4096, =
total_out 2575
zlib compressed 4096 bytes into 2581
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5a870, size 0xa5c
jffs2_write_dnode wrote node at 0x0005a870 with dsize 0x1000, csize =
0xa15, node_
crc 0x86c5ffba, data_crc 0xa8332e43, totlen 0x00000a59
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3970)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x23ac
 (mod 0x23ac): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0x1000
jffs2_read_inode_range: ino #66, range 0x00001000-0x00002000
Filling non-frag hole from 4096-8192
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x1000, range 0-4080
jffs2_write_inode_range(): Ino #66, ofs 0x1000, len 0xff0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xd34 bytes at 0x5b2cc
calling deflate with avail_in 3300, avail_out 3300
deflate returned with avail_in 0, avail_out 1252, total_in 3300, =
total_out 2048
calling deflate with avail_in 780, avail_out 1252
deflate returned with avail_in 0, avail_out 778, total_in 4080, =
total_out 2522
zlib compressed 4080 bytes into 2528
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5b2cc, size 0xa24
jffs2_write_dnode wrote node at 0x0005b2cc with dsize 0xff0, csize =
0x9e0, node_c
rc 0xc1845feb, data_crc 0x96aad99f, totlen 0x00000a24
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3980)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x23ac
 (mod 0x23ac): no
increasing writtenlen by 4080
jffs2_commit_write() returning 4080
jffs2_do_readpage_nolock(): ino #44, page at offset 0x2000
jffs2_read_inode_range: ino #44, range 0x00002000-0x00003000
Reading 8192-12288 from node at 0x5493a0
Node read from 005493a0: node_crc 4e87d997, calculated CRC 4e87d997. =
dsize 1000,
 csize 9e5, offset 2000, buf 00e41000
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0x3000
jffs2_read_inode_range: ino #44, range 0x00003000-0x00004000
Reading 12288-12925 from node at 0x549dcc
Node read from 00549dcc: node_crc 5d118d99, calculated CRC 5d118d99. =
dsize 27d,
csize 1ec, offset 3000, buf 00e40000
Reading 12925-16384 from node at 0x546000
Node read from 00546000: node_crc afc365b2, calculated CRC afc365b2. =
dsize d83,
csize 7e9, offset 327d, buf 00e4027d
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x1000, range 4080-4096
jffs2_write_inode_range(): Ino #66, ofs 0x1ff0, len 0x10
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x310 bytes at 0x5bcf0
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 4, total_out 4
zlib compressed 4 bytes into 13
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5bcf0, size 0x54
jffs2_write_dnode wrote node at 0x0005bcf0 with dsize 0x10, csize 0x10, =
node_crc
 0xa1438369, data_crc 0x2b59bd0e, totlen 0x00000054
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3960)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x23ac
 (mod 0x23ac): no
increasing writtenlen by 16
jffs2_commit_write() returning 16
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x2000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2bc bytes at 0x5bd44
calling deflate with avail_in 620, avail_out 620
deflate returned with avail_in 0, avail_out 169, total_in 620, total_out =
451
calling deflate with avail_in 169, avail_out 169
deflate returned with avail_in 0, avail_out 30, total_in 789, total_out =
590
calling deflate with avail_in 30, avail_out 30
deflate returned with avail_in 0, avail_out 14, total_in 819, total_out =
606
calling deflate with avail_in 14, avail_out 14
deflate returned with avail_in 0, avail_out 1, total_in 833, total_out =
619
calling deflate with avail_in 1, avail_out 1
deflate returned with avail_in 0, avail_out 0, total_in 834, total_out =
620
zlib compressed 834 bytes into 627
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5bd44, size 0x2b8
jffs2_write_dnode wrote node at 0x0005bd44 with dsize 0x342, csize =
0x273, node_c
rc 0xd8a9db30, data_crc 0x3614f222, totlen 0x000002b7
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3950)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x23ac
 (mod 0x23ac): no
increasing writtenlen by 834
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0005a000 to dirty_list (free 0x00000000, =
dirty 0x00
000554, used 0x00001aac
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x58000
calling deflate with avail_in 3250, avail_out 3250
deflate returned with avail_in 0, avail_out 1272, total_in 3250, =
total_out 1978
calling deflate with avail_in 12, avail_out 1272
deflate returned with avail_in 0, avail_out 1259, total_in 3262, =
total_out 1991
zlib compressed 3262 bytes into 1997
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x58000, size 0x814
jffs2_write_dnode wrote node at 0x00058000 with dsize 0xcbe, csize =
0x7cd, node_c
rc 0x1c807ff0, data_crc 0x403b69f8, totlen 0x00000811
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3940)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x23b0
 (mod 0x23b0): no
increasing writtenlen by 3262
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0x3000
jffs2_read_inode_range: ino #66, range 0x00003000-0x00004000
Filling non-frag hole from 12288-16384
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x3000, range 0-4064
jffs2_write_inode_range(): Ino #66, ofs 0x3000, len 0xfe0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17ec bytes at 0x58814
calling deflate with avail_in 4052, avail_out 4052
deflate returned with avail_in 0, avail_out 1713, total_in 4052, =
total_out 2339
calling deflate with avail_in 12, avail_out 1713
deflate returned with avail_in 0, avail_out 1702, total_in 4064, =
total_out 2350
zlib compressed 4064 bytes into 2356
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x58814, size 0x978
jffs2_write_dnode wrote node at 0x00058814 with dsize 0xfe0, csize =
0x934, node_c
rc 0xcaeba856, data_crc 0xc75b076e, totlen 0x00000978
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3930)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x23b0
 (mod 0x23b0): no
increasing writtenlen by 4064
jffs2_commit_write() returning 4064
jffs2_do_readpage_nolock(): ino #44, page at offset 0x4000
jffs2_read_inode_range: ino #44, range 0x00004000-0x00005000
Reading 16384-20480 from node at 0x546830
Node read from 00546830: node_crc a2f13f87, calculated CRC a2f13f87. =
dsize 1000,
 csize 901, offset 4000, buf 00dbd000
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0x5000
jffs2_read_inode_range: ino #44, range 0x00005000-0x00006000
Reading 20480-24576 from node at 0x547178
Node read from 00547178: node_crc a50b75e2, calculated CRC a50b75e2. =
dsize 1000,
 csize a30, offset 5000, buf 00dbc000
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x3000, range 4064-4096
jffs2_write_inode_range(): Ino #66, ofs 0x3fe0, len 0x20
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe74 bytes at 0x5918c
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 0, total_in 20, total_out 20
zlib compressed 20 bytes into 30
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5918c, size 0x64
jffs2_write_dnode wrote node at 0x0005918c with dsize 0x20, csize 0x20, =
node_crc
 0x8368208d, data_crc 0xdd16497c, totlen 0x00000064
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3b30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x23b0
 (mod 0x23b0): no
increasing writtenlen by 32
jffs2_commit_write() returning 32
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x4000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe10 bytes at 0x591f0
calling deflate with avail_in 3520, avail_out 3520
deflate returned with avail_in 0, avail_out 1591, total_in 3520, =
total_out 1929
calling deflate with avail_in 576, avail_out 1591
deflate returned with avail_in 0, avail_out 1173, total_in 4096, =
total_out 2347
zlib compressed 4096 bytes into 2353
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x591f0, size 0x978
jffs2_write_dnode wrote node at 0x000591f0 with dsize 0x1000, csize =
0x931, node_
crc 0x2765d2ef, data_crc 0x378cb4e6, totlen 0x00000975
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3b20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x23b0
 (mod 0x23b0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0x5000
jffs2_read_inode_range: ino #66, range 0x00005000-0x00006000
Filling non-frag hole from 20480-24576
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x5000, range 0-4048
jffs2_write_inode_range(): Ino #66, ofs 0x5000, len 0xfd0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x498 bytes at 0x59b68
calling deflate with avail_in 1096, avail_out 1096
deflate returned with avail_in 0, avail_out 378, total_in 1096, =
total_out 718
calling deflate with avail_in 378, avail_out 378
deflate returned with avail_in 0, avail_out 114, total_in 1474, =
total_out 982
calling deflate with avail_in 114, avail_out 114
deflate returned with avail_in 0, avail_out 31, total_in 1588, total_out =
1065
calling deflate with avail_in 31, avail_out 31
deflate returned with avail_in 0, avail_out 2, total_in 1619, total_out =
1094
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 1621, total_out =
1096
zlib compressed 1621 bytes into 1104
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x59b68, size 0x494
jffs2_write_dnode wrote node at 0x00059b68 with dsize 0x655, csize =
0x450, node_c
rc 0xb2e8841b, data_crc 0x0da7c2e3, totlen 0x00000494
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3b10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x23b0
 (mod 0x23b0): no
increasing writtenlen by 1621
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00058000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x56000
calling deflate with avail_in 2415, avail_out 2415
deflate returned with avail_in 0, avail_out 823, total_in 2415, =
total_out 1592
calling deflate with avail_in 12, avail_out 823
deflate returned with avail_in 0, avail_out 807, total_in 2427, =
total_out 1608
zlib compressed 2427 bytes into 1614
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x56000, size 0x694
jffs2_write_dnode wrote node at 0x00056000 with dsize 0x97b, csize =
0x64e, node_c
rc 0xbc883cc6, data_crc 0xb1d50ca7, totlen 0x00000692
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3b00)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 2427
jffs2_commit_write() returning 4048
jffs2_do_readpage_nolock(): ino #44, page at offset 0x6000
jffs2_read_inode_range: ino #44, range 0x00006000-0x00007000
Reading 24576-25758 from node at 0x547bec
Node read from 00547bec: node_crc 964b6f9a, calculated CRC 964b6f9a. =
dsize 49e,
csize 3cb, offset 6000, buf 00db8000
Reading 25758-28672 from node at 0x544000
Node read from 00544000: node_crc dd63bcba, calculated CRC dd63bcba. =
dsize b62,
csize 748, offset 649e, buf 00db849e
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0x7000
jffs2_read_inode_range: ino #44, range 0x00007000-0x00008000
Reading 28672-32768 from node at 0x54478c
Node read from 0054478c: node_crc a9f61d4e, calculated CRC a9f61d4e. =
dsize 1000,
 csize 9be, offset 7000, buf 00db7000
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x5000, range 4048-4096
jffs2_write_inode_range(): Ino #66, ofs 0x5fd0, len 0x30
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x196c bytes at 0x56694
calling deflate with avail_in 36, avail_out 36
deflate returned with avail_in 0, avail_out 0, total_in 36, total_out 36
zlib compressed 36 bytes into 46
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x56694, size 0x74
jffs2_write_dnode wrote node at 0x00056694 with dsize 0x30, csize 0x30, =
node_crc
 0xff5f410a, data_crc 0x207ebd84, totlen 0x00000074
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3af0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 48
jffs2_commit_write() returning 48
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x6000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x18f8 bytes at 0x56708
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1427, total_in 4084, =
total_out 2657
calling deflate with avail_in 12, avail_out 1427
deflate returned with avail_in 0, avail_out 1419, total_in 4096, =
total_out 2665
zlib compressed 4096 bytes into 2672
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x56708, size 0xab4
jffs2_write_dnode wrote node at 0x00056708 with dsize 0x1000, csize =
0xa70, node_
crc 0x2236ccbf, data_crc 0xb147881d, totlen 0x00000ab4
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3ae0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0x7000
jffs2_read_inode_range: ino #66, range 0x00007000-0x00008000
Filling non-frag hole from 28672-32768
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x7000, range 0-4032
jffs2_write_inode_range(): Ino #66, ofs 0x7000, len 0xfc0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe44 bytes at 0x571bc
calling deflate with avail_in 3572, avail_out 3572
deflate returned with avail_in 0, avail_out 1388, total_in 3572, =
total_out 2184
calling deflate with avail_in 460, avail_out 1388
deflate returned with avail_in 0, avail_out 1087, total_in 4032, =
total_out 2485
zlib compressed 4032 bytes into 2491
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x571bc, size 0xa00
jffs2_write_dnode wrote node at 0x000571bc with dsize 0xfc0, csize =
0x9bb, node_c
rc 0x8beeba0a, data_crc 0x5f80b18a, totlen 0x000009ff
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3ad0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 4032
jffs2_commit_write() returning 4032
jffs2_do_readpage_nolock(): ino #44, page at offset 0x8000
jffs2_read_inode_range: ino #44, range 0x00008000-0x00009000
Reading 32768-36864 from node at 0x545190
Node read from 00545190: node_crc 523bcd45, calculated CRC 523bcd45. =
dsize 1000,
 csize 9a3, offset 8000, buf 00db4000
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0x9000
jffs2_read_inode_range: ino #44, range 0x00009000-0x0000a000
Reading 36864-38308 from node at 0x545b78
Node read from 00545b78: node_crc 13d42789, calculated CRC 13d42789. =
dsize 5a4,
csize 440, offset 9000, buf 00db3000
Reading 38308-40960 from node at 0x542000
Node read from 00542000: node_crc 5f322d9c, calculated CRC 5f322d9c. =
dsize a5c,
csize 60c, offset 95a4, buf 00db35a4
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x7000, range 4032-4096
jffs2_write_inode_range(): Ino #66, ofs 0x7fc0, len 0x40
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x444 bytes at 0x57bbc
calling deflate with avail_in 52, avail_out 52
deflate returned with avail_in 0, avail_out 0, total_in 52, total_out 52
final deflate returned 0
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x57bbc, size 0x84
jffs2_write_dnode wrote node at 0x00057bbc with dsize 0x40, csize 0x40, =
node_crc
 0xa52e2e58, data_crc 0x8a2ea055, totlen 0x00000084
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3ac0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 64
jffs2_commit_write() returning 64
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x8000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3c0 bytes at 0x57c40
calling deflate with avail_in 880, avail_out 880
deflate returned with avail_in 0, avail_out 247, total_in 880, total_out =
633
calling deflate with avail_in 247, avail_out 247
deflate returned with avail_in 0, avail_out 74, total_in 1127, total_out =
806
calling deflate with avail_in 74, avail_out 74
deflate returned with avail_in 0, avail_out 24, total_in 1201, total_out =
856
calling deflate with avail_in 24, avail_out 24
deflate returned with avail_in 0, avail_out 9, total_in 1225, total_out =
871
calling deflate with avail_in 9, avail_out 9
deflate returned with avail_in 0, avail_out 0, total_in 1234, total_out =
880
zlib compressed 1234 bytes into 886
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x57c40, size 0x3bc
jffs2_write_dnode wrote node at 0x00057c40 with dsize 0x4d2, csize =
0x376, node_c
rc 0x07dc0db2, data_crc 0xbe12f11b, totlen 0x000003ba
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3ab0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x23b4
 (mod 0x23b4): no
increasing writtenlen by 1234
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00056000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x54000
calling deflate with avail_in 2850, avail_out 2850
deflate returned with avail_in 0, avail_out 1177, total_in 2850, =
total_out 1673
calling deflate with avail_in 12, avail_out 1177
deflate returned with avail_in 0, avail_out 1164, total_in 2862, =
total_out 1686
zlib compressed 2862 bytes into 1692
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x54000, size 0x6e0
jffs2_write_dnode wrote node at 0x00054000 with dsize 0xb2e, csize =
0x69c, node_c
rc 0x5626e723, data_crc 0x68a092d4, totlen 0x000006e0
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3aa0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x23b8
 (mod 0x23b8): no
increasing writtenlen by 2862
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0x9000
jffs2_read_inode_range: ino #66, range 0x00009000-0x0000a000
Filling non-frag hole from 36864-40960
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x9000, range 0-4016
jffs2_write_inode_range(): Ino #66, ofs 0x9000, len 0xfb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1920 bytes at 0x546e0
calling deflate with avail_in 4004, avail_out 4004
deflate returned with avail_in 0, avail_out 1616, total_in 4004, =
total_out 2388
calling deflate with avail_in 12, avail_out 1616
deflate returned with avail_in 0, avail_out 1608, total_in 4016, =
total_out 2396
zlib compressed 4016 bytes into 2402
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x546e0, size 0x9a8
jffs2_write_dnode wrote node at 0x000546e0 with dsize 0xfb0, csize =
0x962, node_c
rc 0x721aa5f6, data_crc 0xeca6b857, totlen 0x000009a6
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a90)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x23b8
 (mod 0x23b8): no
increasing writtenlen by 4016
jffs2_commit_write() returning 4016
jffs2_do_readpage_nolock(): ino #44, page at offset 0xa000
jffs2_read_inode_range: ino #44, range 0x0000a000-0x0000b000
Reading 40960-45056 from node at 0x542650
Node read from 00542650: node_crc 2e4bf38c, calculated CRC 2e4bf38c. =
dsize 1000,
 csize 814, offset a000, buf 00db0000
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0xb000
jffs2_read_inode_range: ino #44, range 0x0000b000-0x0000c000
Reading 45056-49152 from node at 0x542ea8
Node read from 00542ea8: node_crc de6bf961, calculated CRC de6bf961. =
dsize 1000,
 csize 803, offset b000, buf 00daf000
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0x9000, range 4016-4096
jffs2_write_inode_range(): Ino #66, ofs 0x9fb0, len 0x50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf78 bytes at 0x55088
calling deflate with avail_in 68, avail_out 68
deflate returned with avail_in 0, avail_out 5, total_in 68, total_out 63
calling deflate with avail_in 5, avail_out 5
deflate returned with avail_in 0, avail_out 0, total_in 73, total_out 68
zlib compressed 73 bytes into 75
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x55088, size 0x94
jffs2_write_dnode wrote node at 0x00055088 with dsize 0x50, csize 0x50, =
node_crc
 0x09a9e3e9, data_crc 0xe96d40de, totlen 0x00000094
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a80)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x23b8
 (mod 0x23b8): no
increasing writtenlen by 80
jffs2_commit_write() returning 80
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0xa000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xee4 bytes at 0x5511c
calling deflate with avail_in 3732, avail_out 3732
deflate returned with avail_in 0, avail_out 1826, total_in 3732, =
total_out 1906
calling deflate with avail_in 364, avail_out 1826
deflate returned with avail_in 0, avail_out 1642, total_in 4096, =
total_out 2090
zlib compressed 4096 bytes into 2096
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5511c, size 0x874
jffs2_write_dnode wrote node at 0x0005511c with dsize 0x1000, csize =
0x830, node_
crc 0x81c7b015, data_crc 0xc876e28e, totlen 0x00000874
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a70)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x23b8
 (mod 0x23b8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0xb000
jffs2_read_inode_range: ino #66, range 0x0000b000-0x0000c000
Filling non-frag hole from 45056-49152
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0xb000, range 0-4000
jffs2_write_inode_range(): Ino #66, ofs 0xb000, len 0xfa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x670 bytes at 0x55990
calling deflate with avail_in 1568, avail_out 1568
deflate returned with avail_in 0, avail_out 692, total_in 1568, =
total_out 876
calling deflate with avail_in 692, avail_out 692
deflate returned with avail_in 0, avail_out 369, total_in 2260, =
total_out 1199
calling deflate with avail_in 369, avail_out 369
deflate returned with avail_in 0, avail_out 179, total_in 2629, =
total_out 1389
calling deflate with avail_in 179, avail_out 179
deflate returned with avail_in 0, avail_out 55, total_in 2808, total_out =
1513
calling deflate with avail_in 55, avail_out 55
deflate returned with avail_in 0, avail_out 16, total_in 2863, total_out =
1552
calling deflate with avail_in 16, avail_out 16
deflate returned with avail_in 0, avail_out 2, total_in 2879, total_out =
1566
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 2881, total_out =
1568
zlib compressed 2881 bytes into 1576
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x55990, size 0x66c
jffs2_write_dnode wrote node at 0x00055990 with dsize 0xb41, csize =
0x628, node_c
rc 0x22c08f4b, data_crc 0x554c51aa, totlen 0x0000066c
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a60)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x23b8
 (mod 0x23b8): no
increasing writtenlen by 2881
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00054000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x52000
calling deflate with avail_in 1107, avail_out 1107
deflate returned with avail_in 0, avail_out 521, total_in 1107, =
total_out 586
calling deflate with avail_in 12, avail_out 521
deflate returned with avail_in 0, avail_out 509, total_in 1119, =
total_out 598
zlib compressed 1119 bytes into 604
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x52000, size 0x2a0
jffs2_write_dnode wrote node at 0x00052000 with dsize 0x45f, csize =
0x25c, node_c
rc 0x65ef2b51, data_crc 0x9e676315, totlen 0x000002a0
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a50)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x23bc
 (mod 0x23bc): no
increasing writtenlen by 1119
jffs2_commit_write() returning 4000
jffs2_do_readpage_nolock(): ino #44, page at offset 0xc000
jffs2_read_inode_range: ino #44, range 0x0000c000-0x0000d000
Reading 49152-53248 from node at 0x5436f0
Node read from 005436f0: node_crc a1003565, calculated CRC a1003565. =
dsize 1000,
 csize 80d, offset c000, buf 00dac000
readpage finished
jffs2_do_readpage_nolock(): ino #44, page at offset 0xd000
jffs2_read_inode_range: ino #44, range 0x0000d000-0x0000e000
Reading 53248-54960 from node at 0x540000
Node read from 00540000: node_crc 17f0e8c8, calculated CRC 17f0e8c8. =
dsize 6b0,
csize 3d0, offset d000, buf 00dab000
Filling non-frag hole from 54960-57344
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0xb000, range 4000-4096
jffs2_write_inode_range(): Ino #66, ofs 0xbfa0, len 0x60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1d60 bytes at 0x522a0
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 17, total_in 84, total_out =
67
calling deflate with avail_in 12, avail_out 17
deflate returned with avail_in 0, avail_out 2, total_in 96, total_out 82
zlib compressed 96 bytes into 88
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x522a0, size 0x9c
jffs2_write_dnode wrote node at 0x000522a0 with dsize 0x60, csize 0x58, =
node_crc
 0x714b1c24, data_crc 0x2f4382ec, totlen 0x0000009c
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a40)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x23bc
 (mod 0x23bc): no
increasing writtenlen by 96
jffs2_commit_write() returning 96
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #66, page at 0xc000, range 0-4096
jffs2_write_inode_range(): Ino #66, ofs 0xc000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1cc4 bytes at 0x5233c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1971, total_in 4084, =
total_out 2113
calling deflate with avail_in 12, avail_out 1971
deflate returned with avail_in 0, avail_out 1960, total_in 4096, =
total_out 2124
zlib compressed 4096 bytes into 2130
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5233c, size 0x898
jffs2_write_dnode wrote node at 0x0005233c with dsize 0x1000, csize =
0x852, node_
crc 0x3d0a47a2, data_crc 0x177ca30e, totlen 0x00000896
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x23bc
 (mod 0x23bc): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #66, page at offset 0xd000
jffs2_read_inode_range: ino #66, range 0x0000d000-0x0000e000
Filling non-frag hole from 53248-57344
readpage finished
end prepare_write()
jffs2_commit_write(): ino #66, page at 0xd000, range 0-1712
jffs2_write_inode_range(): Ino #66, ofs 0xd000, len 0x6b0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x142c bytes at 0x52bd4
calling deflate with avail_in 1700, avail_out 1700
deflate returned with avail_in 0, avail_out 742, total_in 1700, =
total_out 958
calling deflate with avail_in 12, avail_out 742
deflate returned with avail_in 0, avail_out 730, total_in 1712, =
total_out 970
zlib compressed 1712 bytes into 976
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x52bd4, size 0x414
jffs2_write_dnode wrote node at 0x00052bd4 with dsize 0x6b0, csize =
0x3d0, node_c
rc 0xc5155f72, data_crc 0x902f3d51, totlen 0x00000414
jffs2_add_full_dnode_to_inode(ino #66, f 00e49560, fn 00ff3a20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x23bc
 (mod 0x23bc): no
increasing writtenlen by 1712
jffs2_commit_write() returning 1712
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/bin> rm po
jffs2_lookup()
jffs2_reserve_space(): Requested 0x2c bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1000 bytes at 0x53000
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #0, name_crc =
0xf232053f
)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x53000, size 0x2c
jffs2_add_fd_to_list( 001b9ac0, 00fef920 (->001b9b20))
Marking old dirent node (ino #66) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x23e8
 (mod 0x23e8): no
jffs2_clear_inode(): ino #66 mode 100755
Eraseblock at 0x0005a000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00058000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00058000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00056000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00056000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00054000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00054000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x00058000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00056000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00054000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list

/bin> cjffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 3, =
dirty_size 0xab50
 (mod 0xab50): no
Starting erase of pending block 0x00058000
Freeing all node refs for eraseblock offset 0x00058000
Removed nodes in range 0x00058000-0x0005a000 from ino #66
pErase completed successfully at 0x00058000
Starting erase of pending block 0x00056000
Freeing all node refs for eraseblock offset 0x00056000
Removed nodes in range 0x00056000-0x00058000 from ino #66
Erase completed successfully at 0x00056000
Starting erase of pending block 0x00054000
Freeing all node refs for eraseblock offset 0x00054000
Removed nodes in range 0x00054000-0x00056000 from ino #66
 Erase completed successfully at 0x00054000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00058000
Writing erased marker to block at 0x00058000
Verifying erase at 0x00056000
Writing erased marker to block at 0x00056000
Verifying erase at 0x00054000
Writing erased marker to block at 0x00054000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x4b50
 (mod 0x4b50): no
jffs2_erase_pending_blocks completed

usage: cp srcname ... destname
/bin> cp ping po
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c37e8
jffs2_do_new_inode(): Assigned ino# 67
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe00 bytes at 0x53200
jffs2_do_create(): reserved 0xe00 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x53200, size 0x44
jffs2_write_dnode wrote node at 0x00053200 with dsize 0x0, csize 0x0, =
node_crc 0
x1913b8cc, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #67, name_crc =
0xf232053
f)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x53244, size 0x2c
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9ac0))
Marking old dirent node (ino #0) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x4b7c
 (mod 0x4b7c): no
jffs2_create: Created ino #67 with mode 100755, nlink 1(1). nrpages 0
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xd90 bytes at 0x53270
calling deflate with avail_in 3392, avail_out 3392
deflate returned with avail_in 0, avail_out 1295, total_in 3392, =
total_out 2097
calling deflate with avail_in 704, avail_out 1295
deflate returned with avail_in 0, avail_out 760, total_in 4096, =
total_out 2632
zlib compressed 4096 bytes into 2638
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x53270, size 0xa94
jffs2_write_dnode wrote node at 0x00053270 with dsize 0x1000, csize =
0xa4e, node_
crc 0xf05d8202, data_crc 0x470cee20, totlen 0x00000a92
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x4bc0
 (mod 0x4bc0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0x1000
jffs2_read_inode_range: ino #67, range 0x00001000-0x00002000
Filling non-frag hole from 4096-8192
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x1000, range 0-4080
jffs2_write_inode_range(): Ino #67, ofs 0x1000, len 0xff0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2fc bytes at 0x53d04
calling deflate with avail_in 684, avail_out 684
deflate returned with avail_in 0, avail_out 197, total_in 684, total_out =
487
calling deflate with avail_in 197, avail_out 197
deflate returned with avail_in 0, avail_out 61, total_in 881, total_out =
623
calling deflate with avail_in 61, avail_out 61
deflate returned with avail_in 0, avail_out 4, total_in 942, total_out =
680
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 946, total_out =
684
zlib compressed 946 bytes into 691
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x53d04, size 0x2f8
jffs2_write_dnode wrote node at 0x00053d04 with dsize 0x3b2, csize =
0x2b3, node_c
rc 0x2fb76fc9, data_crc 0xd2cf9900, totlen 0x000002f7
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x4bc0
 (mod 0x4bc0): no
increasing writtenlen by 946
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00052000 to very_dirty_list (free =
0x00000000, dirty
 0x00001248, used 0x00000db8
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x50000
calling deflate with avail_in 3122, avail_out 3122
deflate returned with avail_in 0, avail_out 1209, total_in 3122, =
total_out 1913
calling deflate with avail_in 12, avail_out 1209
deflate returned with avail_in 0, avail_out 1196, total_in 3134, =
total_out 1926
zlib compressed 3134 bytes into 1932
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x50000, size 0x7d0
jffs2_write_dnode wrote node at 0x00050000 with dsize 0xc3e, csize =
0x78c, node_c
rc 0x266197dc, data_crc 0x6f4c70e1, totlen 0x000007d0
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a40)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 3134
jffs2_commit_write() returning 4080
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x1000, range 4080-4096
jffs2_write_inode_range(): Ino #67, ofs 0x1ff0, len 0x10
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1830 bytes at 0x507d0
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 4, total_out 4
zlib compressed 4 bytes into 13
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x507d0, size 0x54
jffs2_write_dnode wrote node at 0x000507d0 with dsize 0x10, csize 0x10, =
node_crc
 0xa0847808, data_crc 0x2b59bd0e, totlen 0x00000054
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a50)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 16
jffs2_commit_write() returning 16
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x2000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17dc bytes at 0x50824
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1622, total_in 4084, =
total_out 2462
calling deflate with avail_in 12, avail_out 1622
deflate returned with avail_in 0, avail_out 1609, total_in 4096, =
total_out 2475
zlib compressed 4096 bytes into 2481
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x50824, size 0x9f8
jffs2_write_dnode wrote node at 0x00050824 with dsize 0x1000, csize =
0x9b1, node_
crc 0x68d116a8, data_crc 0xa21a4161, totlen 0x000009f5
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a60)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0x3000
jffs2_read_inode_range: ino #67, range 0x00003000-0x00004000
Filling non-frag hole from 12288-16384
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x3000, range 0-4064
jffs2_write_inode_range(): Ino #67, ofs 0x3000, len 0xfe0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xde4 bytes at 0x5121c
calling deflate with avail_in 3476, avail_out 3476
deflate returned with avail_in 0, avail_out 1427, total_in 3476, =
total_out 2049
calling deflate with avail_in 588, avail_out 1427
deflate returned with avail_in 0, avail_out 1083, total_in 4064, =
total_out 2393
zlib compressed 4064 bytes into 2399
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x5121c, size 0x9a4
jffs2_write_dnode wrote node at 0x0005121c with dsize 0xfe0, csize =
0x95f, node_c
rc 0x4fed65b4, data_crc 0xabc40455, totlen 0x000009a3
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a70)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 4064
jffs2_commit_write() returning 4064
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x3000, range 4064-4096
jffs2_write_inode_range(): Ino #67, ofs 0x3fe0, len 0x20
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x440 bytes at 0x51bc0
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 0, total_in 20, total_out 20
zlib compressed 20 bytes into 30
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x51bc0, size 0x64
jffs2_write_dnode wrote node at 0x00051bc0 with dsize 0x20, csize 0x20, =
node_crc
 0xba598615, data_crc 0xdd16497c, totlen 0x00000064
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a80)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 32
jffs2_commit_write() returning 32
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x4000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3dc bytes at 0x51c24
calling deflate with avail_in 908, avail_out 908
deflate returned with avail_in 0, avail_out 227, total_in 908, total_out =
681
calling deflate with avail_in 227, avail_out 227
deflate returned with avail_in 0, avail_out 43, total_in 1135, total_out =
865
calling deflate with avail_in 43, avail_out 43
deflate returned with avail_in 0, avail_out 11, total_in 1178, total_out =
897
calling deflate with avail_in 11, avail_out 11
deflate returned with avail_in 0, avail_out 2, total_in 1189, total_out =
906
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 1191, total_out =
908
zlib compressed 1191 bytes into 915
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x51c24, size 0x3d8
jffs2_write_dnode wrote node at 0x00051c24 with dsize 0x4a7, csize =
0x393, node_c
rc 0x3277a4d0, data_crc 0xa7513ab4, totlen 0x000003d7
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3a90)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x4bc4
 (mod 0x4bc4): no
increasing writtenlen by 1191
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00050000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x4e000
calling deflate with avail_in 2893, avail_out 2893
deflate returned with avail_in 0, avail_out 1369, total_in 2893, =
total_out 1524
calling deflate with avail_in 12, avail_out 1369
deflate returned with avail_in 0, avail_out 1359, total_in 2905, =
total_out 1534
zlib compressed 2905 bytes into 1541
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4e000, size 0x64c
jffs2_write_dnode wrote node at 0x0004e000 with dsize 0xb59, csize =
0x605, node_c
rc 0x23598c9d, data_crc 0x59b5f627, totlen 0x00000649
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3aa0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x4bc8
 (mod 0x4bc8): no
increasing writtenlen by 2905
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0x5000
jffs2_read_inode_range: ino #67, range 0x00005000-0x00006000
Filling non-frag hole from 20480-24576
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x5000, range 0-4048
jffs2_write_inode_range(): Ino #67, ofs 0x5000, len 0xfd0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x19b4 bytes at 0x4e64c
calling deflate with avail_in 4036, avail_out 4036
deflate returned with avail_in 0, avail_out 1527, total_in 4036, =
total_out 2509
calling deflate with avail_in 12, avail_out 1527
deflate returned with avail_in 0, avail_out 1512, total_in 4048, =
total_out 2524
zlib compressed 4048 bytes into 2530
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4e64c, size 0xa28
jffs2_write_dnode wrote node at 0x0004e64c with dsize 0xfd0, csize =
0x9e2, node_c
rc 0xbbe5fad6, data_crc 0x0fb746f5, totlen 0x00000a26
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3ab0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x4bc8
 (mod 0x4bc8): no
increasing writtenlen by 4048
jffs2_commit_write() returning 4048
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x5000, range 4048-4096
jffs2_write_inode_range(): Ino #67, ofs 0x5fd0, len 0x30
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf8c bytes at 0x4f074
calling deflate with avail_in 36, avail_out 36
deflate returned with avail_in 0, avail_out 0, total_in 36, total_out 36
zlib compressed 36 bytes into 46
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4f074, size 0x74
jffs2_write_dnode wrote node at 0x0004f074 with dsize 0x30, csize 0x30, =
node_crc
 0xe75266e0, data_crc 0x207ebd84, totlen 0x00000074
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3ac0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x4bc8
 (mod 0x4bc8): no
increasing writtenlen by 48
jffs2_commit_write() returning 48
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x6000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf18 bytes at 0x4f0e8
calling deflate with avail_in 3784, avail_out 3784
deflate returned with avail_in 0, avail_out 1289, total_in 3784, =
total_out 2495
calling deflate with avail_in 312, avail_out 1289
deflate returned with avail_in 0, avail_out 1087, total_in 4096, =
total_out 2697
zlib compressed 4096 bytes into 2703
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4f0e8, size 0xad4
jffs2_write_dnode wrote node at 0x0004f0e8 with dsize 0x1000, csize =
0xa8f, node_
crc 0x0c229a30, data_crc 0xb3466ed9, totlen 0x00000ad3
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3ad0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x4bc8
 (mod 0x4bc8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0x7000
jffs2_read_inode_range: ino #67, range 0x00007000-0x00008000
Filling non-frag hole from 28672-32768
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x7000, range 0-4032
jffs2_write_inode_range(): Ino #67, ofs 0x7000, len 0xfc0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x444 bytes at 0x4fbbc
calling deflate with avail_in 1012, avail_out 1012
deflate returned with avail_in 0, avail_out 260, total_in 1012, =
total_out 752
calling deflate with avail_in 260, avail_out 260
deflate returned with avail_in 0, avail_out 80, total_in 1272, total_out =
932
calling deflate with avail_in 80, avail_out 80
deflate returned with avail_in 0, avail_out 12, total_in 1352, total_out =
1000
calling deflate with avail_in 12, avail_out 12
deflate returned with avail_in 0, avail_out 0, total_in 1364, total_out =
1012
zlib compressed 1364 bytes into 1018
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4fbbc, size 0x440
jffs2_write_dnode wrote node at 0x0004fbbc with dsize 0x554, csize =
0x3fa, node_c
rc 0x39d84f1f, data_crc 0xf8611409, totlen 0x0000043e
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3ae0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x4bc8
 (mod 0x4bc8): no
increasing writtenlen by 1364
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0004e000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x4c000
calling deflate with avail_in 2656, avail_out 2656
deflate returned with avail_in 0, avail_out 1081, total_in 2656, =
total_out 1575
calling deflate with avail_in 12, avail_out 1081
deflate returned with avail_in 0, avail_out 1068, total_in 2668, =
total_out 1588
zlib compressed 2668 bytes into 1594
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4c000, size 0x680
jffs2_write_dnode wrote node at 0x0004c000 with dsize 0xa6c, csize =
0x63a, node_c
rc 0x516495c7, data_crc 0x3589c420, totlen 0x0000067e
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3af0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 2668
jffs2_commit_write() returning 4032
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x7000, range 4032-4096
jffs2_write_inode_range(): Ino #67, ofs 0x7fc0, len 0x40
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1980 bytes at 0x4c680
calling deflate with avail_in 52, avail_out 52
deflate returned with avail_in 0, avail_out 0, total_in 52, total_out 52
final deflate returned 0
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4c680, size 0x84
jffs2_write_dnode wrote node at 0x0004c680 with dsize 0x40, csize 0x40, =
node_crc
 0x0fe7685c, data_crc 0x8a2ea055, totlen 0x00000084
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3b00)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 64
jffs2_commit_write() returning 64
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x8000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x18fc bytes at 0x4c704
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1669, total_in 4084, =
total_out 2415
calling deflate with avail_in 12, avail_out 1669
deflate returned with avail_in 0, avail_out 1656, total_in 4096, =
total_out 2428
zlib compressed 4096 bytes into 2434
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4c704, size 0x9c8
jffs2_write_dnode wrote node at 0x0004c704 with dsize 0x1000, csize =
0x982, node_
crc 0x099b565f, data_crc 0xc3cded4c, totlen 0x000009c6
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3b10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0x9000
jffs2_read_inode_range: ino #67, range 0x00009000-0x0000a000
Filling non-frag hole from 36864-40960
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x9000, range 0-4016
jffs2_write_inode_range(): Ino #67, ofs 0x9000, len 0xfb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf34 bytes at 0x4d0cc
calling deflate with avail_in 3812, avail_out 3812
deflate returned with avail_in 0, avail_out 1468, total_in 3812, =
total_out 2344
calling deflate with avail_in 204, avail_out 1468
deflate returned with avail_in 0, avail_out 1419, total_in 4016, =
total_out 2393
zlib compressed 4016 bytes into 2399
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4d0cc, size 0x9a4
jffs2_write_dnode wrote node at 0x0004d0cc with dsize 0xfb0, csize =
0x95f, node_c
rc 0xc1ad3484, data_crc 0x58bfd47b, totlen 0x000009a3
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3b20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 4016
jffs2_commit_write() returning 4016
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0x9000, range 4016-4096
jffs2_write_inode_range(): Ino #67, ofs 0x9fb0, len 0x50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x590 bytes at 0x4da70
calling deflate with avail_in 68, avail_out 68
deflate returned with avail_in 0, avail_out 5, total_in 68, total_out 63
calling deflate with avail_in 5, avail_out 5
deflate returned with avail_in 0, avail_out 0, total_in 73, total_out 68
zlib compressed 73 bytes into 75
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4da70, size 0x94
jffs2_write_dnode wrote node at 0x0004da70 with dsize 0x50, csize 0x50, =
node_crc
 0x30984571, data_crc 0xe96d40de, totlen 0x00000094
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3b30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 80
jffs2_commit_write() returning 80
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0xa000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x4fc bytes at 0x4db04
calling deflate with avail_in 1196, avail_out 1196
deflate returned with avail_in 0, avail_out 470, total_in 1196, =
total_out 726
calling deflate with avail_in 470, avail_out 470
deflate returned with avail_in 0, avail_out 127, total_in 1666, =
total_out 1069
calling deflate with avail_in 127, avail_out 127
deflate returned with avail_in 0, avail_out 15, total_in 1793, total_out =
1181
calling deflate with avail_in 15, avail_out 15
deflate returned with avail_in 0, avail_out 2, total_in 1808, total_out =
1194
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 1810, total_out =
1196
zlib compressed 1810 bytes into 1203
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4db04, size 0x4f8
jffs2_write_dnode wrote node at 0x0004db04 with dsize 0x712, csize =
0x4b3, node_c
rc 0xda07d997, data_crc 0x7ac88dab, totlen 0x000004f7
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3930)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x4bcc
 (mod 0x4bcc): no
increasing writtenlen by 1810
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0004c000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x4a000
calling deflate with avail_in 2274, avail_out 2274
deflate returned with avail_in 0, avail_out 1188, total_in 2274, =
total_out 1086
calling deflate with avail_in 12, avail_out 1188
deflate returned with avail_in 0, avail_out 1181, total_in 2286, =
total_out 1093
zlib compressed 2286 bytes into 1099
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4a000, size 0x490
jffs2_write_dnode wrote node at 0x0004a000 with dsize 0x8ee, csize =
0x44b, node_c
rc 0xf5f168cf, data_crc 0x201751a0, totlen 0x0000048f
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3940)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bd0
 (mod 0x4bd0): no
increasing writtenlen by 2286
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0xb000
jffs2_read_inode_range: ino #67, range 0x0000b000-0x0000c000
Filling non-frag hole from 45056-49152
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0xb000, range 0-4000
jffs2_write_inode_range(): Ino #67, ofs 0xb000, len 0xfa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1b70 bytes at 0x4a490
calling deflate with avail_in 3988, avail_out 3988
deflate returned with avail_in 0, avail_out 1974, total_in 3988, =
total_out 2014
calling deflate with avail_in 12, avail_out 1974
deflate returned with avail_in 0, avail_out 1967, total_in 4000, =
total_out 2021
zlib compressed 4000 bytes into 2027
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4a490, size 0x830
jffs2_write_dnode wrote node at 0x0004a490 with dsize 0xfa0, csize =
0x7eb, node_c
rc 0xb0e68437, data_crc 0x9d8dffc5, totlen 0x0000082f
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3950)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bd0
 (mod 0x4bd0): no
increasing writtenlen by 4000
jffs2_commit_write() returning 4000
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0xb000, range 4000-4096
jffs2_write_inode_range(): Ino #67, ofs 0xbfa0, len 0x60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1340 bytes at 0x4acc0
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 17, total_in 84, total_out =
67
calling deflate with avail_in 12, avail_out 17
deflate returned with avail_in 0, avail_out 2, total_in 96, total_out 82
zlib compressed 96 bytes into 88
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4acc0, size 0x9c
jffs2_write_dnode wrote node at 0x0004acc0 with dsize 0x60, csize 0x58, =
node_crc
 0x4a3a9f9e, data_crc 0x2f4382ec, totlen 0x0000009c
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3960)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bd0
 (mod 0x4bd0): no
increasing writtenlen by 96
jffs2_commit_write() returning 96
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #67, page at 0xc000, range 0-4096
jffs2_write_inode_range(): Ino #67, ofs 0xc000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x12a4 bytes at 0x4ad5c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1971, total_in 4084, =
total_out 2113
calling deflate with avail_in 12, avail_out 1971
deflate returned with avail_in 0, avail_out 1960, total_in 4096, =
total_out 2124
zlib compressed 4096 bytes into 2130
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4ad5c, size 0x898
jffs2_write_dnode wrote node at 0x0004ad5c with dsize 0x1000, csize =
0x852, node_
crc 0xe38c6764, data_crc 0x177ca30e, totlen 0x00000896
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3980)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bd0
 (mod 0x4bd0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #67, page at offset 0xd000
jffs2_read_inode_range: ino #67, range 0x0000d000-0x0000e000
Filling non-frag hole from 53248-57344
readpage finished
end prepare_write()
jffs2_commit_write(): ino #67, page at 0xd000, range 0-1712
jffs2_write_inode_range(): Ino #67, ofs 0xd000, len 0x6b0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xa0c bytes at 0x4b5f4
calling deflate with avail_in 1700, avail_out 1700
deflate returned with avail_in 0, avail_out 742, total_in 1700, =
total_out 958
calling deflate with avail_in 12, avail_out 742
deflate returned with avail_in 0, avail_out 730, total_in 1712, =
total_out 970
zlib compressed 1712 bytes into 976
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4b5f4, size 0x414
jffs2_write_dnode wrote node at 0x0004b5f4 with dsize 0x6b0, csize =
0x3d0, node_c
rc 0x1b937fb4, data_crc 0x902f3d51, totlen 0x00000414
jffs2_add_full_dnode_to_inode(ino #67, f 00e49560, fn 00ff3970)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bd0
 (mod 0x4bd0): no
increasing writtenlen by 1712
jffs2_commit_write() returning 1712
/bin>
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/bin> rm po
jffs2_reserve_space(): Requested 0x2c bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x400 bytes at 0x4bc00
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #0, name_crc =
0xf232053f
)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4bc00, size 0x2c
jffs2_add_fd_to_list( 001b9ac0, 00fef920 (->001b9b20))
Marking old dirent node (ino #67) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x4bfc
 (mod 0x4bfc): no
jffs2_clear_inode(): ino #67 mode 100755
Eraseblock at 0x00052000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00050000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00050000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0004e000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0004e000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0004c000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0004c000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x00052000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00050000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0004e000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0004c000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list

/bin> jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 4, =
dirty_size 0xd384
 (mod 0xd384): no
Starting erase of pending block 0x00052000
Freeing all node refs for eraseblock offset 0x00052000
Removed nodes in range 0x00052000-0x00054000 from ino #66
Removed nodes in range 0x00052000-0x00054000 from ino #2
Removed nodes in range 0x00052000-0x00054000 from ino #67
Erase completed successfully at 0x00052000
Starting erase of pending block 0x00050000
Freeing all node refs for eraseblock offset 0x00050000
Removed nodes in range 0x00050000-0x00052000 from ino #67
Erase completed successfully at 0x00050000
Starting erase of pending block 0x0004e000
Freeing all node refs for eraseblock offset 0x0004e000
Removed nodes in range 0x0004e000-0x00050000 from ino #67
Erase completed successfully at 0x0004e000
Starting erase of pending block 0x0004c000
Freeing all node refs for eraseblock offset 0x0004c000
Removed nodes in range 0x0004c000-0x0004e000 from ino #67
Erase completed successfully at 0x0004c000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00052000
Writing erased marker to block at 0x00052000
Verifying erase at 0x00050000
Writing erased marker to block at 0x00050000
Verifying erase at 0x0004e000
Writing erased marker to block at 0x0004e000
Verifying erase at 0x0004c000
Writing erased marker to block at 0x0004c000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x5384
 (mod 0x5384): no
jffs2_erase_pending_blocks completed

/bin>
/bin> rm po
po: No such file or directory
/bin> cp ping po
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c37fc
jffs2_do_new_inode(): Assigned ino# 68
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x200 bytes at 0x4be00
jffs2_do_create(): reserved 0x200 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4be00, size 0x44
jffs2_write_dnode wrote node at 0x0004be00 with dsize 0x0, csize 0x0, =
node_crc 0
xe03f8d96, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #68, name_crc =
0xf232053
f)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4be44, size 0x2c
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9ac0))
Marking old dirent node (ino #0) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x53b0
 (mod 0x53b0): no
jffs2_create: Created ino #68 with mode 100755, nlink 1(1). nrpages 0
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x190 bytes at 0x4be70
calling deflate with avail_in 320, avail_out 320
deflate returned with avail_in 0, avail_out 80, total_in 320, total_out =
240
calling deflate with avail_in 80, avail_out 80
deflate returned with avail_in 0, avail_out 57, total_in 400, total_out =
263
calling deflate with avail_in 57, avail_out 57
deflate returned with avail_in 0, avail_out 22, total_in 457, total_out =
298
calling deflate with avail_in 22, avail_out 22
deflate returned with avail_in 0, avail_out 6, total_in 479, total_out =
314
calling deflate with avail_in 6, avail_out 6
deflate returned with avail_in 0, avail_out 0, total_in 485, total_out =
320
zlib compressed 485 bytes into 327
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4be70, size 0x18c
jffs2_write_dnode wrote node at 0x0004be70 with dsize 0x1e5, csize =
0x147, node_c
rc 0x78b5dd8d, data_crc 0x2da26e4b, totlen 0x0000018b
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3980)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x53f4
 (mod 0x53f4): no
increasing writtenlen by 485
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0004a000 to very_dirty_list (free =
0x00000000, dirty
 0x00001e48, used 0x000001b8
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x48000
calling deflate with avail_in 3599, avail_out 3599
deflate returned with avail_in 0, avail_out 1267, total_in 3599, =
total_out 2332
calling deflate with avail_in 12, avail_out 1267
deflate returned with avail_in 0, avail_out 1255, total_in 3611, =
total_out 2344
zlib compressed 3611 bytes into 2350
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x48000, size 0x974
jffs2_write_dnode wrote node at 0x00048000 with dsize 0xe1b, csize =
0x92e, node_c
rc 0x22c72950, data_crc 0xbe46aa34, totlen 0x00000972
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3970)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x53f8
 (mod 0x53f8): no
increasing writtenlen by 3611
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0x1000
jffs2_read_inode_range: ino #68, range 0x00001000-0x00002000
Filling non-frag hole from 4096-8192
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x1000, range 0-4080
jffs2_write_inode_range(): Ino #68, ofs 0x1000, len 0xff0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x168c bytes at 0x48974
calling deflate with avail_in 4068, avail_out 4068
deflate returned with avail_in 0, avail_out 1601, total_in 4068, =
total_out 2467
calling deflate with avail_in 12, avail_out 1601
deflate returned with avail_in 0, avail_out 1588, total_in 4080, =
total_out 2480
zlib compressed 4080 bytes into 2486
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x48974, size 0x9fc
jffs2_write_dnode wrote node at 0x00048974 with dsize 0xff0, csize =
0x9b6, node_c
rc 0x0647bfc9, data_crc 0x868be2d3, totlen 0x000009fa
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3960)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x53f8
 (mod 0x53f8): no
increasing writtenlen by 4080
jffs2_commit_write() returning 4080
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x1000, range 4080-4096
jffs2_write_inode_range(): Ino #68, ofs 0x1ff0, len 0x10
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xc90 bytes at 0x49370
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 4, total_out 4
zlib compressed 4 bytes into 13
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x49370, size 0x54
jffs2_write_dnode wrote node at 0x00049370 with dsize 0x10, csize 0x10, =
node_crc
 0x49360deb, data_crc 0x2b59bd0e, totlen 0x00000054
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3950)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x53f8
 (mod 0x53f8): no
increasing writtenlen by 16
jffs2_commit_write() returning 16
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x2000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xc3c bytes at 0x493c4
calling deflate with avail_in 3052, avail_out 3052
deflate returned with avail_in 0, avail_out 1185, total_in 3052, =
total_out 1867
calling deflate with avail_in 1044, avail_out 1185
deflate returned with avail_in 0, avail_out 526, total_in 4096, =
total_out 2526
zlib compressed 4096 bytes into 2532
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x493c4, size 0xa28
jffs2_write_dnode wrote node at 0x000493c4 with dsize 0x1000, csize =
0x9e4, node_
crc 0xc04ced2b, data_crc 0x2fb65694, totlen 0x00000a28
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3940)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x53f8
 (mod 0x53f8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0x3000
jffs2_read_inode_range: ino #68, range 0x00003000-0x00004000
Filling non-frag hole from 12288-16384
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x3000, range 0-4064
jffs2_write_inode_range(): Ino #68, ofs 0x3000, len 0xfe0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x214 bytes at 0x49dec
calling deflate with avail_in 452, avail_out 452
deflate returned with avail_in 0, avail_out 95, total_in 452, total_out =
357
calling deflate with avail_in 95, avail_out 95
deflate returned with avail_in 0, avail_out 21, total_in 547, total_out =
431
calling deflate with avail_in 21, avail_out 21
deflate returned with avail_in 0, avail_out 1, total_in 568, total_out =
451
calling deflate with avail_in 1, avail_out 1
deflate returned with avail_in 0, avail_out 0, total_in 569, total_out =
452
zlib compressed 569 bytes into 459
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x49dec, size 0x210
jffs2_write_dnode wrote node at 0x00049dec with dsize 0x239, csize =
0x1cb, node_c
rc 0xc9209ad9, data_crc 0x1682fe67, totlen 0x0000020f
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3930)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x53f8
 (mod 0x53f8): no
increasing writtenlen by 569
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00048000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x46000
calling deflate with avail_in 3483, avail_out 3483
deflate returned with avail_in 0, avail_out 1454, total_in 3483, =
total_out 2029
calling deflate with avail_in 12, avail_out 1454
deflate returned with avail_in 0, avail_out 1443, total_in 3495, =
total_out 2040
zlib compressed 3495 bytes into 2046
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x46000, size 0x844
jffs2_write_dnode wrote node at 0x00046000 with dsize 0xda7, csize =
0x7fe, node_c
rc 0x6b2ecf91, data_crc 0x63c835e4, totlen 0x00000842
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3b30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 3495
jffs2_commit_write() returning 4064
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x3000, range 4064-4096
jffs2_write_inode_range(): Ino #68, ofs 0x3fe0, len 0x20
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17bc bytes at 0x46844
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 0, total_in 20, total_out 20
zlib compressed 20 bytes into 30
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x46844, size 0x64
jffs2_write_dnode wrote node at 0x00046844 with dsize 0x20, csize 0x20, =
node_crc
 0x695d8b2d, data_crc 0xdd16497c, totlen 0x00000064
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3b20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 32
jffs2_commit_write() returning 32
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x4000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1758 bytes at 0x468a8
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1796, total_in 4084, =
total_out 2288
calling deflate with avail_in 12, avail_out 1796
deflate returned with avail_in 0, avail_out 1786, total_in 4096, =
total_out 2298
zlib compressed 4096 bytes into 2305
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x468a8, size 0x948
jffs2_write_dnode wrote node at 0x000468a8 with dsize 0x1000, csize =
0x901, node_
crc 0x8d293f8f, data_crc 0x1c9483fa, totlen 0x00000945
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3b10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0x5000
jffs2_read_inode_range: ino #68, range 0x00005000-0x00006000
Filling non-frag hole from 20480-24576
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x5000, range 0-4048
jffs2_write_inode_range(): Ino #68, ofs 0x5000, len 0xfd0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe10 bytes at 0x471f0
calling deflate with avail_in 3520, avail_out 3520
deflate returned with avail_in 0, avail_out 1344, total_in 3520, =
total_out 2176
calling deflate with avail_in 528, avail_out 1344
deflate returned with avail_in 0, avail_out 946, total_in 4048, =
total_out 2574
zlib compressed 4048 bytes into 2580
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x471f0, size 0xa58
jffs2_write_dnode wrote node at 0x000471f0 with dsize 0xfd0, csize =
0xa14, node_c
rc 0x413923b2, data_crc 0x757c6ac8, totlen 0x00000a58
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3b00)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 4048
jffs2_commit_write() returning 4048
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x5000, range 4048-4096
jffs2_write_inode_range(): Ino #68, ofs 0x5fd0, len 0x30
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3b8 bytes at 0x47c48
calling deflate with avail_in 36, avail_out 36
deflate returned with avail_in 0, avail_out 0, total_in 36, total_out 36
zlib compressed 36 bytes into 46
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x47c48, size 0x74
jffs2_write_dnode wrote node at 0x00047c48 with dsize 0x30, csize 0x30, =
node_crc
 0xca2b310d, data_crc 0x207ebd84, totlen 0x00000074
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3af0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 48
jffs2_commit_write() returning 48
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x6000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x344 bytes at 0x47cbc
calling deflate with avail_in 756, avail_out 756
deflate returned with avail_in 0, avail_out 127, total_in 756, total_out =
629
calling deflate with avail_in 127, avail_out 127
deflate returned with avail_in 0, avail_out 11, total_in 883, total_out =
745
calling deflate with avail_in 11, avail_out 11
deflate returned with avail_in 0, avail_out 0, total_in 894, total_out =
756
zlib compressed 894 bytes into 763
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x47cbc, size 0x340
jffs2_write_dnode wrote node at 0x00047cbc with dsize 0x37e, csize =
0x2fb, node_c
rc 0x56bb0c75, data_crc 0xcc24e316, totlen 0x0000033f
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3ae0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x53fc
 (mod 0x53fc): no
increasing writtenlen by 894
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00046000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x44000
calling deflate with avail_in 3190, avail_out 3190
deflate returned with avail_in 0, avail_out 1164, total_in 3190, =
total_out 2026
calling deflate with avail_in 12, avail_out 1164
deflate returned with avail_in 0, avail_out 1156, total_in 3202, =
total_out 2034
zlib compressed 3202 bytes into 2040
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x44000, size 0x83c
jffs2_write_dnode wrote node at 0x00044000 with dsize 0xc82, csize =
0x7f8, node_c
rc 0x9b9cfbd1, data_crc 0x5ad14513, totlen 0x0000083c
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3ad0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x5400
 (mod 0x5400): no
increasing writtenlen by 3202
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0x7000
jffs2_read_inode_range: ino #68, range 0x00007000-0x00008000
Filling non-frag hole from 28672-32768
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x7000, range 0-4032
jffs2_write_inode_range(): Ino #68, ofs 0x7000, len 0xfc0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17c4 bytes at 0x4483c
calling deflate with avail_in 4020, avail_out 4020
deflate returned with avail_in 0, avail_out 1593, total_in 4020, =
total_out 2427
calling deflate with avail_in 12, avail_out 1593
deflate returned with avail_in 0, avail_out 1579, total_in 4032, =
total_out 2441
zlib compressed 4032 bytes into 2447
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4483c, size 0x9d4
jffs2_write_dnode wrote node at 0x0004483c with dsize 0xfc0, csize =
0x98f, node_c
rc 0x57c89da3, data_crc 0x8bb5dc63, totlen 0x000009d3
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3ac0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x5400
 (mod 0x5400): no
increasing writtenlen by 4032
jffs2_commit_write() returning 4032
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x7000, range 4032-4096
jffs2_write_inode_range(): Ino #68, ofs 0x7fc0, len 0x40
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xdf0 bytes at 0x45210
calling deflate with avail_in 52, avail_out 52
deflate returned with avail_in 0, avail_out 0, total_in 52, total_out 52
final deflate returned 0
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x45210, size 0x84
jffs2_write_dnode wrote node at 0x00045210 with dsize 0x40, csize 0x40, =
node_crc
 0x03a2bec3, data_crc 0x8a2ea055, totlen 0x00000084
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3ab0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x5400
 (mod 0x5400): no
increasing writtenlen by 64
jffs2_commit_write() returning 64
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x8000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xd6c bytes at 0x45294
calling deflate with avail_in 3356, avail_out 3356
deflate returned with avail_in 0, avail_out 1236, total_in 3356, =
total_out 2120
calling deflate with avail_in 740, avail_out 1236
deflate returned with avail_in 0, avail_out 887, total_in 4096, =
total_out 2469
zlib compressed 4096 bytes into 2475
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x45294, size 0x9f0
jffs2_write_dnode wrote node at 0x00045294 with dsize 0x1000, csize =
0x9ab, node_
crc 0x65b1c2d5, data_crc 0x5d879889, totlen 0x000009ef
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3aa0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x5400
 (mod 0x5400): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0x9000
jffs2_read_inode_range: ino #68, range 0x00009000-0x0000a000
Filling non-frag hole from 36864-40960
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x9000, range 0-4016
jffs2_write_inode_range(): Ino #68, ofs 0x9000, len 0xfb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x37c bytes at 0x45c84
calling deflate with avail_in 812, avail_out 812
deflate returned with avail_in 0, avail_out 182, total_in 812, total_out =
630
calling deflate with avail_in 182, avail_out 182
deflate returned with avail_in 0, avail_out 39, total_in 994, total_out =
773
calling deflate with avail_in 39, avail_out 39
deflate returned with avail_in 0, avail_out 3, total_in 1033, total_out =
809
calling deflate with avail_in 3, avail_out 3
deflate returned with avail_in 0, avail_out 0, total_in 1036, total_out =
812
zlib compressed 1036 bytes into 819
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x45c84, size 0x378
jffs2_write_dnode wrote node at 0x00045c84 with dsize 0x40c, csize =
0x333, node_c
rc 0xbae899f2, data_crc 0x2a009568, totlen 0x00000377
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a90)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x5400
 (mod 0x5400): no
increasing writtenlen by 1036
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00044000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x42000
calling deflate with avail_in 2968, avail_out 2968
deflate returned with avail_in 0, avail_out 1228, total_in 2968, =
total_out 1740
calling deflate with avail_in 12, avail_out 1228
deflate returned with avail_in 0, avail_out 1220, total_in 2980, =
total_out 1748
zlib compressed 2980 bytes into 1754
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x42000, size 0x720
jffs2_write_dnode wrote node at 0x00042000 with dsize 0xba4, csize =
0x6da, node_c
rc 0xadbc9b26, data_crc 0xc7a96126, totlen 0x0000071e
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a80)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 2980
jffs2_commit_write() returning 4016
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0x9000, range 4016-4096
jffs2_write_inode_range(): Ino #68, ofs 0x9fb0, len 0x50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x18e0 bytes at 0x42720
calling deflate with avail_in 68, avail_out 68
deflate returned with avail_in 0, avail_out 5, total_in 68, total_out 63
calling deflate with avail_in 5, avail_out 5
deflate returned with avail_in 0, avail_out 0, total_in 73, total_out 68
zlib compressed 73 bytes into 75
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x42720, size 0x94
jffs2_write_dnode wrote node at 0x00042720 with dsize 0x50, csize 0x50, =
node_crc
 0x1f6cd905, data_crc 0xe96d40de, totlen 0x00000094
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a70)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 80
jffs2_commit_write() returning 80
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0xa000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x184c bytes at 0x427b4
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2029, total_in 4084, =
total_out 2055
calling deflate with avail_in 12, avail_out 2029
deflate returned with avail_in 0, avail_out 2022, total_in 4096, =
total_out 2062
zlib compressed 4096 bytes into 2068
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x427b4, size 0x858
jffs2_write_dnode wrote node at 0x000427b4 with dsize 0x1000, csize =
0x814, node_
crc 0x70c5fb32, data_crc 0xabee6758, totlen 0x00000858
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a60)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0xb000
jffs2_read_inode_range: ino #68, range 0x0000b000-0x0000c000
Filling non-frag hole from 45056-49152
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0xb000, range 0-4000
jffs2_write_inode_range(): Ino #68, ofs 0xb000, len 0xfa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xff4 bytes at 0x4300c
calling deflate with avail_in 3988, avail_out 3988
deflate returned with avail_in 0, avail_out 1974, total_in 3988, =
total_out 2014
calling deflate with avail_in 12, avail_out 1974
deflate returned with avail_in 0, avail_out 1967, total_in 4000, =
total_out 2021
zlib compressed 4000 bytes into 2027
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4300c, size 0x830
jffs2_write_dnode wrote node at 0x0004300c with dsize 0xfa0, csize =
0x7eb, node_c
rc 0x5b14d4f6, data_crc 0x9d8dffc5, totlen 0x0000082f
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a50)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 4000
jffs2_commit_write() returning 4000
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0xb000, range 4000-4096
jffs2_write_inode_range(): Ino #68, ofs 0xbfa0, len 0x60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x7c4 bytes at 0x4383c
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 17, total_in 84, total_out =
67
calling deflate with avail_in 12, avail_out 17
deflate returned with avail_in 0, avail_out 2, total_in 96, total_out 82
zlib compressed 96 bytes into 88
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x4383c, size 0x9c
jffs2_write_dnode wrote node at 0x0004383c with dsize 0x60, csize 0x58, =
node_crc
 0x443f6c23, data_crc 0x2f4382ec, totlen 0x0000009c
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a40)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 96
jffs2_commit_write() returning 96
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #68, page at 0xc000, range 0-4096
jffs2_write_inode_range(): Ino #68, ofs 0xc000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x728 bytes at 0x438d8
calling deflate with avail_in 1752, avail_out 1752
deflate returned with avail_in 0, avail_out 895, total_in 1752, =
total_out 857
calling deflate with avail_in 895, avail_out 895
deflate returned with avail_in 0, avail_out 477, total_in 2647, =
total_out 1275
calling deflate with avail_in 477, avail_out 477
deflate returned with avail_in 0, avail_out 145, total_in 3124, =
total_out 1607
calling deflate with avail_in 145, avail_out 145
deflate returned with avail_in 0, avail_out 83, total_in 3269, total_out =
1669
calling deflate with avail_in 83, avail_out 83
deflate returned with avail_in 0, avail_out 48, total_in 3352, total_out =
1704
calling deflate with avail_in 48, avail_out 48
deflate returned with avail_in 0, avail_out 20, total_in 3400, total_out =
1732
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 15, total_in 3420, total_out =
1737
calling deflate with avail_in 15, avail_out 15
deflate returned with avail_in 0, avail_out 6, total_in 3435, total_out =
1746
calling deflate with avail_in 6, avail_out 6
deflate returned with avail_in 0, avail_out 0, total_in 3441, total_out =
1752
zlib compressed 3441 bytes into 1758
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x438d8, size 0x724
jffs2_write_dnode wrote node at 0x000438d8 with dsize 0xd71, csize =
0x6de, node_c
rc 0x565bdffa, data_crc 0xf398add0, totlen 0x00000722
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x5404
 (mod 0x5404): no
increasing writtenlen by 3441
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00042000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x40000
calling deflate with avail_in 643, avail_out 643
deflate returned with avail_in 0, avail_out 287, total_in 643, total_out =
356
calling deflate with avail_in 12, avail_out 287
deflate returned with avail_in 0, avail_out 276, total_in 655, total_out =
367
zlib compressed 655 bytes into 374
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x40000, size 0x1bc
jffs2_write_dnode wrote node at 0x00040000 with dsize 0x28f, csize =
0x176, node_c
rc 0xb5769bd0, data_crc 0x058491d3, totlen 0x000001ba
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 608, nr_erasing_blocks 0, =
dirty_size 0x5408
 (mod 0x5408): no
increasing writtenlen by 655
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #68, page at offset 0xd000
jffs2_read_inode_range: ino #68, range 0x0000d000-0x0000e000
Filling non-frag hole from 53248-57344
readpage finished
end prepare_write()
jffs2_commit_write(): ino #68, page at 0xd000, range 0-1712
jffs2_write_inode_range(): Ino #68, ofs 0xd000, len 0x6b0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1e44 bytes at 0x401bc
calling deflate with avail_in 1700, avail_out 1700
deflate returned with avail_in 0, avail_out 742, total_in 1700, =
total_out 958
calling deflate with avail_in 12, avail_out 742
deflate returned with avail_in 0, avail_out 730, total_in 1712, =
total_out 970
zlib compressed 1712 bytes into 976
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x401bc, size 0x414
jffs2_write_dnode wrote node at 0x000401bc with dsize 0x6b0, csize =
0x3d0, node_c
rc 0x9cc70248, data_crc 0x902f3d51, totlen 0x00000414
jffs2_add_full_dnode_to_inode(ino #68, f 00e49560, fn 00ff3a10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 608, nr_erasing_blocks 0, =
dirty_size 0x5408
 (mod 0x5408): no
increasing writtenlen by 1712
jffs2_commit_write() returning 1712
/bin>
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/bin> rm po
jffs2_reserve_space(): Requested 0x2c bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1a00 bytes at 0x40600
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #0, name_crc =
0xf232053f
)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x40600, size 0x2c
jffs2_add_fd_to_list( 001b9ac0, 00fef920 (->001b9b20))
Marking old dirent node (ino #68) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 608, nr_erasing_blocks 0, =
dirty_size 0x5434
 (mod 0x5434): no
jffs2_clear_inode(): ino #68 mode 100755
Eraseblock at 0x0004a000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00048000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00048000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00046000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00046000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00044000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00044000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00042000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00042000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x0004a000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00048000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00046000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00044000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00042000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list

/bin>
/bin> jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 608, nr_erasing_blocks 5, =
dirty_size 0xdb80
 (mod 0xdb80): no
Starting erase of pending block 0x0004a000
Freeing all node refs for eraseblock offset 0x0004a000
Removed nodes in range 0x0004a000-0x0004c000 from ino #67
inocache for ino #67 is all gone now. Freeing
Freeing inocache at 001c37e8
Removed nodes in range 0x0004a000-0x0004c000 from ino #2
Removed nodes in range 0x0004a000-0x0004c000 from ino #68
Erase completed successfully at 0x0004a000
Starting erase of pending block 0x00048000
Freeing all node refs for eraseblock offset 0x00048000
Removed nodes in range 0x00048000-0x0004a000 from ino #68
Erase completed successfully at 0x00048000
Starting erase of pending block 0x00046000
Freeing all node refs for eraseblock offset 0x00046000
Removed nodes in range 0x00046000-0x00048000 from ino #68
Erase completed successfully at 0x00046000
Starting erase of pending block 0x00044000
Freeing all node refs for eraseblock offset 0x00044000
Removed nodes in range 0x00044000-0x00046000 from ino #68
Erase completed successfully at 0x00044000
Starting erase of pending block 0x00042000
Freeing all node refs for eraseblock offset 0x00042000
Removed nodes in range 0x00042000-0x00044000 from ino #68
Erase completed successfully at 0x00042000
jffs2_erase_pending_blocks completed
Verifying erase at 0x0004a000
Writing erased marker to block at 0x0004a000
Verifying erase at 0x00048000
Writing erased marker to block at 0x00048000
Verifying erase at 0x00046000
Writing erased marker to block at 0x00046000
Verifying erase at 0x00044000
Writing erased marker to block at 0x00044000
Verifying erase at 0x00042000
Writing erased marker to block at 0x00042000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3b80
 (mod 0x3b80): no
jffs2_erase_pending_blocks completed

/bin>
/bin> cp po
usage: cp srcname ... destname
/bin> rm po
po: No such file or directory
/bin> cp ping po
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c37e8
jffs2_do_new_inode(): Assigned ino# 69
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1800 bytes at 0x40800
jffs2_do_create(): reserved 0x1800 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x40800, size 0x44
jffs2_write_dnode wrote node at 0x00040800 with dsize 0x0, csize 0x0, =
node_crc 0
x2c67c8cb, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #69, name_crc =
0xf232053
f)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x40844, size 0x2c
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9ac0))
Marking old dirent node (ino #0) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3bac
 (mod 0x3bac): no
jffs2_create: Created ino #69 with mode 100755, nlink 1(1). nrpages 0
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1790 bytes at 0x40870
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1521, total_in 4084, =
total_out 2563
calling deflate with avail_in 12, avail_out 1521
deflate returned with avail_in 0, avail_out 1509, total_in 4096, =
total_out 2575
zlib compressed 4096 bytes into 2581
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x40870, size 0xa5c
jffs2_write_dnode wrote node at 0x00040870 with dsize 0x1000, csize =
0xa15, node_
crc 0x88c00c07, data_crc 0xa8332e43, totlen 0x00000a59
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3bf0
 (mod 0x3bf0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0x1000
jffs2_read_inode_range: ino #69, range 0x00001000-0x00002000
Filling non-frag hole from 4096-8192
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x1000, range 0-4080
jffs2_write_inode_range(): Ino #69, ofs 0x1000, len 0xff0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xd34 bytes at 0x412cc
calling deflate with avail_in 3300, avail_out 3300
deflate returned with avail_in 0, avail_out 1252, total_in 3300, =
total_out 2048
calling deflate with avail_in 780, avail_out 1252
deflate returned with avail_in 0, avail_out 778, total_in 4080, =
total_out 2522
zlib compressed 4080 bytes into 2528
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x412cc, size 0xa24
jffs2_write_dnode wrote node at 0x000412cc with dsize 0xff0, csize =
0x9e0, node_c
rc 0x2a760f2a, data_crc 0x96aad99f, totlen 0x00000a24
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3bf0
 (mod 0x3bf0): no
increasing writtenlen by 4080
jffs2_commit_write() returning 4080
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x1000, range 4080-4096
jffs2_write_inode_range(): Ino #69, ofs 0x1ff0, len 0x10
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x310 bytes at 0x41cf0
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 4, total_out 4
zlib compressed 4 bytes into 13
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x41cf0, size 0x54
jffs2_write_dnode wrote node at 0x00041cf0 with dsize 0x10, csize 0x10, =
node_crc
 0xbfd8306d, data_crc 0x2b59bd0e, totlen 0x00000054
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3bf0
 (mod 0x3bf0): no
increasing writtenlen by 16
jffs2_commit_write() returning 16
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x2000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2bc bytes at 0x41d44
calling deflate with avail_in 620, avail_out 620
deflate returned with avail_in 0, avail_out 169, total_in 620, total_out =
451
calling deflate with avail_in 169, avail_out 169
deflate returned with avail_in 0, avail_out 30, total_in 789, total_out =
590
calling deflate with avail_in 30, avail_out 30
deflate returned with avail_in 0, avail_out 14, total_in 819, total_out =
606
calling deflate with avail_in 14, avail_out 14
deflate returned with avail_in 0, avail_out 1, total_in 833, total_out =
619
calling deflate with avail_in 1, avail_out 1
deflate returned with avail_in 0, avail_out 0, total_in 834, total_out =
620
zlib compressed 834 bytes into 627
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x41d44, size 0x2b8
jffs2_write_dnode wrote node at 0x00041d44 with dsize 0x342, csize =
0x273, node_c
rc 0xd4ec0daf, data_crc 0x3614f222, totlen 0x000002b7
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a40)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x3bf0
 (mod 0x3bf0): no
increasing writtenlen by 834
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00040000 to dirty_list (free 0x00000000, =
dirty 0x00
000848, used 0x000017b8
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x3e000
calling deflate with avail_in 3250, avail_out 3250
deflate returned with avail_in 0, avail_out 1272, total_in 3250, =
total_out 1978
calling deflate with avail_in 12, avail_out 1272
deflate returned with avail_in 0, avail_out 1259, total_in 3262, =
total_out 1991
zlib compressed 3262 bytes into 1997
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3e000, size 0x814
jffs2_write_dnode wrote node at 0x0003e000 with dsize 0xcbe, csize =
0x7cd, node_c
rc 0x10c5a96f, data_crc 0x403b69f8, totlen 0x00000811
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a50)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x3bf4
 (mod 0x3bf4): no
increasing writtenlen by 3262
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0x3000
jffs2_read_inode_range: ino #69, range 0x00003000-0x00004000
Filling non-frag hole from 12288-16384
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x3000, range 0-4064
jffs2_write_inode_range(): Ino #69, ofs 0x3000, len 0xfe0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x17ec bytes at 0x3e814
calling deflate with avail_in 4052, avail_out 4052
deflate returned with avail_in 0, avail_out 1713, total_in 4052, =
total_out 2339
calling deflate with avail_in 12, avail_out 1713
deflate returned with avail_in 0, avail_out 1702, total_in 4064, =
total_out 2350
zlib compressed 4064 bytes into 2356
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3e814, size 0x978
jffs2_write_dnode wrote node at 0x0003e814 with dsize 0xfe0, csize =
0x934, node_c
rc 0x2359ddb5, data_crc 0xc75b076e, totlen 0x00000978
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a60)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x3bf4
 (mod 0x3bf4): no
increasing writtenlen by 4064
jffs2_commit_write() returning 4064
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x3000, range 4064-4096
jffs2_write_inode_range(): Ino #69, ofs 0x3fe0, len 0x20
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe74 bytes at 0x3f18c
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 0, total_in 20, total_out 20
zlib compressed 20 bytes into 30
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3f18c, size 0x64
jffs2_write_dnode wrote node at 0x0003f18c with dsize 0x20, csize 0x20, =
node_crc
 0x8f2df612, data_crc 0xdd16497c, totlen 0x00000064
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a70)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x3bf4
 (mod 0x3bf4): no
increasing writtenlen by 32
jffs2_commit_write() returning 32
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x4000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe10 bytes at 0x3f1f0
calling deflate with avail_in 3520, avail_out 3520
deflate returned with avail_in 0, avail_out 1591, total_in 3520, =
total_out 1929
calling deflate with avail_in 576, avail_out 1591
deflate returned with avail_in 0, avail_out 1173, total_in 4096, =
total_out 2347
zlib compressed 4096 bytes into 2353
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3f1f0, size 0x978
jffs2_write_dnode wrote node at 0x0003f1f0 with dsize 0x1000, csize =
0x931, node_
crc 0x2b200470, data_crc 0x378cb4e6, totlen 0x00000975
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a80)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x3bf4
 (mod 0x3bf4): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0x5000
jffs2_read_inode_range: ino #69, range 0x00005000-0x00006000
Filling non-frag hole from 20480-24576
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x5000, range 0-4048
jffs2_write_inode_range(): Ino #69, ofs 0x5000, len 0xfd0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x498 bytes at 0x3fb68
calling deflate with avail_in 1096, avail_out 1096
deflate returned with avail_in 0, avail_out 378, total_in 1096, =
total_out 718
calling deflate with avail_in 378, avail_out 378
deflate returned with avail_in 0, avail_out 114, total_in 1474, =
total_out 982
calling deflate with avail_in 114, avail_out 114
deflate returned with avail_in 0, avail_out 31, total_in 1588, total_out =
1065
calling deflate with avail_in 31, avail_out 31
deflate returned with avail_in 0, avail_out 2, total_in 1619, total_out =
1094
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 1621, total_out =
1096
zlib compressed 1621 bytes into 1104
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3fb68, size 0x494
jffs2_write_dnode wrote node at 0x0003fb68 with dsize 0x655, csize =
0x450, node_c
rc 0x6af83033, data_crc 0x0da7c2e3, totlen 0x00000494
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3a90)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x3bf4
 (mod 0x3bf4): no
increasing writtenlen by 1621
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0003e000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x3c000
calling deflate with avail_in 2415, avail_out 2415
deflate returned with avail_in 0, avail_out 823, total_in 2415, =
total_out 1592
calling deflate with avail_in 12, avail_out 823
deflate returned with avail_in 0, avail_out 807, total_in 2427, =
total_out 1608
zlib compressed 2427 bytes into 1614
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3c000, size 0x694
jffs2_write_dnode wrote node at 0x0003c000 with dsize 0x97b, csize =
0x64e, node_c
rc 0x649888ee, data_crc 0xb1d50ca7, totlen 0x00000692
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3aa0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 2427
jffs2_commit_write() returning 4048
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x5000, range 4048-4096
jffs2_write_inode_range(): Ino #69, ofs 0x5fd0, len 0x30
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x196c bytes at 0x3c694
calling deflate with avail_in 36, avail_out 36
deflate returned with avail_in 0, avail_out 0, total_in 36, total_out 36
zlib compressed 36 bytes into 46
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3c694, size 0x74
jffs2_write_dnode wrote node at 0x0003c694 with dsize 0x30, csize 0x30, =
node_crc
 0x37d1b59b, data_crc 0x207ebd84, totlen 0x00000074
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3ab0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 48
jffs2_commit_write() returning 48
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x6000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x18f8 bytes at 0x3c708
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1427, total_in 4084, =
total_out 2657
calling deflate with avail_in 12, avail_out 1427
deflate returned with avail_in 0, avail_out 1419, total_in 4096, =
total_out 2665
zlib compressed 4096 bytes into 2672
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3c708, size 0xab4
jffs2_write_dnode wrote node at 0x0003c708 with dsize 0x1000, csize =
0xa70, node_
crc 0xeab8382e, data_crc 0xb147881d, totlen 0x00000ab4
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3ac0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0x7000
jffs2_read_inode_range: ino #69, range 0x00007000-0x00008000
Filling non-frag hole from 28672-32768
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x7000, range 0-4032
jffs2_write_inode_range(): Ino #69, ofs 0x7000, len 0xfc0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe44 bytes at 0x3d1bc
calling deflate with avail_in 3572, avail_out 3572
deflate returned with avail_in 0, avail_out 1388, total_in 3572, =
total_out 2184
calling deflate with avail_in 460, avail_out 1388
deflate returned with avail_in 0, avail_out 1087, total_in 4032, =
total_out 2485
zlib compressed 4032 bytes into 2491
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3d1bc, size 0xa00
jffs2_write_dnode wrote node at 0x0003d1bc with dsize 0xfc0, csize =
0x9bb, node_c
rc 0xa697ede7, data_crc 0x5f80b18a, totlen 0x000009ff
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3ad0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 4032
jffs2_commit_write() returning 4032
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x7000, range 4032-4096
jffs2_write_inode_range(): Ino #69, ofs 0x7fc0, len 0x40
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x444 bytes at 0x3dbbc
calling deflate with avail_in 52, avail_out 52
deflate returned with avail_in 0, avail_out 0, total_in 52, total_out 52
final deflate returned 0
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3dbbc, size 0x84
jffs2_write_dnode wrote node at 0x0003dbbc with dsize 0x40, csize 0x40, =
node_crc
 0x5c021b02, data_crc 0x8a2ea055, totlen 0x00000084
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3ae0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 64
jffs2_commit_write() returning 64
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x8000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x3c0 bytes at 0x3dc40
calling deflate with avail_in 880, avail_out 880
deflate returned with avail_in 0, avail_out 247, total_in 880, total_out =
633
calling deflate with avail_in 247, avail_out 247
deflate returned with avail_in 0, avail_out 74, total_in 1127, total_out =
806
calling deflate with avail_in 74, avail_out 74
deflate returned with avail_in 0, avail_out 24, total_in 1201, total_out =
856
calling deflate with avail_in 24, avail_out 24
deflate returned with avail_in 0, avail_out 9, total_in 1225, total_out =
871
calling deflate with avail_in 9, avail_out 9
deflate returned with avail_in 0, avail_out 0, total_in 1234, total_out =
880
zlib compressed 1234 bytes into 886
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3dc40, size 0x3bc
jffs2_write_dnode wrote node at 0x0003dc40 with dsize 0x4d2, csize =
0x376, node_c
rc 0xfef038e8, data_crc 0xbe12f11b, totlen 0x000003ba
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3af0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x3bf8
 (mod 0x3bf8): no
increasing writtenlen by 1234
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0003c000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x3a000
calling deflate with avail_in 2850, avail_out 2850
deflate returned with avail_in 0, avail_out 1177, total_in 2850, =
total_out 1673
calling deflate with avail_in 12, avail_out 1177
deflate returned with avail_in 0, avail_out 1164, total_in 2862, =
total_out 1686
zlib compressed 2862 bytes into 1692
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3a000, size 0x6e0
jffs2_write_dnode wrote node at 0x0003a000 with dsize 0xb2e, csize =
0x69c, node_c
rc 0xaf0ad279, data_crc 0x68a092d4, totlen 0x000006e0
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3b00)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x3bfc
 (mod 0x3bfc): no
increasing writtenlen by 2862
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0x9000
jffs2_read_inode_range: ino #69, range 0x00009000-0x0000a000
Filling non-frag hole from 36864-40960
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x9000, range 0-4016
jffs2_write_inode_range(): Ino #69, ofs 0x9000, len 0xfb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1920 bytes at 0x3a6e0
calling deflate with avail_in 4004, avail_out 4004
deflate returned with avail_in 0, avail_out 1616, total_in 4004, =
total_out 2388
calling deflate with avail_in 12, avail_out 1616
deflate returned with avail_in 0, avail_out 1608, total_in 4016, =
total_out 2396
zlib compressed 4016 bytes into 2402
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3a6e0, size 0x9a8
jffs2_write_dnode wrote node at 0x0003a6e0 with dsize 0xfb0, csize =
0x962, node_c
rc 0x9ba8d015, data_crc 0xeca6b857, totlen 0x000009a6
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3b10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x3bfc
 (mod 0x3bfc): no
increasing writtenlen by 4016
jffs2_commit_write() returning 4016
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0x9000, range 4016-4096
jffs2_write_inode_range(): Ino #69, ofs 0x9fb0, len 0x50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf78 bytes at 0x3b088
calling deflate with avail_in 68, avail_out 68
deflate returned with avail_in 0, avail_out 5, total_in 68, total_out 63
calling deflate with avail_in 5, avail_out 5
deflate returned with avail_in 0, avail_out 0, total_in 73, total_out 68
zlib compressed 73 bytes into 75
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3b088, size 0x94
jffs2_write_dnode wrote node at 0x0003b088 with dsize 0x50, csize 0x50, =
node_crc
 0x05ec3576, data_crc 0xe96d40de, totlen 0x00000094
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3b20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x3bfc
 (mod 0x3bfc): no
increasing writtenlen by 80
jffs2_commit_write() returning 80
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0xa000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xee4 bytes at 0x3b11c
calling deflate with avail_in 3732, avail_out 3732
deflate returned with avail_in 0, avail_out 1826, total_in 3732, =
total_out 1906
calling deflate with avail_in 364, avail_out 1826
deflate returned with avail_in 0, avail_out 1642, total_in 4096, =
total_out 2090
zlib compressed 4096 bytes into 2096
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3b11c, size 0x874
jffs2_write_dnode wrote node at 0x0003b11c with dsize 0x1000, csize =
0x830, node_
crc 0x8d82668a, data_crc 0xc876e28e, totlen 0x00000874
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3b30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x3bfc
 (mod 0x3bfc): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0xb000
jffs2_read_inode_range: ino #69, range 0x0000b000-0x0000c000
Filling non-frag hole from 45056-49152
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0xb000, range 0-4000
jffs2_write_inode_range(): Ino #69, ofs 0xb000, len 0xfa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x670 bytes at 0x3b990
calling deflate with avail_in 1568, avail_out 1568
deflate returned with avail_in 0, avail_out 692, total_in 1568, =
total_out 876
calling deflate with avail_in 692, avail_out 692
deflate returned with avail_in 0, avail_out 369, total_in 2260, =
total_out 1199
calling deflate with avail_in 369, avail_out 369
deflate returned with avail_in 0, avail_out 179, total_in 2629, =
total_out 1389
calling deflate with avail_in 179, avail_out 179
deflate returned with avail_in 0, avail_out 55, total_in 2808, total_out =
1513
calling deflate with avail_in 55, avail_out 55
deflate returned with avail_in 0, avail_out 16, total_in 2863, total_out =
1552
calling deflate with avail_in 16, avail_out 16
deflate returned with avail_in 0, avail_out 2, total_in 2879, total_out =
1566
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 2881, total_out =
1568
zlib compressed 2881 bytes into 1576
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3b990, size 0x66c
jffs2_write_dnode wrote node at 0x0003b990 with dsize 0xb41, csize =
0x628, node_c
rc 0xdbecba11, data_crc 0x554c51aa, totlen 0x0000066c
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3930)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x3bfc
 (mod 0x3bfc): no
increasing writtenlen by 2881
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0003a000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x38000
calling deflate with avail_in 1107, avail_out 1107
deflate returned with avail_in 0, avail_out 521, total_in 1107, =
total_out 586
calling deflate with avail_in 12, avail_out 521
deflate returned with avail_in 0, avail_out 509, total_in 1119, =
total_out 598
zlib compressed 1119 bytes into 604
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x38000, size 0x2a0
jffs2_write_dnode wrote node at 0x00038000 with dsize 0x45f, csize =
0x25c, node_c
rc 0x9cc31e0b, data_crc 0x9e676315, totlen 0x000002a0
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3940)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x3c00
 (mod 0x3c00): no
increasing writtenlen by 1119
jffs2_commit_write() returning 4000
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0xb000, range 4000-4096
jffs2_write_inode_range(): Ino #69, ofs 0xbfa0, len 0x60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1d60 bytes at 0x382a0
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 17, total_in 84, total_out =
67
calling deflate with avail_in 12, avail_out 17
deflate returned with avail_in 0, avail_out 2, total_in 96, total_out 82
zlib compressed 96 bytes into 88
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x382a0, size 0x9c
jffs2_write_dnode wrote node at 0x000382a0 with dsize 0x60, csize 0x58, =
node_crc
 0xfbbcea51, data_crc 0x2f4382ec, totlen 0x0000009c
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3950)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x3c00
 (mod 0x3c00): no
increasing writtenlen by 96
jffs2_commit_write() returning 96
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #69, page at 0xc000, range 0-4096
jffs2_write_inode_range(): Ino #69, ofs 0xc000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1cc4 bytes at 0x3833c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1971, total_in 4084, =
total_out 2113
calling deflate with avail_in 12, avail_out 1971
deflate returned with avail_in 0, avail_out 1960, total_in 4096, =
total_out 2124
zlib compressed 4096 bytes into 2130
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3833c, size 0x898
jffs2_write_dnode wrote node at 0x0003833c with dsize 0x1000, csize =
0x852, node_
crc 0xb7fdb1d7, data_crc 0x177ca30e, totlen 0x00000896
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3960)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x3c00
 (mod 0x3c00): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #69, page at offset 0xd000
jffs2_read_inode_range: ino #69, range 0x0000d000-0x0000e000
Filling non-frag hole from 53248-57344
readpage finished
end prepare_write()
jffs2_commit_write(): ino #69, page at 0xd000, range 0-1712
jffs2_write_inode_range(): Ino #69, ofs 0xd000, len 0x6b0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x142c bytes at 0x38bd4
calling deflate with avail_in 1700, avail_out 1700
deflate returned with avail_in 0, avail_out 742, total_in 1700, =
total_out 958
calling deflate with avail_in 12, avail_out 742
deflate returned with avail_in 0, avail_out 730, total_in 1712, =
total_out 970
zlib compressed 1712 bytes into 976
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x38bd4, size 0x414
jffs2_write_dnode wrote node at 0x00038bd4 with dsize 0x6b0, csize =
0x3d0, node_c
rc 0xaa150a7b, data_crc 0x902f3d51, totlen 0x00000414
jffs2_add_full_dnode_to_inode(ino #69, f 00e49560, fn 00ff3970)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x3c00
 (mod 0x3c00): no
increasing writtenlen by 1712
jffs2_commit_write() returning 1712
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/bin>
/bin> rm po
jffs2_reserve_space(): Requested 0x2c bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1000 bytes at 0x39000
jffs2_write_dirent(ino #2, name at *0x00e51d3c "po"->ino #0, name_crc =
0xf232053f
)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39000, size 0x2c
jffs2_add_fd_to_list( 001b9ac0, 00fef920 (->001b9b20))
Marking old dirent node (ino #69) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x3c2c
 (mod 0x3c2c): no
jffs2_clear_inode(): ino #69 mode 100755
Eraseblock at 0x00040000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00040000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0003e000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0003e000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0003c000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0003c000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0003a000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0003a000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x00040000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0003e000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0003c000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0003a000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 4, =
dirty_size 0xc394
 (mod 0xc394): no
Starting erase of pending block 0x00040000
Freeing all node refs for eraseblock offset 0x00040000
Removed nodes in range 0x00040000-0x00042000 from ino #68
inocache for ino #68 is all gone now. Freeing
Freeing inocache at 001c37fc
Removed nodes in range 0x00040000-0x00042000 from ino #2
Removed nodes in range 0x00040000-0x00042000 from ino #69
Erase completed successfully at 0x00040000
Starting erase of pending block 0x0003e000
Freeing all node refs for eraseblock offset 0x0003e000
Removed nodes in range 0x0003e000-0x00040000 from ino #69
Erase completed successfully at 0x0003e000
Starting erase of pending block 0x0003c000
Freeing all node refs for eraseblock offset 0x0003c000
Removed nodes in range 0x0003c000-0x0003e000 from ino #69
Erase completed successfully at 0x0003c000
Starting erase of pending block 0x0003a000
Freeing all node refs for eraseblock offset 0x0003a000
Removed nodes in range 0x0003a000-0x0003c000 from ino #69
Erase completed successfully at 0x0003a000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00040000
Writing erased marker to block at 0x00040000
Verifying erase at 0x0003e000
Writing erased marker to block at 0x0003e000
Verifying erase at 0x0003c000
Writing erased marker to block at 0x0003c000
Verifying erase at 0x0003a000
Writing erased marker to block at 0x0003a000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x4394
 (mod 0x4394): no
jffs2_erase_pending_blocks completed

/bin> rm netflash
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe00 bytes at 0x39200
jffs2_write_dirent(ino #2, name at *0x00e517bc "netflash"->ino #0, =
name_crc 0xe5
b03602)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39200, size 0x30
jffs2_add_fd_to_list( 001b7860, 00fef920 (->001b9ac0))
Marking old dirent node (ino #43) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x43c4
 (mod 0x43c4): no
jffs2_clear_inode(): ino #43 mode 100755
Eraseblock at 0x00550000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00550000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0054e000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0054e000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0054c000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0054c000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0054a000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x00550000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0054e000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0054c000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list

/bin>
/bin>
/bin> jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 3, =
dirty_size 0xd18c
 (mod 0xd18c): no
Starting erase of pending block 0x00550000
Freeing all node refs for eraseblock offset 0x00550000
Removed nodes in range 0x00550000-0x00552000 from ino #43
Erase completed successfully at 0x00550000
Starting erase of pending block 0x0054e000
Freeing all node refs for eraseblock offset 0x0054e000
Removed nodes in range 0x0054e000-0x00550000 from ino #43
Erase completed successfully at 0x0054e000
Starting erase of pending block 0x0054c000
Freeing all node refs for eraseblock offset 0x0054c000
Removed nodes in range 0x0054c000-0x0054e000 from ino #43
Erase completed successfully at 0x0054c000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00550000
Writing erased marker to block at 0x00550000
Verifying erase at 0x0054e000
Writing erased marker to block at 0x0054e000
Verifying erase at 0x0054c000
Writing erased marker to block at 0x0054c000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 616, nr_erasing_blocks 0, =
dirty_size 0x718c
 (mod 0x718c): no
jffs2_erase_pending_blocks completed

/bin>
/bin> cp boa boa.bak
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c37fc
jffs2_do_new_inode(): Assigned ino# 70
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xc00 bytes at 0x39400
jffs2_do_create(): reserved 0xc00 bytes
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39400, size 0x44
jffs2_write_dnode wrote node at 0x00039400 with dsize 0x0, csize 0x0, =
node_crc 0
x9ae2cd38, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51e3c "boa.bak"->ino #70, =
name_crc 0xec
e19bcb)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39444, size 0x30
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9ac0))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 616, nr_erasing_blocks 0, =
dirty_size 0x718c
 (mod 0x718c): no
jffs2_create: Created ino #70 with mode 100755, nlink 1(1). nrpages 0
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xb8c bytes at 0x39474
calling deflate with avail_in 2876, avail_out 2876
deflate returned with avail_in 0, avail_out 1059, total_in 2876, =
total_out 1817
calling deflate with avail_in 1059, avail_out 1059
deflate returned with avail_in 0, avail_out 524, total_in 3935, =
total_out 2352
calling deflate with avail_in 161, avail_out 524
deflate returned with avail_in 0, avail_out 434, total_in 4096, =
total_out 2442
zlib compressed 4096 bytes into 2448
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39474, size 0x9d4
jffs2_write_dnode wrote node at 0x00039474 with dsize 0x1000, csize =
0x990, node_
crc 0x5fc37705, data_crc 0x9155f7bd, totlen 0x000009d4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6850)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 616, nr_erasing_blocks 0, =
dirty_size 0x71d0
 (mod 0x71d0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x1000
jffs2_read_inode_range: ino #70, range 0x00001000-0x00002000
Filling non-frag hole from 4096-8192
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x1000, range 0-4080
jffs2_write_inode_range(): Ino #70, ofs 0x1000, len 0xff0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1b8 bytes at 0x39e48
calling deflate with avail_in 360, avail_out 360
deflate returned with avail_in 0, avail_out 90, total_in 360, total_out =
270
calling deflate with avail_in 90, avail_out 90
deflate returned with avail_in 0, avail_out 17, total_in 450, total_out =
343
calling deflate with avail_in 17, avail_out 17
deflate returned with avail_in 0, avail_out 0, total_in 467, total_out =
360
zlib compressed 467 bytes into 366
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x39e48, size 0x1b4
jffs2_write_dnode wrote node at 0x00039e48 with dsize 0x1d3, csize =
0x16e, node_c
rc 0x2ac2a889, data_crc 0x2bbdba36, totlen 0x000001b2
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67c0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 616, nr_erasing_blocks 0, =
dirty_size 0x71d0
 (mod 0x71d0): no
increasing writtenlen by 467
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00038000 to very_dirty_list (free =
0x00000000, dirty
 0x000013ec, used 0x00000c14
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x36000
calling deflate with avail_in 3601, avail_out 3601
deflate returned with avail_in 0, avail_out 1507, total_in 3601, =
total_out 2094
calling deflate with avail_in 12, avail_out 1507
deflate returned with avail_in 0, avail_out 1495, total_in 3613, =
total_out 2106
zlib compressed 3613 bytes into 2112
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x36000, size 0x884
jffs2_write_dnode wrote node at 0x00036000 with dsize 0xe1d, csize =
0x840, node_c
rc 0x4966b9a1, data_crc 0xb0ddb1a8, totlen 0x00000884
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6840)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 3613
jffs2_commit_write() returning 4080
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x1000, range 4080-4096
jffs2_write_inode_range(): Ino #70, ofs 0x1ff0, len 0x10
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x177c bytes at 0x36884
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 4, total_out 4
zlib compressed 4 bytes into 13
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x36884, size 0x54
jffs2_write_dnode wrote node at 0x00036884 with dsize 0x10, csize 0x10, =
node_crc
 0x33eb4d45, data_crc 0x294482ab, totlen 0x00000054
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6830)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 16
jffs2_commit_write() returning 16
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x2000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x2000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1728 bytes at 0x368d8
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1728, total_in 4084, =
total_out 2356
calling deflate with avail_in 12, avail_out 1728
deflate returned with avail_in 0, avail_out 1716, total_in 4096, =
total_out 2368
zlib compressed 4096 bytes into 2374
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x368d8, size 0x98c
jffs2_write_dnode wrote node at 0x000368d8 with dsize 0x1000, csize =
0x946, node_
crc 0x2e5c8702, data_crc 0xcbda7119, totlen 0x0000098a
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6810)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x3000
jffs2_read_inode_range: ino #70, range 0x00003000-0x00004000
Filling non-frag hole from 12288-16384
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x3000, range 0-4064
jffs2_write_inode_range(): Ino #70, ofs 0x3000, len 0xfe0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xd9c bytes at 0x37264
calling deflate with avail_in 3404, avail_out 3404
deflate returned with avail_in 0, avail_out 1607, total_in 3404, =
total_out 1797
calling deflate with avail_in 660, avail_out 1607
deflate returned with avail_in 0, avail_out 1152, total_in 4064, =
total_out 2252
zlib compressed 4064 bytes into 2259
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x37264, size 0x918
jffs2_write_dnode wrote node at 0x00037264 with dsize 0xfe0, csize =
0x8d3, node_c
rc 0x0b1a6e77, data_crc 0x6e55f250, totlen 0x00000917
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6800)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 4064
jffs2_commit_write() returning 4064
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x3000, range 4064-4096
jffs2_write_inode_range(): Ino #70, ofs 0x3fe0, len 0x20
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x484 bytes at 0x37b7c
calling deflate with avail_in 20, avail_out 20
deflate returned with avail_in 0, avail_out 0, total_in 20, total_out 20
zlib compressed 20 bytes into 30
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x37b7c, size 0x64
jffs2_write_dnode wrote node at 0x00037b7c with dsize 0x20, csize 0x20, =
node_crc
 0x5aed7077, data_crc 0xd27f52ee, totlen 0x00000064
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67f0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 32
jffs2_commit_write() returning 32
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x4000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x4000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x420 bytes at 0x37be0
calling deflate with avail_in 976, avail_out 976
deflate returned with avail_in 0, avail_out 306, total_in 976, total_out =
670
calling deflate with avail_in 306, avail_out 306
deflate returned with avail_in 0, avail_out 77, total_in 1282, total_out =
899
calling deflate with avail_in 77, avail_out 77
deflate returned with avail_in 0, avail_out 17, total_in 1359, total_out =
959
calling deflate with avail_in 17, avail_out 17
deflate returned with avail_in 0, avail_out 3, total_in 1376, total_out =
973
calling deflate with avail_in 3, avail_out 3
deflate returned with avail_in 0, avail_out 0, total_in 1379, total_out =
976
zlib compressed 1379 bytes into 984
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x37be0, size 0x41c
jffs2_write_dnode wrote node at 0x00037be0 with dsize 0x563, csize =
0x3d8, node_c
rc 0xff3f5f95, data_crc 0x91c26152, totlen 0x0000041c
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67e0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x71d4
 (mod 0x71d4): no
increasing writtenlen by 1379
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00036000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x34000
calling deflate with avail_in 2705, avail_out 2705
deflate returned with avail_in 0, avail_out 1311, total_in 2705, =
total_out 1394
calling deflate with avail_in 12, avail_out 1311
deflate returned with avail_in 0, avail_out 1303, total_in 2717, =
total_out 1402
zlib compressed 2717 bytes into 1408
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x34000, size 0x5c4
jffs2_write_dnode wrote node at 0x00034000 with dsize 0xa9d, csize =
0x580, node_c
rc 0x31eca8a1, data_crc 0xa96e67fa, totlen 0x000005c4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67d0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x71d8
 (mod 0x71d8): no
increasing writtenlen by 2717
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x5000
jffs2_read_inode_range: ino #70, range 0x00005000-0x00006000
Filling non-frag hole from 20480-24576
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x5000, range 0-4048
jffs2_write_inode_range(): Ino #70, ofs 0x5000, len 0xfd0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1a3c bytes at 0x345c4
calling deflate with avail_in 4036, avail_out 4036
deflate returned with avail_in 0, avail_out 1802, total_in 4036, =
total_out 2234
calling deflate with avail_in 12, avail_out 1802
deflate returned with avail_in 0, avail_out 1789, total_in 4048, =
total_out 2247
zlib compressed 4048 bytes into 2253
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x345c4, size 0x914
jffs2_write_dnode wrote node at 0x000345c4 with dsize 0xfd0, csize =
0x8cd, node_c
rc 0xc1d85636, data_crc 0x62c1b936, totlen 0x00000911
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67b0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x71d8
 (mod 0x71d8): no
increasing writtenlen by 4048
jffs2_commit_write() returning 4048
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x5000, range 4048-4096
jffs2_write_inode_range(): Ino #70, ofs 0x5fd0, len 0x30
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1128 bytes at 0x34ed8
calling deflate with avail_in 36, avail_out 36
deflate returned with avail_in 0, avail_out 0, total_in 36, total_out 36
final deflate returned 0
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x34ed8, size 0x74
jffs2_write_dnode wrote node at 0x00034ed8 with dsize 0x30, csize 0x30, =
node_crc
 0xd3b3f235, data_crc 0x65b699da, totlen 0x00000074
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff67a0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x71d8
 (mod 0x71d8): no
increasing writtenlen by 48
jffs2_commit_write() returning 48
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x6000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x6000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x10b4 bytes at 0x34f4c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1372, total_in 4084, =
total_out 2712
calling deflate with avail_in 12, avail_out 1372
deflate returned with avail_in 0, avail_out 1359, total_in 4096, =
total_out 2725
zlib compressed 4096 bytes into 2731
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x34f4c, size 0xaf0
jffs2_write_dnode wrote node at 0x00034f4c with dsize 0x1000, csize =
0xaab, node_
crc 0x23f4ee62, data_crc 0x1bfc3d0b, totlen 0x00000aef
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6790)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x71d8
 (mod 0x71d8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x7000
jffs2_read_inode_range: ino #70, range 0x00007000-0x00008000
Filling non-frag hole from 28672-32768
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x7000, range 0-4032
jffs2_write_inode_range(): Ino #70, ofs 0x7000, len 0xfc0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x5c4 bytes at 0x35a3c
calling deflate with avail_in 1396, avail_out 1396
deflate returned with avail_in 0, avail_out 426, total_in 1396, =
total_out 970
calling deflate with avail_in 426, avail_out 426
deflate returned with avail_in 0, avail_out 104, total_in 1822, =
total_out 1292
calling deflate with avail_in 104, avail_out 104
deflate returned with avail_in 0, avail_out 15, total_in 1926, total_out =
1381
calling deflate with avail_in 15, avail_out 15
deflate returned with avail_in 0, avail_out 4, total_in 1941, total_out =
1392
calling deflate with avail_in 4, avail_out 4
deflate returned with avail_in 0, avail_out 0, total_in 1945, total_out =
1396
zlib compressed 1945 bytes into 1403
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x35a3c, size 0x5c0
jffs2_write_dnode wrote node at 0x00035a3c with dsize 0x799, csize =
0x57b, node_c
rc 0x7c9ea496, data_crc 0xa3c55e57, totlen 0x000005bf
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6780)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 614, nr_erasing_blocks 0, =
dirty_size 0x71d8
 (mod 0x71d8): no
increasing writtenlen by 1945
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00034000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x32000
calling deflate with avail_in 2075, avail_out 2075
deflate returned with avail_in 0, avail_out 718, total_in 2075, =
total_out 1357
calling deflate with avail_in 12, avail_out 718
deflate returned with avail_in 0, avail_out 706, total_in 2087, =
total_out 1369
zlib compressed 2087 bytes into 1375
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x32000, size 0x5a4
jffs2_write_dnode wrote node at 0x00032000 with dsize 0x827, csize =
0x55f, node_c
rc 0x89d8b89a, data_crc 0xceb63171, totlen 0x000005a3
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6770)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 2087
jffs2_commit_write() returning 4032
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x7000, range 4032-4096
jffs2_write_inode_range(): Ino #70, ofs 0x7fc0, len 0x40
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1a5c bytes at 0x325a4
calling deflate with avail_in 52, avail_out 52
deflate returned with avail_in 0, avail_out 2, total_in 52, total_out 50
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 54, total_out 52
zlib compressed 54 bytes into 59
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x325a4, size 0x84
jffs2_write_dnode wrote node at 0x000325a4 with dsize 0x40, csize 0x40, =
node_crc
 0xdef15ff5, data_crc 0xce8ec90f, totlen 0x00000084
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6760)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 64
jffs2_commit_write() returning 64
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x8000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x8000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x19d8 bytes at 0x32628
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1425, total_in 4084, =
total_out 2659
calling deflate with avail_in 12, avail_out 1425
deflate returned with avail_in 0, avail_out 1414, total_in 4096, =
total_out 2670
zlib compressed 4096 bytes into 2676
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x32628, size 0xab8
jffs2_write_dnode wrote node at 0x00032628 with dsize 0x1000, csize =
0xa74, node_
crc 0xeadf4c03, data_crc 0x1a0823f3, totlen 0x00000ab8
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6750)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x9000
jffs2_read_inode_range: ino #70, range 0x00009000-0x0000a000
Filling non-frag hole from 36864-40960
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x9000, range 0-4016
jffs2_write_inode_range(): Ino #70, ofs 0x9000, len 0xfb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf20 bytes at 0x330e0
calling deflate with avail_in 3792, avail_out 3792
deflate returned with avail_in 0, avail_out 1493, total_in 3792, =
total_out 2299
calling deflate with avail_in 224, avail_out 1493
deflate returned with avail_in 0, avail_out 1318, total_in 4016, =
total_out 2474
zlib compressed 4016 bytes into 2480
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x330e0, size 0x9f4
jffs2_write_dnode wrote node at 0x000330e0 with dsize 0xfb0, csize =
0x9b0, node_c
rc 0xcf4d3cc8, data_crc 0x1843eaf1, totlen 0x000009f4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6740)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 4016
jffs2_commit_write() returning 4016
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x9000, range 4016-4096
jffs2_write_inode_range(): Ino #70, ofs 0x9fb0, len 0x50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x52c bytes at 0x33ad4
calling deflate with avail_in 68, avail_out 68
deflate returned with avail_in 0, avail_out 0, total_in 68, total_out 68
zlib compressed 68 bytes into 77
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x33ad4, size 0x94
jffs2_write_dnode wrote node at 0x00033ad4 with dsize 0x50, csize 0x50, =
node_crc
 0xd02cb313, data_crc 0x21aef182, totlen 0x00000094
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6710)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 80
jffs2_commit_write() returning 80
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xa000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0xa000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x498 bytes at 0x33b68
calling deflate with avail_in 1096, avail_out 1096
deflate returned with avail_in 0, avail_out 376, total_in 1096, =
total_out 720
calling deflate with avail_in 376, avail_out 376
deflate returned with avail_in 0, avail_out 84, total_in 1472, total_out =
1012
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 10, total_in 1556, total_out =
1086
calling deflate with avail_in 10, avail_out 10
deflate returned with avail_in 0, avail_out 0, total_in 1566, total_out =
1096
zlib compressed 1566 bytes into 1103
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x33b68, size 0x494
jffs2_write_dnode wrote node at 0x00033b68 with dsize 0x61e, csize =
0x44f, node_c
rc 0x16955434, data_crc 0xcc1772f9, totlen 0x00000493
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6700)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 613, nr_erasing_blocks 0, =
dirty_size 0x71dc
 (mod 0x71dc): no
increasing writtenlen by 1566
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00032000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x30000
calling deflate with avail_in 2518, avail_out 2518
deflate returned with avail_in 0, avail_out 1068, total_in 2518, =
total_out 1450
calling deflate with avail_in 12, avail_out 1068
deflate returned with avail_in 0, avail_out 1057, total_in 2530, =
total_out 1461
zlib compressed 2530 bytes into 1467
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x30000, size 0x600
jffs2_write_dnode wrote node at 0x00030000 with dsize 0x9e2, csize =
0x5bb, node_c
rc 0x7f47b9a2, data_crc 0x9500e3b1, totlen 0x000005ff
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff6820)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x71e0
 (mod 0x71e0): no
increasing writtenlen by 2530
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0xb000
jffs2_read_inode_range: ino #70, range 0x0000b000-0x0000c000
Filling non-frag hole from 45056-49152
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xb000, range 0-4000
jffs2_write_inode_range(): Ino #70, ofs 0xb000, len 0xfa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1a00 bytes at 0x30600
calling deflate with avail_in 3988, avail_out 3988
deflate returned with avail_in 0, avail_out 1775, total_in 3988, =
total_out 2213
calling deflate with avail_in 12, avail_out 1775
deflate returned with avail_in 0, avail_out 1770, total_in 4000, =
total_out 2218
zlib compressed 4000 bytes into 2224
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x30600, size 0x8f4
jffs2_write_dnode wrote node at 0x00030600 with dsize 0xfa0, csize =
0x8b0, node_c
rc 0x796abe76, data_crc 0xcbddaaa9, totlen 0x000008f4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3970)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x71e0
 (mod 0x71e0): no
increasing writtenlen by 4000
jffs2_commit_write() returning 4000
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xb000, range 4000-4096
jffs2_write_inode_range(): Ino #70, ofs 0xbfa0, len 0x60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x110c bytes at 0x30ef4
calling deflate with avail_in 84, avail_out 84
deflate returned with avail_in 0, avail_out 0, total_in 84, total_out 84
zlib compressed 84 bytes into 90
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x30ef4, size 0xa4
jffs2_write_dnode wrote node at 0x00030ef4 with dsize 0x60, csize 0x60, =
node_crc
 0x6ae9b03d, data_crc 0x2161da5c, totlen 0x000000a4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3960)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x71e0
 (mod 0x71e0): no
increasing writtenlen by 96
jffs2_commit_write() returning 96
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xc000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0xc000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1068 bytes at 0x30f98
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2198, total_in 4084, =
total_out 1886
calling deflate with avail_in 12, avail_out 2198
deflate returned with avail_in 0, avail_out 2187, total_in 4096, =
total_out 1897
zlib compressed 4096 bytes into 1904
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x30f98, size 0x7b4
jffs2_write_dnode wrote node at 0x00030f98 with dsize 0x1000, csize =
0x770, node_
crc 0x7614453c, data_crc 0x330e90fd, totlen 0x000007b4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3950)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x71e0
 (mod 0x71e0): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0xd000
jffs2_read_inode_range: ino #70, range 0x0000d000-0x0000e000
Filling non-frag hole from 53248-57344
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xd000, range 0-3984
jffs2_write_inode_range(): Ino #70, ofs 0xd000, len 0xf90
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x8b4 bytes at 0x3174c
calling deflate with avail_in 2148, avail_out 2148
deflate returned with avail_in 0, avail_out 657, total_in 2148, =
total_out 1491
calling deflate with avail_in 657, avail_out 657
deflate returned with avail_in 0, avail_out 231, total_in 2805, =
total_out 1917
calling deflate with avail_in 231, avail_out 231
deflate returned with avail_in 0, avail_out 69, total_in 3036, total_out =
2079
calling deflate with avail_in 69, avail_out 69
deflate returned with avail_in 0, avail_out 16, total_in 3105, total_out =
2132
calling deflate with avail_in 16, avail_out 16
deflate returned with avail_in 0, avail_out 3, total_in 3121, total_out =
2145
calling deflate with avail_in 3, avail_out 3
deflate returned with avail_in 0, avail_out 0, total_in 3124, total_out =
2148
zlib compressed 3124 bytes into 2155
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x3174c, size 0x8b0
jffs2_write_dnode wrote node at 0x0003174c with dsize 0xc34, csize =
0x86b, node_c
rc 0xb87d5b00, data_crc 0xed920eef, totlen 0x000008af
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3940)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 612, nr_erasing_blocks 0, =
dirty_size 0x71e0
 (mod 0x71e0): no
increasing writtenlen by 3124
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x00030000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x2e000
calling deflate with avail_in 848, avail_out 848
deflate returned with avail_in 0, avail_out 232, total_in 848, total_out =
616
calling deflate with avail_in 12, avail_out 232
deflate returned with avail_in 0, avail_out 220, total_in 860, total_out =
628
zlib compressed 860 bytes into 635
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2e000, size 0x2c0
jffs2_write_dnode wrote node at 0x0002e000 with dsize 0x35c, csize =
0x27b, node_c
rc 0x0ff3447a, data_crc 0x32281643, totlen 0x000002bf
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3930)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 860
jffs2_commit_write() returning 3984
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xd000, range 3984-4096
jffs2_write_inode_range(): Ino #70, ofs 0xdf90, len 0x70
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1d40 bytes at 0x2e2c0
calling deflate with avail_in 100, avail_out 100
deflate returned with avail_in 0, avail_out 29, total_in 100, total_out =
71
calling deflate with avail_in 12, avail_out 29
deflate returned with avail_in 0, avail_out 14, total_in 112, total_out =
86
zlib compressed 112 bytes into 93
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2e2c0, size 0xa4
jffs2_write_dnode wrote node at 0x0002e2c0 with dsize 0x70, csize 0x5d, =
node_crc
 0xdaec325d, data_crc 0x6982cb79, totlen 0x000000a1
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3b30)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 112
jffs2_commit_write() returning 112
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xe000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0xe000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1c9c bytes at 0x2e364
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1463, total_in 4084, =
total_out 2621
calling deflate with avail_in 12, avail_out 1463
deflate returned with avail_in 0, avail_out 1452, total_in 4096, =
total_out 2632
zlib compressed 4096 bytes into 2638
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2e364, size 0xa94
jffs2_write_dnode wrote node at 0x0002e364 with dsize 0x1000, csize =
0xa4e, node_
crc 0x77ef6eef, data_crc 0x9c628672, totlen 0x00000a92
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3b20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0xf000
jffs2_read_inode_range: ino #70, range 0x0000f000-0x00010000
Filling non-frag hole from 61440-65536
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xf000, range 0-3968
jffs2_write_inode_range(): Ino #70, ofs 0xf000, len 0xf80
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1208 bytes at 0x2edf8
calling deflate with avail_in 3956, avail_out 3956
deflate returned with avail_in 0, avail_out 1474, total_in 3956, =
total_out 2482
calling deflate with avail_in 12, avail_out 1474
deflate returned with avail_in 0, avail_out 1469, total_in 3968, =
total_out 2487
zlib compressed 3968 bytes into 2493
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2edf8, size 0xa04
jffs2_write_dnode wrote node at 0x0002edf8 with dsize 0xf80, csize =
0x9bd, node_c
rc 0xc4ba512d, data_crc 0x07ec5a2c, totlen 0x00000a01
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3b10)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 3968
jffs2_commit_write() returning 3968
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0xf000, range 3968-4096
jffs2_write_inode_range(): Ino #70, ofs 0xff80, len 0x80
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x804 bytes at 0x2f7fc
calling deflate with avail_in 116, avail_out 116
deflate returned with avail_in 0, avail_out 0, total_in 116, total_out =
116
zlib compressed 116 bytes into 122
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2f7fc, size 0xc4
jffs2_write_dnode wrote node at 0x0002f7fc with dsize 0x80, csize 0x80, =
node_crc
 0xe1a68170, data_crc 0x42c3f493, totlen 0x000000c4
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3b00)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 128
jffs2_commit_write() returning 128
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x10000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x10000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x740 bytes at 0x2f8c0
calling deflate with avail_in 1776, avail_out 1776
deflate returned with avail_in 0, avail_out 650, total_in 1776, =
total_out 1126
calling deflate with avail_in 650, avail_out 650
deflate returned with avail_in 0, avail_out 233, total_in 2426, =
total_out 1543
calling deflate with avail_in 233, avail_out 233
deflate returned with avail_in 0, avail_out 48, total_in 2659, total_out =
1728
calling deflate with avail_in 48, avail_out 48
deflate returned with avail_in 0, avail_out 5, total_in 2707, total_out =
1771
calling deflate with avail_in 5, avail_out 5
deflate returned with avail_in 0, avail_out 0, total_in 2712, total_out =
1776
zlib compressed 2712 bytes into 1783
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2f8c0, size 0x73c
jffs2_write_dnode wrote node at 0x0002f8c0 with dsize 0xa98, csize =
0x6f7, node_c
rc 0xeca50b6a, data_crc 0x3b7ef041, totlen 0x0000073b
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3af0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 611, nr_erasing_blocks 0, =
dirty_size 0x71e4
 (mod 0x71e4): no
increasing writtenlen by 2712
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0002e000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x2c000
calling deflate with avail_in 1372, avail_out 1372
deflate returned with avail_in 0, avail_out 589, total_in 1372, =
total_out 783
calling deflate with avail_in 12, avail_out 589
deflate returned with avail_in 0, avail_out 579, total_in 1384, =
total_out 793
zlib compressed 1384 bytes into 800
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2c000, size 0x364
jffs2_write_dnode wrote node at 0x0002c000 with dsize 0x568, csize =
0x320, node_c
rc 0x5493e60f, data_crc 0x6d6c6b0d, totlen 0x00000364
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3ae0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 1384
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x11000
jffs2_read_inode_range: ino #70, range 0x00011000-0x00012000
Filling non-frag hole from 69632-73728
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x11000, range 0-3952
jffs2_write_inode_range(): Ino #70, ofs 0x11000, len 0xf70
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1c9c bytes at 0x2c364
calling deflate with avail_in 3940, avail_out 3940
deflate returned with avail_in 0, avail_out 1736, total_in 3940, =
total_out 2204
calling deflate with avail_in 12, avail_out 1736
deflate returned with avail_in 0, avail_out 1731, total_in 3952, =
total_out 2209
zlib compressed 3952 bytes into 2216
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2c364, size 0x8ec
jffs2_write_dnode wrote node at 0x0002c364 with dsize 0xf70, csize =
0x8a8, node_c
rc 0xd7dd4fbb, data_crc 0x50eb3c06, totlen 0x000008ec
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3ad0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 3952
jffs2_commit_write() returning 3952
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x11000, range 3952-4096
jffs2_write_inode_range(): Ino #70, ofs 0x11f70, len 0x90
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x13b0 bytes at 0x2cc50
calling deflate with avail_in 132, avail_out 132
deflate returned with avail_in 0, avail_out 8, total_in 132, total_out =
124
calling deflate with avail_in 8, avail_out 8
deflate returned with avail_in 0, avail_out 0, total_in 140, total_out =
132
zlib compressed 140 bytes into 138
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2cc50, size 0xd0
jffs2_write_dnode wrote node at 0x0002cc50 with dsize 0x8c, csize 0x8a, =
node_crc
 0xafac581d, data_crc 0x7b701804, totlen 0x000000ce
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3ac0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 140
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x12e0 bytes at 0x2cd20
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2cd20, size 0x48
jffs2_write_dnode wrote node at 0x0002cd20 with dsize 0x4, csize 0x4, =
node_crc 0
xceb93f69, data_crc 0x0992ada2, totlen 0x00000048
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3ab0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 4
jffs2_commit_write() returning 144
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x12000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x12000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1298 bytes at 0x2cd68
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1838, total_in 4084, =
total_out 2246
calling deflate with avail_in 12, avail_out 1838
deflate returned with avail_in 0, avail_out 1829, total_in 4096, =
total_out 2255
zlib compressed 4096 bytes into 2262
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2cd68, size 0x91c
jffs2_write_dnode wrote node at 0x0002cd68 with dsize 0x1000, csize =
0x8d6, node_
crc 0x863273e0, data_crc 0xa8e764ac, totlen 0x0000091a
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3aa0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x13000
jffs2_read_inode_range: ino #70, range 0x00013000-0x00014000
Filling non-frag hole from 77824-81920
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x13000, range 0-3936
jffs2_write_inode_range(): Ino #70, ofs 0x13000, len 0xf60
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x97c bytes at 0x2d684
calling deflate with avail_in 2348, avail_out 2348
deflate returned with avail_in 0, avail_out 1102, total_in 2348, =
total_out 1246
calling deflate with avail_in 1102, avail_out 1102
deflate returned with avail_in 0, avail_out 793, total_in 3450, =
total_out 1555
calling deflate with avail_in 486, avail_out 793
deflate returned with avail_in 0, avail_out 631, total_in 3936, =
total_out 1717
zlib compressed 3936 bytes into 1723
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2d684, size 0x700
jffs2_write_dnode wrote node at 0x0002d684 with dsize 0xf60, csize =
0x6bb, node_c
rc 0x5dd16478, data_crc 0x7600e1c3, totlen 0x000006ff
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a90)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 3936
jffs2_commit_write() returning 3936
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x13000, range 3936-4096
jffs2_write_inode_range(): Ino #70, ofs 0x13f60, len 0xa0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x27c bytes at 0x2dd84
calling deflate with avail_in 148, avail_out 148
deflate returned with avail_in 0, avail_out 33, total_in 148, total_out =
115
calling deflate with avail_in 12, avail_out 33
deflate returned with avail_in 0, avail_out 19, total_in 160, total_out =
129
zlib compressed 160 bytes into 135
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2dd84, size 0xcc
jffs2_write_dnode wrote node at 0x0002dd84 with dsize 0xa0, csize 0x87, =
node_crc
 0x38c41463, data_crc 0xf20fa65f, totlen 0x000000cb
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a80)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 160
jffs2_commit_write() returning 160
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x14000, range 0-4096
jffs2_write_inode_range(): Ino #70, ofs 0x14000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1b0 bytes at 0x2de50
calling deflate with avail_in 352, avail_out 352
deflate returned with avail_in 0, avail_out 110, total_in 352, total_out =
242
calling deflate with avail_in 110, avail_out 110
deflate returned with avail_in 0, avail_out 3, total_in 462, total_out =
349
calling deflate with avail_in 3, avail_out 3
deflate returned with avail_in 0, avail_out 0, total_in 465, total_out =
352
zlib compressed 465 bytes into 360
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2de50, size 0x1ac
jffs2_write_dnode wrote node at 0x0002de50 with dsize 0x1d1, csize =
0x168, node_c
rc 0x39b12e2a, data_crc 0x06c011bf, totlen 0x000001ac
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a70)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 610, nr_erasing_blocks 0, =
dirty_size 0x71e8
 (mod 0x71e8): no
increasing writtenlen by 465
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
Adding full erase block at 0x0002c000 to dirty_list (free 0x00000000, =
dirty 0x00
000004, used 0x00001ffc
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x2a000
calling deflate with avail_in 3619, avail_out 3619
deflate returned with avail_in 0, avail_out 1333, total_in 3619, =
total_out 2286
calling deflate with avail_in 12, avail_out 1333
deflate returned with avail_in 0, avail_out 1321, total_in 3631, =
total_out 2298
zlib compressed 3631 bytes into 2304
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2a000, size 0x944
jffs2_write_dnode wrote node at 0x0002a000 with dsize 0xe2f, csize =
0x900, node_c
rc 0xfdee62f0, data_crc 0x3446083e, totlen 0x00000944
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a60)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x71ec
 (mod 0x71ec): no
increasing writtenlen by 3631
jffs2_commit_write() returning 4096
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x15000
jffs2_read_inode_range: ino #70, range 0x00015000-0x00016000
Filling non-frag hole from 86016-90112
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x15000, range 0-3920
jffs2_write_inode_range(): Ino #70, ofs 0x15000, len 0xf50
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x16bc bytes at 0x2a944
calling deflate with avail_in 3908, avail_out 3908
deflate returned with avail_in 0, avail_out 1913, total_in 3908, =
total_out 1995
calling deflate with avail_in 12, avail_out 1913
deflate returned with avail_in 0, avail_out 1901, total_in 3920, =
total_out 2007
zlib compressed 3920 bytes into 2013
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2a944, size 0x824
jffs2_write_dnode wrote node at 0x0002a944 with dsize 0xf50, csize =
0x7dd, node_c
rc 0x81b29736, data_crc 0x8b97a70c, totlen 0x00000821
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a50)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x71ec
 (mod 0x71ec): no
increasing writtenlen by 3920
jffs2_commit_write() returning 3920
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x15000, range 3920-4096
jffs2_write_inode_range(): Ino #70, ofs 0x15f50, len 0xb0
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xe98 bytes at 0x2b168
calling deflate with avail_in 164, avail_out 164
deflate returned with avail_in 0, avail_out 58, total_in 164, total_out =
106
calling deflate with avail_in 12, avail_out 58
deflate returned with avail_in 0, avail_out 47, total_in 176, total_out =
117
zlib compressed 176 bytes into 123
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2b168, size 0xc0
jffs2_write_dnode wrote node at 0x0002b168 with dsize 0xb0, csize 0x7b, =
node_crc
 0x76351d19, data_crc 0x4b50da75, totlen 0x000000bf
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a40)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x71ec
 (mod 0x71ec): no
increasing writtenlen by 176
jffs2_commit_write() returning 176
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #70, page at offset 0x16000
jffs2_read_inode_range: ino #70, range 0x00016000-0x00017000
Filling non-frag hole from 90112-94208
readpage finished
end prepare_write()
jffs2_commit_write(): ino #70, page at 0x16000, range 0-3212
jffs2_write_inode_range(): Ino #70, ofs 0x16000, len 0xc8c
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xdd8 bytes at 0x2b228
calling deflate with avail_in 3200, avail_out 3200
deflate returned with avail_in 0, avail_out 1335, total_in 3200, =
total_out 1865
calling deflate with avail_in 12, avail_out 1335
deflate returned with avail_in 0, avail_out 1323, total_in 3212, =
total_out 1877
zlib compressed 3212 bytes into 1883
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2b228, size 0x7a0
jffs2_write_dnode wrote node at 0x0002b228 with dsize 0xc8c, csize =
0x75b, node_c
rc 0x1c56d194, data_crc 0x4cb814a4, totlen 0x0000079f
jffs2_add_full_dnode_to_inode(ino #70, f 00e4a180, fn 00ff3a20)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x71ec
 (mod 0x71ec): no
increasing writtenlen by 3212
jffs2_commit_write() returning 3212
/bin>
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock

/bin>
/bin> rm boa.bak
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x600 bytes at 0x2ba00
jffs2_write_dirent(ino #2, name at *0x00e51e3c "boa.bak"->ino #0, =
name_crc 0xece
19bcb)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2ba00, size 0x30
jffs2_add_fd_to_list( 001b99c0, 00fef920 (->001b9ac0))
Marking old dirent node (ino #70) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 0, =
dirty_size 0x721c
 (mod 0x721c): no
jffs2_clear_inode(): ino #70 mode 100755
Eraseblock at 0x00036000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00036000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00034000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00034000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00032000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00032000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00030000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00030000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0002e000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0002e000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x0002c000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0002c000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x00036000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00034000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00032000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00030000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0002e000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x0002c000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list

/bin> jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 609, nr_erasing_blocks 6, =
dirty_size 0x1575
4 (mod 0x15754): no
Starting erase of pending block 0x00036000
Freeing all node refs for eraseblock offset 0x00036000
Removed nodes in range 0x00036000-0x00038000 from ino #70
Erase completed successfully at 0x00036000
Starting erase of pending block 0x00034000
Freeing all node refs for eraseblock offset 0x00034000
Removed nodes in range 0x00034000-0x00036000 from ino #70
Erase completed successfully at 0x00034000
Starting erase of pending block 0x00032000
Freeing all node refs for eraseblock offset 0x00032000
Removed nodes in range 0x00032000-0x00034000 from ino #70
Erase completed successfully at 0x00032000
Starting erase of pending block 0x00030000
Freeing all node refs for eraseblock offset 0x00030000
Removed nodes in range 0x00030000-0x00032000 from ino #70
Erase completed successfully at 0x00030000
Starting erase of pending block 0x0002e000
Freeing all node refs for eraseblock offset 0x0002e000
Removed nodes in range 0x0002e000-0x00030000 from ino #70
Erase completed successfully at 0x0002e000
Starting erase of pending block 0x0002c000
Freeing all node refs for eraseblock offset 0x0002c000
Removed nodes in range 0x0002c000-0x0002e000 from ino #70
Erase completed successfully at 0x0002c000
jffs2_erase_pending_blocks completed
Verifying erase at 0x00036000
Writing erased marker to block at 0x00036000
Verifying erase at 0x00034000
Writing erased marker to block at 0x00034000
Verifying erase at 0x00032000
Writing erased marker to block at 0x00032000
Verifying erase at 0x00030000
Writing erased marker to block at 0x00030000
Verifying erase at 0x0002e000
Writing erased marker to block at 0x0002e000
Verifying erase at 0x0002c000
Writing erased marker to block at 0x0002c000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x9754
 (mod 0x9754): no
jffs2_erase_pending_blocks completed

/bin>
/bin> rm arp
jffs2_reserve_space(): Requested 0x2c bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x400 bytes at 0x2bc00
jffs2_write_dirent(ino #2, name at *0x00e514bc "arp"->ino #0, name_crc =
0x0419cb5
f)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2bc00, size 0x2c
jffs2_add_fd_to_list( 001b9b20, 00fef920 (->001b9ac0))
Marking old dirent node (ino #29) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 0, =
dirty_size 0x9780
 (mod 0x9780): no
jffs2_clear_inode(): ino #29 mode 100755
Eraseblock at 0x005f6000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x005f6000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x005f4000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x005f4000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x005f2000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x005f2000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x005f0000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x005f0000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
jffs2_flush_wbuf() adjusting free_size of c->nextblock
Removing eraseblock at 0x005f6000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x005f4000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x005f2000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x005f0000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 615, nr_erasing_blocks 4, =
dirty_size 0x125f
c (mod 0x125fc): no
Starting erase of pending block 0x005f6000
Freeing all node refs for eraseblock offset 0x005f6000
Removed nodes in range 0x005f6000-0x005f8000 from ino #29
Erase completed successfully at 0x005f6000
Starting erase of pending block 0x005f4000
Freeing all node refs for eraseblock offset 0x005f4000
Removed nodes in range 0x005f4000-0x005f6000 from ino #29
Erase completed successfully at 0x005f4000
Starting erase of pending block 0x005f2000
Freeing all node refs for eraseblock offset 0x005f2000
Removed nodes in range 0x005f2000-0x005f4000 from ino #29
Erase completed successfully at 0x005f2000
Starting erase of pending block 0x005f0000
Freeing all node refs for eraseblock offset 0x005f0000
Removed nodes in range 0x005f0000-0x005f2000 from ino #29
Erase completed successfully at 0x005f0000
jffs2_erase_pending_blocks completed
Verifying erase at 0x005f6000
Writing erased marker to block at 0x005f6000
Verifying erase at 0x005f4000
Writing erased marker to block at 0x005f4000
Verifying erase at 0x005f2000
Writing erased marker to block at 0x005f2000
Verifying erase at 0x005f0000
Writing erased marker to block at 0x005f0000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 619, nr_erasing_blocks 0, =
dirty_size 0xa5fc
 (mod 0xa5fc): no
jffs2_erase_pending_blocks completed

/bin> rm telnet
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x200 bytes at 0x2be00
jffs2_write_dirent(ino #2, name at *0x00e519bc "telnet"->ino #0, =
name_crc 0xbd3a
33bc)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2be00, size 0x30
jffs2_add_fd_to_list( 001b9540, 00fef920 (->001b9ac0))
Marking old dirent node (ino #49) obsolete
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 619, nr_erasing_blocks 0, =
dirty_size 0xa62c
 (mod 0xa62c): no
jffs2_clear_inode(): ino #49 mode 100755
Eraseblock at 0x0050c000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0050a000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x0050a000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00508000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00508000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00506000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00506000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00504000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00504000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00502000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00502000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x00500000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x00500000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
Eraseblock at 0x004fe000 is now very dirty. Removing from dirty list...
...and adding to very_dirty_list
Eraseblock at 0x004fe000 completely dirtied. Removing from (dirty?) =
list...
...and adding to erasable_pending_wbuf_list
Done OK
/bin>
/bin> jffs2_wbuf_timeout(): timer expired
jffs2_wbuf_process() entered
jffs2_wbuf_process() alloc_sem got
Removing eraseblock at 0x0050a000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00508000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00506000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00504000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00502000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x00500000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
Removing eraseblock at 0x004fe000 from erasable_pending_wbuf_list...
...and adding to erase_pending_list
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 619, nr_erasing_blocks 7, =
dirty_size 0x1a53
0 (mod 0x1a530): no
Starting erase of pending block 0x0050a000
Freeing all node refs for eraseblock offset 0x0050a000
Removed nodes in range 0x0050a000-0x0050c000 from ino #49
Erase completed successfully at 0x0050a000
Starting erase of pending block 0x00508000
Freeing all node refs for eraseblock offset 0x00508000
Removed nodes in range 0x00508000-0x0050a000 from ino #49
Erase completed successfully at 0x00508000
Starting erase of pending block 0x00506000
Freeing all node refs for eraseblock offset 0x00506000
Removed nodes in range 0x00506000-0x00508000 from ino #49
Erase completed successfully at 0x00506000
Starting erase of pending block 0x00504000
Freeing all node refs for eraseblock offset 0x00504000
Removed nodes in range 0x00504000-0x00506000 from ino #49
Erase completed successfully at 0x00504000
Starting erase of pending block 0x00502000
Freeing all node refs for eraseblock offset 0x00502000
Removed nodes in range 0x00502000-0x00504000 from ino #49
Erase completed successfully at 0x00502000
Starting erase of pending block 0x00500000
Freeing all node refs for eraseblock offset 0x00500000
Removed nodes in range 0x00500000-0x00502000 from ino #49
Erase completed successfully at 0x00500000
Starting erase of pending block 0x004fe000
Freeing all node refs for eraseblock offset 0x004fe000
Removed nodes in range 0x004fe000-0x00500000 from ino #49
Erase completed successfully at 0x004fe000
jffs2_erase_pending_blocks completed
Verifying erase at 0x0050a000
Writing erased marker to block at 0x0050a000
Verifying erase at 0x00508000
Writing erased marker to block at 0x00508000
Verifying erase at 0x00506000
Writing erased marker to block at 0x00506000
Verifying erase at 0x00504000
Writing erased marker to block at 0x00504000
Verifying erase at 0x00502000
Writing erased marker to block at 0x00502000
Verifying erase at 0x00500000
Writing erased marker to block at 0x00500000
Verifying erase at 0x004fe000
Writing erased marker to block at 0x004fe000
jffs2_write_super(): flush_wbuf before gc-trigger
thread_should_wake(): nr_free_blocks 626, nr_erasing_blocks 0, =
dirty_size 0xc530
 (mod 0xc530): no
jffs2_erase_pending_blocks completed

/bin> cp busybox busybox.old
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 2, mode 0x81ed
Allocated inocache at 001c3810
jffs2_do_new_inode(): Assigned ino# 71
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x1d0 bytes at 0x2be30
jffs2_do_create(): reserved 0x1d0 bytes
ARGH. About to write node to 0x0002be30 on flash, but there are data =
already the
re:
0x0002be30: 85 19 04 20 d0 01 00 00 1f ec 5b 94 ff ff ff ff
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2be30, size 0x44
jffs2_write_dnode wrote node at 0x0002be30 with dsize 0x0, csize 0x0, =
node_crc 0
xcbd6599c, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81ed
jffs2_write_dirent(ino #2, name at *0x00e51ebc "busybox.old"->ino #71, =
name_crc
0xce318a39)
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2be74, size 0x34
jffs2_add_fd_to_list( 001b77e0, 00fef920 (->001b9ac0))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 626, nr_erasing_blocks 0, =
dirty_size 0xc530
 (mod 0xc530): no
jffs2_create: Created ino #71 with mode 100755, nlink 1(1). nrpages 0
jffs2_do_readpage_nolock(): ino #32, page at offset 0x0
jffs2_read_inode_range: ino #32, range 0x00000000-0x00001000
Reading 0-4096 from node at 0x5cf2c0
Node read from 005cf2c0: node_crc 99bcb91e, calculated CRC 99bcb91e. =
dsize 1000,
 csize 9cc, offset 0, buf 00daa000
readpage finished
jffs2_do_readpage_nolock(): ino #32, page at offset 0x1000
jffs2_read_inode_range: ino #32, range 0x00001000-0x00002000
Reading 4096-5112 from node at 0x5cfcd0
Node read from 005cfcd0: node_crc 8fb51ddd, calculated CRC 8fb51ddd. =
dsize 3f8,
csize 2e7, offset 1000, buf 00dae000
Reading 5112-8192 from node at 0x5cc000
Node read from 005cc000: node_crc f0a0534e, calculated CRC f0a0534e. =
dsize c08,
csize 749, offset 13f8, buf 00dae3f8
readpage finished
jffs2_prepare_write()
end prepare_write()
jffs2_commit_write(): ino #71, page at 0x0, range 0-4096
jffs2_write_inode_range(): Ino #71, ofs 0x0, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x158 bytes at 0x2bea8
calling deflate with avail_in 264, avail_out 264
deflate returned with avail_in 0, avail_out 41, total_in 264, total_out =
223
calling deflate with avail_in 41, avail_out 41
deflate returned with avail_in 0, avail_out 6, total_in 305, total_out =
258
calling deflate with avail_in 6, avail_out 6
deflate returned with avail_in 0, avail_out 0, total_in 311, total_out =
264
zlib compressed 311 bytes into 272
jffs2_flash_writev: mod wbuf_timer
jffs2_add_physical_node_ref(): Node at 0x2bea8, size 0x154
jffs2_write_dnode wrote node at 0x0002bea8 with dsize 0x137, csize =
0x110, node_c
rc 0x10dc87b0, data_crc 0x5cf508ac, totlen 0x00000154
jffs2_add_full_dnode_to_inode(ino #71, f 00e53520, fn 001c19a0)
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 626, nr_erasing_blocks 0, =
dirty_size 0xc574
 (mod 0xc574): no
increasing writtenlen by 311
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space: Flushing write buffer
jffs2_flush_wbuf(): Write failed with -5
Adding full erase block at 0x0002a000 to very_dirty_list (free =
0x00000000, dirty
 0x00001dec, used 0x00000214
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x28000
calling deflate with avail_in 3773, avail_out 3773
deflate returned with avail_in 0, avail_out 1503, total_in 3773, =
total_out 2270
calling deflate with avail_in 12, avail_out 1503
deflate returned with avail_in 0, avail_out 1498, total_in 3785, =
total_out 2275
zlib compressed 3785 bytes into 2281
jffs2_flash_writev() to 0x28000 causes flush of wbuf at 0x0002be00
jffs2_flush_wbuf(): Write failed with -5
jffs2_flush_wbuf() called from jffs2_flash_writev() failed -5
Write of 2349 bytes at 0x00028000 failed. returned -5, retlen 0
Not marking the space at 0x00028000 as dirty because the flash driver =
returned r
etlen zero
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 625, nr_erasing_blocks 0, =
dirty_size 0xc578
 (mod 0xc578): no
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write() returning 311
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #71, page at offset 0x0
jffs2_read_inode_range: ino #71, range 0x00000000-0x00001000
Reading 0-311 from node at 0x2bea8
mtd->read(0x44 bytes from 0x2bea8) returned ECC error
Node read from 0002bea8: node_crc 10dc87b0, calculated CRC 10dc87b0. =
dsize 137,
csize 110, offset 0, buf 00db1000
mtd->read(0x110 bytes from 0x2beec) returned ECC error
Filling non-frag hole from 311-4096
readpage finished
end prepare_write()
jffs2_commit_write(): ino #71, page at 0x0, range 311-4096
jffs2_write_inode_range(): Ino #71, ofs 0x137, len 0xec9
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x28000
calling deflate with avail_in 3773, avail_out 3773
deflate returned with avail_in 0, avail_out 1503, total_in 3773, =
total_out 2270
calling deflate with avail_in 12, avail_out 1503
deflate returned with avail_in 0, avail_out 1498, total_in 3785, =
total_out 2275
zlib compressed 3785 bytes into 2281
jffs2_flash_writev() to 0x28000 causes flush of wbuf at 0x0002be00
jffs2_flush_wbuf(): Write failed with -5
jffs2_flush_wbuf() called from jffs2_flash_writev() failed -5
Write of 2349 bytes at 0x00028000 failed. returned -5, retlen 0
Not marking the space at 0x00028000 as dirty because the flash driver =
returned r
etlen zero
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 625, nr_erasing_blocks 0, =
dirty_size 0xc578
 (mod 0xc578): no
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write() returning -5
jffs2_prepare_write()
jffs2_do_readpage_nolock(): ino #71, page at offset 0x0
jffs2_read_inode_range: ino #71, range 0x00000000-0x00001000
Reading 0-311 from node at 0x2bea8
mtd->read(0x44 bytes from 0x2bea8) returned ECC error
Node read from 0002bea8: node_crc 10dc87b0, calculated CRC 10dc87b0. =
dsize 137,
csize 110, offset 0, buf 00db1000
mtd->read(0x110 bytes from 0x2beec) returned ECC error
Filling non-frag hole from 311-4096
readpage finished
end prepare_write()
jffs2_commit_write(): ino #71, page at 0x0, range 311-4096
jffs2_write_inode_range(): Ino #71, ofs 0x137, len 0xec9
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0x2000 bytes at 0x28000
calling deflate with avail_in 3773, avail_out 3773
deflate returned with avail_in 0, avail_out 1503, total_in 3773, =
total_out 2270
calling deflate with avail_in 12, avail_out 1503
deflate returned with avail_in 0, avail_out 1498, total_in 3785, =
total_out 2275
zlib compressed 3785 bytes into 2281
jffs2_flash_writev() to 0x28000 causes flush of wbuf at 0x0002be00
jffs2_flush_wbuf(): Write failed with -5
jffs2_flush_wbuf() called from jffs2_flash_writev() failed -5
Write of 2349 bytes at 0x00028000 failed. returned -5, retlen 0
Not marking the space at 0x00028000 as dirty because the flash driver =
returned r
etlen zero
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 625, nr_erasing_blocks 0, =
dirty_size 0xc578
 (mod 0xc578): no
jffs2_commit_write(): Not all bytes written. Marking page !uptodate
jffs2_commit_write() returning -5
busybox.old: I/O error
/bin> df
jffs2_lookup()
jffs2_dump_block_lists:
flash_size: 00600000
used_size: 0010e6a8
dirty_size: 0000c578
free_size: 004e53e0
erasing_size: 00000000
bad_size: 00000000
sector_size: 00002000
jffs2_reserved_blocks size: 0000a000
nextblock: 00028000 (used 00000000, dirty 00000000, free 00002000)
gcblock: NULL
clean_list: 004fc000 (used 000011c8, dirty 00000e38, free 00000000)
clean_list: 004fa000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004f8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004f6000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 004f4000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004f2000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 004f0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004ee000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004ec000 (used 00001fa0, dirty 00000060, free 00000000)
clean_list: 004ea000 (used 00001f8c, dirty 00000074, free 00000000)
clean_list: 004e8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004e6000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 004e4000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004e2000 (used 00002000, dirty 00000000, free 00000000)
clean_list: 004e0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004de000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004dc000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004da000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004d8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004d6000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004d4000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 004d0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 004ce000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005fa000 (used 00001d10, dirty 000002f0, free 00000000)
clean_list: 005ee000 (used 000018fc, dirty 00000704, free 00000000)
clean_list: 005ec000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005ea000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005e8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005e6000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005e4000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005e2000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005e0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005de000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005dc000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 005da000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005d8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005d6000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005d4000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005d2000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005d0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005ce000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 005cc000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005ca000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005c8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005c6000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005c4000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005c2000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005c0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005be000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005bc000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 005ba000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005b8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005b6000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 005b4000 (used 00001f9c, dirty 00000064, free 00000000)
clean_list: 005b2000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005b0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005ae000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005ac000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005aa000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005a8000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005a6000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005a4000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 005a2000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 005a0000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0059e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0059c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0059a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00598000 (used 00002000, dirty 00000000, free 00000000)
clean_list: 00596000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00594000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00592000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00590000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0058e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0058c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0058a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00588000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00586000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00584000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00582000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00580000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0057e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0057c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0057a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00578000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00576000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00574000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00572000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00570000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 0056e000 (used 00001ff4, dirty 00000000, free 0000000c)
clean_list: 0056c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0056a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00568000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00566000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00564000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00562000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00560000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0055e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0055c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0055a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00558000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00556000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00554000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00552000 (used 00001020, dirty 00000fe0, free 00000000)
clean_list: 00548000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00546000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00544000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00540000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 0053e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0053c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0053a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00538000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00536000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00534000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00532000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00530000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0052e000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 0052c000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0052a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00528000 (used 00001fc0, dirty 00000040, free 00000000)
clean_list: 00526000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00524000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00522000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00520000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0051e000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0051c000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 0051a000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00518000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00516000 (used 00001fb8, dirty 00000048, free 00000000)
clean_list: 00514000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00512000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 00510000 (used 00001ffc, dirty 00000004, free 00000000)
clean_list: 0050e000 (used 00001ffc, dirty 00000004, free 00000000)
very_dirty_list: 0005a000 (used 000002f4, dirty 00001d0c, free 00000000)
very_dirty_list: 0054a000 (used 00000190, dirty 00001e70, free 00000000)
very_dirty_list: 00038000 (used 0000005c, dirty 00001fa4, free 00000000)
very_dirty_list: 0050c000 (used 00000e60, dirty 000011a0, free 00000000)
very_dirty_list: 0002a000 (used 00000214, dirty 00001dec, free 00000000)
dirty_list: 004cc000 (used 00001a70, dirty 00000590, free 00000000)
dirty_list: 005fc000 (used 00001284, dirty 00000d7c, free 00000000)
dirty_list: 005f8000 (used 0000164c, dirty 000009b4, free 00000000)
dirty_list: 00542000 (used 00001f44, dirty 000000bc, free 00000000)
dirty_list: 004d2000 (used 00001f50, dirty 000000b0, free 00000000)
erasable_list: empty
erasing_list: empty
erase_pending_list: empty
erasable_pending_wbuf_list: empty
free_list: 00026000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00024000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00022000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00020000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0001e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0001c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0001a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00018000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00016000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00014000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00012000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00010000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0000e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0000c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0000a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00008000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00006000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00004000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00002000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00000000 (used 00000000, dirty 00000000, free 00002000)
free_list: 005fe000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004ca000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004c8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004c6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004c4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004c2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004c0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004be000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004bc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004ba000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004b8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004b6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004b4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004b2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004b0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004ae000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004ac000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004aa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004a8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004a6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004a4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004a2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004a0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0049e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0049c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0049a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00498000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00496000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00494000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00492000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00490000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0048e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0048c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0048a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00488000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00486000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00484000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00482000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00480000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0047e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0047c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0047a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00478000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00476000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00474000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00472000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00470000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0046e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0046c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0046a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00468000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00466000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00464000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00462000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00460000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0045e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0045c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0045a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00458000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00456000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00454000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00452000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00450000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0044e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0044c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0044a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00448000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00446000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00444000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00442000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00440000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0043e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0043c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0043a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00438000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00436000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00434000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00432000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00430000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0042e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0042c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0042a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00428000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00426000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00424000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00422000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00420000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0041e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0041c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0041a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00418000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00416000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00414000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00412000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00410000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0040e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0040c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0040a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00408000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00406000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00404000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00402000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00400000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003fe000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003fc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003fa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003f8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003f6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003f4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003f2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003f0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ee000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ec000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ea000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003e8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003e6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003e4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003e2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003e0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003de000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003dc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003da000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003d8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003d6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003d4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003d2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003d0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ce000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003cc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ca000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003c8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003c6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003c4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003c2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003c0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003be000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003bc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ba000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003b8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003b6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003b4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003b2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003b0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ae000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003ac000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003aa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003a8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003a6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003a4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003a2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 003a0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0039e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0039c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0039a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00398000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00396000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00394000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00392000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00390000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0038e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0038c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0038a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00388000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00386000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00384000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00382000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00380000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0037e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0037c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0037a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00378000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00376000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00374000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00372000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00370000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0036e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0036c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0036a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00368000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00366000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00364000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00362000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00360000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0035e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0035c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0035a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00358000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00356000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00354000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00352000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00350000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0034e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0034c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0034a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00348000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00346000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00344000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00342000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00340000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0033e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0033c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0033a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00338000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00336000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00334000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00332000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00330000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0032e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0032c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0032a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00328000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00326000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00324000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00322000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00320000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0031e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0031c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0031a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00318000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00316000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00314000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00312000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00310000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0030e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0030c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0030a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00308000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00306000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00304000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00302000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00300000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002fe000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002fc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002fa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002f8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002f6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002f4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002f2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002f0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ee000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ec000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ea000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002e8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002e6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002e4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002e2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002e0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002de000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002dc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002da000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002d8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002d6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002d4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002d2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002d0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ce000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002cc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ca000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002c8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002c6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002c4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002c2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002c0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002be000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002bc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ba000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002b8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002b6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002b4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002b2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002b0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ae000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002ac000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002aa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002a8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002a6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002a4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002a2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 002a0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0029e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0029c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0029a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00298000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00296000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00294000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00292000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00290000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0028e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0028c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0028a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00288000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00286000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00284000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00282000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00280000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0027e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0027c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0027a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00278000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00276000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00274000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00272000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00270000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0026e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0026c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0026a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00268000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00266000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00264000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00262000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00260000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0025e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0025c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0025a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00258000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00256000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00254000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00252000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00250000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0024e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0024c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0024a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00248000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00246000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00244000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00242000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00240000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0023e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0023c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0023a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00238000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00236000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00234000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00232000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00230000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0022e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0022c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0022a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00228000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00226000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00224000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00222000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00220000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0021e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0021c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0021a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00218000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00216000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00214000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00212000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00210000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0020e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0020c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0020a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00208000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00206000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00204000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00202000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00200000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001fe000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001fc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001fa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001f8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001f6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001f4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001f2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001f0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ee000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ec000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ea000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001e8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001e6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001e4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001e2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001e0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001de000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001dc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001da000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001d8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001d6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001d4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001d2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001d0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ce000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001cc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ca000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001c8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001c6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001c4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001c2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001c0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001be000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001bc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ba000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001b8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001b6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001b4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001b2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001b0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ae000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001ac000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001aa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001a8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001a6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001a4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001a2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 001a0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0019e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0019c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0019a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00198000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00196000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00194000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00192000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00190000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0018e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0018c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0018a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00188000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00186000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00184000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00182000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00180000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0017e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0017c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0017a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00178000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00176000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00174000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00172000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00170000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0016e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0016c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0016a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00168000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00166000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00164000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00162000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00160000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0015e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0015c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0015a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00158000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00156000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00154000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00152000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00150000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0014e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0014c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0014a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00148000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00146000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00144000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00142000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00140000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0013e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0013c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0013a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00138000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00136000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00134000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00132000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00130000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0012e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0012c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0012a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00128000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00126000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00124000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00122000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00120000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0011e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0011c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0011a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00118000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00116000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00114000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00112000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00110000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0010e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0010c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0010a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00108000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00106000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00104000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00102000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00100000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000fe000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000fc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000fa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000f8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000f6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000f4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000f2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000f0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ee000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ec000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ea000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000e8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000e6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000e4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000e2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000e0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000de000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000dc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000da000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000d8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000d6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000d4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000d2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000d0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ce000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000cc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ca000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000c8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000c6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000c4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000c2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000c0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000be000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000bc000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ba000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000b8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000b6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000b4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000b2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000b0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ae000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000ac000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000aa000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000a8000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000a6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000a4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000a2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 000a0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0009e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0009c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0009a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00098000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00096000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00094000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00092000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00090000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0008e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0008c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0008a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00088000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00086000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00084000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00082000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00080000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0007e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0007c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0007a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00078000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00076000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00074000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00072000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00070000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0006e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0006c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0006a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00068000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00066000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00064000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00062000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00060000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0005e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0005c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00058000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00056000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00054000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00052000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00050000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0004e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0004c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0004a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00048000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00046000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00044000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00042000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00040000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0003e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0003c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0003a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00550000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0054e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0054c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00036000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00034000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00032000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00030000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0002e000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0002c000 (used 00000000, dirty 00000000, free 00002000)
free_list: 005f6000 (used 00000000, dirty 00000000, free 00002000)
free_list: 005f4000 (used 00000000, dirty 00000000, free 00002000)
free_list: 005f2000 (used 00000000, dirty 00000000, free 00002000)
free_list: 005f0000 (used 00000000, dirty 00000000, free 00002000)
free_list: 0050a000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00508000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00506000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00504000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00502000 (used 00000000, dirty 00000000, free 00002000)
free_list: 00500000 (used 00000000, dirty 00000000, free 00002000)
free_list: 004fe000 (used 00000000, dirty 00000000, free 00002000)
bad_list: empty
bad_used_list: empty
Total Kbytes: 6144
Free  Kbytes: 5008
Total  nodes: 0
Free   nodes: 0
/bin>

------=_NextPart_000_0022_01C23E35.06EDED00--
