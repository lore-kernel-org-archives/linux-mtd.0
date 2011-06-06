Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvo-000726-Oo
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:09 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 25/32] mtd: s3c2410 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:15 +0400
Message-Id: <1307351782-7456-25-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/s3c2410.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index ec28079..17954ba 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -744,7 +744,6 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-const char *part_probes[] = { "cmdlinepart", NULL };
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
@@ -756,7 +755,7 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 		return mtd_device_register(&mtd->mtd, NULL, 0);
 
 	mtd->mtd.name = set->name;
-	nr_part = parse_mtd_partitions(&mtd->mtd, part_probes, &part_info, 0);
+	nr_part = parse_mtd_partitions(&mtd->mtd, NULL, &part_info, 0);
 
 	if (nr_part <= 0 && set->nr_partitions > 0) {
 		nr_part = set->nr_partitions;
-- 
1.7.4.4
