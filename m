Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx7QP-0007oR-7R
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 09:15:07 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fsmc: Fix Hamming ECC
Date: Tue,  4 Sep 2018 11:14:38 +0200
Message-Id: <20180904091438.3755-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apparently ECC bytes are not ordered as expected by nand_correct_data()
in the ecc_calc buffer which leads to invalid bitflip correction when
an ECC error is detected (can be reproduced with 'nandbiterrs -i').

Re-ordering ECC bytes seems to fix the problem.

While at it, get rid of the useless u8 cast.

Fixes: 6c009ab89a21 ("mtd: generic FSMC NAND MTD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index f418236fa020..c79f8e965b38 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -440,9 +440,9 @@ static int fsmc_read_hwecc_ecc1(struct mtd_info *mtd, const uint8_t *data,
 	uint32_t ecc_tmp;
 
 	ecc_tmp = readl_relaxed(host->regs_va + ECC1);
-	ecc[0] = (uint8_t) (ecc_tmp >> 0);
-	ecc[1] = (uint8_t) (ecc_tmp >> 8);
-	ecc[2] = (uint8_t) (ecc_tmp >> 16);
+	ecc[0] = ecc_tmp >> 8;
+	ecc[1] = ecc_tmp;
+	ecc[2] = ecc_tmp >> 16;
 
 	return 0;
 }
-- 
2.14.1
