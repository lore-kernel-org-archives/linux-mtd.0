Received: from ip-196-116.sn1.eutelia.it ([62.94.196.116]
 helo=goldrake.enneenne.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2id2-0000n2-8N
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 14:36:37 +0000
From: Rodolfo Giometti <giometti@linux.it>
To: linux-mtd@lists.infradead.org
Date: Mon, 13 Jan 2014 15:35:38 +0100
Message-Id: <1389623738-19585-1-git-send-email-giometti@linux.it>
Subject: [PATCH] mtd pxa3xx_nand.c: add support for 2048 bytes page size layout
Cc: Rodolfo Giometti <giometti@linux.it>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Rodolfo Giometti <giometti@linux.it>
---
 drivers/mtd/nand/pxa3xx_nand.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 31aae53..2a7a0b2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -286,6 +286,16 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = bbt_mirror_pattern
 };
 
+static struct nand_ecclayout ecc_layout_2KB_bch4bit = {
+	.eccbytes = 32,
+	.eccpos = {
+		32, 33, 34, 35, 36, 37, 38, 39,
+		40, 41, 42, 43, 44, 45, 46, 47,
+		48, 49, 50, 51, 52, 53, 54, 55,
+		56, 57, 58, 59, 60, 61, 62, 63},
+	.oobfree = { {2, 30} }
+};
+
 static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
 	.eccbytes = 64,
 	.eccpos = {
@@ -1360,6 +1370,17 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 4-bit correction per 512 bytes
 	 * Select: 16-bit correction per 2048 bytes
 	 */
+	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 2048) {
+		info->ecc_bch = 1;
+		info->chunk_size = 2048;
+		info->spare_size = 32;
+		info->ecc_size = 32;
+		ecc->mode = NAND_ECC_HW;
+		ecc->size = info->chunk_size;
+		ecc->layout = &ecc_layout_2KB_bch4bit;
+		ecc->strength = 16;
+		return 1;
+
 	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
-- 
1.8.1.2
