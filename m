Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROc-0002Tm-QS
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:56 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:54 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 52/62] mtd/s3c2410 nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:33 +0100
Message-Id: <1306142623-24952-53-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Kukjin Kim <kgene.kim@samsung.com>,
	dwmw2@infradead.org, Ben Dooks <ben-linux@fluff.org>, dedekind1@gmail.com
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

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/s3c2410.c |   16 ++--------------
 1 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 33d832d..3540789 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -715,7 +715,6 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
@@ -725,7 +724,7 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 	int nr_part = 0;
 
 	if (set == NULL)
-		return add_mtd_device(&mtd->mtd);
+		return mtd_device_register(&mtd->mtd, NULL, 0);
 
 	mtd->mtd.name = set->name;
 	nr_part = parse_mtd_partitions(&mtd->mtd, part_probes, &part_info, 0);
@@ -735,19 +734,8 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 		part_info = set->partitions;
 	}
 
-	if (nr_part > 0 && part_info)
-		return add_mtd_partitions(&mtd->mtd, part_info, nr_part);
-
-	return add_mtd_device(&mtd->mtd);
-}
-#else
-static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
-				      struct s3c2410_nand_mtd *mtd,
-				      struct s3c2410_nand_set *set)
-{
-	return add_mtd_device(&mtd->mtd);
+	return mtd_device_register(&mtd->mtd, part_info, nr_part);
 }
-#endif
 
 /**
  * s3c2410_nand_init_chip - initialise a single instance of an chip
-- 
1.7.4.4
