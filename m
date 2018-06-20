Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVZdS-0003KV-QL
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 09:42:44 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Julien Su <juliensu@mxic.com.tw>,
 Mason Yang <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>
Subject: [PATCH] mtd: rawnand: All AC chips have a broken
 GET_FEATURES(TIMINGS).
Date: Wed, 20 Jun 2018 11:42:28 +0200
Message-Id: <20180620094228.10693-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mason Yang <masonccyang@mxic.com.tw>

Make sure we flag all broken chips as not supporting this feature.
Also move this logic to a new function to keep things readable.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 48 +++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 7ed1f87e742a..49c546c97c6f 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -17,23 +17,47 @@
 
 #include <linux/mtd/rawnand.h>
 
+/*
+ * Macronix AC series does not support using SET/GET_FEATURES to change
+ * the timings unlike what is declared in the parameter page. Unflag
+ * this feature to avoid unnecessary downturns.
+ */
+static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
+{
+	unsigned int i;
+	static const char * const broken_get_timings[] = {
+		"MX30LF1G18AC",
+		"MX30LF1G28AC",
+		"MX30LF2G18AC",
+		"MX30LF2G28AC",
+		"MX30LF4G18AC",
+		"MX30LF4G28AC",
+		"MX60LF8G18AC",
+	};
+
+	if (!chip->parameters.supports_set_get_features)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(broken_get_timings); i++) {
+		if (!strcmp(broken_get_timings[i], chip->parameters.model))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(broken_get_timings))
+		return;
+
+	bitmap_clear(chip->parameters.get_feature_list,
+		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+	bitmap_clear(chip->parameters.set_feature_list,
+		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+}
+
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
-	/*
-	 * MX30LF2G18AC chip does not support using SET/GET_FEATURES to change
-	 * the timings unlike what is declared in the parameter page. Unflag
-	 * this feature to avoid unnecessary downturns.
-	 */
-	if (chip->parameters.supports_set_get_features &&
-	    !strcmp("MX30LF2G18AC", chip->parameters.model)) {
-		bitmap_clear(chip->parameters.get_feature_list,
-			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
-		bitmap_clear(chip->parameters.set_feature_list,
-			     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
-	}
+	macronix_nand_fix_broken_get_timings(chip);
 
 	return 0;
 }
-- 
2.14.1
