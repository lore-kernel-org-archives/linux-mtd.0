Received: from smtp20.doorway.no ([212.4.49.47])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L784C-0004MB-An
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 12:39:56 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: UBIFS error CRC calculation on avr32 CPU
Date: Mon, 1 Dec 2008 13:33:24 +0100
Message-ID: <2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
In-Reply-To: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
References: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>,
	<kernel@avr32linux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I get this problem running my ubi/ubifs on a partition in my system.
The error occurs when I try to move one file to a new location and there
seems to be something wrong with the file. The file contains binary data
and is 9.3MB large. Can anyone help me locate this error or point me in
the right direction?

My system is a ap7002(arch =3D=3D avr32) with 32MByte SRAM, 8MByte NOR =
flash
and 2GByte NAND flash(ubi).

Cmd:
----
/mnt/slave # mv wpr_004.wfp ../master/data/

UBIFS error (pid 471): ubifs_check_node: bad CRC: calculated 0x582d0a64,
read 0x4932021b
UBIFS error (pid 471): ubifs_check_node: bad node at LEB 159:302512
UBIFS error (pid 471): ubifs_read_node: expected node type 1
UBIFS error (pid 471): do_readpage: cannot read page 24 of inode 34213,
error -117
mv: read error: Input/output error


The file causing the problem:
-----------------------------
-rwxr-xr-x    1 root     root      9717632 Nov 28  2008 wpr_004.wfp


Disk space and filesystem:
--------------------------
Filesystem           1k-blocks      Used Available Use% Mounted on
...
ubi0:wpr_slave          222992     71776    146156  33% /mnt/slave
...


Mount point:
------------
ubi0:wpr_slave on /mnt/slave type ubifs (rw)


Parts of my kernel configuration:
---------------------------------

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_NAND=3Dy
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
# CONFIG_MTD_NAND_ECC_SMC is not set
# CONFIG_MTD_NAND_MUSEUM_IDS is not set
CONFIG_MTD_NAND_IDS=3Dy
# CONFIG_MTD_NAND_DISKONCHIP is not set
CONFIG_MTD_NAND_ATMEL=3Dy
CONFIG_MTD_NAND_ATMEL_ECC_HW=3Dy
# CONFIG_MTD_NAND_ATMEL_ECC_SOFT is not set
# CONFIG_MTD_NAND_ATMEL_ECC_NONE is not set
# CONFIG_MTD_NAND_NANDSIM is not set
# CONFIG_MTD_NAND_PLATFORM is not set
# CONFIG_MTD_ONENAND is not set

#
# UBI - Unsorted block images
#
CONFIG_MTD_UBI=3Dm
CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
CONFIG_MTD_UBI_BEB_RESERVE=3D1
CONFIG_MTD_UBI_GLUEBI=3Dy

#
# UBI debugging options
#
# CONFIG_MTD_UBI_DEBUG is not set
# CONFIG_PARPORT is not set
CONFIG_BLK_DEV=3Dy
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_MISC_DEVICES=3Dy
# CONFIG_ATMEL_PWM is not set
CONFIG_ATMEL_TCLIB=3Dy
CONFIG_ATMEL_TCB_CLKSRC=3Dy
CONFIG_ATMEL_TCB_CLKSRC_BLOCK=3D0
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_ATMEL_SSC is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HAVE_IDE is not set


#
# Miscellaneous filesystems
#
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=3Dy
# CONFIG_JFFS2_LZO is not set
CONFIG_JFFS2_RTIME=3Dy
# CONFIG_JFFS2_RUBIN is not set
CONFIG_UBIFS_FS=3Dm
# CONFIG_UBIFS_FS_XATTR is not set
CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
# CONFIG_UBIFS_FS_LZO is not set
# CONFIG_UBIFS_FS_ZLIB is not set
# CONFIG_UBIFS_FS_DEBUG is not set
