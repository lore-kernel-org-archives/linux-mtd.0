From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: atmel_nand: pmecc: fix bug fail to correct bit error in
 1024-bytes sector
Date: Mon, 19 Aug 2013 18:05:44 +0800
Message-ID: <1376906744-4711-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicolas.ferre@atmel.com, computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The PMECC use BCH algorithm to correct error. In BCH algorithm, the primitive
polynomial value is GF(2^13) for 512-bytes sector size. And it is GF(2^14) for
1024-bytes sector size.

This patch will choose correct degree of the remainders(13 or 14) for
different sector size.
Tested in AT91SAM9X5-EK with MLC nand flash.

More detail can be refered to section 5.4.1 of:
  AT91SAM ARM-based Embedded MPU Application Note
  <http://www.atmel.com/Images/doc11127.pdf>

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 0e365da..8b2eb3e 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1204,7 +1204,8 @@ static int __init atmel_pmecc_nand_init_params(struct platform_device *pdev,
 	/* set ECC page size and oob layout */
 	switch (mtd->writesize) {
 	case 2048:
-		host->pmecc_degree = PMECC_GF_DIMENSION_13;
+		host->pmecc_degree = (sector_size == 512) ?
+			PMECC_GF_DIMENSION_13 : PMECC_GF_DIMENSION_14;
 		host->pmecc_cw_len = (1 << host->pmecc_degree) - 1;
 		host->pmecc_sector_number = mtd->writesize / sector_size;
 		host->pmecc_bytes_per_sector = pmecc_get_ecc_bytes(
-- 
1.7.9.5
