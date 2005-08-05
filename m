Received: from fall-pradero.atl.sa.earthlink.net ([207.69.195.104])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E1CMa-0006KM-Jm
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2005 01:16:33 +0100
Received: from pop-tawny.atl.sa.earthlink.net ([207.69.195.67])
	by fall-pradero.atl.sa.earthlink.net with esmtp (Exim 3.36 #4)
	id 1E1Bpt-0008Td-00
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2005 19:42:45 -0400
Received: from cpe-66-1-91-99.az.sprintbbd.net ([66.1.91.99]
	helo=[192.168.0.254])
	by pop-tawny.atl.sa.earthlink.net with esmtp (Exim 3.36 #10)
	id 1E1Bl0-0000rh-00
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2005 19:37:43 -0400
From: Brent Roberts <randd@globalopensource.net>
To: MTD list <linux-mtd@lists.infradead.org>
Date: Fri, 5 Aug 2005 16:37:33 -0700
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200508051637.33177.randd@globalopensource.net>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: kernel for DOC 2000 192 MB with 5.1.2 firmware
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all.

Which kernel version will support the DiskOnChip 2000 size 192 MB with 5.1.2 
firmware?  I have not had success doing the following:

Using kernel 2.6.3 with the following relevant configuration:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOCPROBE=y
CONFIG_MTD_DOCPROBE_ADDRESS=0

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND_IDS=y

and kernel 2.6.8 with the following relevant configuration:

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCECC=y

#
# NAND Flash Device Drivers
#
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_IDS=y
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0

In each case I boot to DOS and issue the following commands using version 5.x 
of DOC tools:

To save the BBT:
dformat /win:d000 /noformat /log:docbbt.txt

To install GRUB and format with NFTL (where GRUB_F~1 is grub_firmware, I 
intend to boot from this DOC):

dformat /win:d000 /bdfk0:GRUB_F~1

Then I boot to linux:

fdisk /dev/nftla

This command fails: "fdisk cannot open /dev/nftla".  

The above commands and grub_firmware worked fine with a 32 MB DOC 2000 having 
4.2 firmware on the 2.6.3 kernel i described above.


I have read that linux prefers the 4.2 firmware, however, attempts to change 
from 5.1.2 to 4.2 have been unsuccessful using M-Systems DOC tools under DOS.

Thanks in advance!

-Brent Roberts
