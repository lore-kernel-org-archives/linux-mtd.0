Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JrsR-0000Wu-Il
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 10:33:16 +0100
Received: from mail.tuke.sk ([147.232.3.3] ident=postfix)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 19Jrnd-0001Hj-00
	for linux-mtd@lists.infradead.org; Sun, 25 May 2003 10:28:17 +0100
Date: Sun, 25 May 2003 11:27:37 +0200
To: linux-mtd@lists.infradead.org
Message-ID: <20030525092737.GJ13272@intrak.sk>
References: <20030523063820.GH13272@intrak.sk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030523063820.GH13272@intrak.sk>
From: stolc@intrak.sk (Oskar Stolc)
Content-Type: text/plain; charset=us-ascii
Subject: Possible GRUB problem: [Was: DiskOnChip MD2202-D256]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Sorry for a bit longer email, please be patient while reading and try to
help me if can...

I changed the DiskOnChip 2000 MD2202-D256 chip to an older 8MB
DiskOnChip 2000. (May be the MD2202-D256 model ist newer than the
drivers and so it is not supporter yet) Now I am able to see the
/dev/nftla device with /dev/nftla1 partition on my 8 MB flash disk.

> I'm just trying to install DiskOnChip MD2202-D256 flash disk on my
> 2.4.21-rc2 linux. While loading modul by command
> 	'modprobe docprobe'
> 	
> these messages occurred on my screen:
> 
> DiskOnChip Millenium found at address 0xE0000
> Unknown flash chip found: 21 21
> Please report to dwmw2@infradead.org
> Unknown flash chip found: 21 21
> Please report to dwmw2@infradead.org
> Unknown flash chip found: A1 A1
> Please report to dwmw2@infradead.org
> No flash chips recognised.
> 
> This flash disk was formated by DOS command:
> 	dformat /win:e000 /s:doc514.exb
> 
> and that enabled C:\ disk under DOS.
> 
> DiskOnChip is a part of ICOP-6070 PC/104 Embedded CPU module.
> Is there some HOWTO showing me how to install this DOC in Linux?
> Is this DOC supported by MTD drivers in 2.4.21-rc2 kernel?

Here is the order of steps I made to get funtional that 8MB flash disk:

- I built new linux kernel with MTD support. Here is the partion of my
  .config file:

  	#
	# Memory Technology Devices (MTD)
	#
	CONFIG_MTD=y
	CONFIG_MTD_DEBUG=y
	CONFIG_MTD_DEBUG_VERBOSE=0
	# CONFIG_MTD_PARTITIONS is not set
	# CONFIG_MTD_CONCAT is not set
	# CONFIG_MTD_REDBOOT_PARTS is not set
	# CONFIG_MTD_CMDLINE_PARTS is not set
	CONFIG_MTD_CHAR=y
	# CONFIG_MTD_BLOCK is not set
	# CONFIG_MTD_BLOCK_RO is not set
	CONFIG_FTL=y
	CONFIG_NFTL=y
	CONFIG_NFTL_RW=y

	#
	# RAM/ROM/Flash chip drivers
	#
	# nothing is set

	#
	# Mapping drivers for chip access
	#
	# nothing is set

	#
	# Self-contained MTD device drivers
	#
	# CONFIG_MTD_PMC551 is not set
	# CONFIG_MTD_SLRAM is not set
	# CONFIG_MTD_MTDRAM is not set
	# CONFIG_MTD_BLKMTD is not set
	# CONFIG_MTD_DOC1000 is not set
	CONFIG_MTD_DOC2000=y
	# CONFIG_MTD_DOC2001 is not set
	CONFIG_MTD_DOCPROBE=y
	CONFIG_MTD_DOCPROBE_ADVANCED=y
	CONFIG_MTD_DOCPROBE_ADDRESS=E0000
	# CONFIG_MTD_DOCPROBE_HIGH is not set
	# CONFIG_MTD_DOCPROBE_55AA is not set

	#
	# NAND Flash Device Drivers
	#
	CONFIG_MTD_NAND=y
	# CONFIG_MTD_NAND_VERIFY_WRITE is not set
	CONFIG_MTD_NAND_IDS=y

