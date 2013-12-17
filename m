Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsnMo-0001KV-PG
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 05:38:51 +0000
Received: by mail-pa0-f45.google.com with SMTP id fb1so3962140pad.18
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 21:38:28 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: lpc32xx_mlc: drop custom write_page callback
Date: Mon, 16 Dec 2013 21:10:11 -0800
Message-Id: <1387257011-4208-1-git-send-email-computersforpeace@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver doesn't need its own custom chip->write_page callback; the
only "custom" requirement is that this driver does not support subpage
writes, which we can avoid using the NAND_NO_SUBPAGE_WRITE flag. With
NAND_NO_SUBPAGE_WRITE, the default routine (nand_write_page()) should
perform the equivalent operations.

Compile-tested only.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>
---
 drivers/mtd/nand/lpc32xx_mlc.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 327d96c03505..48be85039a89 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -539,20 +539,6 @@ static int lpc32xx_write_page_lowlevel(struct mtd_info *mtd,
 	return 0;
 }
 
-static int lpc32xx_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			uint32_t offset, int data_len, const uint8_t *buf,
-			int oob_required, int page, int cached, int raw)
-{
-	int res;
-
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-	res = lpc32xx_write_page_lowlevel(mtd, chip, buf, oob_required);
-	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-	lpc32xx_waitfunc(mtd, chip);
-
-	return res;
-}
-
 static int lpc32xx_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			    int page)
 {
@@ -732,9 +718,9 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	nand_chip->ecc.write_oob = lpc32xx_write_oob;
 	nand_chip->ecc.read_oob = lpc32xx_read_oob;
 	nand_chip->ecc.strength = 4;
-	nand_chip->write_page = lpc32xx_write_page;
 	nand_chip->waitfunc = lpc32xx_waitfunc;
 
+	nand_chip->options = NAND_NO_SUBPAGE_WRITE;
 	nand_chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 	nand_chip->bbt_td = &lpc32xx_nand_bbt;
 	nand_chip->bbt_md = &lpc32xx_nand_bbt_mirror;
-- 
1.8.3.2
