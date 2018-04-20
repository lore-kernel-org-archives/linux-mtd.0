Received: from mail-wr0-f196.google.com ([209.85.128.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RNK-0007qi-FU
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:26:51 +0000
Received: by mail-wr0-f196.google.com with SMTP id w3-v6so20659505wrg.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:26:24 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>, Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH 17/18] mtd: rawnand: gpmi: gpmi_nand_command(): use separate
 sgl for the two commands
Date: Fri, 20 Apr 2018 10:19:45 +0200
Message-Id: <20180420081946.16088-18-sam.lefebvre@essensium.com>
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

To enable chaining the two DMAs corresponding to the two commands that
can be issued by gpmi_nand_command(), duplicate the cmd_sgl and
command_length. For cmd_buffer, instead of duplicating it, we can use
a fixed offset within the buffer.

The appropriate sgl and command_length is passed to gpmi_send_command(),
and the sg_init_one(), dma_map_sg() and dma_unmap_sg() calls are hoisted
out of it. This is needed because the unmapping should only be done
after both commands have finished.

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 12 ++----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 68 +++++++++++++++++-------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  9 +++-
 3 files changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 1858afdb400d..46b2208df30e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -548,11 +548,11 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 	return reg & mask;
 }
 
-int gpmi_send_command(struct gpmi_nand_data *this)
+int gpmi_send_command(struct gpmi_nand_data *this, struct scatterlist *sgl,
+		      unsigned int command_length)
 {
 	struct dma_chan *channel = get_dma_chan(this);
 	struct dma_async_tx_descriptor *desc;
-	struct scatterlist *sgl;
 	int chip = this->current_chip;
 	int ret;
 	u32 pio[3];
@@ -564,7 +564,7 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
 		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_CLE)
 		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
-		| BF_GPMI_CTRL0_XFER_COUNT(this->command_length);
+		| BF_GPMI_CTRL0_XFER_COUNT(command_length);
 	pio[1] = pio[2] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
@@ -573,10 +573,6 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 		return -EINVAL;
 
 	/* [2] send out the COMMAND + ADDRESS string stored in @buffer */
-	sgl = &this->cmd_sgl;
-
-	sg_init_one(sgl, this->cmd_buffer, this->command_length);
-	dma_map_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
 	desc = dmaengine_prep_slave_sg(channel,
 				sgl, 1, DMA_MEM_TO_DEV,
 				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -586,8 +582,6 @@ int gpmi_send_command(struct gpmi_nand_data *this)
 	/* [3] submit the DMA */
 	ret = start_dma_without_bch_irq(this, desc);
 
-	dma_unmap_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
-
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 97d44fe212c9..4455ea428255 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1075,6 +1075,9 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 	/* Large page devices (> 512 bytes) behave slightly differently. */
 	bool is_lp = mtd->writesize > 512;
 
+	BUG_ON(this->command_length != 0);
+	BUG_ON(this->command_length2 != 0);
+
 	if (is_lp) {
 		/* Large page devices don't have the separate regions as we
 		 * have in the small page devices. We must emulate
@@ -1125,47 +1128,54 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			this->cmd_buffer[this->command_length++] = page_addr >> 16;
 	}
 
+	/* Reuse the same cmd_buffer for the possible second command. The address
+	 * must be word-aligned. For convenience, use a fixed offset of 64, much
+	 * larger than the maximum command_length. */
+	if (is_lp)
+		switch (command) {
+		case NAND_CMD_RNDOUT:
+			/* No ready / busy check necessary */
+			this->cmd_buffer[64 + this->command_length2++] = NAND_CMD_RNDOUTSTART;
+			break;
+
+		case NAND_CMD_READ0:
+			/*
+			 * READ0 is sometimes used to exit GET STATUS mode. When this
+			 * is the case no address cycles are requested, and we can use
+			 * this information to detect that that we should not wait for
+			 * the device to be ready and READSTART should not be issued.
+			 */
+			if (column != -1 || page_addr != -1)
+				this->cmd_buffer[64 + this->command_length2++] = NAND_CMD_READSTART;
+			break;
+		}
+
 	/* This starts the DMA for the command and waits for it to finish. */
 	if (this->command_length > 0) {
-		ret = gpmi_send_command(this);
+		sg_init_one(&this->cmd_sgl, this->cmd_buffer, this->command_length);
+		dma_map_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
+		ret = gpmi_send_command(this, &this->cmd_sgl, this->command_length);
 		if (ret)
 			dev_err(this->dev, "Chip: %u, Error %d\n",
 				this->current_chip, ret);
-
-		this->command_length = 0;
 	}
 
-	if (!is_lp)
-		return;
-
-	switch (command) {
-	case NAND_CMD_RNDOUT:
-		/* No ready / busy check necessary */
-		this->cmd_buffer[this->command_length++] = NAND_CMD_RNDOUTSTART;
-		ret = gpmi_send_command(this);
+	if (this->command_length2 > 0) {
+		sg_init_one(&this->cmd_sgl2, this->cmd_buffer + 64, this->command_length2);
+		dma_map_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
+		ret = gpmi_send_command(this, &this->cmd_sgl2, this->command_length2);
 		if (ret)
 			dev_err(this->dev, "Chip: %u, Error %d\n",
 				this->current_chip, ret);
-		this->command_length = 0;
-		break;
-
-	case NAND_CMD_READ0:
-		/*
-		 * READ0 is sometimes used to exit GET STATUS mode. When this
-		 * is the case no address cycles are requested, and we can use
-		 * this information to detect that that we should not wait for
-		 * the device to be ready and READSTART should not be issued.
-		 */
-		if (column == -1 && page_addr == -1)
-			return;
+	}
 
-		this->cmd_buffer[this->command_length++] = NAND_CMD_READSTART;
-		ret = gpmi_send_command(this);
-		if (ret)
-			dev_err(this->dev, "Chip: %u, Error %d\n",
-				this->current_chip, ret);
+	if (this->command_length > 0) {
+		dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
 		this->command_length = 0;
-		break;
+	}
+	if (this->command_length2 > 0) {
+		dma_unmap_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
+		this->command_length2 = 0;
 	}
 }
 
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 6aa10d6962d6..9dc3dd16fa0b 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -139,11 +139,15 @@ struct gpmi_nand_data {
 
 	/* General-use Variables */
 	int			current_chip;
-	unsigned int		command_length;
 
+	unsigned int		command_length;
 	struct scatterlist	cmd_sgl;
 	char			*cmd_buffer;
 
+	unsigned int		command_length2;
+	struct scatterlist	cmd_sgl2;
+	char			*cmd_buffer2;
+
 	struct scatterlist	data_sgl;
 	char			*data_buffer_dma;
 
@@ -184,7 +188,8 @@ void gpmi_clear_bch(struct gpmi_nand_data *);
 void gpmi_dump_info(struct gpmi_nand_data *);
 int bch_set_geometry(struct gpmi_nand_data *);
 int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
-int gpmi_send_command(struct gpmi_nand_data *);
+int gpmi_send_command(struct gpmi_nand_data *, struct scatterlist *sgl,
+		      unsigned int command_length);
 int gpmi_enable_clk(struct gpmi_nand_data *this);
 int gpmi_disable_clk(struct gpmi_nand_data *this);
 int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
-- 
2.14.1
