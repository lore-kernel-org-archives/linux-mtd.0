Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CYmNL-0000FP-4t
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 09:19:36 -0500
Received: from 192.168.69.106 ([69.70.213.145]) by VL-MO-MR001.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0I7Y00H9U2F4GC@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 29 Nov 2004 09:18:40 -0500 (EST)
Date: Mon, 29 Nov 2004 09:19:56 -0500
From: ccool <ccool@ninjatech.biz>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Message-id: <200411290919.56666.ccool@ninjatech.biz>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-disposition: inline
Subject: MTD device initialisation, how to access ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I have a RPXlite board with 16 Mb of AMD flash on it (the board configurati=
on=20
is at the end of this mail).  When I boot linux, I can see that the=20
cfi_probie is seeing my chip, but I don`t know how to access it.

I use the /dev support in my kernel with the option that mount it=20
automatically at boot, but I don`t see any character device int /dev/mtd or=
=20
any block device in /dev/mtdblock

I think everythings gets detected correctly, because here is what I see whe=
n I=20
"dmesg" :

<---  some other kernel stuff --->
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
RPX Lite or CLLF flash device: 800000 at fe000000
RPX: Found 4 x16 devices at 0x0 in 32-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
Using word write method
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
<--- other messages --->

My kernel configuration is at the end of this mail.

I would really like to know a way to access the MTD device.  I thought that=
=20
there would be something I have to set, so I changed the=20
#define WINDOW_ADDR 0xfe000000
#define WINDOW_SIZE 0x800000

for

#define WINDOW_ADDR 0xff000000
#define WINDOW_SIZE 0x1000000

in the
drivers/mtd/maps/rpxlite.c

and I thought that would solve the problem, but it did not.  Please if some=
one=20
could direct my toward the solution, an understanding of what is happening =
or=20
even a nice document where it would explain what I have to set to have acce=
ss=20
to the mtd device.  (ideally, a block device)

Thanks
Rapha=EBl

=2D-----------------------
RPXlite
Powerpc MPC823
16 Mb RAM  0000 0000 - 00FF FFFF
16 Mb Flash FF00 0000 - FFFF FFFF
128 ko NVRAM FA00 0000 - FA02 0000
=2E..  actually, I have a lot=20
=2D-----------------------
=46lash memory map, 16 Mb, from FF00 0000 to FFFF FFFF
4 Chips of AMD D323CB90VI 9952AQA G

On the RPXlite, the flash memory is mirrored 4 times because of the way the=
=20
adresses are decoded.:

=46C00 0000
	- mirrored flash 16 Mb
=46CFF FFFF

=46D00 0000
	- mirrored flash 16 Mb
=46DFF FFFF

=46E00 0000
	- mirrored flash 16 Mb
=46EFF FFFF

=46F00 0000
	- actual flash 16 Mb
=46FFF FFFF

=2D-----------------------
Kernel MTD configuration option

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D3
CONFIG_MTD_PARTITIONS=3Dy
CONFIG_MTD_CONCAT=3Dy
CONFIG_MTD_REDBOOT_PARTS=3Dy
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_CHAR=3Dy
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=3Dy
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=3Dy
CONFIG_MTD_JEDECPROBE=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
# CONFIG_MTD_CFI_NOSWAP is not set
CONFIG_MTD_CFI_BE_BYTE_SWAP=3Dy
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=3Dy
# CONFIG_MTD_CFI_B1 is not set
CONFIG_MTD_CFI_B2=3Dy
CONFIG_MTD_CFI_B4=3Dy
# CONFIG_MTD_CFI_B8 is not set
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
CONFIG_MTD_CFI_I4=3Dy
CONFIG_MTD_CFI_I8=3Dy
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=3Dy
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=3Dy
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
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_RPXLITE=3Dy
