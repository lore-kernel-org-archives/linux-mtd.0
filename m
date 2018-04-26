Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj28-0005hR-5m
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:09 +0000
Received: by mail-wr0-x243.google.com with SMTP id h3-v6so57285408wrh.5
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:41:57 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 02/13] mtd: nand: gpmi: pass buffer and len around
Date: Thu, 26 Apr 2018 17:41:23 +0200
Message-Id: <20180426154134.8270-3-sam.lefebvre@essensium.com>
In-Reply-To: <20180426154134.8270-1-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

Instead of putting the buffer and len passed in from the mtd core
into the private data struct, just pass it around in the GPMI
drivers functions. This makes the lifetime of the variables more
clear and the code easier to follow.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: rebased
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 14 +++++++-------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 20 ++++++++------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 11 ++++-------
 3 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index d479358758a0..447961b798b4 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -587,7 +587,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 	return ret;
 }
 
-int gpmi_send_data(struct gpmi_nand_data *this)
+int gpmi_send_data(struct gpmi_nand_data *this, const void *buf, int len)
 {
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
@@ -606,7 +606,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_CS(chip, this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(this->upper_len);
+		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
 	desc = dmaengine_prep_slave_sg(channel, (struct scatterlist *)pio,
 					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
@@ -614,7 +614,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] send DMA request */
-	prepare_data_dma(this, DMA_TO_DEVICE);
+	prepare_data_dma(this, buf, len, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_MEM_TO_DEV,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -629,7 +629,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 	return ret;
 }
 
-int gpmi_read_data(struct gpmi_nand_data *this)
+int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 {
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
@@ -643,7 +643,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_CS(chip, this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
-		| BF_GPMI_CTRL0_XFER_COUNT(this->upper_len);
+		| BF_GPMI_CTRL0_XFER_COUNT(len);
 	pio[1] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
@@ -652,7 +652,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] : send DMA request */
-	prepare_data_dma(this, DMA_FROM_DEVICE);
+	prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -665,7 +665,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 
 	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
 	if (this->direct_dma_map_ok == false)
-		memcpy(this->upper_buf, this->data_buffer_dma, this->upper_len);
+		memcpy(buf, this->data_buffer_dma, len);
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 864fda1901a6..5fa9cd4fac4a 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
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
 
@@ -919,10 +919,8 @@ static void gpmi_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
-	this->upper_buf	= buf;
-	this->upper_len	= len;
 
-	gpmi_read_data(this);
+	gpmi_read_data(this, buf, len);
 }
 
 static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
@@ -931,10 +929,8 @@ static void gpmi_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
 	dev_dbg(this->dev, "len is %d\n", len);
-	this->upper_buf	= (uint8_t *)buf;
-	this->upper_len	= len;
 
-	gpmi_send_data(this);
+	gpmi_send_data(this, buf, len);
 }
 
 static uint8_t gpmi_read_byte(struct mtd_info *mtd)
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 2397010a8963..fba72ad28263 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -141,10 +141,6 @@ struct gpmi_nand_data {
 	int			current_chip;
 	unsigned int		command_length;
 
-	/* passed from upper layer */
-	uint8_t			*upper_buf;
-	int			upper_len;
-
 	/* for DMA operations */
 	bool			direct_dma_map_ok;
 
@@ -178,7 +174,7 @@ struct gpmi_nand_data {
 /* Common Services */
 int common_nfc_set_geometry(struct gpmi_nand_data *);
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
-void prepare_data_dma(struct gpmi_nand_data *,
+void prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
 		      enum dma_data_direction dr);
 int start_dma_without_bch_irq(struct gpmi_nand_data *,
 			      struct dma_async_tx_descriptor *);
@@ -197,8 +193,9 @@ int gpmi_disable_clk(struct gpmi_nand_data *this);
 int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
 			      const struct nand_data_interface *conf);
 void gpmi_nfc_apply_timings(struct gpmi_nand_data *this);
-int gpmi_read_data(struct gpmi_nand_data *);
-int gpmi_send_data(struct gpmi_nand_data *);
+int gpmi_read_data(struct gpmi_nand_data *, void *buf, int len);
+int gpmi_send_data(struct gpmi_nand_data *, const void *buf, int len);
+
 int gpmi_send_page(struct gpmi_nand_data *,
 		   dma_addr_t payload, dma_addr_t auxiliary);
 int gpmi_read_page(struct gpmi_nand_data *,
-- 
2.14.1
