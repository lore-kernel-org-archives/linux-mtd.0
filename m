Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYXXy-0002YI-DB
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 04:56:47 +0000
Received: by pvf33 with SMTP id 33so2481104pvf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jul 2010 21:56:41 -0700 (PDT)
From: Conke Hu <conke@maxwit.com>
To: support@simtec.co.uk, linux@simtec.co.uk, ben-linux@fluff.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] s3c nand: parsing commad-line partitions prior to
	set->partitions
Date: Tue, 13 Jul 2010 12:56:30 +0800
Message-Id: <1278996990-4380-1-git-send-email-conke@maxwit.com>
Cc: Conke Hu <conke@maxwit.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current driver prevents command-line partitions from being parsed when built-in 
partitions are defined in s3c2410_nand_set object, but it is not desirable in some 
cases. This patch tries to parse commad-line partitions prior to the built-in.

Signed-off-by: Conke Hu <conke@maxwit.com>
---
 drivers/mtd/nand/s3c2410.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 239aadf..33d832d 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -727,15 +727,12 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 	if (set == NULL)
 		return add_mtd_device(&mtd->mtd);
 
-	if (set->nr_partitions == 0) {
-		mtd->mtd.name = set->name;
-		nr_part = parse_mtd_partitions(&mtd->mtd, part_probes,
-						&part_info, 0);
-	} else {
-		if (set->nr_partitions > 0 && set->partitions != NULL) {
-			nr_part = set->nr_partitions;
-			part_info = set->partitions;
-		}
+	mtd->mtd.name = set->name;
+	nr_part = parse_mtd_partitions(&mtd->mtd, part_probes, &part_info, 0);
+
+	if (nr_part <= 0 && set->nr_partitions > 0) {
+		nr_part = set->nr_partitions;
+		part_info = set->partitions;
 	}
 
 	if (nr_part > 0 && part_info)
-- 
1.7.0.4
