Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3s-00049M-Py
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:21 +0000
Received: by fg-out-1718.google.com with SMTP id l26so165587fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:20 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] [MTD] sharpsl-nand: use platform_data for model-specific
	values
Date: Fri, 17 Oct 2008 03:15:08 +0400
Message-Id: <1224198909-17568-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1224198909-17568-4-git-send-email-dbaryshkov@gmail.com>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
	<1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-3-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-4-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add platform_data which holds all model-specific values, like badblocks
pattern, oobinfo, partitions.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/sharpsl.c  |  158 +++++++++++++++++++++++--------------------
 include/linux/mtd/sharpsl.h |   20 ++++++
 2 files changed, 104 insertions(+), 74 deletions(-)
 create mode 100644 include/linux/mtd/sharpsl.h

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 17625c0..698378c 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/sharpsl.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 
@@ -53,31 +54,6 @@ struct sharpsl_nand {
 #define FLCLE		(1 << 1)
 #define FLCE0		(1 << 0)
 
-#ifdef CONFIG_MTD_PARTITIONS
-/*
- * Define partitions for flash device
- */
-#define DEFAULT_NUM_PARTITIONS 3
-
-static struct mtd_partition sharpsl_nand_default_partition_info[] = {
-	{
-	 .name = "System Area",
-	 .offset = 0,
-	 .size = 7 * 1024 * 1024,
-	 },
-	{
-	 .name = "Root Filesystem",
-	 .offset = 7 * 1024 * 1024,
-	 .size = 30 * 1024 * 1024,
-	 },
-	{
-	 .name = "Home Filesystem",
-	 .offset = MTDPART_OFS_APPEND,
-	 .size = MTDPART_SIZ_FULL,
-	 },
-};
-#endif
-
 /*
  *	hardware specific access to control-lines
  *	ctrl:
@@ -106,31 +82,6 @@ static void sharpsl_nand_hwcontrol(struct mtd_info *mtd, int cmd,
 		writeb(cmd, chip->IO_ADDR_W);
 }
 
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-static struct nand_bbt_descr sharpsl_bbt = {
-	.options = 0,
-	.offs = 4,
-	.len = 2,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr sharpsl_akita_bbt = {
-	.options = 0,
-	.offs = 4,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_ecclayout akita_oobinfo = {
-	.eccbytes = 24,
-	.eccpos = {
-		   0x5, 0x1, 0x2, 0x3, 0x6, 0x7, 0x15, 0x11,
-		   0x12, 0x13, 0x16, 0x17, 0x25, 0x21, 0x22, 0x23,
-		   0x26, 0x27, 0x35, 0x31, 0x32, 0x33, 0x36, 0x37},
-	.oobfree = {{0x08, 0x09}}
-};
-
 static int sharpsl_nand_dev_ready(struct mtd_info *mtd)
 {
 	struct sharpsl_nand *sharpsl = mtd_to_sharpsl(mtd);
@@ -169,6 +120,12 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	struct resource *r;
 	int err = 0;
 	struct sharpsl_nand *sharpsl;
+	struct sharpsl_nand_platform_data *data = pdev->dev.platform_data;
+
+	if (!data) {
+		dev_err(&pdev->dev, "no platform data!\n");
+		return -EINVAL;
+	}
 
 	/* Allocate memory for MTD device structure and private data */
 	sharpsl = kzalloc(sizeof(struct sharpsl_nand), GFP_KERNEL);
@@ -218,11 +175,8 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	this->ecc.mode = NAND_ECC_HW;
 	this->ecc.size = 256;
 	this->ecc.bytes = 3;
-	this->badblock_pattern = &sharpsl_bbt;
-	if (machine_is_akita() || machine_is_borzoi()) {
-		this->badblock_pattern = &sharpsl_akita_bbt;
-		this->ecc.layout = &akita_oobinfo;
-	}
+	this->badblock_pattern = data->badblock_pattern;
+	this->ecc.layout = data->ecc_layout;
 	this->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	this->ecc.calculate = sharpsl_nand_calculate_ecc;
 	this->ecc.correct = nand_correct_data;
@@ -236,29 +190,16 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl->mtd.name = "sharpsl-nand";
 #ifdef CONFIG_MTD_PARTITIONS
 	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, part_probes, &sharpsl_partition_info, 0);
-
 	if (nr_partitions <= 0) {
-		nr_partitions = ARRAY_SIZE(sharpsl_nand_default_partition_info);
-		sharpsl_partition_info = sharpsl_nand_default_partition_info;
-		if (machine_is_poodle()) {
-			sharpsl_partition_info[1].size = 22 * 1024 * 1024;
-		} else if (machine_is_corgi() || machine_is_shepherd()) {
-			sharpsl_partition_info[1].size = 25 * 1024 * 1024;
-		} else if (machine_is_husky()) {
-			sharpsl_partition_info[1].size = 53 * 1024 * 1024;
-		} else if (machine_is_spitz()) {
-			sharpsl_partition_info[1].size = 5 * 1024 * 1024;
-		} else if (machine_is_akita()) {
-			sharpsl_partition_info[1].size = 58 * 1024 * 1024;
-		} else if (machine_is_borzoi()) {
-			sharpsl_partition_info[1].size = 32 * 1024 * 1024;
-		}
+		nr_partitions = data->nr_partitions;
+		sharpsl_partition_info = data->partitions;
 	}
 
