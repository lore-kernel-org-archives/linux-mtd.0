Received: from guardian.hermes.si ([193.77.5.150])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t6eF-0005iX-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 13:47:27 +0100
Received: from primus.hermes.si (primus.hermes.si [193.77.5.98])
	by guardian.hermes.si (8.9.3/8.9.3) with ESMTP id OAA20594
	for <linux-mtd@lists.infradead.org>; Thu, 4 Apr 2002 14:47:24 +0200 (METDST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by primus.hermes.si (Postfix) with ESMTP id C4F1373C6A
	for <linux-mtd@lists.infradead.org>; Thu,  4 Apr 2002 14:46:55 +0200 (CEST)
Received: from hsl-mb2.hermes.si (hsl-mb2.hermes.si [10.53.100.100])
	by primus.hermes.si (Postfix) with ESMTP id 7D7F073C68
	for <linux-mtd@lists.infradead.org>; Thu,  4 Apr 2002 14:46:54 +0200 (CEST)
Received: from jadran.hermes.si (jadran.hermes.si [10.53.1.9])
	by hsl-mb2.hermes.si (8.9.3/8.9.3) with ESMTP id PAA01800
	for <linux-mtd@lists.infradead.org>; Thu, 4 Apr 2002 15:06:06 +0200
Message-ID: <81D0D3538E3CD411AE3C00D0B7474C31BB63BA@jadran.hermes.si>
From: Ludvik Kumin <ludvik.kumin@hermes.si>
To: linux-mtd@lists.infradead.org
Subject: Flash partitions
Date: Thu, 4 Apr 2002 14:49:51 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
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

Hi!

I am  trying to get the mtd working on the custom-made board based 
on the SA1110. It contains two Intel StrataFlash chips 28F640J3A 
(8 MB each; the first is connected to the data lines D0 - D15, the second
to D16 - D31). I manage to read/ write the flash using "dd" 
(through the device file /dev/mtd5) and also to mount the
/dev/mtdblock5 (-t jffs) device and read/write to it. 

However, while booting the kernel (2.4.16) I get the message:

>---------------------------------------------------------------------------
----------------
physmap flash device: 1000000 at 0
Using buffer write method
mtd: Giving out device 0 to Physically mapped flash
SA1100 flash: probing 32-bit flash bus
Using buffer write method
No RedBoot partition table detected in SA1100 flash   <--------- !!!
Using static partition definition
Creating 5 MTD partitions on "SA1100 flash":
0x00000000-0x00040000 : "bootloader"
mtd: Giving out device 1 to bootloader
0x00040000-0x00080000 : "bootloader params"
mtd: Giving out device 2 to bootloader params
0x00080000-0x00180000 : "kernel"
mtd: Giving out device 3 to kernel
0x00180000-0x00800000 : "RAM disk"
mtd: Giving out device 4 to RAM disk
0x00800000-0x01000000 : "jffs"
mtd: Giving out device 5 to jffs
----------------------------------------------------------------------------
---------------<

The partition table is not detected! The part of the ".config" file
related to "mtd" is:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_REDBOOT_PARTS=y
# CONFIG_MTD_BOOTLDR_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=y
# CONFIG_MTD_CFI_B8 is not set
# CONFIG_MTD_CFI_I1 is not set
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=00000000
CONFIG_MTD_PHYSMAP_LEN=1000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_CDB89712 is not set
CONFIG_MTD_SA1100=y
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_EPXA10DB is not set
# CONFIG_MTD_AUTCPU12 is not set
# CONFIG_MTD_PCI is not set

Q:
Has anyone experienced the same problem? 
What could be the reason the partition table is not found?
Any help would be appreciated.

Ludvik
 
