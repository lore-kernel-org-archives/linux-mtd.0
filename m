Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 160oyT-0006bc-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Nov 2001 18:59:57 +0000
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA1B73D7@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: linux-mtd@lists.infradead.org
Subject: MTD files MIA, and strange permission failure
Date: Mon, 5 Nov 2001 13:07:50 -0600 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I downloaded all new from CVS on Friday and am attempting to recompile the
our MIPS kernel with JFFS2 support. Permissions are 777 all the way up to
/usr down both the /usr/src/mtd path and the /usr/src/linux path to which so
much of the mtd path is linked, yet I get this error.

> make[4]: Entering directory `/usr/src/linux/drivers/mtd/chips'
> touch: /usr/src/include/linux/mtd/compatmac.h: Operation not permitted
> make[4]: *** [/usr/src/linux/include/linux/mtd/compatmac.h] Error 1

Also, files cfi_jedec.c and mapped.h are none existent, but of course the
patchin.sh script created softlinks for them anyway. The MTD and JFFS2
section of .config is as follows:
---------------------------------------------------------------------------
...<snip>...
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
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
# CONFIG_MTD_CFI_I1 is not set
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_RAM=y
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
CONFIG_MTD_PHYSMAP_START=9e000000
CONFIG_MTD_PHYSMAP_LEN=2000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_CSTM_MIPS_IXX is not set
# CONFIG_MTD_OCELOT is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=256
CONFIG_MTDRAM_ABS_POS=0
CONFIG_MTD_BLKMTD=y

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set
#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set
#
...<snip>...
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=3
# CONFIG_CRAMFS is not set
...<snip>...
---------------------------------------------------------------------

Have I missed configured something here??


Keith Siders
Software Engineer
 Toshiba America Consumer Products, Inc.
Advanced Television Technology Center
801 Royal Parkway, Suite 100
Nashville, Tennessee 37214
Phone: (615) 257-4050
Fax:   (615) 453-7880
