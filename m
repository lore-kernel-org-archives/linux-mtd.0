Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1Yv2-0007TX-PK
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 10:34:42 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 1/2] mtd: nand: clean nand_write_subpage_hwecc to reduce
 local variables
Date: Mon, 30 Jun 2014 16:04:00 +0530
Message-ID: <1404124441-26038-2-git-send-email-pekon@ti.com>
In-Reply-To: <1404124441-26038-1-git-send-email-pekon@ti.com>
References: <1404124441-26038-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use 'struct nand_ecc_ctrl *' instead of 'struct nand_chip *' for de-referenceing
ECC variables.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c5c1b1f..fdbd8c6 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2106,25 +2106,23 @@ static int nand_write_subpage_hwecc(struct mtd_info *mtd,
 {
 	uint8_t *oob_buf  = chip->oob_poi;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
-	int ecc_size      = chip->ecc.size;
-	int ecc_bytes     = chip->ecc.bytes;
-	int ecc_steps     = chip->ecc.steps;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	uint32_t *eccpos  = chip->ecc.layout->eccpos;
-	uint32_t start_step = offset / ecc_size;
-	uint32_t end_step   = (offset + data_len - 1) / ecc_size;
-	int oob_bytes       = mtd->oobsize / ecc_steps;
+	uint32_t start_step = offset / ecc->size;
+	uint32_t end_step   = (offset + data_len - 1) / ecc->size;
+	int oob_bytes       = mtd->oobsize / ecc->steps;
 	int step, i;
 
-	for (step = 0; step < ecc_steps; step++) {
+	for (step = 0; step < ecc->steps; step++) {
 		/* configure controller for WRITE access */
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
 
 		/* write data (untouched subpages already masked by 0xFF) */
-		chip->write_buf(mtd, buf, ecc_size);
+		chip->write_buf(mtd, buf, ecc->size);
 
 		/* mask ECC of un-touched subpages by padding 0xFF */
 		if ((step < start_step) || (step > end_step))
-			memset(ecc_calc, 0xff, ecc_bytes);
+			memset(ecc_calc, 0xff, ecc->bytes);
 		else
 			chip->ecc.calculate(mtd, buf, ecc_calc);
 
@@ -2133,9 +2131,9 @@ static int nand_write_subpage_hwecc(struct mtd_info *mtd,
 		if (!oob_required || (step < start_step) || (step > end_step))
 			memset(oob_buf, 0xff, oob_bytes);
 
-		buf += ecc_size;
-		ecc_calc += ecc_bytes;
-		oob_buf  += oob_bytes;
+		buf		+= ecc->size;
+		ecc_calc	+= ecc->bytes;
+		oob_buf		+= oob_bytes;
 	}
 
 	/* copy calculated ECC for whole page to chip->buffer->oob */
-- 
1.8.5.1.163.gd7aced9
