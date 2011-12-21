Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdUEE-0004Ww-B4
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2011 22:01:39 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: fix typo in comment
Date: Wed, 21 Dec 2011 23:01:20 +0100
Message-Id: <1324504880-13312-1-git-send-email-w.sang@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Funny one :) "Heck" fits somehow, too, but I am sure it was meant to be "Check".

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/nand/nand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3ed9c5e..376472b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2588,7 +2588,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	instr->state = MTD_ERASING;
 
 	while (len) {
-		/* Heck if we have a bad block, we do not erase bad blocks! */
+		/* Check if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
-- 
1.7.2.5
