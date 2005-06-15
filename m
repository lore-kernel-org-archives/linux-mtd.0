Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DibrR-0003js-GN
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2005 13:39:35 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Dibl5-0008TU-2k
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2005 19:32:59 +0200
Received: from s01060004e28f4900.du.shawcable.net ([70.67.196.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2005 19:32:59 +0200
Received: from andre by s01060004e28f4900.du.shawcable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2005 19:32:59 +0200
To: linux-mtd@lists.infradead.org
From: "Andre" <andre@rocklandocean.com>
Date: Wed, 15 Jun 2005 10:40:45 -0700
Message-ID: <d8poni$4bo$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: can't mount diskonchip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using kernel 2.6.11 with mtd snapshot from 20050612.

My diskonchip still has the m-sys firmware on it and the following is the
dmesg output after issueing the command 'modprobe -a diskonchip nftl':

DiskOnChip found at 0xd0000
Detected 3 chips per floor.
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V
8-bit)
3 NAND chips detected
Bad block table not found for chip 0
Bad block table not found for chip 0
Found DiskOnChip BNAND Media Header at 0x4000
    bootRecordID          = BNAND
    NoOfBootImageBlocks   = 0
    NoOfBinaryPartitions  = 1
    NoOfBDTLPartitions    = 1
    BlockMultiplerBits    = 0
    FormatFlgs            = 1
    OsakVersion           = 5.1.4.0
    PercentUsed           = 98
    PARTITION[0] ->
        virtualUnits    = 4
        firstUnit       = 2
        lastUnit        = 5
        flags           = 0x20000000
        spareUnits      = 0
    PARTITION[1] ->
        virtualUnits    = 24072
        firstUnit       = 11
        lastUnit        = 24575
        flags           = 0xc0000000
        spareUnits      = 2
NFTL driver: nftlcore.c $Revision: 1.97 $, nftlmount.c $Revision: 1.40 $
doc200x_correct_data corrected 2 errors
Could not find valid boot record
NFTL: could not mount device

This device is supposed to be a 384MB chip, but only one of the chips seems
to have been detected by mtd. I haven't had any problems with the device
yet.

Here are the kernel config flags related to mtd:

CONFIG_MTD=m
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_PARTITIONS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=m
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
CONFIG_FTL=m
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
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_RAMTD is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set

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


Here is my lib/modules/2.6.11/kernel/drivers/mtd directory listing:

ftl.ko  mtd_blkdevs.ko  mtdchar.ko  mtdcore.ko  nftl.ko

chips:
chipreg.ko

nand:
diskonchip.ko  nand.ko  nand_ecc.ko  nand_ids.ko

My  questions are:
 * do I need to use the nftl_format?
 * will I loose the bad block info as per the m-sys firmware?
 * will I be able to go back to m-sys firmware? (I only have this one
diskonchip)

best regards,
Andre
