Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lGdv-0007mc-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 21:46:11 +0100
Received: from [199.221.73.29] (helo=marconi-gfw.marconicommerce.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14lGcn-0007lg-00
	for mtd@infradead.org; Thu, 05 Apr 2001 21:45:33 +0100
Message-ID: <A3E34B558F5CD211B4980008C7A4A99003163E34@sparrow.eng.gilbarco.com>
From: "Williams, Kevin M." <kevin.m.williams@marconi.com>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: FTL header not found?
Date: Thu, 5 Apr 2001 16:44:07 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I am a Linux newbie porting Linux 2.4.3 to a custom embedded PowerPC 860
board.   I have replaced my drivers/mtd and include/linux/mtd directories
with what's in the latest mtd snapshot off the FTP site (20010404).  I am
not trying to do anything real fancy or cutting edge, I just want to be able
to mount my onboard AMD flash chips as an ext2 filesystem.

The cfi_probe code in the latest mtd patch seems to identify the chips and
configuration (coupled pair in 16 bit mode), but scan_header() in ftl.c
seems to read incorrectly when searching for the ftl header (it doesn't find
one...see output below).   The kernel builds and boots, but I get an ftl
error (header not found) during boot up, and I can't mount the flash. I get:

192.168.60.12:/> mount -t ext2 /dev/ftla /flash
bad area!!
bad area!!
mount: /dev/ftla has wrong device number or fs type ext2 not supported

ls -l on the /dev directory shows:
crwxr-xr-x   1 root     root      60,   0 Oct  2  2000 flash0
brwxr-xr-x   1 root     root      44,   0 Oct  2  2000 ftla

This same hardware currently runs a hacked up version of 2.2.13 with some
flash code merged in that has ftl and cfi functionality, but not as mtd,
just as a device.

I'm guessing either the read routine isn't big-endian supported, or I don't
need to find the ftl header and my problem is really elsewhere, or I am just
doing something stupid.

Is there a HOWTO or other documentation on any of this?  

Thanks in advance for any help or ideas.

Kevin Williams
Marconi Commerce Systems

relevant portion of debug output.............
physmap flash device: 400000 at ffc00000
Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
Physically mapped flash: Swapping erase regions for broken CFI table.
number of CFI chips: 1
0: offset=0x0,size=0x20000,blocks=31
1: offset=0x3e0000,size=0x4000,blocks=8
mtd: Giving out device 0 to Physically mapped flash
$Id: ftl.c,v 1.28 2001/03/17 17:10:21 dwmw2 Exp $
ftl_cs: FTL header not found.
NET4: Linux TCP/IP 1.0 for NET4.0...

.config MTD settings:
#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# RAM/ROM Device Drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_MTDRAM is not set

#
# Linearly Mapped Flash Device Drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_VIRTUAL_ER is not set
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0xFFC00000
CONFIG_MTD_PHYSMAP_LEN=0x00400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_SA1100 is not set
# CONFIG_MTD_DC21285 is not set
# CONFIG_MTD_IQ80310 is not set
# CONFIG_MTD_CSTM_CFI_JEDEC is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_JEDEC is not set
# CONFIG_MTD_ARM is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_CHAR is not set
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
CONFIG_FTL=y
# CONFIG_NFTL is not set




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
