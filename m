Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYsPG-000724-W3
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 05:54:31 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so491492daj.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2012 21:54:28 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: typo in nand_id_has_period() comments
Date: Wed, 14 Nov 2012 21:54:20 -0800
Message-Id: <1352958860-16430-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The simple example provided in the comments for nand_id_has_period()
actually has a period of 3, not 2. Silly mistake...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4569174..c2af1e8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2913,7 +2913,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
  *
  * Check if an ID string is repeated within a given sequence of bytes at
  * specific repetition interval period (e.g., {0x20,0x01,0x7F,0x20} has a
- * period of 2). This is a helper function for nand_id_len(). Returns non-zero
+ * period of 3). This is a helper function for nand_id_len(). Returns non-zero
  * if the repetition has a period of @period; otherwise, returns zero.
  */
 static int nand_id_has_period(u8 *id_data, int arrlen, int period)
-- 
1.8.0
