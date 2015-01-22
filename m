Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEHjp-00050s-Ay
 for linux-mtd@lists.infradead.org; Thu, 22 Jan 2015 13:23:58 +0000
From: Baruch Siach <baruch@tkos.co.il>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: remove redundant local variable
Date: Thu, 22 Jan 2015 15:23:05 +0200
Message-Id: <ef5edcf3dae1786e22b006e854b955bfd3a57307.1421932985.git.baruch@tkos.co.il>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/nand_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7bfa519588a4..31e252a5ce9c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1750,11 +1750,10 @@ static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 static int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 				  int page)
 {
-	uint8_t *buf = chip->oob_poi;
 	int length = mtd->oobsize;
 	int chunk = chip->ecc.bytes + chip->ecc.prepad + chip->ecc.postpad;
 	int eccsize = chip->ecc.size;
-	uint8_t *bufpoi = buf;
+	uint8_t *bufpoi = chip->oob_poi;
 	int i, toread, sndrnd = 0, pos;
 
 	chip->cmdfunc(mtd, NAND_CMD_READ0, chip->ecc.size, page);
-- 
2.1.4
