Received: from ganesha.gnumonks.org ([2001:780:45:1d:2e0:81ff:fe28:898a])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4aTc-0000Ib-8z
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 11:19:08 +0000
Date: Tue, 18 Dec 2007 12:07:14 +0100
From: Harald Welte <laforge@openmoko.org>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH 4/12] neo1973: s3c2410 NAND bad block table support
Message-ID: <20071218110714.GK29882@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] Add Kconfig option to enable NAND bad-block-table support for s3c2410

This patch adds a new CONFIG_MTD_NAND_S3C2410_BBT which, if enabled,
asks the mtd NAND core to use a bad-block table.

Signed-off-by: Harald Welte <laforge@openmoko.org>

---

Index: linux-2.6.17.14-fic4.test/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.17.14-fic4.test.orig/drivers/mtd/nand/s3c2410.c	2007-02-02 13:02:10.000000000 +0100
+++ linux-2.6.17.14-fic4.test/drivers/mtd/nand/s3c2410.c	2007-02-02 13:03:52.000000000 +0100
@@ -524,7 +524,11 @@
 	chip->select_chip  = s3c2410_nand_select_chip;
 	chip->chip_delay   = 50;
 	chip->priv	   = nmtd;
+#ifdef CONFIG_MTD_NAND_S3C2410_BBT
+	chip->options	   = NAND_USE_FLASH_BBT;
+#else
 	chip->options	   = 0;
+#endif
 	chip->controller   = &info->controller;
 
 	if (info->is_s3c2440) {
Index: linux-2.6.17.14-fic4.test/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6.17.14-fic4.test.orig/drivers/mtd/nand/Kconfig	2007-02-02 13:03:56.000000000 +0100
+++ linux-2.6.17.14-fic4.test/drivers/mtd/nand/Kconfig	2007-02-02 13:04:47.000000000 +0100
@@ -90,6 +90,12 @@
 	  No board specfic support is done by this driver, each board
 	  must advertise a platform_device for the driver to attach.
 
+config MTD_NAND_S3C2410_BBT
+	bool "S3C2410 NAND bad block table"
+	depends on MTD_NAND_S3C2410
+	help
+	  Enable bad block table support for S3C2410 NAND driver
+
 config MTD_NAND_S3C2410_DEBUG
 	bool "S3C2410 NAND driver debug"
 	depends on MTD_NAND_S3C2410
-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone
