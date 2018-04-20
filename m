Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RMs-0007Vr-4l
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:08 +0000
Received: by mail-wr0-x242.google.com with SMTP id p18-v6so1480314wrm.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:25:55 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH 01/18] mtd: nand: gpmi: drop dma_ops_type
Date: Fri, 20 Apr 2018 10:19:29 +0200
Message-Id: <20180420081946.16088-2-sam.lefebvre@essensium.com>
In-Reply-To: <20180420081946.16088-1-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

The GPMI nand driver puts dma_ops_type in its private data struct. Based
on the ops type the DMA callback handler unmaps previously mapped
buffers. Instead of unmapping the buffers in the DMA callback handler,
do this in the caller directly which waits for the DMA transfer to
finish. This makes the whole dma_ops_type mechanism unnecessary.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: also unmap the cmd_sgl, don't unmap in gpmi_read_page() (it's done
    in the bch interrupt handler). Sascha, in the future better test
    with CONFIG_DMA_API_DEBUG :-)
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 36 +++++++++++++++++-------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 31 ++-----------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h | 11 ---------
 3 files changed, 23 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index e94556705dc7..d479358758a0 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -544,19 +544,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
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
 	struct dma_async_tx_descriptor *desc;
 	struct scatterlist *sgl;
 	int chip = this->current_chip;
+	int ret;
 	u32 pio[3];
 
 	/* [1] send out the PIO words */
@@ -586,8 +580,11 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [3] submit the DMA */
-	set_dma_type(this, DMA_FOR_COMMAND);
-	return start_dma_without_bch_irq(this, desc);
+	ret = start_dma_without_bch_irq(this, desc);
+
+	dma_unmap_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
+
+	return ret;
 }
 
 int gpmi_send_data(struct gpmi_nand_data *this)
@@ -595,6 +592,7 @@ int gpmi_send_data(struct gpmi_nand_data *this)
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
 	int chip = this->current_chip;
+	int ret;
 	uint32_t command_mode;
 	uint32_t address;
 	u32 pio[2];
@@ -624,8 +622,11 @@ int gpmi_send_data(struct gpmi_nand_data *this)
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
@@ -633,6 +634,7 @@ int gpmi_read_data(struct gpmi_nand_data *this)
 	struct dma_async_tx_descriptor *desc;
 	struct dma_chan *channel = get_dma_chan(this);
 	int chip = this->current_chip;
+	int ret;
 	u32 pio[2];
 
 	/* [1] : send PIO */
@@ -658,8 +660,14 @@ int gpmi_read_data(struct gpmi_nand_data *this)
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
@@ -703,7 +711,6 @@ int gpmi_send_page(struct gpmi_nand_data *this,
 	if (!desc)
 		return -EINVAL;
 
-	set_dma_type(this, DMA_FOR_WRITE_ECC_PAGE);
 	return start_dma_with_bch_irq(this, desc);
 }
 
@@ -785,7 +792,6 @@ int gpmi_read_page(struct gpmi_nand_data *this,
 		return -EINVAL;
 
 	/* [4] submit the DMA */
-	set_dma_type(this, DMA_FOR_READ_ECC_PAGE);
 	return start_dma_with_bch_irq(this, desc);
 }
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c2597c8107a0..864fda1901a6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
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
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 62fde59b995f..2397010a8963 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
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
 enum gpmi_type {
 	IS_MX23,
 	IS_MX28,
@@ -178,8 +169,6 @@ struct gpmi_nand_data {
 	/* DMA channels */
 #define DMA_CHANS		8
 	struct dma_chan		*dma_chans[DMA_CHANS];
-	enum dma_ops_type	last_dma_type;
-	enum dma_ops_type	dma_type;
 	struct completion	dma_done;
 
 	/* private */
-- 
2.14.1
