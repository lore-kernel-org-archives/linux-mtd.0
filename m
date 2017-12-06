From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 06/10] mtd: nand: gpmi: remove direct_dma_map_ok from driver
 data struct
Date: Wed,  6 Dec 2017 10:19:21 +0100
Message-Id: <20171206091925.5810-7-s.hauer@pengutronix.de>
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

Instead of putting direct_dma_map_ok into driver struct pass it around
between functions to make the code more readable.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 15 +++++++--------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  5 +----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 503b024aa883..83996f7783ab 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1198,6 +1198,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	int chip = this->current_chip;
 	int ret;
 	u32 pio[2];
+	bool direct;
 
 	/* [1] : send PIO */
 	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__READ)
@@ -1214,7 +1215,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 		return -EINVAL;
 
 	/* [2] : send DMA request */
-	prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
+	direct = prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -1226,7 +1227,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	ret = start_dma_without_bch_irq(this, desc);
 
 	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
-	if (this->direct_dma_map_ok == false)
+	if (!direct)
 		memcpy(buf, this->data_buffer_dma, len);
 
 	return ret;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index db6664ef7c90..09eb1960a60d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -437,7 +437,7 @@ struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
 }
 
 /* Can we use the upper's buffer directly for DMA? */
-void prepare_data_dma(struct gpmi_nand_data *this, const void *buf, int len,
+bool prepare_data_dma(struct gpmi_nand_data *this, const void *buf, int len,
 		      enum dma_data_direction dr)
 {
 	struct scatterlist *sgl = &this->data_sgl;
@@ -450,8 +450,7 @@ void prepare_data_dma(struct gpmi_nand_data *this, const void *buf, int len,
 		if (ret == 0)
 			goto map_fail;
 
-		this->direct_dma_map_ok = true;
-		return;
+		return true;
 	}
 
 map_fail:
@@ -463,7 +462,7 @@ void prepare_data_dma(struct gpmi_nand_data *this, const void *buf, int len,
 
 	dma_map_sg(this->dev, sgl, 1, dr);
 
-	this->direct_dma_map_ok = false;
+	return false;
 }
 
 /* This will be called after the DMA operation is finished. */
@@ -961,12 +960,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	unsigned char *status;
 	unsigned int  max_bitflips = 0;
 	int           ret;
+	bool          direct = false;
 
 	dev_dbg(this->dev, "page number is : %d\n", page);
 
 	payload_virt = this->payload_virt;
 	payload_phys = this->payload_phys;
-	this->direct_dma_map_ok = false;
 
 	if (virt_addr_valid(buf)) {
 		dma_addr_t dest_phys;
@@ -976,7 +975,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 		if (!dma_mapping_error(this->dev, dest_phys)) {
 			payload_virt = buf;
 			payload_phys = dest_phys;
-			this->direct_dma_map_ok = true;
+			direct = true;
 		}
 	}
 
@@ -988,7 +987,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* go! */
 	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
 
-	if (this->direct_dma_map_ok)
+	if (direct)
 		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
 				 DMA_FROM_DEVICE);
 
@@ -1000,7 +999,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	/* Loop over status bytes, accumulating ECC status. */
 	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
-	if (!this->direct_dma_map_ok)
+	if (!direct)
 		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
 
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a14bfda45156..769ff91a714f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -159,9 +159,6 @@ struct gpmi_nand_data {
 	int			current_chip;
 	unsigned int		command_length;
 
-	/* for DMA operations */
-	bool			direct_dma_map_ok;
-
 	struct scatterlist	cmd_sgl;
 	char			*cmd_buffer;
 
@@ -255,7 +252,7 @@ struct timing_threshold {
 /* Common Services */
 extern int common_nfc_set_geometry(struct gpmi_nand_data *);
 extern struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
-extern void prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
+extern bool prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
 				enum dma_data_direction dr);
 extern int start_dma_without_bch_irq(struct gpmi_nand_data *,
 				struct dma_async_tx_descriptor *);
-- 
2.11.0
