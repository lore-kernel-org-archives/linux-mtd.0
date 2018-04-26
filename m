Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj2O-0005mD-Vu
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:28 +0000
Received: by mail-wr0-x243.google.com with SMTP id p18-v6so38068972wrm.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:16 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>
Subject: [PATCH 13/13] mtd: rawnand: gmpi: chain gpmi_nand_command() with
 gpmi_ecc_read_page_data()
Date: Thu, 26 Apr 2018 17:41:34 +0200
Message-Id: <20180426154134.8270-14-sam.lefebvre@essensium.com>
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

An additional interrupt can be avoided in the page and subpage
read operations by adding a flag start_dma to indicate weather
gpmi_nand_command() needs to be chained with other dma commands
or not.

In case of chaining, gpmi_read_page() gets a flag that adds:
DMA_PREP_INTERRUPT: chain the dma with previous one
DMA_PREP_PQ_DISABLE_P: wait for prefetching being ready
before reading, turns on the CCW_WAIT4RDY flag.

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
---
 drivers/dma/mxs-dma.c                      |  3 +++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  6 ++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 12 ++++++++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  3 ++-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 41d167921fab..cb13fc759f97 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -82,6 +82,7 @@
 #define CCW_CHAIN		(1 << 2)
 #define CCW_IRQ			(1 << 3)
 #define CCW_DEC_SEM		(1 << 6)
+#define CCW_WAIT4RDY		(1 << 5)
 #define CCW_WAIT4END		(1 << 7)
 #define CCW_HALT_ON_TERM	(1 << 8)
 #define CCW_TERM_FLUSH		(1 << 9)
@@ -551,6 +552,8 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 		ccw->bits |= CCW_TERM_FLUSH;
 		ccw->bits |= BF_CCW(sg_len, PIO_NUM);
 		ccw->bits |= BF_CCW(MXS_DMA_CMD_NO_XFER, COMMAND);
+		if (flags & DMA_PREP_PQ_DISABLE_P)
+			ccw->bits |= CCW_WAIT4RDY;
 	} else {
 		for_each_sg(sgl, sg, sg_len, i) {
 			if (sg_dma_len(sg) > MAX_XFER_BYTES) {
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 8f5a2a242228..a8d09214b44c 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -716,7 +716,8 @@ int gpmi_send_page(struct gpmi_nand_data *this,
 }
 
 int gpmi_read_page(struct gpmi_nand_data *this,
-				dma_addr_t payload, dma_addr_t auxiliary)
+				dma_addr_t payload, dma_addr_t auxiliary,
+				bool chain)
 {
 	struct bch_geometry *geo = &this->bch_geometry;
 	uint32_t command_mode;
@@ -741,7 +742,8 @@ int gpmi_read_page(struct gpmi_nand_data *this,
 	pio[1] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 				(struct scatterlist *)pio, 2,
-				DMA_TRANS_NONE, 0);
+				DMA_TRANS_NONE,
+				chain ? DMA_PREP_INTERRUPT | DMA_PREP_PQ_DISABLE_P : 0);
 	if (!desc)
 		return -EINVAL;
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 49599d6dd841..80cc85755582 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -952,7 +952,7 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	}
 
 	/* go! */
-	ret = gpmi_read_page(this, payload_phys, this->auxiliary_phys);
+	ret = gpmi_read_page(this, payload_phys, this->auxiliary_phys, true);
 
 	if (direct)
 		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
@@ -1178,12 +1178,14 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 		sg_init_one(&this->cmd_sgl2, this->cmd_buffer + 64, this->command_length2);
 		dma_map_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
 		ret = gpmi_send_command(this, &this->cmd_sgl2, this->command_length2,
-					this->command_length > 0, true);
+					this->command_length > 0, this->start_dma);
 		if (ret)
 			dev_err(this->dev, "Chip: %u, Error %d\n",
 				this->current_chip, ret);
 	}
 
+	this->start_dma = 1;
+
 	if (this->command_length > 0) {
 		dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
 		this->command_length = 0;
@@ -1198,6 +1200,8 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf, int oob_required, int page)
 {
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	this->start_dma = 0;
 	nand_read_page_op(chip, page, 0, NULL, 0);
 
 	return gpmi_ecc_read_page_data(chip, buf, oob_required, page);
@@ -1251,6 +1255,7 @@ static int gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		buf = buf + first * size;
 	}
 
+	this->start_dma = 0;
 	nand_read_page_op(chip, page, col, NULL, 0);
 
 	/* Save the old environment */
@@ -1993,6 +1998,9 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* init current chip */
 	this->current_chip	= -1;
 
+	/* init dma */
+	this->start_dma = true;
+
 	/* init the MTD data structures */
 	mtd->name		= "gpmi-nand";
 	mtd->dev.parent		= this->dev;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index a09ec300754f..c4a6e100c07f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -167,6 +167,7 @@ struct gpmi_nand_data {
 #define DMA_CHANS		8
 	struct dma_chan		*dma_chans[DMA_CHANS];
 	struct completion	dma_done;
+	bool start_dma;
 
 	/* private */
 	void			*private;
@@ -201,7 +202,7 @@ int gpmi_send_data(struct gpmi_nand_data *, const void *buf, int len);
 int gpmi_send_page(struct gpmi_nand_data *,
 		   dma_addr_t payload, dma_addr_t auxiliary);
 int gpmi_read_page(struct gpmi_nand_data *,
-		   dma_addr_t payload, dma_addr_t auxiliary);
+		   dma_addr_t payload, dma_addr_t auxiliary, bool chain);
 
 void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 		    const u8 *src, size_t src_bit_off,
-- 
2.14.1
