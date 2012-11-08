Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWP7y-0007qR-R2
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 10:14:27 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so1801283pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2012 02:14:24 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: s3c2410: Change return type of
 s3c2410_nand_add_partition function
Date: Thu,  8 Nov 2012 15:38:43 +0530
Message-Id: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
Cc: sachin.kamat@linaro.org, patches@linaro.org, dwmw2@infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The return value of s3c2410_nand_add_partition() is not checked for error
or success in the calling function. Hence change the return type to void.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 295e4be..dfb8636 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -726,15 +726,15 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
+static void s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
 	if (set)
 		mtd->mtd.name = set->name;
 
-	return mtd_device_parse_register(&mtd->mtd, NULL, NULL,
-					 set->partitions, set->nr_partitions);
+	mtd_device_parse_register(&mtd->mtd, NULL, NULL,
+				  set->partitions, set->nr_partitions);
 }
 
 /**
-- 
1.7.4.1