-	err = add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
-#else
-	err = add_mtd_device(&sharpsl->mtd);
+	if (nr_partitions > 0)
+		err = add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
+	else
 #endif
+	err = add_mtd_device(&sharpsl->mtd);
 	if (err)
 		goto err_add;
 
@@ -306,6 +247,58 @@ static struct platform_driver sharpsl_nand_driver = {
 	.remove		= __devexit_p(sharpsl_nand_remove),
 };
 
+/*
+ * Define partitions for flash device
+ */
+static struct mtd_partition sharpsl_nand_partitions[] = {
+	{
+	 .name = "System Area",
+	 .offset = 0,
+	 .size = 7 * 1024 * 1024,
+	 },
+	{
+	 .name = "Root Filesystem",
+	 .offset = 7 * 1024 * 1024,
+	 .size = 30 * 1024 * 1024,
+	 },
+	{
+	 .name = "Home Filesystem",
+	 .offset = MTDPART_OFS_APPEND,
+	 .size = MTDPART_SIZ_FULL,
+	 },
+};
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+static struct nand_bbt_descr sharpsl_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 2,
+	.pattern = scan_ff_pattern
+};
+
+static struct nand_bbt_descr sharpsl_akita_bbt = {
+	.options = 0,
+	.offs = 4,
+	.len = 1,
+	.pattern = scan_ff_pattern
+};
+
+static struct nand_ecclayout akita_oobinfo = {
+	.eccbytes = 24,
+	.eccpos = {
+		   0x5, 0x1, 0x2, 0x3, 0x6, 0x7, 0x15, 0x11,
+		   0x12, 0x13, 0x16, 0x17, 0x25, 0x21, 0x22, 0x23,
+		   0x26, 0x27, 0x35, 0x31, 0x32, 0x33, 0x36, 0x37},
+	.oobfree = {{0x08, 0x09}}
+};
+
+static struct sharpsl_nand_platform_data sharpsl_nand_platform_data = {
+	.badblock_pattern	= &sharpsl_bbt,
+	.partitions		= sharpsl_nand_partitions,
+	.nr_partitions		= ARRAY_SIZE(sharpsl_nand_partitions),
+};
+
 static struct resource sharpsl_nand_resources[] = {
 	{
 		.start	= 0x0C000000,
@@ -319,10 +312,27 @@ static struct platform_device sharpsl_nand_device = {
 	.id		= -1,
 	.resource	= sharpsl_nand_resources,
 	.num_resources	= ARRAY_SIZE(sharpsl_nand_resources),
+	.dev.platform_data	= &sharpsl_nand_platform_data,
 };
 
 static int __init sharpsl_nand_init(void)
 {
+	if (machine_is_poodle()) {
+		sharpsl_nand_partitions[1].size = 22 * 1024 * 1024;
+	} else if (machine_is_corgi() || machine_is_shepherd()) {
+		sharpsl_nand_partitions[1].size = 25 * 1024 * 1024;
+	} else if (machine_is_husky()) {
+		sharpsl_nand_partitions[1].size = 53 * 1024 * 1024;
+	} else if (machine_is_spitz()) {
+		sharpsl_nand_partitions[1].size = 5 * 1024 * 1024;
+	} else if (machine_is_akita()) {
+		sharpsl_nand_partitions[1].size = 58 * 1024 * 1024;
+		sharpsl_nand_platform_data.badblock_pattern = &sharpsl_akita_bbt;
+		sharpsl_nand_platform_data.ecc_layout = &akita_oobinfo;
+	} else if (machine_is_borzoi()) {
+		sharpsl_nand_partitions[1].size = 32 * 1024 * 1024;
+	}
+
 	platform_device_register(&sharpsl_nand_device);
 	return platform_driver_register(&sharpsl_nand_driver);
 }
diff --git a/include/linux/mtd/sharpsl.h b/include/linux/mtd/sharpsl.h
new file mode 100644
index 0000000..25f4d2a
--- /dev/null
+++ b/include/linux/mtd/sharpsl.h
@@ -0,0 +1,20 @@
+/*
+ * SharpSL NAND support
+ *
+ * Copyright (C) 2008 Dmitry Baryshkov
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/mtd/nand.h>
+#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/partitions.h>
+
+struct sharpsl_nand_platform_data {
+	struct nand_bbt_descr	*badblock_pattern;
+	struct nand_ecclayout	*ecc_layout;
+	struct mtd_partition	*partitions;
+	unsigned int		nr_partitions;
+};
-- 
1.5.6.5
