Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19GIen-00005V-OC
	for <linux-mtd@lists.infradead.org>; Thu, 15 May 2003 14:20:30 +0100
Received: from [65.66.242.209] (helo=mail.pondussolutions.com)
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 19GIej-00052c-00
	for linux-mtd@lists.infradead.org; Thu, 15 May 2003 14:20:26 +0100
Message-ID: <2040.199.67.7.151.1053004532.squirrel@www.pondussolutions.com>
Date: Thu, 15 May 2003 08:15:32 -0500 (CDT)
From: "Thomas Griffing" <Thomas.Griffing@pondussolutions.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Subject: insmod doc2000 returns kernel BUG!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm hoping this gets to the right place.

I've been trying to get a kernel to properly
recognize a 8 Mbyte Disk-On-Chip, the M-Systems
MD-2000-D08.  After installing Red Hat 9 and
configuring the 2.4.20-8 kernel for the mtd, it
detects the DOC on bootup:

  Using configured DiskOnChip probe address 0xd8000
  DiskOnChip Millennium found at address 0xD8000
  Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
  1 flash chips found. Total DiskOnChip size: 8 MiB
  ftl_cs: FTL header not found.
  NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
   nftla: nftla1



trying to load the module for it fails as
follows:

  # insmod mtdcore
  Using /lib/modules/2.4.20-8custom/kernel/drivers/mtd/mtdcore.o
  # insmod docecc
  Using /lib/modules/2.4.20-8custom/kernel/drivers/mtd/devices/docecc.o
  # insmod doc2000
  Using /lib/modules/2.4.20-8custom/kernel/drivers/mtd/devices/doc2000.o
  ------------[ cut here ]------------
  kernel BUG at module.c:117!
  invalid operand: 0000
  doc2000 docecc mtdcore iptable_filter ip_tables autofs 8139too mii
  ide-scsi scsi_mod ide-cd cdrom keybdev mousedev hid input usb-uhci usbcore
  ext3 jbd
  CPU:    0
  EIP:    0060:[<c01194c8>]    Not tainted
  EFLAGS: 00010286

  EIP is at inter_module_register [kernel] 0xb8 (2.4.20-8custom)
  eax: 00000038   ebx: d00e5d9f   ecx: 00000002   edx: 00000046
  esi: c022a14b   edi: d00e5daa   ebp: c1a63ac0   esp: ccf4bef8
  ds: 0068   es: 0068   ss: 0068
  Process insmod (pid: 2347, stackpage=ccf4b000)
  Stack: c02321a0 d00e5d9f cd707360 cd707360 ffffffea 00000002 00000002
  d00e3000
       d00e5854 d00e5d9f d00e3000 d00e3800 c0119c92 d00e5e80 08099802
  00002daa
       00000060 00000060 00000007 cd707340 ccdad000 ccd0a000 00000060
  d00e1000
  Call Trace:   [<d00e5d9f>] im_name [doc2000] 0x0 (0xccf4befc))
  [<d00e5854>] init_module [doc2000] 0x14 (0xccf4bf18))
  [<d00e5d9f>] im_name [doc2000] 0x0 (0xccf4bf1c))
  [<d00e3800>] DoC2k_init [doc2000] 0x0 (0xccf4bf24))
  [<c0119c92>] sys_init_module [kernel] 0x4a2 (0xccf4bf28))
  [<d00e5e80>] .kmodtab [doc2000] 0x0 (0xccf4bf2c))
  [<d00e3060>] DoC_Delay [doc2000] 0x0 (0xccf4bf58))
  [<c0109103>] system_call [kernel] 0x33 (0xccf4bfc0))


  Code: 0f 0b 75 00 96 1a 23 c0 83 c4 0c eb b4 53 68 e0 21 23 c0 e8
   Segmentation fault
  #
  # lsmod
  Module                  Size  Used by    Not tainted
  doc2000                13556   1  (initializing)
  docecc                  3652   0  [doc2000]
  mtdcore                 3524   0  [doc2000]
  iptable_filter          2316   0  (autoclean) (unused)
  ip_tables              14488   1  [iptable_filter]
  autofs                 12148   0  (autoclean) (unused)
  8139too                17032   1
  mii                     3720   0  [8139too]
  ide-scsi               11120   0
  scsi_mod              102616   1  [ide-scsi]
  ide-cd                 33404   0
  cdrom                  31040   0  [ide-cd]
  keybdev                 2752   0  (unused)
  mousedev                5204   0  (unused)
  hid                    20772   0  (unused)
  input                   5664   0  [keybdev mousedev hid]
  usb-uhci               24652   0  (unused)
  usbcore                73120   1  [hid usb-uhci]
  ext3                   64704   1
  jbd                    47828   1  [ext3]
  #


Here's the MTD config section:

  #
  # Memory Technology Devices (MTD)
  #
  CONFIG_MTD=y
  # CONFIG_MTD_DEBUG is not set
  CONFIG_MTD_PARTITIONS=y
  CONFIG_MTD_CONCAT=m
  CONFIG_MTD_REDBOOT_PARTS=m

  #
  # User Modules And Translation Layers
  #
  CONFIG_MTD_CHAR=y
  CONFIG_MTD_BLOCK=y
  CONFIG_FTL=y
  CONFIG_NFTL=y
  # CONFIG_NFTL_RW is not set

  #
  # RAM/ROM/Flash chip drivers
  #
  # CONFIG_MTD_CFI is not set
  # CONFIG_MTD_JEDECPROBE is not set
  # CONFIG_MTD_GEN_PROBE is not set
  # CONFIG_MTD_RAM is not set
  # CONFIG_MTD_ROM is not set
  # CONFIG_MTD_ABSENT is not set
  # CONFIG_MTD_OBSOLETE_CHIPS is not set

  #
  # Mapping drivers for chip access
  #
  # CONFIG_MTD_PCI is not set

  #
  # Self-contained MTD device drivers
  #
  CONFIG_MTD_PMC551=m
  # CONFIG_MTD_PMC551_BUGFIX is not set
  # CONFIG_MTD_PMC551_DEBUG is not set
  CONFIG_MTD_SLRAM=m
  CONFIG_MTD_MTDRAM=m
  CONFIG_MTDRAM_TOTAL_SIZE=4096
  CONFIG_MTDRAM_ERASE_SIZE=128
  CONFIG_MTD_BLKMTD=m

  #
  # Disk-On-Chip Device Drivers
  #
  CONFIG_MTD_DOC1000=m
  CONFIG_MTD_DOC2000=y
  CONFIG_MTD_DOC2001=m
  CONFIG_MTD_DOCPROBE=y
  CONFIG_MTD_DOCPROBE_ADVANCED=y
  CONFIG_MTD_DOCPROBE_ADDRESS=0xD8000
  # CONFIG_MTD_DOCPROBE_HIGH is not set
  # CONFIG_MTD_DOCPROBE_55AA is not set

  #
  # NAND Flash Device Drivers
  #
  CONFIG_MTD_NAND=m
  # CONFIG_MTD_NAND_ECC is not set
  # CONFIG_MTD_NAND_VERIFY_WRITE is not set


Any hints?

----------------------------------------------------------------
   Thomas L. Griffing       Red Hat Certified Engineer
   Pondus Solutions, Inc.   mailto:RHCE@swbell.net
