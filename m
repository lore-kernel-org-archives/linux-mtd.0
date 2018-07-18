Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffhoy-0004FY-Nk
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:28:30 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fsmc: Stop using chip->read_buf()
Date: Wed, 18 Jul 2018 10:28:14 +0200
Message-Id: <20180718082814.17203-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

chip->read_buf is left unassigned since commit 4da712e70294 ("mtd: nand:
fsmc: use ->exec_op()"), leading to a NULL pointer dereference when it's
called from fsmc_read_page_hwecc(). Fix that by using the appropriate
helper to read data out of the NAND.

Fixes: 4da712e70294 ("mtd: nand: fsmc: use ->exec_op()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index f4a5a317d4ae..e1086a010b88 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -740,7 +740,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0, s = 0; s < eccsteps; s++, i += eccbytes, p += eccsize) {
 		nand_read_page_op(chip, page, s * eccsize, NULL, 0);
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
-		chip->read_buf(mtd, p, eccsize);
+		nand_read_data_op(chip, p, eccsize, false);
 
 		for (j = 0; j < eccbytes;) {
 			struct mtd_oob_region oobregion;
-- 
2.14.1
