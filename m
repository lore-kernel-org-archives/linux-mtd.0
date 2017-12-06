From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 03/10] mtd: nand: gpmi: drop dma_ops_type
Date: Wed,  6 Dec 2017 10:19:18 +0100
Message-Id: <20171206091925.5810-4-s.hauer@pengutronix.de>
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

The GPMI nand driver puts dma_ops_type in its private data struct. Based
on the ops type the DMA callback handler unmaps previously mapped
buffers. Instead of unmapping the buffers in the DMA callback handler,
do this in the caller directly which waits for the DMA transfer to
finish. This makes the whole dma_ops_type mechanism unnecessary.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 37 ++++++++++++++++++++--------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 31 ++--------------------------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 11 ----------
 3 files changed, 24 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 97787246af41..f29349d1cb7a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -1111,13 +1111,6 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	return reg & mask;
 }
 
-static inline void set_dma_type(struct gpmi_nand_data *this,
-					enum dma_ops_type type)
-{
-	this->last_dma_type = this->dma_type;
-	this->dma_type = type;
-}
-
 int gpmi_send_command(struct gpmi_nand_data *this)
 {
 	struct dma_chan *channel = get_dma_chan(this);
@@ -1153,7 +1146,6 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [3] submit the DMA */
-	set_dma_type(this, DMA_FOR_COMMAND);
 	return start_dma_without_bch_irq(this, desc);
 }
 
@@ -1162,6 +1154,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
 	int chip = this->current_chip;
+	int ret;
 	uint32_t command_mode;
 	uint32_t address;
 	u32 pio[2];
@@ -1191,8 +1184,11 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [3] submit the DMA */
-	set_dma_type(this, DMA_FOR_WRITE_DATA);
-	return start_dma_without_bch_irq(this, desc);
+	ret = start_dma_without_bch_irq(this, desc);
+
+	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_TO_DEVICE);
+
+	return ret;
 }
 
 int gpmi_read_data(struct gpmi_nand_data *this)
@@ -1200,6 +1196,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
 	int chip = this->current_chip;
+	int ret;
 	u32 pio[2];
 
 	/* [1] : send PIO */
@@ -1225,8 +1222,14 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [3] : submit the DMA */
-	set_dma_type(this, DMA_FOR_READ_DATA);
-	return start_dma_without_bch_irq(this, desc);
+
+	ret = start_dma_without_bch_irq(this, desc);
+
+	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
+	if (this->direct_dma_map_ok == false)
+		memcpy(this->upper_buf, this->data_buffer_dma, this->upper_len);
+
+	return ret;
 }
 
 int gpmi_send_page(struct gpmi_nand_data *this,
@@ -1270,7 +1273,6 @@ int gpmi_send_page(struct gpmi_nand_data *this,
 	if (!desc)
 		return -EINVAL;
 
-	set_dma_type(this, DMA_FOR_WRITE_ECC_PAGE);
 	return start_dma_with_bch_irq(this, desc);
 }
 
@@ -1285,6 +1287,7 @@ int gpmi_read_page(struct gpmi_nand_data *this,
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
 	int chip = this->current_chip;
+	int ret;
 	u32 pio[6];
 
 	/* [1] Wait for the chip to report ready. */
@@ -1352,8 +1355,12 @@ int gpmi_read_page(struct gpmi_nand_data *this,
 		return -EINVAL;
 
 	/* [4] submit the DMA */
-	set_dma_type(this, DMA_FOR_READ_ECC_PAGE);
-	return start_dma_with_bch_irq(this, desc);
+
+	ret = start_dma_with_bch_irq(this, desc);
+
+	dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 09e8ded3f1e2..da1090474b11 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -472,31 +472,6 @@ static void dma_irq_callback(void *param)
 	struct gpmi_nand_data *this = param;
 	struct completion *dma_c = &this->dma_done;
 
-	switch (this->dma_type) {
-	case DMA_FOR_COMMAND:
-		dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
-		break;
-
-	case DMA_FOR_READ_DATA:
-		dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
-		if (this->direct_dma_map_ok == false)
-			memcpy(this->upper_buf, this->data_buffer_dma,
-				this->upper_len);
-		break;
-
-	case DMA_FOR_WRITE_DATA:
-		dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_TO_DEVICE);
-		break;
-
-	case DMA_FOR_READ_ECC_PAGE:
-	case DMA_FOR_WRITE_ECC_PAGE:
-		/* We have to wait the BCH interrupt to finish. */
-		break;
-
-	default:
-		dev_err(this->dev, "in wrong DMA operation.\n");
-	}
-
 	complete(dma_c);
 }
 
@@ -516,8 +491,7 @@ int start_dma_without_bch_irq(struct gpmi_nand_data *this,
 	/* Wait for the interrupt from the DMA block. */
 	timeout = wait_for_completion_timeout(dma_c, msecs_to_jiffies(1000));
 	if (!timeout) {
-		dev_err(this->dev, "DMA timeout, last DMA :%d\n",
-			this->last_dma_type);
+		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
 		return -ETIMEDOUT;
 	}
@@ -546,8 +520,7 @@ int start_dma_with_bch_irq(struct gpmi_nand_data *this,
 	/* Wait for the interrupt from the BCH block. */
 	timeout = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));
 	if (!timeout) {
-		dev_err(this->dev, "BCH timeout, last DMA :%d\n",
-			this->last_dma_type);
+		dev_err(this->dev, "BCH timeout\n");
 		gpmi_dump_info(this);
 		return -ETIMEDOUT;
 	}
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a45e4ce13d10..602e47ce4e88 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -77,15 +77,6 @@ struct boot_rom_geometry {
 	unsigned int  search_area_stride_exponent;
 };
 
-/* DMA operations types */
-enum dma_ops_type {
-	DMA_FOR_COMMAND = 1,
-	DMA_FOR_READ_DATA,
-	DMA_FOR_WRITE_DATA,
-	DMA_FOR_READ_ECC_PAGE,
-	DMA_FOR_WRITE_ECC_PAGE
-};
-
 /**
  * struct nand_timing - Fundamental timing attributes for NAND.
  * @data_setup_in_ns:         The data setup time, in nanoseconds. Usually the
@@ -196,8 +187,6 @@ struct gpmi_nand_data {
 	/* DMA channels */
 #define DMA_CHANS		8
 	struct dma_chan		*dma_chans[DMA_CHANS];
-	enum dma_ops_type	last_dma_type;
-	enum dma_ops_type	dma_type;
 	struct completion	dma_done;
 
 	/* private */
-- 
2.11.0
