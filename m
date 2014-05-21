Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqM-0000ip-WD
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:39 +0000
Received: by mail-pd0-f179.google.com with SMTP id x10so1071162pdj.38
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:22 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/6] mtd: nand_bbt: remove unused variable
Date: Tue, 20 May 2014 23:17:01 -0700
Message-Id: <1400653023-25757-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set, but unused, variable.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c0615d1526f9..6cbf8768a0a4 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -528,7 +528,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 {
 	struct nand_chip *this = mtd->priv;
 	int i, chips;
-	int bits, startblock, block, dir;
+	int startblock, block, dir;
 	int scanlen = mtd->writesize + mtd->oobsize;
 	int bbtblocks;
 	int blocktopage = this->bbt_erase_shift - this->page_shift;
@@ -552,9 +552,6 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		bbtblocks = mtd->size >> this->bbt_erase_shift;
 	}
 
-	/* Number of bits for each erase block in the bbt */
-	bits = td->options & NAND_BBT_NRBITS_MSK;
-
 	for (i = 0; i < chips; i++) {
 		/* Reset version information */
 		td->version[i] = 0;
-- 
1.7.9.5
