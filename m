From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 18/52] mtd: rawnand: gpmi: convert driver to nand_scan()
Date: Fri,  2 Mar 2018 18:03:26 +0100
Message-Id: <20180302170400.6712-19-miquel.raynal@bootlin.com>
In-Reply-To: <20180302170400.6712-1-miquel.raynal@bootlin.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Two helpers have been added to the core to make ECC-related
configuration between the detection phase and the final NAND scan. Use
these hooks and convert the driver to just use nand_scan() instead of
both nand_scan_ident() and nand_scan_tail().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 52 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c2597c8107a0..b72f4f2db695 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -825,9 +825,9 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	 * [2] Allocate a read/write data buffer.
 	 *     The gpmi_alloc_dma_buffer can be called twice.
 	 *     We allocate a PAGE_SIZE length buffer if gpmi_alloc_dma_buffer
-	 *     is called before the nand_scan_ident; and we allocate a buffer
-	 *     of the real NAND page size when the gpmi_alloc_dma_buffer is
-	 *     called after the nand_scan_ident.
+	 *     is called before the NAND identification; and we allocate a
+	 *     buffer of the real NAND page size when the gpmi_alloc_dma_buffer
+	 *     is called after.
 	 */
 	this->data_buffer_dma = kzalloc(mtd->writesize ?: PAGE_SIZE,
 					GFP_DMA | GFP_KERNEL);
@@ -1951,6 +1951,30 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	return 0;
 }
 
+static int gpmi_nand_attach_chip(struct nand_chip *chip)
+{
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	int ret;
+
+	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
+		if (of_property_read_bool(this->dev->of_node,
+					  "fsl,no-blockmark-swap"))
+			this->swap_block_mark = false;
+	}
+	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
+		this->swap_block_mark ? "en" : "dis");
+
+	ret = gpmi_init_last(this);
+	if (ret)
+		return ret;
+
+	chip->options |= NAND_SKIP_BBTSCAN;
+
+	return 0;
+}
+
 static int gpmi_nand_init(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
@@ -1991,26 +2015,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
-	if (ret)
-		goto err_out;
-
-	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
-		chip->bbt_options |= NAND_BBT_NO_OOB;
-
-		if (of_property_read_bool(this->dev->of_node,
-						"fsl,no-blockmark-swap"))
-			this->swap_block_mark = false;
-	}
-	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
-		this->swap_block_mark ? "en" : "dis");
-
-	ret = gpmi_init_last(this);
-	if (ret)
-		goto err_out;
-
-	chip->options |= NAND_SKIP_BBTSCAN;
-	ret = nand_scan_tail(mtd);
+	chip->ecc.attach_chip = gpmi_nand_attach_chip;
+	ret = nand_scan(mtd, GPMI_IS_MX6(this) ? 2 : 1);
 	if (ret)
 		goto err_out;
 
-- 
2.14.1
