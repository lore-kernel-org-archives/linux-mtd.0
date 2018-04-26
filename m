Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj2P-0005lM-0S
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:26 +0000
Received: by mail-wr0-x243.google.com with SMTP id v5-v6so6503064wrf.9
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:42:14 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>
Subject: [PATCH 12/13] mtd: rawnand: gpmi: issue two commands in a single DMA
 chain
Date: Thu, 26 Apr 2018 17:41:33 +0200
Message-Id: <20180426154134.8270-13-sam.lefebvre@essensium.com>
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

gpmi_nand_command() may issue two commands. Instead of issuing them as
separate DMAs, chain them together and issue only a single DMA.

This removes one DMA interrupt and associated overhead. For full-page
reads with ECC, it reduces the number of interrupts from 4 per page to
3 per page (2 DMA interrupts + 1 BCH interrupt).

Signed-off-by: Sam Lefebvre <sam.lefebvre@essensium.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  | 12 +++++++-----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  8 +++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  2 +-
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
index 46b2208df30e..8f5a2a242228 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
@@ -549,12 +549,12 @@ int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
 }
 
 int gpmi_send_command(struct gpmi_nand_data *this, struct scatterlist *sgl,
-		      unsigned int command_length)
+		      unsigned int command_length, bool chain, bool start_dma)
 {
 	struct dma_chan *channel = get_dma_chan(this);
 	struct dma_async_tx_descriptor *desc;
 	int chip = this->current_chip;
-	int ret;
+	int ret = 0;
 	u32 pio[3];
 
 	/* [1] send out the PIO words */
@@ -568,7 +568,8 @@ int gpmi_send_command(struct gpmi_nand_data *this, struct scatterlist *sgl,
 	pio[1] = pio[2] = 0;
 	desc = dmaengine_prep_slave_sg(channel,
 					(struct scatterlist *)pio,
-					ARRAY_SIZE(pio), DMA_TRANS_NONE, 0);
+					ARRAY_SIZE(pio), DMA_TRANS_NONE,
+					chain ? DMA_PREP_INTERRUPT : 0);
 	if (!desc)
 		return -EINVAL;
 
@@ -579,8 +580,9 @@ int gpmi_send_command(struct gpmi_nand_data *this, struct scatterlist *sgl,
 	if (!desc)
 		return -EINVAL;
 
-	/* [3] submit the DMA */
-	ret = start_dma_without_bch_irq(this, desc);
+	if (start_dma)
+		/* [3] submit the DMA */
+		ret = start_dma_without_bch_irq(this, desc);
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 81accbf175bf..49599d6dd841 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1163,11 +1163,12 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 			break;
 		}
 
-	/* This starts the DMA for the command and waits for it to finish. */
+	/* Chain the two commands, start the DMA and wait for it to finish. */
 	if (this->command_length > 0) {
 		sg_init_one(&this->cmd_sgl, this->cmd_buffer, this->command_length);
 		dma_map_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
-		ret = gpmi_send_command(this, &this->cmd_sgl, this->command_length);
+		ret = gpmi_send_command(this, &this->cmd_sgl, this->command_length,
+					false, this->command_length2 == 0);
 		if (ret)
 			dev_err(this->dev, "Chip: %u, Error %d\n",
 				this->current_chip, ret);
@@ -1176,7 +1177,8 @@ static void gpmi_nand_command(struct mtd_info *mtd, unsigned int command,
 	if (this->command_length2 > 0) {
 		sg_init_one(&this->cmd_sgl2, this->cmd_buffer + 64, this->command_length2);
 		dma_map_sg(this->dev, &this->cmd_sgl2, 1, DMA_TO_DEVICE);
-		ret = gpmi_send_command(this, &this->cmd_sgl2, this->command_length2);
+		ret = gpmi_send_command(this, &this->cmd_sgl2, this->command_length2,
+					this->command_length > 0, true);
 		if (ret)
 			dev_err(this->dev, "Chip: %u, Error %d\n",
 				this->current_chip, ret);
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 9dc3dd16fa0b..a09ec300754f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -189,7 +189,7 @@ void gpmi_dump_info(struct gpmi_nand_data *);
 int bch_set_geometry(struct gpmi_nand_data *);
 int gpmi_is_ready(struct gpmi_nand_data *, unsigned chip);
 int gpmi_send_command(struct gpmi_nand_data *, struct scatterlist *sgl,
-		      unsigned int command_length);
+		      unsigned int command_length, bool chain, bool start_dma);
 int gpmi_enable_clk(struct gpmi_nand_data *this);
 int gpmi_disable_clk(struct gpmi_nand_data *this);
 int gpmi_setup_data_interface(struct mtd_info *mtd, int chipnr,
-- 
2.14.1
