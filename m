Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCrjB-0006vW-6W
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:22 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/11] mtd: nand: use NAND_HAS_CACHEPROG
Date: Tue,  5 Mar 2013 15:17:22 +0200
Message-Id: <1362489444-27762-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We have this unused macro, let's use it and justify its existence.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 include/linux/mtd/nand.h     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 79b1081..a79cd82 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2043,7 +2043,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	 */
 	cached = 0;
 
-	if (!cached || !(chip->options & NAND_CACHEPRG)) {
+	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
 
 		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 		status = chip->waitfunc(mtd, chip);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9af859f..59dee20 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -160,7 +160,7 @@ typedef enum {
 #define NAND_SUBPAGE_READ	0x00001000
 
 /* Options valid for Samsung large page devices */
-#define NAND_SAMSUNG_LP_OPTIONS (NAND_CACHEPRG)
+#define NAND_SAMSUNG_LP_OPTIONS NAND_CACHEPRG
 
 /* Macros to identify the above */
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
-- 
1.7.10.4
