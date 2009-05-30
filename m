Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=teyla.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MATFO-0000gW-0d
	for linux-mtd@lists.infradead.org; Sat, 30 May 2009 18:25:40 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [MTD] [NAND] S3C2410: Allow commandline partition processing
Date: Sat, 30 May 2009 18:41:34 +0100
Message-Id: <1243705298-21814-8-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1243705298-21814-7-git-send-email-ben-linux@fluff.org>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
Cc: Andy Green <andy@warmcat.com>, Andy Green <andy@warcat.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Nelson Castillo <arhuaco@freaks-unidos.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andy Green <andy@warmcat.com>

This patch allows commandline partition processing to
work with the s3c2410 NAND platform driver.

Signed-off-by: Andy Green <andy@warcat.com>
Signed-off-by: Nelson Castillo <arhuaco@freaks-unidos.net>
[ben-linux@fluff.org: Change andy@openmoko.com to andy@warmcat.com]
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/mtd/nand/s3c2410.c |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 87c40de..ef56652 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -699,17 +699,31 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
+	struct mtd_partition *part_info;
+	int nr_part = 0;
+
 	if (set == NULL)
 		return add_mtd_device(&mtd->mtd);
 
-	if (set->nr_partitions > 0 && set->partitions != NULL) {
-		return add_mtd_partitions(&mtd->mtd, set->partitions, set->nr_partitions);
+	if (set->nr_partitions == 0) {
+		mtd->mtd.name = set->name;
+		nr_part = parse_mtd_partitions(&mtd->mtd, part_probes,
+						&part_info, 0);
+	} else {
+		if (set->nr_partitions > 0 && set->partitions != NULL) {
+			nr_part = set->nr_partitions;
+			part_info = set->partitions;
+		}
 	}
 
+	if (nr_part > 0 && part_info)
+		return add_mtd_partitions(&mtd->mtd, part_info, nr_part);
+
 	return add_mtd_device(&mtd->mtd);
 }
 #else
-- 
1.5.6.5
