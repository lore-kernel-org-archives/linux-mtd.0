From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 04/10] mtd: nand: gpmi: pass buffer and len around
Date: Wed,  6 Dec 2017 10:19:19 +0100
Message-Id: <20171206091925.5810-5-s.hauer@pengutronix.de>
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

Instead of putting the buffer and len passed in from the mtd core
into the private data struct, just pass it around in the GPMI
drivers functions. This makes the lifetime of the variables more
clear and the code easier to follow.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 14 +++++++-------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 20 ++++++++------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 10 +++-------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index f29349d1cb7a..503b024aa883 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1149,7 +1149,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 	return start_dma_without_bch_irq(this, desc);
 }
 
-int gpmi_send_data(struct gpmi_nand_data *this)
+int gpmi_send_data(struct gpmi_nand_data *this, const void *buf, int len)
 {
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
@@ -1168,7 +1168,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_CS(chip, this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(this->upper_len);
+		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
 	desc = dmaengine_prep_slave_sg(channel, (struct scatterlist *)pio,
 					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
@@ -1176,7 +1176,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] send DMA request */
-	prepare_data_dma(this, DMA_TO_DEVICE);
+	prepare_data_dma(this, buf, len, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -1191,7 +1191,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 	return ret;
 }
 
-int gpmi_read_data(struct gpmi_nand_data *this)
+int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 {
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
@@ -1205,7 +1205,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_CS(chip, this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
-		| BF_GPMI_CTRL0_XFER_COUNT(this->upper_len);
+		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
@@ -1214,7 +1214,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] : send DMA request */
-	prepare_data_dma(this, DMA_FROM_DEVICE);
+	prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -1227,7 +1227,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 
 	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
 	if (this->direct_dma_map_ok == false)
-		memcpy(this->upper_buf, this->data_buffer_dma, this->upper_len);
+		memcpy(buf, this->data_buffer_dma, len);
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index da1090474b11..0f525a45b7ec 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -437,15 +437,15 @@ struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
 }
 
 /* Can we use the upper's buffer directly for DMA? */
-void prepare_data_dma(struct gpmi_nand_data *this, enum dma_data_direction dr)
+void prepare_data_dma(struct gpmi_nand_data *this, const void *buf, int len,
+		      enum dma_data_direction dr)
 {
 	struct scatterlist *sgl = &this->data_sgl;
 	int ret;
 
 	/* first try to map the upper buffer directly */
-	if (virt_addr_valid(this->upper_buf) &&
-		!object_is_on_stack(this->upper_buf)) {
-		sg_init_one(sgl, this->upper_buf, this->upper_len);
+	if (virt_addr_valid(buf) && !object_is_on_stack(buf)) {
+		sg_init_one(sgl, buf, len);
 		ret = dma_map_sg(this->dev, sgl, 1, dr);
 		if (ret == 0)
 			goto map_fail;
@@ -456,10 +456,10 @@ void prepare_data_dma(struct gpmi_nand_data *this, enum dma_data_direction dr)
 
 map_fail:
 	/* We have to use our own DMA buffer. */
-	sg_init_one(sgl, this->data_buffer_dma, this->upper_len);
+	sg_init_one(sgl, this->data_buffer_dma, len);
 
 	if (dr == DMA_TO_DEVICE)
-		memcpy(this->data_buffer_dma, this->upper_buf, this->upper_len);
+		memcpy(this->data_buffer_dma, buf, len);
 
 	dma_map_sg(this->dev, sgl, 1, dr);
 
@@ -926,10 +926,8 @@ static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
-	this->upper_buf	= buf;
-	this->upper_len	= len;
 
-	gpmi_read_data(this);
+	gpmi_read_data(this, buf, len);
 }
 
 static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
@@ -938,10 +936,8 @@ static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
-	this->upper_buf	= (uint8_t *)buf;
-	this->upper_len	= len;
 
-	gpmi_send_data(this);
+	gpmi_send_data(this, buf, len);
 }
 
 static uint8_t gpmi_read_byte(struct mtd_info *mtd)
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 602e47ce4e88..a14bfda45156 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -159,10 +159,6 @@ struct gpmi_nand_data {
 	int			current_chip;
 	unsigned int		command_length;
 
-	/* passed from upper layer */
-	uint8_t			*upper_buf;
-	int			upper_len;
-
 	/* for DMA operations */
 	bool			direct_dma_map_ok;
 
@@ -259,7 +255,7 @@ struct timing_threshold {
 /* Common Services */
 extern int common_nfc_set_geometry(struct gpmi_nand_data *);
 extern struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
-extern void prepare_data_dma(struct gpmi_nand_data *,
+extern void prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
 				enum dma_data_direction dr);
 extern int start_dma_without_bch_irq(struct gpmi_nand_data *,
 				struct dma_async_tx_descriptor *);
@@ -276,8 +272,8 @@ extern int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
 extern int gpmi_send_command(struct gpmi_nand_data *);
 extern void gpmi_begin(struct gpmi_nand_data *);
 extern void gpmi_end(struct gpmi_nand_data *);
-extern int gpmi_read_data(struct gpmi_nand_data *);
-extern int gpmi_send_data(struct gpmi_nand_data *);
+extern int gpmi_read_data(struct gpmi_nand_data *, void *buf, int len);
+extern int gpmi_send_data(struct gpmi_nand_data *, const void *buf, int len);
 extern int gpmi_send_page(struct gpmi_nand_data *,
 			dma_addr_t payload, dma_addr_t auxiliary);
 extern int gpmi_read_page(struct gpmi_nand_data *,
-- 
2.11.0
