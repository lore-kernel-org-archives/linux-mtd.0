Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RMx-0007Yq-1m
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:14 +0000
Received: by mail-wr0-x243.google.com with SMTP id d1-v6so20638434wrj.13
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:00 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH 04/18] mtd: nand: gpmi: remove direct_dma_map_ok from driver
 data struct
Date: Fri, 20 Apr 2018 10:19:32 +0200
Message-Id: <20180420081946.16088-5-sam.lefebvre@essensium.com>
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

Instead of putting direct_dma_map_ok into driver struct pass it around
between functions to make the code more readable.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: rebased
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  5 +++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 15 +++++++--------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  5 +----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 447961b798b4..39834bedf460 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -636,6 +636,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	int chip = this->current_chip;
 	int ret;
 	u32 pio[2];
+	bool direct;
 
 	/* [1] : send PIO */
 	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__READ)
@@ -652,7 +653,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 		return -EINVAL;
 
 	/* [2] : send DMA request */
-	prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
+	direct = prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
 					1, DMA_DEV_TO_MEM,
 					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -664,7 +665,7 @@ int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
 	ret = start_dma_without_bch_irq(this, desc);
 
 	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
-	if (this->direct_dma_map_ok == false)
+	if (!direct)
 		memcpy(buf, this->data_buffer_dma, len);
 
 	return ret;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 774ac98fbdb2..9ecba7ea0cd5 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
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
@@ -956,12 +955,12 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
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
@@ -971,7 +970,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		if (!dma_mapping_error(this->dev, dest_phys)) {
 			payload_virt = buf;
 			payload_phys = dest_phys;
-			this->direct_dma_map_ok = true;
+			direct = true;
 		}
 	}
 
@@ -981,7 +980,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	/* go! */
 	ret = gpmi_read_page(this, payload_phys, auxiliary_phys);
 
-	if (this->direct_dma_map_ok)
+	if (direct)
 		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
 				 DMA_FROM_DEVICE);
 
@@ -993,7 +992,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	/* Loop over status bytes, accumulating ECC status. */
 	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
-	if (!this->direct_dma_map_ok)
+	if (!direct)
 		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
 
 	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index fba72ad28263..6aa10d6962d6 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -141,9 +141,6 @@ struct gpmi_nand_data {
 	int			current_chip;
 	unsigned int		command_length;
 
-	/* for DMA operations */
-	bool			direct_dma_map_ok;
-
 	struct scatterlist	cmd_sgl;
 	char			*cmd_buffer;
 
@@ -174,7 +171,7 @@ struct gpmi_nand_data {
 /* Common Services */
 int common_nfc_set_geometry(struct gpmi_nand_data *);
 struct dma_chan *get_dma_chan(struct gpmi_nand_data *);
-void prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
+bool prepare_data_dma(struct gpmi_nand_data *, const void *buf, int len,
 		      enum dma_data_direction dr);
 int start_dma_without_bch_irq(struct gpmi_nand_data *,
 			      struct dma_async_tx_descriptor *);
-- 
2.14.1
