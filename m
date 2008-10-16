Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3p-0004EX-3c
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:17 +0000
Received: by ey-out-1920.google.com with SMTP id 4so106071eyg.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:16 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] [MTD] sharpsl_nand: make drvdata non-static
Date: Fri, 17 Oct 2008 03:15:05 +0400
Message-Id: <1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
	<1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Merge mtd_info and nand_chip info special struct and
make it drvdata instead of plain static variable.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/sharpsl.c |   53 ++++++++++++++++++++++++--------------------
 1 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 0a99188..6851806 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -26,6 +26,11 @@
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
 
+struct sharpsl_nand {
+	struct mtd_info		mtd;
+	struct nand_chip	chip;
+};
+
 static void __iomem *sharpsl_io_base;
 
 /* register offset */
@@ -46,11 +51,6 @@ static void __iomem *sharpsl_io_base;
 #define FLCE0		(1 << 0)
 
 /*
- * MTD structure for SharpSL
- */
-static struct mtd_info *sharpsl_mtd = NULL;
-
-/*
  * Define partitions for flash device
  */
 #define DEFAULT_NUM_PARTITIONS 3
@@ -157,10 +157,11 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	struct mtd_partition *sharpsl_partition_info;
 	struct resource *r;
 	int err = 0;
+	struct sharpsl_nand *sharpsl;
 
 	/* Allocate memory for MTD device structure and private data */
-	sharpsl_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
-	if (!sharpsl_mtd) {
+	sharpsl = kzalloc(sizeof(struct sharpsl_nand), GFP_KERNEL);
+	if (!sharpsl) {
 		printk("Unable to allocate SharpSL NAND MTD device structure.\n");
 		return -ENOMEM;
 	}
@@ -176,20 +177,18 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl_io_base = ioremap(r->start, resource_size(r));
 	if (!sharpsl_io_base) {
 		printk("ioremap to access Sharp SL NAND chip failed\n");
-		kfree(sharpsl_mtd);
-		return -EIO;
+		err = -EIO;
+		goto err_ioremap;
 	}
 
 	/* Get pointer to private data */
-	this = (struct nand_chip *)(&sharpsl_mtd[1]);
-
-	/* Initialize structures */
-	memset(sharpsl_mtd, 0, sizeof(struct mtd_info));
-	memset(this, 0, sizeof(struct nand_chip));
+	this = (struct nand_chip *)(&sharpsl->chip);
 
 	/* Link the private data with the MTD structure */
-	sharpsl_mtd->priv = this;
-	sharpsl_mtd->owner = THIS_MODULE;
+	sharpsl->mtd.priv = this;
+	sharpsl->mtd.owner = THIS_MODULE;
+
+	platform_set_drvdata(pdev, sharpsl);
 
 	/*
 	 * PXA initialize
@@ -218,16 +217,17 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 	this->ecc.correct = nand_correct_data;
 
 	/* Scan to find existence of the device */
-	err = nand_scan(sharpsl_mtd, 1);
+	err = nand_scan(&sharpsl->mtd, 1);
 	if (err) {
+		platform_set_drvdata(pdev, NULL);
 		iounmap(sharpsl_io_base);
-		kfree(sharpsl_mtd);
+		kfree(sharpsl);
 		return err;
 	}
 
 	/* Register the partitions */
-	sharpsl_mtd->name = "sharpsl-nand";
-	nr_partitions = parse_mtd_partitions(sharpsl_mtd, part_probes, &sharpsl_partition_info, 0);
+	sharpsl->mtd.name = "sharpsl-nand";
+	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, part_probes, &sharpsl_partition_info, 0);
 
 	if (nr_partitions <= 0) {
 		nr_partitions = DEFAULT_NUM_PARTITIONS;
@@ -247,13 +247,14 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	add_mtd_partitions(sharpsl_mtd, sharpsl_partition_info, nr_partitions);
+	add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
 
 	/* Return happy */
 	return 0;
 
+err_ioremap:
 err_get_res:
-	kfree(sharpsl_mtd);
+	kfree(sharpsl);
 	return err;
 }
 
@@ -262,13 +263,17 @@ err_get_res:
  */
 static int __devexit sharpsl_nand_remove(struct platform_device *pdev)
 {
+	struct sharpsl_nand *sharpsl = platform_get_drvdata(pdev);
+
 	/* Release resources, unregister device */
-	nand_release(sharpsl_mtd);
+	nand_release(&sharpsl->mtd);
+
+	platform_set_drvdata(pdev, NULL);
 
 	iounmap(sharpsl_io_base);
 
 	/* Free the MTD device structure */
-	kfree(sharpsl_mtd);
+	kfree(sharpsl);
 
 	return 0;
 }
-- 
1.5.6.5
