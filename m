Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GmL9N-0003uf-12
	for linux-mtd@lists.infradead.org; Mon, 20 Nov 2006 21:14:24 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAL2DxRQ025506
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 21:13:59 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAL2DxXq274468
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 21:13:59 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAL2DxKQ011764
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 21:13:59 -0500
Received: from [9.67.123.168] (wecm-9-67-123-168.wecm.ibm.com [9.67.123.168])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAL2DwlP011713
	for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2006 21:13:58 -0500
Subject: [PATCH] [MTD] BLKDEV: Add MTD_BLKDEVS Kconfig option
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 20 Nov 2006 20:15:36 -0600
Message-Id: <1164075336.19697.34.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a MTD_BLKDEVS Kconfig option to cleanup the makefile a bit

Signed-off-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>
---
 drivers/mtd/Kconfig  |   12 ++++++++++++
 drivers/mtd/Makefile |   15 ++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

--- linux-2.6.orig/drivers/mtd/Kconfig
+++ linux-2.6/drivers/mtd/Kconfig
@@ -164,9 +164,15 @@ config MTD_CHAR
 	  memory chips, and also use ioctl() to obtain information about
 	  the device, or to erase parts of it.
 
+config MTD_BLKDEVS
+	tristate "Common interface to block layer for MTD 'translation layers'"
+	depends on MTD && BLOCK
+	default n
+
 config MTD_BLOCK
 	tristate "Caching block device access to MTD devices"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	---help---
 	  Although most flash chips have an erase size too large to be useful
 	  as block devices, it is possible to use MTD devices which are based
@@ -189,6 +195,7 @@ config MTD_BLOCK
 config MTD_BLOCK_RO
 	tristate "Readonly block device access to MTD devices"
 	depends on MTD_BLOCK!=y && MTD && BLOCK
+	select MTD_BLKDEVS
 	help
 	  This allows you to mount read-only file systems (such as cramfs)
 	  from an MTD device, without the overhead (and danger) of the caching
@@ -200,6 +207,7 @@ config MTD_BLOCK_RO
 config FTL
 	tristate "FTL (Flash Translation Layer) support"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	---help---
 	  This provides support for the original Flash Translation Layer which
 	  is part of the PCMCIA specification. It uses a kind of pseudo-
@@ -216,6 +224,7 @@ config FTL
 config NFTL
 	tristate "NFTL (NAND Flash Translation Layer) support"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	---help---
 	  This provides support for the NAND Flash Translation Layer which is
 	  used on M-Systems' DiskOnChip devices. It uses a kind of pseudo-
@@ -239,6 +248,7 @@ config NFTL_RW
 config INFTL
 	tristate "INFTL (Inverse NAND Flash Translation Layer) support"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	---help---
 	  This provides support for the Inverse NAND Flash Translation
 	  Layer which is used on M-Systems' newer DiskOnChip devices. It
@@ -256,6 +266,7 @@ config INFTL
 config RFD_FTL
         tristate "Resident Flash Disk (Flash Translation Layer) support"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	---help---
 	  This provides support for the flash translation layer known
 	  as the Resident Flash Disk (RFD), as used by the Embedded BIOS
@@ -266,6 +277,7 @@ config RFD_FTL
 config SSFDC
 	tristate "NAND SSFDC (SmartMedia) read only translation layer"
 	depends on MTD && BLOCK
+	select MTD_BLKDEVS
 	help
 	  This enables read only access to SmartMedia formatted NAND
 	  flash. You can mount it with FAT file system.
--- linux-2.6.orig/drivers/mtd/Makefile
+++ linux-2.6/drivers/mtd/Makefile
@@ -15,13 +15,14 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
-obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o mtd_blkdevs.o
-obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o mtd_blkdevs.o
-obj-$(CONFIG_FTL)		+= ftl.o mtd_blkdevs.o
-obj-$(CONFIG_NFTL)		+= nftl.o mtd_blkdevs.o
-obj-$(CONFIG_INFTL)		+= inftl.o mtd_blkdevs.o
-obj-$(CONFIG_RFD_FTL)		+= rfd_ftl.o mtd_blkdevs.o
-obj-$(CONFIG_SSFDC)		+= ssfdc.o mtd_blkdevs.o
+obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
+obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o
+obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o
+obj-$(CONFIG_FTL)		+= ftl.o
+obj-$(CONFIG_NFTL)		+= nftl.o
+obj-$(CONFIG_INFTL)		+= inftl.o
+obj-$(CONFIG_RFD_FTL)		+= rfd_ftl.o
+obj-$(CONFIG_SSFDC)		+= ssfdc.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
