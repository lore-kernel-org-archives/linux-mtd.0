From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 09/10] mtd: nand: gpmi: rework gpmi_ecc_write_page
Date: Wed,  6 Dec 2017 10:19:24 +0100
Message-Id: <20171206091925.5810-10-s.hauer@pengutronix.de>
In-Reply-To: <20171206091925.5810-1-s.hauer@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gpmi_ecc_write_page() used to call several functions with 8 arguments
each. refactor this to make it easier to follow.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 140 ++++++++++-----------------------
 1 file changed, 42 insertions(+), 98 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8dc40b672ab9..d8038b62246c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -695,51 +695,6 @@ static int init_hardware(struct gpmi_nand_data *this)
 	return 0;
 }
 
-static int send_page_prepare(struct gpmi_nand_data *this,
-			const void *source, unsigned length,
-			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
-			const void **use_virt, dma_addr_t *use_phys)
-{
-	struct device *dev = this->dev;
-
-	if (virt_addr_valid(source)) {
-		dma_addr_t source_phys;
-
-		source_phys = dma_map_single(dev, (void *)source, length,
-						DMA_TO_DEVICE);
-		if (dma_mapping_error(dev, source_phys)) {
-			if (alt_size < length) {
-				dev_err(dev, "Alternate buffer is too small\n");
-				return -ENOMEM;
-			}
-			goto map_failed;
-		}
-		*use_virt = source;
-		*use_phys = source_phys;
-		return 0;
-	}
-map_failed:
-	/*
-	 * Copy the content of the source buffer into the alternate
-	 * buffer and set up the return values accordingly.
-	 */
-	memcpy(alt_virt, source, length);
-
-	*use_virt = alt_virt;
-	*use_phys = alt_phys;
-	return 0;
-}
-
-static void send_page_end(struct gpmi_nand_data *this,
-			const void *source, unsigned length,
-			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
-			const void *used_virt, dma_addr_t used_phys)
-{
-	struct device *dev = this->dev;
-	if (used_virt == source)
-		dma_unmap_single(dev, used_phys, length, DMA_TO_DEVICE);
-}
-
 static void gpmi_free_dma_buffer(struct gpmi_nand_data *this)
 {
 	struct device *dev = this->dev;
@@ -1126,60 +1081,53 @@ static int gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
+
+static bool map_write_direct(struct gpmi_nand_data *this, const void *source,
+		       unsigned length, dma_addr_t *phys)
+{
+	struct device *dev = this->dev;
+	dma_addr_t source_phys;
+
+	/*
+	 * input data is const, we cannot map directly when doing bad block
+	 * marker swapping.
+	 */
+	if (this->swap_block_mark)
+		return false;
+
+	if (!virt_addr_valid(source))
+		return false;
+
+	source_phys = dma_map_single(dev, (void *)source, length,
+					DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, source_phys))
+		return false;
+
+	return true;
+}
+
 static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf, int oob_required, int page)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	const void *payload_virt;
 	dma_addr_t payload_phys;
-	const void *auxiliary_virt;
 	dma_addr_t auxiliary_phys;
-	int        ret;
+	int ret;
+	bool user_mapped, oob_mapped;
 
 	dev_dbg(this->dev, "ecc write page.\n");
-	if (this->swap_block_mark) {
-		/*
-		 * If control arrives here, we're doing block mark swapping.
-		 * Since we can't modify the caller's buffers, we must copy them
-		 * into our own.
-		 */
+
+	user_mapped = map_write_direct(this, buf, mtd->writesize, &payload_phys);
+	if (!user_mapped) {
 		memcpy(this->payload_virt, buf, mtd->writesize);
-		payload_virt = this->payload_virt;
 		payload_phys = this->payload_phys;
+	}
 
-		memcpy(this->auxiliary_virt, chip->oob_poi,
-				nfc_geo->auxiliary_size);
-		auxiliary_virt = this->auxiliary_virt;
+	oob_mapped = map_write_direct(this, chip->oob_poi, mtd->oobsize,
+				&auxiliary_phys);
+	if (!oob_mapped) {
+		memcpy(this->auxiliary_virt, buf, mtd->oobsize);
 		auxiliary_phys = this->auxiliary_phys;
-
-		/* Handle block mark swapping. */
-		block_mark_swapping(this,
-				(void *)payload_virt, (void *)auxiliary_virt);
-	} else {
-		/*
-		 * If control arrives here, we're not doing block mark swapping,
-		 * so we can to try and use the caller's buffers.
-		 */
-		ret = send_page_prepare(this,
-				buf, mtd->writesize,
-				this->payload_virt, this->payload_phys,
-				nfc_geo->payload_size,
-				&payload_virt, &payload_phys);
-		if (ret) {
-			dev_err(this->dev, "Inadequate payload DMA buffer\n");
-			return 0;
-		}
-
-		ret = send_page_prepare(this,
-				chip->oob_poi, mtd->oobsize,
-				this->auxiliary_virt, this->auxiliary_phys,
-				nfc_geo->auxiliary_size,
-				&auxiliary_virt, &auxiliary_phys);
-		if (ret) {
-			dev_err(this->dev, "Inadequate auxiliary DMA buffer\n");
-			goto exit_auxiliary;
-		}
 	}
 
 	/* Ask the NFC. */
@@ -1187,17 +1135,13 @@ static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (ret)
 		dev_err(this->dev, "Error in ECC-based write: %d\n", ret);
 
-	if (!this->swap_block_mark) {
-		send_page_end(this, chip->oob_poi, mtd->oobsize,
-				this->auxiliary_virt, this->auxiliary_phys,
-				nfc_geo->auxiliary_size,
-				auxiliary_virt, auxiliary_phys);
-exit_auxiliary:
-		send_page_end(this, buf, mtd->writesize,
-				this->payload_virt, this->payload_phys,
-				nfc_geo->payload_size,
-				payload_virt, payload_phys);
-	}
+	if (oob_mapped)
+		dma_unmap_single(this->dev, auxiliary_phys, mtd->oobsize,
+				 DMA_TO_DEVICE);
+
+	if (user_mapped)
+		dma_unmap_single(this->dev, payload_phys, mtd->writesize,
+				 DMA_TO_DEVICE);
 
 	return 0;
 }
-- 
2.11.0
