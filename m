Received: from ihmc.us ([65.212.118.136])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRgJs-0001MK-Rn
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 19:26:44 -0500
Received: from [65.212.118.129] (account mtortonesi HELO [10.100.0.119])
	by ihmc.us (CommuniGate Pro SMTP 4.2.5)
	with ESMTP-TLS id 4155960 for linux-mtd@lists.infradead.org;
	Tue, 09 Nov 2004 18:27:57 -0600
From: Mauro Tortonesi <mtortonesi@ing.unife.it>
To: linux-mtd@lists.infradead.org
Date: Wed, 10 Nov 2004 01:28:10 +0100
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200411100128.10447.mtortonesi@ing.unife.it>
Subject: problems installing linux on a diskonchip device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


hi to everybody,

i am trying to install linux on the diskonchip 2000 device mounted on a pc104. 
i have read the mtd-jffs-HOWTO and the thread:

http://lists.infradead.org/pipermail/linux-mtd/2004-October/010543.html

so i have compiled the 2.6.9 kernel using this configuration:


#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=m
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_PARTITIONS is not set
# CONFIG_MTD_CONCAT is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=m
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_DOCECC=m

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=m
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=m
CONFIG_MTD_NAND_DISKONCHIP=m
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set


and installed it in a slackware 10.0 distro on a hard drive connected to the 
pc104. then i booted from the harddrive and started loading the MTD modules. 
unfortunately, it seems that the kernel finds a diskonchip device but is not 
able to use it. the "modprobe diskonchip" command returns:

FATAL: Error inserting diskonchip 
(/lib/modules/2.6.9/kernel/drivers/mtd/nand/diskonchip.ko): No such device

and the logs are:


Jan  8 23:05:15 darkstar kernel: DiskOnChip found at 0xc8000
Jan  8 23:05:15 darkstar kernel: DiskOnChip 2000 responds to DWORD access
Jan  8 23:05:15 darkstar kernel: NAND device: Manufacturer ID: 0x98, Chip ID: 
0x75 (Toshiba NAND 32MiB 3,3V 8-bit)
Jan  8 23:05:15 darkstar kernel: 9 NAND chips detected
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x10000
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x18000
Jan  8 23:05:15 darkstar kernel:     DataOrgID        = ANAND
Jan  8 23:05:15 darkstar kernel: DiskOnChip found at 0xca000
Jan  8 23:05:15 darkstar kernel: DiskOnChip 2000 responds to DWORD access
Jan  8 23:05:15 darkstar kernel: NAND device: Manufacturer ID: 0x98, Chip ID: 
0x75 (Toshiba NAND 32MiB 3,3V 8-bit)
Jan  8 23:05:15 darkstar kernel: 9 NAND chips detected
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x10000
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x18000
Jan  8 23:05:15 darkstar kernel:     DataOrgID        = ANAND
Jan  8 23:05:15 darkstar kernel: DiskOnChip found at 0xcc000
Jan  8 23:05:15 darkstar kernel: DiskOnChip 2000 responds to DWORD access
Jan  8 23:05:15 darkstar kernel: NAND device: Manufacturer ID: 0x98, Chip ID: 
0x75 (Toshiba NAND 32MiB 3,3V 8-bit)
Jan  8 23:05:15 darkstar kernel: 9 NAND chips detected
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x10000
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x18000
Jan  8 23:05:15 darkstar kernel:     DataOrgID        = ANAND
Jan  8 23:05:15 darkstar kernel: DiskOnChip found at 0xce000
Jan  8 23:05:15 darkstar kernel: DiskOnChip 2000 responds to DWORD access
Jan  8 23:05:15 darkstar kernel: NAND device: Manufacturer ID: 0x98, Chip ID: 
0x75 (Toshiba NAND 32MiB 3,3V 8-bit)
Jan  8 23:05:15 darkstar kernel: 9 NAND chips detected
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x10000
Jan  8 23:05:15 darkstar kernel: Found DiskOnChip ANAND Media Header at 
0x18000
Jan  8 23:05:15 darkstar kernel:     DataOrgID        = ANAND
Jan  8 23:05:15 darkstar kernel: No valid DiskOnChip devices found


i have no clue on how to fix this problem. perhaps i am just following the 
wrong procedure. could you please give me some hints on how to make the 
diskonchip 2000 working? thank you very much in advance.

please, keep my address in cc, as i am not subscribed to this list.


-- 
Aequam memento rebus in arduis servare mentem...

Mauro Tortonesi

University of Ferrara - Dept. of Eng.    http://www.ing.unife.it
Institute of Human & Machine Cognition   http://www.ihmc.us
Deep Space 6 - IPv6 for Linux            http://www.deepspace6.net
Ferrara Linux User Group                 http://www.ferrara.linux.it