- by MS DOS program I formated the chip:
	dformat /win:e000 /s:doc514.exb /empty /y /nodos
- and booted my newly created kernel. Some output while processing the
  kernel booting follows:
	
	Using configured DiskOnChip probe adress 0xe000
	DiskOnChip 2000 found at address 0xE000
	Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba:NAND 8MB 3,3V)
  	1 flash chips found. Total DiskOnChip size: 8 MB
	mtd: Giving out device 0 to DiskOnChip 2000
	$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $
	ftl_cs: FTL header not found.
	NFTL driver: nttlcore.c $Revision: 1.87 $, nftlmount.c $Revision: 1.31 $
	NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think we know wat it means...
	Partition check:
	 nftla: nftla1

- then I partitioned the flash disk:

	# fdisk /dev/nftla
	Command (m for help): p
	Disk /dev/nftla: 8 MB, 8101888 bytes
	16 heads, 1 sector/track, 989 cylinders
	Units = cylinders of 16 * 512 = 8192 bytes
		Device	Boot	Start	End	Blocks	Id	System
	/dev/nftla1		1	989	7911+	1	FAT12

	Command (m for help): d 1

	Command (m for help): n p 1 <ENTER> <ENTER>

	Command (m for help): a 1

	Command (m for help): p
	Disk /dev/nftla: 8 MB, 8101888 bytes
	16 heads, 1 sector/track, 989 cylinders
	Units = cylinders of 16 * 512 = 8192 bytes
		Device	Boot	Start	End	Blocks	Id	System
	/dev/nftla1		1	989	7911+	1	Linux

	Command (m for help): w

- I created an ext2 filesystem on /dev/nftla1 partition and transfered
  my minimalised linux 'distribution' on that partition. (I created a
  linux system that can fit under 8 MB following the Linux BootDisk
  HOWTO)

- the following step was to build GRUB with DiskOnChip support:
	wget ftp://alpla.gnu.org/gnu/grub/grub-0.92.tar.gz
	tar xzvf grup-0.92.tar.gz
	cd grup-0.92
	cat ../mtd/patches/grub-0.92-doc.patch |patch -p1
	aclocal
	automake --add-missing
	autoconf
	./configure --enable-diskonchip-2000 --enable-ext2fs \
		--disable-ffs --disable-xfs --disable-jfs \
		--disable-vstafs --disable-reiserfs \
		--disable-minix --disable-fat
	make

- compilation was successful. After that all I loaded grub_firmware into
  flash disk typing in MS DOS environment:
  	dformat /win:e000 /bdkf0:grub_f~1
  Regarding the outputs from dformat, this command ended successfully.
  
Finally I rebooted my computer by turning the power off and on again.

Now I can see loading grub from flash disk, by it crashes by following
error:

	DoC 2000 E600
	E698
	Jumping to Grub
	Attempting to open /dev/grub/menu.lst on drive 0xe0, partition 0xff
	DiskOnChip 2000 found at e0000
	floor 0, chip 0; manufacturer: Toshiba
	Chip: Toshiba TC58V64AFT/DC, total size: 8 MB
		erase unit: 8192 bytes, page: 512 bytes
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	_DoC_WaitReady timed out
	Total of 1 chips found - total capacity 8 MB
	Scanning for NFTL Media Header
	NFTL Media Header found in flash sector 176
	Sorry, we don't support UnitSizeFactor of != 1 yet
	NFTL Media Header found in flash sector 192
	Sorry, we don't support UnitSizeFactor of != 1 yet
	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0xff
	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x0
	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x1
	Attempting to open /boot/grub/menu.lst on drive 0xe0, partition 0x2
	...
	Attempting to open /boot/grub/menu.lst on drive 0x0, partition 0xf
	
		GRUB version 0.92 (639K lower / 121856K upper memory)

In this moment a get a grub> promtp. Trying enter
	kernel (dc0,0)/boot/bzImage root=/dev/nftla1
a get a result
	Loading kernel image...
	Error 21: Selected disk does not exist

:-(

What am I doing incorrectly?

All suggests are welcome.

Thank you,

Oskar Stolc
