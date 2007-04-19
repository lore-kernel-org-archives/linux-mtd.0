Received: from mail2.metocean.com ([142.176.129.151] helo=metocean.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeZDv-0001uG-8T
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 12:11:09 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: DOC 2000 on Linux 2.6 cannot boot
Date: Thu, 19 Apr 2007 13:10:15 -0300
Message-ID: <5269FB0A43484A4AA1B7EE047BCBFAAD01BC7F69@juno.MetoceanData.local>
From: "Charles Mao" <CMao@metocean.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
=20
I am new to MTD subsystems and I need your help to make my DiskOnChip
2000 work on a PC-104 system.
My CPU board is Tri-M's TMZ104. I have a 128MB DOC 2000 TSOP(INFTL).=20

I built the mtd into kernel 2.6.20.6 and system created the following 9
device files
[root@sales03 linux-2.6.20.6]# ls /dev/mtd*
/dev/mtd0  /dev/mtd0ro  /dev/mtd1  /dev/mtd1ro  /dev/mtd2  /dev/mtd2ro
/dev/mtdblock0  /dev/mtdblock1  /dev/mtdblock2

Then I check partitions and get the following output
[root@sales03 linux-2.6.20.6]# docfdisk /dev/mtd0
Device size is 134217728 bytes.  Erasesize is 16384 bytes.
Found INFTL Media Header at block 1:
  bootRecordID          =3D BNAND
  NoOfBootImageBlocks   =3D -1
  NoOfBinaryPartitions  =3D 1
  NoOfBDTLPartitions    =3D 1
  BlockMultiplierBits   =3D 0
  FormatFlags           =3D 1
  OsakVersion           =3D 5.1.4.0
  PercentUsed           =3D 98
Unitsize is 16384 bytes.  Device has 8192 units.
  Partition 1   (BDK): 5242880 bytes
    virtualUnits  =3D 320
    firstUnit     =3D 2
    lastUnit      =3D 321
    flags         =3D 0x20000000
    spareUnits    =3D 0
  Unpartitioned space: 32768 bytes
    virtualUnits  =3D 2
    firstUnit     =3D 322
    lastUnit      =3D 323
  Partition 2  (BDTL): 126205952 bytes
    virtualUnits  =3D 7703
    firstUnit     =3D 324
    lastUnit      =3D 8191
    flags         =3D 0xc0000000
    spareUnits    =3D 2

Next, when I try to program the BIOS rom, I got the error shown below
[root@sales03 linux-2.6.20.6]# doc_loadbios /dev/mtd0
/usr/docboot/bios_ext
Performing Flash Erase of length 16384 at offset 0
ioctl(MEMERASE): Input/output error
nand_erase: attempt to erase a bad block at page 0x00000000
[root@sales03 linux-2.6.20.6]#

Could anybody tell me what's wrong ?

Thanks,

Charles Mao


P.s. I attached my MTD configuration for the kernel, could you check
anything incorrect?

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D3
CONFIG_MTD_CONCAT=3Dy
CONFIG_MTD_PARTITIONS=3Dy
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_FTL=3Dm
CONFIG_NFTL=3Dm
CONFIG_NFTL_RW=3Dy
CONFIG_INFTL=3Dm
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
# CONFIG_MTD_TS5500 is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOC2000=3Dm
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set
CONFIG_MTD_DOCPROBE=3Dm
CONFIG_MTD_DOCECC=3Dm
# CONFIG_MTD_DOCPROBE_ADVANCED is not set
CONFIG_MTD_DOCPROBE_ADDRESS=3D0

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=3Dy
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
# CONFIG_MTD_NAND_ECC_SMC is not set
CONFIG_MTD_NAND_IDS=3Dy
CONFIG_MTD_NAND_DISKONCHIP=3Dy
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
# CONFIG_MTD_NAND_CAFE is not set
# CONFIG_MTD_NAND_CS553X is not set
# CONFIG_MTD_NAND_NANDSIM is not set

#
# OneNAND Flash Device Drivers
#
# CONFIG_MTD_ONENAND is not set
