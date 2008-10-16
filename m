Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqc3r-0004EX-Ep
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 23:15:19 +0000
Received: by ey-out-1920.google.com with SMTP id 4so106071eyg.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 16:15:19 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] [MTD] sharpsl-nand: cleanup partitions support
Date: Fri, 17 Oct 2008 03:15:07 +0400
Message-Id: <1224198909-17568-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1224198909-17568-3-git-send-email-dbaryshkov@gmail.com>
References: <20081016231127.GA17131@doriath.ww600.siemens.net>
	<1224198909-17568-1-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-2-git-send-email-dbaryshkov@gmail.com>
	<1224198909-17568-3-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, Eric Miao <eric.miao@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/sharpsl.c |   22 ++++++++++++++++++----
 1 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 328e02e..17625c0 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -2,6 +2,7 @@
  * drivers/mtd/nand/sharpsl.c
  *
  *  Copyright (C) 2004 Richard Purdie
+ *  Copyright (C) 2008 Dmitry Baryshkov
  *
  *  Based on Sharp's NAND driver sharp_sl.c
  *
@@ -52,12 +53,12 @@ struct sharpsl_nand {
 #define FLCLE		(1 << 1)
 #define FLCE0		(1 << 0)
 
+#ifdef CONFIG_MTD_PARTITIONS
 /*
  * Define partitions for flash device
  */
 #define DEFAULT_NUM_PARTITIONS 3
 
-static int nr_partitions;
 static struct mtd_partition sharpsl_nand_default_partition_info[] = {
 	{
 	 .name = "System Area",
@@ -75,6 +76,7 @@ static struct mtd_partition sharpsl_nand_default_partition_info[] = {
 	 .size = MTDPART_SIZ_FULL,
 	 },
 };
+#endif
 
 /*
  *	hardware specific access to control-lines
@@ -151,7 +153,7 @@ static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat,
 }
 
 #ifdef CONFIG_MTD_PARTITIONS
-const char *part_probes[] = { "cmdlinepart", NULL };
+static const char *part_probes[] = { "cmdlinepart", NULL };
 #endif
 
 /*
@@ -160,7 +162,10 @@ const char *part_probes[] = { "cmdlinepart", NULL };
 static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
+#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *sharpsl_partition_info;
+	int nr_partitions;
+#endif
 	struct resource *r;
 	int err = 0;
 	struct sharpsl_nand *sharpsl;
@@ -229,10 +234,11 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
+#ifdef CONFIG_MTD_PARTITIONS
 	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, part_probes, &sharpsl_partition_info, 0);
 
 	if (nr_partitions <= 0) {
-		nr_partitions = DEFAULT_NUM_PARTITIONS;
+		nr_partitions = ARRAY_SIZE(sharpsl_nand_default_partition_info);
 		sharpsl_partition_info = sharpsl_nand_default_partition_info;
 		if (machine_is_poodle()) {
 			sharpsl_partition_info[1].size = 22 * 1024 * 1024;
@@ -249,11 +255,19 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
+	err = add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
+#else
+	err = add_mtd_device(&sharpsl->mtd);
+#endif
+	if (err)
+		goto err_add;
 
 	/* Return happy */
 	return 0;
 
+err_add:
+	nand_release(&sharpsl->mtd);
+
 err_scan:
 	platform_set_drvdata(pdev, NULL);
 	iounmap(sharpsl->io);
-- 
1.5.6.5
