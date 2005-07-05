Received: from bay20-f37.bay20.hotmail.com ([64.4.54.126] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dpl2e-0006Ot-T4
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2005 06:52:43 -0400
Message-ID: <BAY20-F370286398A1D013E3B5B01BFE60@phx.gbl>
In-Reply-To: <426888a60507050110537bea15@mail.gmail.com>
From: "Kuen Fu" <culinux@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 05 Jul 2005 18:35:15 +0800
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: Re: When I try to mount up the JFFS2 using uClinux, fail "-22"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Vishal,

Here shows the partition of device(mtd):

NAND device: Manufacturer ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MiB 3,3V)
Using static partition definition
Creating 4 MTD partitions on "NAND 16MiB 3,3V":
0x00000000-0x00030000 : "boot"
mtd: Giving out device 0 to boot
0x00030000-0x00200000 : "kernel"
mtd: Giving out device 1 to kernel
0x00200000-0x00800000 : "rootfs"
mtd: Giving out device 2 to rootfs
0x00800000-0x01000000 : "ext-fs1"
mtd: Giving out device 3 to ext-fs1

-------------------------------------------------
------------------------------------------------

Here is the boot up message:

Run program from 0xC300000
Set boot params = root=/dev/rom0 console=ttyS0,115200
Uncompressing 
Linux.............................................................. done, 
booting the kernel.
Linux version 2.4.24-uc0 (root@xilinx54) (gcc version 2.95.3 20010315 
(release)(ColdFire patches - 20010318 from 
http://fiddes.net/coldfire/)(uClinux XIP and shared lib patches from 
http://www.snapgear.com/)) #44 Fri Jul 1 14:39:43 HKT 2005
Processor: Samsung S3C44B0X revision 0
Architecture: S3C44B0X
On node 0 totalpages: 2048
zone(0): 0 pages.
zone(1): 2048 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/rom0 console=ttyS0,115200
Console: colour dummy device 80x30
Calibrating delay loop... 30.31 BogoMIPS
Memory: 8MB = 8MB total
Memory: 5972KB available (1700K code, 307K data, 72K init)
Dentry cache hash table entries: 1024 (order: 1, 8192 bytes)
Inode cache hash table entries: 512 (order: 0, 4096 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
NTFS driver v1.1.22 [Flags: R/O]
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
LCD buffer : 0c7c7000
fbcon_setup: No support for fontwidth 8
fbcon_setup: type 0 (aux 0, depth 0) not supported
Console: switching to colour frame buffer device 80x30
err=0
pty: 256 Unix98 ptys configured
ads7843_ts initialized
ttyS%d0 at I/O 0x1d00000 (irq = 3) is a S3C44B0
ttyS%d1 at I/O 0x1d04000 (irq = 2) is a S3C44B0
ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
Last modified Nov 1, 2000 by Paul Gortmaker
NE*000 ethercard probe at 0x6000000:NE2000 driver modified by antisle, 
Http://www.uCdragon.com
00 49 34 00 00 00
eth0: NE2000 found at 0x6000000, using IRQ 24
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 1 disk images:
0: 100000-1E3FFF [VIRTUAL 100000-1E3FFF] (RO)
RAMDISK driver initialized: 16 RAM disks of 1024K size 1024 blocksize
loop: loaded (max 8 devices)
Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
SCSI subsystem driver Revision: 1.00
NAND device: Manufacturer ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MiB 3,3V)
Using static partition definition
Creating 4 MTD partitions on "NAND 16MiB 3,3V":
0x00000000-0x00030000 : "boot"
0x00030000-0x00200000 : "kernel"
0x00200000-0x00800000 : "rootfs"
0x00800000-0x01000000 : "ext-fs1"
No NAND device found!!!
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
sl811.c: v0.30 : Sl811 USB Host Controller Alternate Driver
usb.c: new USB bus registered, assigned bus number 1
sl811.c: USB SL811 at a000000,a000001, IRQ 21
hub.c: USB hub found
hub.c: 1 port detected
usb.c: registered new driver hid
hid-core.c: v1.8.1 Andreas Gal, Vojtech Pavlik <vojtech@suse.cz>
hid-core.c: USB HID support drivers
Initializing USB Mass Storage driver...
usb.c: registered new driver usb-storage
USB Mass Storage support registered.
mice: PS/2 mouse device common for all mice
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 512)
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
cramfs: wrong magic
FAT: bogus logical sector size 19232
FAT: bogus logical sector size 19232
yaffs: dev is 7936 name is "1f:00"
VFS: Mounted root (romfs filesystem) readonly.
Freeing init memory: 72K
Welcome to
____ _ _
/ __| ||_|
_ _| | | | _ ____ _ _ _ _
| | | | | | || | _ \| | | |\ \/ /
| |_| | |__| || | | | | |_| |/ \
| ___\____|_||_|_| |_|\____|\_/\_/
| |
|_|




------------------------------------------------------

I have successfully mount up the partitions with yaffs.
But when I mount up with "JFFS2", the problem which I memtion in the last 
message comes.

Regards,
Kuen



>From: Vishal Soni <vishal.soni.1@gmail.com>
>Reply-To: Vishal Soni <vishal.soni.1@gmail.com>
>To: asdfg dfgh <culinux@hotmail.com>
>Subject: Re: When I try to mount up the JFFS2 using uClinux, fail "-22"
>Date: Tue, 5 Jul 2005 13:40:17 +0530
>
>Would you please tell me how to partition the device(mtd) in jffs2 file 
>system
>regards,
>vishal
>
>On Tuesday 05 July 2005 13:27, asdfg dfgh wrote:
> > I am using the uClinux 2.4.24 and FS44B0X (arm7)
> > When I try to mount up the JFFS2, there are some error message shown as
> > below.
> >
> > I have already erase the mtd block before mounting, but the problem 
>still
> > cannot be solved.
> > ----------------------------------------------------------
> >
> > #  mount -t jffs2 /dev/mtdblock0 /mnt
> > mtdblock_open
> > ok
> > nand_read_ecc: from = 0x00000000, len = 1024
> > Reading data from NAND FLASH without ECC is not recommended
> > nand_read_ecc: from = 0x00004000, len = 1024
> > nand_read_ecc: from = 0x00008000, len = 1024
> > nand_read_ecc: from = 0x0000c000, len = 1024
> > nand_read_ecc: from = 0x00010000, len = 1024
> > nand_read_ecc: from = 0x00014000, len = 1024
> > nand_read_ecc: from = 0x00018000, len = 1024
> > nand_read_ecc: from = 0x0001c000, len = 1024
> > nand_read_ecc: from = 0x00020000, len = 1024
> > nand_read_ecc: from = 0x00024000, len = 1024
> > nand_read_ecc: from = 0x00028000, len = 1024
> > nand_read_ecc: from = 0x0002c000, len = 1024
> > # nand_erase: start = 0x00028000, len = 16384
> > nand_read_ecc: from = 0x00028000, len = 4096
> > Reading data from NAND FLASH without ECC is not recommended
> > nand_read_ecc: from = 0x00029000, len = 4096
> > nand_read_ecc: from = 0x0002a000, len = 4096
> > nand_read_ecc: from = 0x0002b000, len = 4096
> > nand_write_ecc: to = 0x00028000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00028000 failed: -22
> > nand_erase: start = 0x00024000, len = 16384
> > nand_read_ecc: from = 0x00024000, len = 4096
> > nand_read_ecc: from = 0x00025000, len = 4096
> > nand_read_ecc: from = 0x00026000, len = 4096
> > nand_read_ecc: from = 0x00027000, len = 4096
> > nand_write_ecc: to = 0x00024000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00024000 failed: -22
> > nand_erase: start = 0x00020000, len = 16384
> > nand_read_ecc: from = 0x00020000, len = 4096
> > nand_read_ecc: from = 0x00021000, len = 4096
> > nand_read_ecc: from = 0x00022000, len = 4096
> > nand_read_ecc: from = 0x00023000, len = 4096
> > nand_write_ecc: to = 0x00020000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00020000 failed: -22
> > nand_erase: start = 0x0001c000, len = 16384
> > nand_read_ecc: from = 0x0001c000, len = 4096
> > nand_read_ecc: from = 0x0001d000, len = 4096
> > nand_read_ecc: from = 0x0001e000, len = 4096
> > nand_read_ecc: from = 0x0001f000, len = 4096
> > nand_write_ecc: to = 0x0001c000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x0001c000 failed: -22
> > nand_erase: start = 0x00018000, len = 16384
> > nand_read_ecc: from = 0x00018000, len = 4096
> > nand_read_ecc: from = 0x00019000, len = 4096
> > nand_read_ecc: from = 0x0001a000, len = 4096
> > nand_read_ecc: from = 0x0001b000, len = 4096
> > nand_write_ecc: to = 0x00018000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00018000 failed: -22
> > nand_erase: start = 0x00014000, len = 16384
> > nand_read_ecc: from = 0x00014000, len = 4096
> > nand_read_ecc: from = 0x00015000, len = 4096
> > nand_read_ecc: from = 0x00016000, len = 4096
> > nand_read_ecc: from = 0x00017000, len = 4096
> > nand_write_ecc: to = 0x00014000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00014000 failed: -22
> > nand_erase: start = 0x00010000, len = 16384
> > nand_read_ecc: from = 0x00010000, len = 4096
> > nand_read_ecc: from = 0x00011000, len = 4096
> > nand_read_ecc: from = 0x00012000, len = 4096
> > nand_read_ecc: from = 0x00013000, len = 4096
> > nand_write_ecc: to = 0x00010000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00010000 failed: -22
> > nand_erase: start = 0x0000c000, len = 16384
> > nand_read_ecc: from = 0x0000c000, len = 4096
> > nand_read_ecc: from = 0x0000d000, len = 4096
> > nand_read_ecc: from = 0x0000e000, len = 4096
> > nand_read_ecc: from = 0x0000f000, len = 4096
> > nand_write_ecc: to = 0x0000c000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x0000c000 failed: -22
> > nand_erase: start = 0x00008000, len = 16384
> > nand_read_ecc: from = 0x00008000, len = 4096
> > nand_read_ecc: from = 0x00009000, len = 4096
> > nand_read_ecc: from = 0x0000a000, len = 4096
> > nand_read_ecc: from = 0x0000b000, len = 4096
> > nand_write_ecc: to = 0x00008000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00008000 failed: -22
> > nand_erase: start = 0x00004000, len = 16384
> > nand_read_ecc: from = 0x00004000, len = 4096
> > nand_read_ecc: from = 0x00005000, len = 4096
> > nand_read_ecc: from = 0x00006000, len = 4096
> > nand_read_ecc: from = 0x00007000, len = 4096
> > nand_write_ecc: to = 0x00004000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00004000 failed: -22
> > nand_erase: start = 0x00000000, len = 16384
> > nand_read_ecc: from = 0x00000000, len = 4096
> > nand_read_ecc: from = 0x00001000, len = 4096
> > nand_read_ecc: from = 0x00002000, len = 4096
> > nand_read_ecc: from = 0x00003000, len = 4096
> > nand_write_ecc: to = 0x00000000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x00000000 failed: -22
> > nand_erase: start = 0x0002c000, len = 16384
> > nand_read_ecc: from = 0x0002c000, len = 4096
> > nand_read_ecc: from = 0x0002d000, len = 4096
> > nand_read_ecc: from = 0x0002e000, len = 4096
> > nand_read_ecc: from = 0x0002f000, len = 4096
> > nand_write_ecc: to = 0x0002c000, len = 12
> > nand_write_ecc: Attempt to write not page aligned data
> > Write clean marker to block at 0x0002c000 failed: -22
> >
> > #
> >
> >
> > I doubt if the error is caused by the incorrect value of "len", but I 
>would
> > like to ask how could I set the "len" to be a correct value.
> > (I have not set the block size yet and do not know if I need to do so.)
> >
> > Thank you.
> >
> > Regards,
> > Kuen
> >
> > _________________________________________________________________
> > 46 FREE English Classes, ACT Now!
> > 
>http://www.linguaphonegroup.com/BannerTrack.asp?EMSCode=MSN03-08ETFJ-0211E
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/

_________________________________________________________________
Get 10Mb extra storage for MSN Hotmail. Subscribe Now! 
http://join.msn.com/?pgmarket=en-hk
