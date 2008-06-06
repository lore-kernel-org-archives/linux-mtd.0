Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4eYO-0006zf-UI
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 16:12:37 +0000
Received: from bagnes.atmel.com ([10.175.100.4])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id m56GBsGi003371
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2008 09:11:55 -0700 (PDT)
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: linux-mtd@lists.infradead.org, kernel@avr32linux.org
Subject: [PATCH 4/8] atmel_nand: Clean up and fix probe() error path
Date: Fri,  6 Jun 2008 18:04:54 +0200
Message-Id: <1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
In-Reply-To: <1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Andrew Victor <avictor.za@gmail.com>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes several bugs in the atmel_nand_probe() error path, including
at least one memory leak.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |   41 ++++++++++++++++++++++-------------------
 1 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 675a82c..325ce29 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -371,6 +371,12 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	int num_partitions = 0;
 #endif
 
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		printk(KERN_ERR "atmel_nand: can't get I/O resource mem\n");
+		return -ENXIO;
+	}
+
 	/* Allocate memory for the device structure (and zero it) */
 	host = kzalloc(sizeof(struct atmel_nand_host), GFP_KERNEL);
 	if (!host) {
@@ -378,17 +384,11 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		printk(KERN_ERR "atmel_nand: can't get I/O resource mem\n");
-		return -ENXIO;
-	}
-
 	host->io_base = ioremap(mem->start, mem->end - mem->start + 1);
 	if (host->io_base == NULL) {
 		printk(KERN_ERR "atmel_nand: ioremap failed\n");
-		kfree(host);
-		return -EIO;
+		res = -EIO;
+		goto err_nand_ioremap;
 	}
 
 	mtd = &host->mtd;
@@ -446,14 +446,14 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		if (gpio_get_value(host->board->det_pin)) {
 			printk ("No SmartMedia card inserted.\n");
 			res = ENXIO;
-			goto out;
+			goto err_no_card;
 		}
 	}
 
 	/* first scan to find the device and get the page size */
 	if (nand_scan_ident(mtd, 1)) {
 		res = -ENXIO;
-		goto out;
+		goto err_scan_ident;
 	}
 
 	if (nand_chip->ecc.mode == NAND_ECC_HW_SYNDROME) {
@@ -498,7 +498,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	/* second phase scan */
 	if (nand_scan_tail(mtd)) {
 		res = -ENXIO;
-		goto out;
+		goto err_scan_tail;
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
@@ -514,7 +514,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	if ((!partitions) || (num_partitions == 0)) {
 		printk(KERN_ERR "atmel_nand: No parititions defined, or unsupported device.\n");
 		res = ENXIO;
-		goto release;
+		goto err_no_partitions;
 	}
 
 	res = add_mtd_partitions(mtd, partitions, num_partitions);
@@ -526,17 +526,19 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		return res;
 
 #ifdef CONFIG_MTD_PARTITIONS
-release:
+err_no_partitions:
 #endif
 	nand_release(mtd);
-
-out:
-	iounmap(host->ecc);
-
-err_ecc_ioremap:
+err_scan_tail:
+err_scan_ident:
+err_no_card:
 	atmel_nand_disable(host);
 	platform_set_drvdata(pdev, NULL);
+	if (host->ecc)
+		iounmap(host->ecc);
+err_ecc_ioremap:
 	iounmap(host->io_base);
+err_nand_ioremap:
 	kfree(host);
 	return res;
 }
@@ -553,8 +555,9 @@ static int __devexit atmel_nand_remove(struct platform_device *pdev)
 
 	atmel_nand_disable(host);
 
+	if (host->ecc)
+		iounmap(host->ecc);
 	iounmap(host->io_base);
-	iounmap(host->ecc);
 	kfree(host);
 
 	return 0;
-- 
1.5.5.1
