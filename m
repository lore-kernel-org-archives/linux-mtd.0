Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYS3-0004CV-3o
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:31 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 09/12] mtd: nand: use NAND_HAS_CACHEPROG
Date: Mon,  4 Mar 2013 18:42:26 +0200
Message-Id: <1362415349-7107-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
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
index 760ee49..e607565 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2045,7 +2045,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
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
