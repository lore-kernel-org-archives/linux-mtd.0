Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROH-0002Tm-1q
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:34 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:32 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 43/62] mtd/h1910: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:24 +0100
Message-Id: <1306142623-24952-44-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 drivers/mtd/nand/h1910.c |    5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index edec457..333d231 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -92,7 +92,7 @@ config MTD_NAND_EDB7312
 
 config MTD_NAND_H1900
 	tristate "iPAQ H1900 flash"
-	depends on ARCH_PXA && MTD_PARTITIONS
+	depends on ARCH_PXA
 	help
 	  This enables the driver for the iPAQ h1900 flash.
 
diff --git a/drivers/mtd/nand/h1910.c b/drivers/mtd/nand/h1910.c
index f8ce79b..02a03e6 100644
--- a/drivers/mtd/nand/h1910.c
+++ b/drivers/mtd/nand/h1910.c
@@ -38,7 +38,6 @@ static struct mtd_info *h1910_nand_mtd = NULL;
  * Module stuff
  */
 
-#ifdef CONFIG_MTD_PARTITIONS
 /*
  * Define static partitions for flash device
  */
@@ -50,8 +49,6 @@ static struct mtd_partition partition_info[] = {
 
 #define NUM_PARTITIONS 1
 
-#endif
-
 /*
  *	hardware specific access to control-lines
  *
@@ -154,7 +151,7 @@ static int __init h1910_init(void)
 
 	/* Register the partitions */
 	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	add_mtd_partitions(h1910_nand_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_register(h1910_nand_mtd, mtd_parts, mtd_parts_nb);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
