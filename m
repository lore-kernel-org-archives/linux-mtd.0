Received: from cn2.connectnet.com ([207.110.3.2] helo=smtp.connectnet.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 160tnw-0006zo-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 00:09:24 +0000
Reply-To: <jglennon@getntds.com>
To: <linux-mtd@lists.infradead.org>
Subject: Need help understanding cfi_probe and cfi_cmdset_0002
Date: Mon, 5 Nov 2001 16:37:57 -0800
Message-ID: <2178200CCE4ED311974300A0CC4263FB143605@accounting>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
From: jglennon@getntds.com
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

I find that qry_present is failing on MVME5100

target board:   Motorola MVME5100, CPU=MPC750
                FLASH = 4x AMD29D323D, is CFI.

kernel:  2.4.2 (Hard Hat Linux 2.0)
MTD:     CVS download of about Tuesday (10/30/01)

I do not see how to "make it" do cfi_cmdset_0002 (amdstd CFI) stuff.
It goes through gen_probe, and since it didn't correctly put chips into CFI
query mode, the qry_present fails.


It appears like the command to enter CFI Query mode not working; subsequent
cfi_reads return "normal" flash data, I think.  So qry_present returns 1.

I say it looks like normal FLASH contents because I see the stuff cfi_read
returns when I use PPC_BUG6> m 0xF4000000 and scroll on down to ...80 which
is 0x10 * osf.

I am likely missing something basic.  Like incorrect xconfig settings!
Help appreciated!

Enclosed is .config.
Thank you!

Joe Glennon
GET Engineering
San Diego CA
---------------------
.config:
(deleted down to MTD stuff...)
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
# CONFIG_MTD_PARTITIONS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
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
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0xF4000000
CONFIG_MTD_PHYSMAP_LEN=0x1000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_PCI is not set

 --(No self-contained configured...)
 --(No DOC configured...)

# CONFIG_MTD_NAND is not set
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_BLK_DEV_LOOP=y
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y

(deletions)


#
# File systems
#
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=3
# CONFIG_CRAMFS is not set
# CONFIG_RAMFS is not set
CONFIG_ISO9660_FS=y
CONFIG_PROC_FS=y
CONFIG_DEVPTS_FS=y
CONFIG_EXT2_FS=y



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
