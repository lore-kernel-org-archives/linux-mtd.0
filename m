Received: from web10308.mail.yahoo.com ([216.136.130.86])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UNph-0003j1-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 09:09:37 +0000
Message-ID: <20030103094024.54024.qmail@web10308.mail.yahoo.com>
Date: Fri, 3 Jan 2003 01:40:24 -0800 (PST)
From: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Problem with DiskOnChipMillenium
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi all,

I am working on an Assabet like board(SA1110).
but when I enable mtd device(M-systems Millenium)I am
able to see the driver recognizing the Millenium chip.

After booting I have added following links 

mknod /dev/nftla b 93 0
mknod /dev/nftla1 b 93 1
mknod /dev/nftla2 b 93 2
mknod /dev/nftla3 b 93 3

and 

mknod /dev/mtd0 c 90 0
mknod /dev/mtd1 c 90 1
mknod /dev/mtd2 c 90 2
mknod /dev/mtd3 c 90 3

and in bootup I am getting some errors like
out-of-line wait
_DoC_WaitReady called for out-of-line wait
.
.

_DoC_WaitReady called for out-of-line wait
Could not find valid boot record
Could not mount NFTL device

and using nftl_format I tried to format the diskon
chip But I get an error like the following

NFTL_open
ENODEV: thisNFTL = 0, minor = 23808, ip = c94ac4c0, fp
= c965caa0
NFTL_open
ENODEV: thisNFTL = 0, minor = 23809, ip = c94ac6e0, fp
= c965ca20

The only thing I could do was 

 dd if=XXXX of=/dev/mtd0 

What all things I need to so to make a linux filesysem
on Disk On Chip.

I am adding part of my .config here.

# 
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_BOOTLDR_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set

# 
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

# 
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
# CONFIG_MTD_GEN_PROBE is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC1000 is not set
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOC2001=y
CONFIG_MTD_DOCPROBE=y
# CONFIG_MTD_DOCPROBE_ADVANCED is not set
CONFIG_MTD_DOCPROBE_ADDRESS=0
# CONFIG_MTD_DOCPROBE_HIGH is not set
# CONFIG_MTD_DOCPROBE_55AA is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Plug and Play configuration
#
# CONFIG_PNP is not set



TIA
Best Regards
Sanal.



__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
