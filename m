Received: from 134.22.47.march-62.151.net ([134.22.47.62]
	helo=mail.marchnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KOL1-00089O-U2
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 21:12:56 +0100
Message-ID: <3BBD8AB1E1EB12418982A3A8E7C5F624390CAC@orion.marchnetworks.com>
From: Jeff Corrall <jcorrall@MarchNetworks.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 26 May 2003 16:12:55 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Intel 28F320J3 on SA1100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have been unsuccessful in getting my Intel flash memory detected on a
custom SA-1110 board.  
There are 2 chips, both in x16 mode and are interleaved at address 0.  I
have taken the following 
steps:

1) Added a description of my flash to mtd/maps/sa1100-flash.c
2) Created a virtual mapping to 0xe8000000

Has anybody experienced problems with this setup?  I've checked the archives
and I found some 
early problems with the Intel parts but everything I have found seems to be
fixed in the latest source.
I've also read the mtd-jffs-HOWTO and even tried to map the flash
physically.  As far as I can tell from
the datasheets, these parts are CFI compliant.  I'm looking for suggestions
on the next step to solving 
this problem  :o)

3) I am using the following configuration file

----------------------------------------------------------------------------
------------------
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_BOOTLDR_PARTS is not set
CONFIG_MTD_AFS_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_MTD_BLOCK_RO is not set
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
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_ARM_INTEGRATOR is not set
# CONFIG_MTD_CDB89712 is not set
CONFIG_MTD_SA1100=y
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_FORTUNET is not set
# CONFIG_MTD_EPXA10DB is not set
# CONFIG_MTD_AUTCPU12 is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
----------------------------------------------------------------------------
------------------------------------------------

Thanks,
Jeff
