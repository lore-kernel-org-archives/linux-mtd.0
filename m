Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBQrr-0000e2-26
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 13:51:07 +0000
Received: by wibhq4 with SMTP id hq4so2683037wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2012 06:51:04 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] NAND BBT: use NAND_BBT_SCAN_MAXBLOCKS
Date: Tue, 11 Sep 2012 15:50:54 +0200
Message-Id: <1347371454-17107-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In nand_bbt.c, a hardcoded value was used instead of the define meant
for that, so we use the define.

There's no functionnal change.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..741ecf7 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -62,6 +62,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/bbm.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/bitops.h>
@@ -1260,7 +1261,7 @@ static struct nand_bbt_descr bbt_main_descr = {
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
-	.maxblocks = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
 	.pattern = bbt_pattern
 };
 
@@ -1270,7 +1271,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
-	.maxblocks = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
 	.pattern = mirror_pattern
 };
 
@@ -1280,7 +1281,7 @@ static struct nand_bbt_descr bbt_main_no_bbt_descr = {
 		| NAND_BBT_NO_OOB,
 	.len = 4,
 	.veroffs = 4,
-	.maxblocks = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
 	.pattern = bbt_pattern
 };
 
@@ -1290,7 +1291,7 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 		| NAND_BBT_NO_OOB,
 	.len = 4,
 	.veroffs = 4,
-	.maxblocks = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
 	.pattern = mirror_pattern
 };
 
-- 
1.7.2.5
