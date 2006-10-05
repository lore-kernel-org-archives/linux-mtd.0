Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVWF0-0001Y4-TN
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 17:38:35 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17701.15123.205461.480037@vaishnavi.localdomain>
Date: Thu, 5 Oct 2006 22:34:19 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] NAND: nandsim sector-wise allocation
In-Reply-To: <17701.14724.377713.929566@vaishnavi.localdomain>
References: <17701.14724.377713.929566@vaishnavi.localdomain>
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The existing config options related to chip mapping and chip-wise
allocation are moved to kernel configuration system.

Index: linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/Kconfig	2006-10-01 18:56:35.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/Kconfig	2006-10-01 20:35:47.000000000 +0530
@@ -239,4 +239,28 @@
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+choice 
+	depends on MTD_NAND_NANDSIM
+	prompt "Mapping/allocation method"
+	default MTD_NAND_NANDSIM_CHIP_ALLOC
+
+config  MTD_NAND_NANDSIM_CHIP_MAP
+	bool "Mapped flash image"
+	help
+	  The flash data is stored in an image mapped to memory.
+
+config  MTD_NAND_NANDSIM_CHIP_ALLOC
+	bool "Use allocated memory"
+	help
+	  The flash data is stored in allocated memory.
+
+endchoice
+
+config MTD_NAND_NANDSIM_ABS_POS
+	hex "Location of the flash image"
+	depends on MTD_NAND_NANDSIM_CHIP_MAP
+	help
+	  The value specifies the location at which the flash
+	  image exists.
+
 endmenu
Index: linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c
===================================================================
--- linux-2.6-mtd-quilt.orig/drivers/mtd/nand/nandsim.c	2006-10-01 18:53:35.000000000 +0530
+++ linux-2.6-mtd-quilt/drivers/mtd/nand/nandsim.c	2006-10-01 20:39:39.000000000 +0530
@@ -37,10 +37,17 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
-#ifdef CONFIG_NS_ABS_POS
+#ifdef CONFIG_MTD_NAND_NANDSIM_CHIP_MAP
 #include <asm/io.h>
 #endif
 
+#if defined(CONFIG_MTD_NAND_NANDSIM_CHIP_MAP)
+#define CONFIG_NANDSIM_CHIP_MAP      1
+#elif defined(CONFIG_MTD_NAND_NANDSIM_CHIP_ALLOC)
+#define CONFIG_NANDSIM_CHIP_ALLOC    1
+#else
+#error "One of chip map or chip alloc has to be selected."
+#endif
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -53,6 +60,8 @@
 #define CONFIG_NANDSIM_FOURTH_ID_BYTE 0xFF /* No byte */
 #endif
 
+#define CONFIG_NANDSIM_ABS_POS       CONFIG_MTD_NAND_NANDSIM_ABS_POS
+
 #ifndef CONFIG_NANDSIM_ACCESS_DELAY
 #define CONFIG_NANDSIM_ACCESS_DELAY 25
 #endif
@@ -440,8 +449,8 @@
 	printk("options: %#x\n",                ns->options);
 
 	/* Map / allocate and initialize the flash image */
-#ifdef CONFIG_NS_ABS_POS
-	ns->mem.byte = ioremap(CONFIG_NS_ABS_POS, ns->geom.totszoob);
+#ifdef CONFIG_NANDSIM_CHIP_MAP
+	ns->mem.byte = ioremap(CONFIG_NANDSIM_ABS_POS, ns->geom.totszoob);
 	if (!ns->mem.byte) {
 		NS_ERR("init_nandsim: failed to map the NAND flash image at address %p\n",
 			(void *)CONFIG_NS_ABS_POS);
@@ -474,7 +483,7 @@
 	return 0;
 
 error:
-#ifdef CONFIG_NS_ABS_POS
+#ifdef CONFIG_NANDSIM_CHIP_MAP
 	iounmap(ns->mem.byte);
 #else
 	vfree(ns->mem.byte);
@@ -491,7 +500,7 @@
 {
 	kfree(ns->buf.byte);
 
-#ifdef CONFIG_NS_ABS_POS
+#ifdef CONFIG_NANDSIM_CHIP_MAP
 	iounmap(ns->mem.byte);
 #else
 	vfree(ns->mem.byte);
