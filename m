Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROJ-0002TQ-EJ
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:36 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:35 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 44/62] mtd/jz4740_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:25 +0100
Message-Id: <1306142623-24952-45-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/jz4740_nand.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index cea38a5..6e813da 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -299,10 +299,8 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
 	struct jz_nand_platform_data *pdata = pdev->dev.platform_data;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *partition_info;
 	int num_partitions = 0;
-#endif
 
 	nand = kzalloc(sizeof(*nand), GFP_KERNEL);
 	if (!nand) {
@@ -375,7 +373,6 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 		goto err_gpio_free;
 	}
 
-#ifdef CONFIG_MTD_PARTITIONS
 #ifdef CONFIG_MTD_CMDLINE_PARTS
 	num_partitions = parse_mtd_partitions(mtd, part_probes,
 						&partition_info, 0);
@@ -384,12 +381,7 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 		num_partitions = pdata->num_partitions;
 		partition_info = pdata->partitions;
 	}
-
-	if (num_partitions > 0)
-		ret = add_mtd_partitions(mtd, partition_info, num_partitions);
-	else
-#endif
-	ret = add_mtd_device(mtd);
+	ret = mtd_device_register(mtd, partition_info, num_partitions);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add mtd device\n");
-- 
1.7.4.4
