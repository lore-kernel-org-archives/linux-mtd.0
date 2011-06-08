Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHK-0007CU-R8
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:47 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:46 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 30/43] mtd: jz4740_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:39 +0400
Message-Id: <1307549152-7085-31-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
