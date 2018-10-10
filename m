Received: from gateway34.websitewelcome.com ([192.185.148.214])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAGtU-0003EI-Oq
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 15:59:30 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 369B131E3903
 for <linux-mtd@lists.infradead.org>;
 Wed, 10 Oct 2018 10:59:17 -0500 (CDT)
Date: Wed, 10 Oct 2018 17:58:58 +0200
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] mtd: rawnand: fsmc: Fix unchecked return value in
 fsmc_read_page_hwecc
Message-ID: <20181010155857.GA18860@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check return value of nand_read_data_op.

Notice that, currently, all instances of nand_read_data_op() are
being checked, with the exception of two of them in marvell_nand
driver, in which the caller function explicitly returns 0 every
time.

Also, notice that I moved the declaration of *ret* to the top of
fsmc_read_page_hwecc().

Addresses-Coverity-ID: 1471968 ("Unchecked return value")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 70ac8d8..41ba76e 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -727,7 +727,7 @@ static int fsmc_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	uint8_t *ecc_code = chip->ecc.code_buf;
-	int off, len, group = 0;
+	int off, len, ret, group = 0;
 	/*
 	 * ecc_oob is intentionally taken as uint16_t. In 16bit devices, we
 	 * end up reading 14 bytes (7 words) from oob. The local array is
@@ -740,11 +740,12 @@ static int fsmc_read_page_hwecc(struct nand_chip *chip, uint8_t *buf,
 	for (i = 0, s = 0; s < eccsteps; s++, i += eccbytes, p += eccsize) {
 		nand_read_page_op(chip, page, s * eccsize, NULL, 0);
 		chip->ecc.hwctl(chip, NAND_ECC_READ);
-		nand_read_data_op(chip, p, eccsize, false);
+		ret = nand_read_data_op(chip, p, eccsize, false);
+		if (ret)
+			return ret;
 
 		for (j = 0; j < eccbytes;) {
 			struct mtd_oob_region oobregion;
-			int ret;
 
 			ret = mtd_ooblayout_ecc(mtd, group++, &oobregion);
 			if (ret)
-- 
2.7.4
