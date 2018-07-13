Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fduNK-0007Ql-8f
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:28:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id a6-v6so24064578ljj.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:28:19 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/4] mtd: rawnand: use mtd_device_register() where applicable
Date: Fri, 13 Jul 2018 11:27:31 +0200
Message-Id: <20180713092734.16408-2-zajec5@gmail.com>
In-Reply-To: <20180713092734.16408-1-zajec5@gmail.com>
References: <20180713092734.16408-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

If driver doesn't specify parsers it can use that little helper.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/nand/raw/cmx270_nand.c  | 4 ++--
 drivers/mtd/nand/raw/cs553x_nand.c  | 3 +--
 drivers/mtd/nand/raw/davinci_nand.c | 3 +--
 drivers/mtd/nand/raw/jz4740_nand.c  | 5 ++---
 drivers/mtd/nand/raw/mtk_nand.c     | 2 +-
 drivers/mtd/nand/raw/s3c2410.c      | 4 ++--
 drivers/mtd/nand/raw/txx9ndfmc.c    | 2 +-
 7 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/cmx270_nand.c b/drivers/mtd/nand/raw/cmx270_nand.c
index 02d6751e9efe..b66e254b6802 100644
--- a/drivers/mtd/nand/raw/cmx270_nand.c
+++ b/drivers/mtd/nand/raw/cmx270_nand.c
@@ -200,8 +200,8 @@ static int __init cmx270_init(void)
 	}
 
 	/* Register the partitions */
-	ret = mtd_device_parse_register(cmx270_nand_mtd, NULL, NULL,
-					partition_info, NUM_PARTITIONS);
+	ret = mtd_device_register(cmx270_nand_mtd, partition_info,
+				  NUM_PARTITIONS);
 	if (ret)
 		goto err_scan;
 
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 82269fde9e66..beafad62e7d5 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -310,8 +310,7 @@ static int __init cs553x_init(void)
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (cs553x_mtd[i]) {
 			/* If any devices registered, return success. Else the last error. */
-			mtd_device_parse_register(cs553x_mtd[i], NULL, NULL,
-						  NULL, 0);
+			mtd_device_register(cs553x_mtd[i], NULL, 0);
 			err = 0;
 		}
 	}
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index cd12e5abafde..451abe3ad749 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -803,8 +803,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		goto err;
 
 	if (pdata->parts)
-		ret = mtd_device_parse_register(mtd, NULL, NULL,
-					pdata->parts, pdata->nr_parts);
+		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret < 0)
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 613b00a9604b..e04597a764a8 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -466,9 +466,8 @@ static int jz_nand_probe(struct platform_device *pdev)
 		goto err_unclaim_banks;
 	}
 
-	ret = mtd_device_parse_register(mtd, NULL, NULL,
-					pdata ? pdata->partitions : NULL,
-					pdata ? pdata->num_partitions : 0);
+	ret = mtd_device_register(mtd, pdata ? pdata->partitions : NULL,
+				  pdata ? pdata->num_partitions : 0);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add mtd device\n");
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 75c845adb050..e6b14b79c8a8 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1357,7 +1357,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
 		nand_release(mtd);
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 19661c5d3220..10d81f367d26 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -802,8 +802,8 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 
 		mtdinfo->name = set->name;
 
-		return mtd_device_parse_register(mtdinfo, NULL, NULL,
-					 set->partitions, set->nr_partitions);
+		return mtd_device_register(mtdinfo, set->partitions,
+					   set->nr_partitions);
 	}
 
 	return -ENODEV;
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index b567d212fe7d..fe954e2222f5 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -366,7 +366,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+		mtd_device_register(mtd, NULL, 0);
 		drvdata->mtds[i] = mtd;
 	}
 
-- 
2.13.7
