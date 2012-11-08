Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWP80-0007qR-6S
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 10:14:29 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so1801283pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2012 02:14:28 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: s3c2410: Fix potential NULL pointer dereference error
Date: Thu,  8 Nov 2012 15:38:44 +0530
Message-Id: <1352369324-25771-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
References: <1352369324-25771-1-git-send-email-sachin.kamat@linaro.org>
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

'set' is tested for NULL. But subsequently accessed without the check.
Thus making it conditional to avoid NULL pointer dereferencing.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/nand/s3c2410.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index dfb8636..00fc12f 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -730,11 +730,11 @@ static void s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
-	if (set)
+	if (set) {
 		mtd->mtd.name = set->name;
-
-	mtd_device_parse_register(&mtd->mtd, NULL, NULL,
-				  set->partitions, set->nr_partitions);
+		mtd_device_parse_register(&mtd->mtd, NULL, NULL,
+					  set->partitions, set->nr_partitions);
+	}
 }
 
 /**
-- 
1.7.4.1
