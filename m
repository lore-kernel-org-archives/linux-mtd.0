Received: from smtp-vbr9.xs4all.nl ([194.109.24.29])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pzs1c-0005WN-JI
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2011 14:48:37 +0000
From: Maarten ter Huurne <maarten@treewalker.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: Fixed null pointer dereference.
Date: Wed, 16 Mar 2011 15:47:55 +0100
Message-Id: <1300286875-21426-1-git-send-email-maarten@treewalker.org>
Cc: Maarten ter Huurne <maarten@treewalker.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "bd" argument of verify_bbt_descr() was dereferenced before it was checked for NULL.

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 drivers/mtd/nand/nand_bbt.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6ebd869..fc05f51 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1101,12 +1101,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 {
 	struct nand_chip *this = mtd->priv;
-	u32 pattern_len = bd->len;
-	u32 bits = bd->options & NAND_BBT_NRBITS_MSK;
-	u32 table_size;
+	u32 pattern_len, bits, table_size;
 
 	if (!bd)
 		return;
+
+	pattern_len = bd->len;
+	bits = bd->options & NAND_BBT_NRBITS_MSK;
+
 	BUG_ON((this->options & NAND_USE_FLASH_BBT_NO_OOB) &&
 			!(this->options & NAND_USE_FLASH_BBT));
 	BUG_ON(!bits);
-- 
1.7.1
