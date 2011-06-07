Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTU-0001St-Du
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:41 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852593wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:40 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 31/44] mtd: jz4740_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:30 +0400
Message-Id: <1307453803-31950-32-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/jz4740_nand.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 920719c..e266407 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -295,8 +295,6 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
 	struct jz_nand_platform_data *pdata = pdev->dev.platform_data;
-	struct mtd_partition *partition_info;
-	int num_partitions = 0;
 
 	nand = kzalloc(sizeof(*nand), GFP_KERNEL);
 	if (!nand) {
@@ -369,12 +367,9 @@ static int __devinit jz_nand_probe(struct platform_device *pdev)
 		goto err_gpio_free;
 	}
 
-	num_partitions = parse_mtd_partitions(mtd, NULL, &partition_info, 0);
-	if (num_partitions <= 0 && pdata) {
-		num_partitions = pdata->num_partitions;
-		partition_info = pdata->partitions;
-	}
-	ret = mtd_device_register(mtd, partition_info, num_partitions);
+	ret = mtd_device_parse_register(mtd, NULL, 0,
+			pdata ? pdata->partitions : NULL,
+			pdata ? pdata->num_partitions : 0);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add mtd device\n");
-- 
1.7.4.4
