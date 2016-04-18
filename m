Received: from relay3-d.mail.gandi.net ([2001:4b98:c:538::195])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asBgA-0006bY-9Z
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 16:05:39 +0000
From: Maarten ter Huurne <maarten@treewalker.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maarten ter Huurne <maarten@treewalker.org>
Subject: [PATCH] mtd: nand: jz4740: Remove unused local variable
Date: Mon, 18 Apr 2016 18:04:56 +0200
Message-Id: <1460995496-11666-1-git-send-email-maarten@treewalker.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
---
 drivers/mtd/nand/jz4740_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index 673ceb2..2f39ee1 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -221,7 +221,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
 	struct jz_nand *nand = mtd_to_jz_nand(mtd);
 	int i, error_count, index;
 	uint32_t reg, status, error;
-	uint32_t t;
 	unsigned int timeout = 1000;
 
 	for (i = 0; i < 9; ++i)
-- 
2.6.6
