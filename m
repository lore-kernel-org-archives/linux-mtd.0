Received: from mail-db9lp0252.outbound.messaging.microsoft.com
 ([213.199.154.252] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8kf0-0006fl-Ux
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 05:27:22 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 5/6] mtd: gpmi: remove the nand_scan()
Date: Mon, 12 Aug 2013 13:24:51 +0800
Message-ID: <1376285092-19683-6-git-send-email-b32955@freescale.com>
In-Reply-To: <1376285092-19683-1-git-send-email-b32955@freescale.com>
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to make the nand_scan() work, the current code uses the hack code
to init the @nand_chip->ecc.size and the @nand_chip->ecc.strength. and
re-init some the ECC info in the gpmi_pre_bbt_scan().
This code is really a little ugly.

The patch does following changes:
  (1) Use the nand_scan_ident()/nand_scan_tail() to replace the nand_scan().

  (2) Init all the necessary values in the gpmi_init_last()
      before we call the nand_scan_tail().

  (3) remove the code setting the ECC info, let the mtd layer to do the
      real job.

  (4) remove the gpmi_scan_bbt(). we do not need this function any more.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   65 +++++++++++++++++---------------
 1 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index c6b356c..9c89e80 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -214,7 +214,6 @@ static bool set_geometry_by_ecc_info(struct gpmi_nand_data *this)
 	if (geo->page_size < mtd->writesize + mtd->oobsize) {
 		of->offset = geo->page_size - mtd->writesize;
 		of->length = mtd->oobsize - of->offset;
-		mtd->oobavail = gpmi_hw_ecclayout.oobavail = of->length;
 	}
 
 	geo->payload_size = mtd->writesize;
@@ -1582,19 +1581,22 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
 	if (ret)
 		return ret;
 
-	/* Adjust the ECC strength according to the chip. */
-	this->nand.ecc.strength = this->bch_geometry.ecc_strength;
-	this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
-	this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
-
 	/* NAND boot init, depends on the gpmi_set_geometry(). */
 	return nand_boot_init(this);
 }
 
-static int gpmi_scan_bbt(struct mtd_info *mtd)
+static void gpmi_nfc_exit(struct gpmi_nand_data *this)
+{
+	nand_release(&this->mtd);
+	gpmi_free_dma_buffer(this);
+}
+
+static int gpmi_init_last(struct gpmi_nand_data *this)
 {
+	struct mtd_info *mtd = &this->mtd;
 	struct nand_chip *chip = mtd->priv;
-	struct gpmi_nand_data *this = chip->priv;
+	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	struct bch_geometry *bch_geo = &this->bch_geometry;
 	int ret;
 
 	/* Prepare for the BBT scan. */
@@ -1602,6 +1604,16 @@ static int gpmi_scan_bbt(struct mtd_info *mtd)
 	if (ret)
 		return ret;
 
+	/* Init the nand_ecc_ctrl{} */
+	ecc->read_page	= gpmi_ecc_read_page;
+	ecc->write_page	= gpmi_ecc_write_page;
+	ecc->read_oob	= gpmi_ecc_read_oob;
+	ecc->write_oob	= gpmi_ecc_write_oob;
+	ecc->mode	= NAND_ECC_HW;
+	ecc->size	= bch_geo->ecc_chunk_size;
+	ecc->strength	= bch_geo->ecc_strength;
+	ecc->layout	= &gpmi_hw_ecclayout;
+
 	/*
 	 * Can we enable the extra features? such as EDO or Sync mode.
 	 *
@@ -1610,14 +1622,7 @@ static int gpmi_scan_bbt(struct mtd_info *mtd)
 	 */
 	gpmi_extra_init(this);
 
-	/* use the default BBT implementation */
-	return nand_default_bbt(mtd);
-}
-
-static void gpmi_nfc_exit(struct gpmi_nand_data *this)
-{
-	nand_release(&this->mtd);
-	gpmi_free_dma_buffer(this);
+	return 0;
 }
 
 static int gpmi_nfc_init(struct gpmi_nand_data *this)
@@ -1643,33 +1648,33 @@ static int gpmi_nfc_init(struct gpmi_nand_data *this)
 	chip->read_byte		= gpmi_read_byte;
 	chip->read_buf		= gpmi_read_buf;
 	chip->write_buf		= gpmi_write_buf;
-	chip->ecc.read_page	= gpmi_ecc_read_page;
-	chip->ecc.write_page	= gpmi_ecc_write_page;
-	chip->ecc.read_oob	= gpmi_ecc_read_oob;
-	chip->ecc.write_oob	= gpmi_ecc_write_oob;
-	chip->scan_bbt		= gpmi_scan_bbt;
 	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->block_markbad	= gpmi_block_markbad;
 	chip->options		|= NAND_NO_SUBPAGE_WRITE;
-	chip->ecc.mode		= NAND_ECC_HW;
-	chip->ecc.size		= 1;
-	chip->ecc.strength	= 8;
-	chip->ecc.layout	= &gpmi_hw_ecclayout;
 	if (of_get_nand_on_flash_bbt(this->dev->of_node))
 		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 
-	/* Allocate a temporary DMA buffer for reading ID in the nand_scan() */
+	/*
+	 * Allocate a temporary DMA buffer for reading ID in the
+	 * nand_scan_ident().
+	 */
 	this->bch_geometry.payload_size = 1024;
 	this->bch_geometry.auxiliary_size = 128;
 	ret = gpmi_alloc_dma_buffer(this);
 	if (ret)
 		goto err_out;
 
-	ret = nand_scan(mtd, 1);
-	if (ret) {
-		pr_err("Chip scan failed\n");
+	ret = nand_scan_ident(mtd, 1, NULL);
+	if (ret)
+		goto err_out;
+
+	ret = gpmi_init_last(this);
+	if (ret)
+		goto err_out;
+
+	ret = nand_scan_tail(mtd);
+	if (ret)
 		goto err_out;
-	}
 
 	ppdata.of_node = this->pdev->dev.of_node;
 	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
-- 
1.7.1
