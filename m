Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TZJPN-0001Jd-9o
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 10:44:25 +0000
Received: by mail-pb0-f49.google.com with SMTP id un15so1754799pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Nov 2012 02:44:21 -0800 (PST)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH Resend] mtd: s3c2410: Fix potential NULL pointer dereference
 error
Date: Fri, 16 Nov 2012 16:08:22 +0530
Message-Id: <1353062302-10266-1-git-send-email-sachin.kamat@linaro.org>
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
 drivers/mtd/nand/s3c2410.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 295e4be..bbc49c4 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -730,11 +730,14 @@ static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
-	if (set)
+	if (set) {
 		mtd->mtd.name = set->name;
 
-	return mtd_device_parse_register(&mtd->mtd, NULL, NULL,
+		return mtd_device_parse_register(&mtd->mtd, NULL, NULL,
 					 set->partitions, set->nr_partitions);
+	}
+
+	return -ENODEV;
 }
 
 /**
-- 
1.7.4.1
