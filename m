Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHX-0007LR-Hk
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:07:01 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so631181wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 37/43] mtd: s3c2410.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:46 +0400
Message-Id: <1307549152-7085-38-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/s3c2410.c |   18 ++++--------------
 1 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 17954ba..b0f8e77 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -748,21 +748,11 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
-	struct mtd_partition *part_info;
-	int nr_part = 0;
+	if (set)
+		mtd->mtd.name = set->name;
 
-	if (set == NULL)
-		return mtd_device_register(&mtd->mtd, NULL, 0);
-
-	mtd->mtd.name = set->name;
-	nr_part = parse_mtd_partitions(&mtd->mtd, NULL, &part_info, 0);
-
-	if (nr_part <= 0 && set->nr_partitions > 0) {
-		nr_part = set->nr_partitions;
-		part_info = set->partitions;
-	}
-
-	return mtd_device_register(&mtd->mtd, part_info, nr_part);
+	return mtd_device_parse_register(&mtd->mtd, NULL, 0,
+			set->partitions, set->nr_partitions);
 }
 
 /**
-- 
1.7.4.4
