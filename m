Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AC1C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E0C2173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtDH3AfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E0C2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjsOCaW0kt5FD/PVh+OpqzUymCRiGfbjMId8FxOg+Fg=; b=RtDH3AfLMH3dQt
	Gru7GNhiq+8zEyfzJ/3wbtovzYsCp7Lc7LKRlrnLp4E3hl+0AJNE0qkTijhkHisJdwPMdQgUpUx2A
	3ODkNMiLxU+y0pM9jMiqX3AB2BWu1lkbUWG5e5N3BgsxYGEkeNnsWb+sEufZ2J0G8jD8A3DjRyhxh
	8i8YkQvWPRRGX/kt03l7JARz+ecMg+vkkjsh4hJZuWsCdGj5NIzKl2Ndbtp7WGzRe0QdWcdwS0lQ5
	AVr5su9rA489zYj5GZV+BzxaYVfpenCmK1hJRC8nhAGgp9ORTMdSpESIJyMVVHYvNCW4CLmAOdsAf
	/XCRzFUsfty7A8qp1kfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSyrr-0003J6-Fy; Tue, 21 May 2019 07:07:23 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSyrJ-0002bE-MB
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:07:00 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hSyrH-0006cn-Hx; Tue, 21 May 2019 09:06:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hSyrG-0001bu-FE; Tue, 21 May 2019 09:06:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/14] mtd: rawnand: gpmi: Implement exec_op
Date: Tue, 21 May 2019 09:06:43 +0200
Message-Id: <20190521070643.6244-15-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521070643.6244-1-s.hauer@pengutronix.de>
References: <20190521070643.6244-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_000650_242276_A830CA8C 
X-CRM114-Status: GOOD (  25.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The gpmi driver performance suffers from NAND operations being split
in multiple small DMA transfers. This has been forced by the NAND layer
in the former days, but now with exec_op we can use the controller as
intended.

With this patch gpmi_nfc_exec_op becomes the main entry point to NAND
operations. Here all instructions are collected and chained as separate
DMA transfers. In the end whole chain is fired and waited to be
finished. gpmi_nfc_exec_op only does the hardware operations, bad block
marker swapping and buffer scrambling is done by the callers. It's worth
noting that the nand_*_op functions always take the buffer lengths for
the data that the NAND chip actually transfers. When doing BCH we have
to calculate the net data size from the raw data size in some places.

This patch has been tested with 2048/64 and 2048/128 byte NAND on
i.MX6q. mtd_oobtest, mtd_subpagetest and mtd_speedtest run without
errors. nandbiterrs, nandpagetest and nandsubpagetest userspace tests
from mtdutils run without errors and UBIFS can successfully be mounted.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/dma/mxs-dma.c                      |    3 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1099 ++++++++------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |   25 +-
 include/linux/dma/mxs-dma.h                |    1 +
 4 files changed, 436 insertions(+), 692 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index c622bee7eb12..20a9cb7cb6d3 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -78,6 +78,7 @@
 #define BM_CCW_COMMAND		(3 << 0)
 #define CCW_CHAIN		(1 << 2)
 #define CCW_IRQ			(1 << 3)
+#define CCW_WAIT4RDY		(1 << 5)
 #define CCW_DEC_SEM		(1 << 6)
 #define CCW_WAIT4END		(1 << 7)
 #define CCW_HALT_ON_TERM	(1 << 8)
@@ -547,6 +548,8 @@ static struct dma_async_tx_descriptor *mxs_dma_prep_slave_sg(
 		ccw->bits |= CCW_TERM_FLUSH;
 		ccw->bits |= BF_CCW(sg_len, PIO_NUM);
 		ccw->bits |= BF_CCW(MXS_DMA_CMD_NO_XFER, COMMAND);
+		if (flags & MXS_DMA_CTRL_WAIT4RDY)
+			ccw->bits |= CCW_WAIT4RDY;
 	} else {
 		for_each_sg(sgl, sg, sg_len, i) {
 			if (sg_dma_len(sg) > MAX_XFER_BYTES) {
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0ec55c7620e8..e0080dcd4fc0 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -528,26 +528,12 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 static int bch_set_geometry(struct gpmi_nand_data *this)
 {
 	struct resources *r = &this->resources;
-	struct bch_geometry *bch_geo = &this->bch_geometry;
-	unsigned int block_count;
-	unsigned int block_size;
-	unsigned int metadata_size;
-	unsigned int ecc_strength;
-	unsigned int page_size;
-	unsigned int gf_len;
 	int ret;
 
 	ret = common_nfc_set_geometry(this);
 	if (ret)
 		return ret;
 
-	block_count   = bch_geo->ecc_chunk_count - 1;
-	block_size    = bch_geo->ecc_chunk_size;
-	metadata_size = bch_geo->metadata_size;
-	ecc_strength  = bch_geo->ecc_strength >> 1;
-	page_size     = bch_geo->page_size;
-	gf_len        = bch_geo->gf_len;
-
 	ret = pm_runtime_get_sync(this->dev);
 	if (ret < 0)
 		return ret;
@@ -561,27 +547,9 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	/* Configure layout 0. */
-	writel(BF_BCH_FLASH0LAYOUT0_NBLOCKS(block_count)
-			| BF_BCH_FLASH0LAYOUT0_META_SIZE(metadata_size)
-			| BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this)
-			| BF_BCH_FLASH0LAYOUT0_GF(gf_len, this)
-			| BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block_size, this),
-			r->bch_regs + HW_BCH_FLASH0LAYOUT0);
-
-	writel(BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size)
-			| BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this)
-			| BF_BCH_FLASH0LAYOUT1_GF(gf_len, this)
-			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
-			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
-
 	/* Set *all* chip selects to use layout 0. */
 	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
-	/* Enable interrupts. */
-	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
-				r->bch_regs + HW_BCH_CTRL_SET);
-
 	ret = 0;
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
@@ -795,32 +763,6 @@ static void gpmi_clear_bch(struct gpmi_nand_data *this)
 	writel(BM_BCH_CTRL_COMPLETE_IRQ, r->bch_regs + HW_BCH_CTRL_CLR);
 }
 
-/* Returns the Ready/Busy status of the given chip. */
-static int gpmi_is_ready(struct gpmi_nand_data *this, unsigned chip)
-{
-	struct resources *r = &this->resources;
-	uint32_t mask = 0;
-	uint32_t reg = 0;
-
-	if (GPMI_IS_MX23(this)) {
-		mask = MX23_BM_GPMI_DEBUG_READY0 << chip;
-		reg = readl(r->gpmi_regs + HW_GPMI_DEBUG);
-	} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this)) {
-		/*
-		 * In the imx6, all the ready/busy pins are bound
-		 * together. So we only need to check chip 0.
-		 */
-		if (GPMI_IS_MX6(this))
-			chip = 0;
-
-		/* MX28 shares the same R/B register as MX6Q. */
-		mask = MX28_BF_GPMI_STAT_READY_BUSY(1 << chip);
-		reg = readl(r->gpmi_regs + HW_GPMI_STAT);
-	} else
-		dev_err(this->dev, "unknown arch.\n");
-	return reg & mask;
-}
-
 static struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
 {
 	/* We use the DMA channel 0 to access all the nand chips. */
@@ -836,29 +778,6 @@ static void dma_irq_callback(void *param)
 	complete(dma_c);
 }
 
-static int start_dma_without_bch_irq(struct gpmi_nand_data *this,
-				     struct dma_async_tx_descriptor *desc)
-{
-	struct completion *dma_c = &this->dma_done;
-	unsigned long timeout;
-
-	init_completion(dma_c);
-
-	desc->callback		= dma_irq_callback;
-	desc->callback_param	= this;
-	dmaengine_submit(desc);
-	dma_async_issue_pending(get_dma_chan(this));
-
-	/* Wait for the interrupt from the DMA block. */
-	timeout = wait_for_completion_timeout(dma_c, msecs_to_jiffies(1000));
-	if (!timeout) {
-		dev_err(this->dev, "DMA timeout, last DMA\n");
-		gpmi_dump_info(this);
-		return -ETIMEDOUT;
-	}
-	return 0;
-}
-
 static irqreturn_t bch_irq(int irq, void *cookie)
 {
 	struct gpmi_nand_data *this = cookie;
@@ -868,83 +787,25 @@ static irqreturn_t bch_irq(int irq, void *cookie)
 	return IRQ_HANDLED;
 }
 
-/*
- * This function is used in BCH reading or BCH writing pages.
- * It will wait for the BCH interrupt as long as ONE second.
- * Actually, we must wait for two interrupts :
- *	[1] firstly the DMA interrupt and
- *	[2] secondly the BCH interrupt.
- */
-static int start_dma_with_bch_irq(struct gpmi_nand_data *this,
-				  struct dma_async_tx_descriptor *desc)
+static int gpmi_raw_len_to_len(struct gpmi_nand_data *this, int raw_len)
 {
-	struct completion *bch_c = &this->bch_done;
-	unsigned long timeout;
-
-	/* Prepare to receive an interrupt from the BCH block. */
-	init_completion(bch_c);
-
-	/* start the DMA */
-	start_dma_without_bch_irq(this, desc);
-
-	/* Wait for the interrupt from the BCH block. */
-	timeout = wait_for_completion_timeout(bch_c, msecs_to_jiffies(1000));
-	if (!timeout) {
-		dev_err(this->dev, "BCH timeout\n");
-		gpmi_dump_info(this);
-		return -ETIMEDOUT;
-	}
-	return 0;
-}
-
-static int gpmi_send_command(struct gpmi_nand_data *this)
-{
-	struct dma_chan *channel = get_dma_chan(this);
-	struct dma_async_tx_descriptor *desc;
-	struct scatterlist *sgl;
-	int chip = this->current_chip;
-	int ret;
-	u32 pio[3];
-
-	/* [1] send out the PIO words */
-	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__WRITE)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_CLE)
-		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
-		| BF_GPMI_CTRL0_XFER_COUNT(this->command_length);
-	pio[1] = pio[2] = 0;
-	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* [2] send out the COMMAND + ADDRESS string stored in @buffer */
-	sgl = &this->cmd_sgl;
-
-	sg_init_one(sgl, this->cmd_buffer, this->command_length);
-	dma_map_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
-	desc = dmaengine_prep_slave_sg(channel,
-				sgl, 1, DMA_MEM_TO_DEV,
-				MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	/* [3] submit the DMA */
-	ret = start_dma_without_bch_irq(this, desc);
-
-	dma_unmap_sg(this->dev, sgl, 1, DMA_TO_DEVICE);
-
-	return ret;
+	/*
+	 * raw_len is the length to read/write including bch data which
+	 * we are passed in exec_op. Calculate the data length from it.
+	 */
+	if (this->bch)
+		return ALIGN_DOWN(raw_len, this->bch_geometry.ecc_chunk_size);
+	else
+		return raw_len;
 }
 
 /* Can we use the upper's buffer directly for DMA? */
 static bool prepare_data_dma(struct gpmi_nand_data *this, const void *buf,
-			     int len, enum dma_data_direction dr)
+			     int raw_len, struct scatterlist *sgl,
+			     enum dma_data_direction dr)
 {
-	struct scatterlist *sgl = &this->data_sgl;
 	int ret;
+	int len = gpmi_raw_len_to_len(this, raw_len);
 
 	/* first try to map the upper buffer directly */
 	if (virt_addr_valid(buf) && !object_is_on_stack(buf)) {
@@ -960,7 +821,7 @@ static bool prepare_data_dma(struct gpmi_nand_data *this, const void *buf,
 	/* We have to use our own DMA buffer. */
 	sg_init_one(sgl, this->data_buffer_dma, len);
 
-	if (dr == DMA_TO_DEVICE)
+	if (dr == DMA_TO_DEVICE && buf != this->data_buffer_dma)
 		memcpy(this->data_buffer_dma, buf, len);
 
 	dma_map_sg(this->dev, sgl, 1, dr);
@@ -968,208 +829,6 @@ static bool prepare_data_dma(struct gpmi_nand_data *this, const void *buf,
 	return false;
 }
 
-static int gpmi_send_data(struct gpmi_nand_data *this, const void *buf, int len)
-{
-	struct dma_async_tx_descriptor *desc;
-	struct dma_chan *channel = get_dma_chan(this);
-	int chip = this->current_chip;
-	int ret;
-	uint32_t command_mode;
-	uint32_t address;
-	u32 pio[2];
-
-	/* [1] PIO */
-	command_mode = BV_GPMI_CTRL0_COMMAND_MODE__WRITE;
-	address      = BV_GPMI_CTRL0_ADDRESS__NAND_DATA;
-
-	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(command_mode)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(len);
-	pio[1] = 0;
-	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* [2] send DMA request */
-	prepare_data_dma(this, buf, len, DMA_TO_DEVICE);
-	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_MEM_TO_DEV,
-					MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	/* [3] submit the DMA */
-	ret = start_dma_without_bch_irq(this, desc);
-
-	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_TO_DEVICE);
-
-	return ret;
-}
-
-static int gpmi_read_data(struct gpmi_nand_data *this, void *buf, int len)
-{
-	struct dma_async_tx_descriptor *desc;
-	struct dma_chan *channel = get_dma_chan(this);
-	int chip = this->current_chip;
-	int ret;
-	u32 pio[2];
-	bool direct;
-
-	/* [1] : send PIO */
-	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__READ)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
-		| BF_GPMI_CTRL0_XFER_COUNT(len);
-	pio[1] = 0;
-	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* [2] : send DMA request */
-	direct = prepare_data_dma(this, buf, len, DMA_FROM_DEVICE);
-	desc = dmaengine_prep_slave_sg(channel, &this->data_sgl,
-					1, DMA_DEV_TO_MEM,
-					MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	/* [3] : submit the DMA */
-
-	ret = start_dma_without_bch_irq(this, desc);
-
-	dma_unmap_sg(this->dev, &this->data_sgl, 1, DMA_FROM_DEVICE);
-	if (!direct)
-		memcpy(buf, this->data_buffer_dma, len);
-
-	return ret;
-}
-
-static int gpmi_send_page(struct gpmi_nand_data *this, dma_addr_t payload,
-			  dma_addr_t auxiliary)
-{
-	struct bch_geometry *geo = &this->bch_geometry;
-	uint32_t command_mode;
-	uint32_t address;
-	uint32_t ecc_command;
-	uint32_t buffer_mask;
-	struct dma_async_tx_descriptor *desc;
-	struct dma_chan *channel = get_dma_chan(this);
-	int chip = this->current_chip;
-	u32 pio[6];
-
-	/* A DMA descriptor that does an ECC page read. */
-	command_mode = BV_GPMI_CTRL0_COMMAND_MODE__WRITE;
-	address      = BV_GPMI_CTRL0_ADDRESS__NAND_DATA;
-	ecc_command  = BV_GPMI_ECCCTRL_ECC_CMD__BCH_ENCODE;
-	buffer_mask  = BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_PAGE |
-				BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_AUXONLY;
-
-	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(command_mode)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(0);
-	pio[1] = 0;
-	pio[2] = BM_GPMI_ECCCTRL_ENABLE_ECC
-		| BF_GPMI_ECCCTRL_ECC_CMD(ecc_command)
-		| BF_GPMI_ECCCTRL_BUFFER_MASK(buffer_mask);
-	pio[3] = geo->page_size;
-	pio[4] = payload;
-	pio[5] = auxiliary;
-
-	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE,
-				      MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	return start_dma_with_bch_irq(this, desc);
-}
-
-static int gpmi_read_page(struct gpmi_nand_data *this, dma_addr_t payload,
-			  dma_addr_t auxiliary)
-{
-	struct bch_geometry *geo = &this->bch_geometry;
-	uint32_t command_mode;
-	uint32_t address;
-	uint32_t ecc_command;
-	uint32_t buffer_mask;
-	struct dma_async_tx_descriptor *desc;
-	struct dma_chan *channel = get_dma_chan(this);
-	int chip = this->current_chip;
-	u32 pio[6];
-
-	/* [1] Wait for the chip to report ready. */
-	command_mode = BV_GPMI_CTRL0_COMMAND_MODE__WAIT_FOR_READY;
-	address      = BV_GPMI_CTRL0_ADDRESS__NAND_DATA;
-
-	pio[0] =  BF_GPMI_CTRL0_COMMAND_MODE(command_mode)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(0);
-	pio[1] = 0;
-	desc = mxs_dmaengine_prep_pio(channel, pio, 2, DMA_TRANS_NONE, 0);
-	if (!desc)
-		return -EINVAL;
-
-	/* [2] Enable the BCH block and read. */
-	command_mode = BV_GPMI_CTRL0_COMMAND_MODE__READ;
-	address      = BV_GPMI_CTRL0_ADDRESS__NAND_DATA;
-	ecc_command  = BV_GPMI_ECCCTRL_ECC_CMD__BCH_DECODE;
-	buffer_mask  = BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_PAGE
-			| BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_AUXONLY;
-
-	pio[0] =  BF_GPMI_CTRL0_COMMAND_MODE(command_mode)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(geo->page_size);
-
-	pio[1] = 0;
-	pio[2] =  BM_GPMI_ECCCTRL_ENABLE_ECC
-		| BF_GPMI_ECCCTRL_ECC_CMD(ecc_command)
-		| BF_GPMI_ECCCTRL_BUFFER_MASK(buffer_mask);
-	pio[3] = geo->page_size;
-	pio[4] = payload;
-	pio[5] = auxiliary;
-	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
-				      DMA_TRANS_NONE,
-				      MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	/* [3] Disable the BCH block */
-	command_mode = BV_GPMI_CTRL0_COMMAND_MODE__WAIT_FOR_READY;
-	address      = BV_GPMI_CTRL0_ADDRESS__NAND_DATA;
-
-	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(command_mode)
-		| BM_GPMI_CTRL0_WORD_LENGTH
-		| BF_GPMI_CTRL0_CS(chip, this)
-		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
-		| BF_GPMI_CTRL0_ADDRESS(address)
-		| BF_GPMI_CTRL0_XFER_COUNT(geo->page_size);
-	pio[1] = 0;
-	pio[2] = 0; /* clear GPMI_HW_GPMI_ECCCTRL, disable the BCH. */
-	desc = mxs_dmaengine_prep_pio(channel, pio, 3, DMA_TRANS_NONE,
-				      MXS_DMA_CTRL_WAIT4END);
-	if (!desc)
-		return -EINVAL;
-
-	/* [4] submit the DMA */
-	return start_dma_with_bch_irq(this, desc);
-}
-
 /**
  * gpmi_copy_bits - copy bits from one memory region to another
  * @dst: destination buffer
@@ -1568,67 +1227,20 @@ static void release_resources(struct gpmi_nand_data *this)
 	release_dma_channels(this);
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
+	struct bch_geometry *geo = &this->bch_geometry;
 
-	if (this->payload_virt && virt_addr_valid(this->payload_virt))
-		dma_free_coherent(dev, this->page_buffer_size,
-					this->payload_virt,
-					this->payload_phys);
-	kfree(this->cmd_buffer);
+	if (this->auxiliary_virt && virt_addr_valid(this->auxiliary_virt))
+		dma_free_coherent(dev, geo->auxiliary_size,
+					this->auxiliary_virt,
+					this->auxiliary_phys);
 	kfree(this->data_buffer_dma);
 	kfree(this->raw_buffer);
 
-	this->cmd_buffer	= NULL;
 	this->data_buffer_dma	= NULL;
 	this->raw_buffer	= NULL;
-	this->page_buffer_size	=  0;
 }
 
 /* Allocate the DMA buffers */
@@ -1638,11 +1250,6 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	struct device *dev = this->dev;
 	struct mtd_info *mtd = nand_to_mtd(&this->nand);
 
-	/* [1] Allocate a command buffer. PAGE_SIZE is enough. */
-	this->cmd_buffer = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
-	if (this->cmd_buffer == NULL)
-		goto error_alloc;
-
 	/*
 	 * [2] Allocate a read/write data buffer.
 	 *     The gpmi_alloc_dma_buffer can be called twice.
@@ -1656,27 +1263,15 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	if (this->data_buffer_dma == NULL)
 		goto error_alloc;
 
-	/*
-	 * [3] Allocate the page buffer.
-	 *
-	 * Both the payload buffer and the auxiliary buffer must appear on
-	 * 32-bit boundaries. We presume the size of the payload buffer is a
-	 * power of two and is much larger than four, which guarantees the
-	 * auxiliary buffer will appear on a 32-bit boundary.
-	 */
-	this->page_buffer_size = geo->payload_size + geo->auxiliary_size;
-	this->payload_virt = dma_alloc_coherent(dev, this->page_buffer_size,
-					&this->payload_phys, GFP_DMA);
-	if (!this->payload_virt)
+	this->auxiliary_virt = dma_alloc_coherent(dev, geo->auxiliary_size,
+					&this->auxiliary_phys, GFP_DMA);
+	if (!this->auxiliary_virt)
 		goto error_alloc;
 
-	this->raw_buffer = kzalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
+	this->raw_buffer = kzalloc((mtd->writesize ?: PAGE_SIZE) + mtd->oobsize, GFP_KERNEL);
 	if (!this->raw_buffer)
 		goto error_alloc;
 
-	/* Slice up the page buffer. */
-	this->auxiliary_virt = this->payload_virt + geo->payload_size;
-	this->auxiliary_phys = this->payload_phys + geo->payload_size;
 	return 0;
 
 error_alloc:
@@ -1684,105 +1279,6 @@ static int gpmi_alloc_dma_buffer(struct gpmi_nand_data *this)
 	return -ENOMEM;
 }
 
-static void gpmi_cmd_ctrl(struct nand_chip *chip, int data, unsigned int ctrl)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	int ret;
-
-	/*
-	 * Every operation begins with a command byte and a series of zero or
-	 * more address bytes. These are distinguished by either the Address
-	 * Latch Enable (ALE) or Command Latch Enable (CLE) signals being
-	 * asserted. When MTD is ready to execute the command, it will deassert
-	 * both latch enables.
-	 *
-	 * Rather than run a separate DMA operation for every single byte, we
-	 * queue them up and run a single DMA operation for the entire series
-	 * of command and data bytes. NAND_CMD_NONE means the END of the queue.
-	 */
-	if ((ctrl & (NAND_ALE | NAND_CLE))) {
-		if (data != NAND_CMD_NONE)
-			this->cmd_buffer[this->command_length++] = data;
-		return;
-	}
-
-	if (!this->command_length)
-		return;
-
-	ret = gpmi_send_command(this);
-	if (ret)
-		dev_err(this->dev, "Chip: %u, Error %d\n",
-			this->current_chip, ret);
-
-	this->command_length = 0;
-}
-
-static int gpmi_dev_ready(struct nand_chip *chip)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-
-	return gpmi_is_ready(this, this->current_chip);
-}
-
-static void gpmi_select_chip(struct nand_chip *chip, int chipnr)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	int ret;
-
-	/*
-	 * For power consumption matters, disable/enable the clock each time a
-	 * die is selected/unselected.
-	 */
-	if (this->current_chip < 0 && chipnr >= 0) {
-		ret = pm_runtime_get_sync(this->dev);
-		if (ret < 0)
-			dev_err(this->dev, "Failed to enable the clock\n");
-	} else if (this->current_chip >= 0 && chipnr < 0) {
-		pm_runtime_mark_last_busy(this->dev);
-		pm_runtime_put_autosuspend(this->dev);
-	}
-
-	/*
-	 * This driver currently supports only one NAND chip. Plus, dies share
-	 * the same configuration. So once timings have been applied on the
-	 * controller side, they will not change anymore. When the time will
-	 * come, the check on must_apply_timings will have to be dropped.
-	 */
-	if (chipnr >= 0 && this->hw.must_apply_timings) {
-		this->hw.must_apply_timings = false;
-		gpmi_nfc_apply_timings(this);
-	}
-
-	this->current_chip = chipnr;
-}
-
-static void gpmi_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-
-	dev_dbg(this->dev, "len is %d\n", len);
-
-	gpmi_read_data(this, buf, len);
-}
-
-static void gpmi_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-
-	dev_dbg(this->dev, "len is %d\n", len);
-
-	gpmi_send_data(this, buf, len);
-}
-
-static uint8_t gpmi_read_byte(struct nand_chip *chip)
-{
-	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	uint8_t *buf = this->data_buffer_dma;
-
-	gpmi_read_buf(chip, buf, 1);
-	return buf[0];
-}
-
 /*
  * Handles block mark swapping.
  * It can be called in swapping the block mark, or swapping it back,
@@ -1831,50 +1327,20 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
-static int gpmi_ecc_read_page_data(struct nand_chip *chip, uint8_t *buf)
+static int gpmi_count_bitflips(struct nand_chip *chip, void *buf, int first,
+			       int last, int meta)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	dma_addr_t    payload_phys;
-	unsigned int  i;
+	int i;
 	unsigned char *status;
-	unsigned int  max_bitflips = 0;
-	int           ret;
-	bool          direct = false;
-
-	payload_phys = this->payload_phys;
-
-	if (virt_addr_valid(buf)) {
-		dma_addr_t dest_phys;
-
-		dest_phys = dma_map_single(this->dev, buf, nfc_geo->payload_size,
-					   DMA_FROM_DEVICE);
-		if (!dma_mapping_error(this->dev, dest_phys)) {
-			payload_phys = dest_phys;
-			direct = true;
-		}
-	}
-
-	/* go! */
-	ret = gpmi_read_page(this, payload_phys, this->auxiliary_phys);
-
-	if (direct)
-		dma_unmap_single(this->dev, payload_phys, nfc_geo->payload_size,
-				 DMA_FROM_DEVICE);
-
-	if (ret) {
-		dev_err(this->dev, "Error in ECC-based read: %d\n", ret);
-		return ret;
-	}
+	unsigned int max_bitflips = 0;
 
 	/* Loop over status bytes, accumulating ECC status. */
-	status = this->auxiliary_virt + nfc_geo->auxiliary_status_offset;
-
-	if (!direct)
-		memcpy(buf, this->payload_virt, nfc_geo->payload_size);
+	status = this->auxiliary_virt + ALIGN(meta, 4);
 
-	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
+	for (i = first; i < last; i++, status++) {
 		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
 			continue;
 
@@ -1954,24 +1420,49 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip, uint8_t *buf)
 		max_bitflips = max_t(unsigned int, max_bitflips, *status);
 	}
 
-	/* handle the block mark swapping */
-	block_mark_swapping(this, buf, this->auxiliary_virt);
-
 	return max_bitflips;
 }
 
+static void gpmi_bch_layout_std(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *geo = &this->bch_geometry;
+	unsigned int ecc_strength = geo->ecc_strength >> 1;
+	unsigned int gf_len = geo->gf_len;
+	unsigned int block_size = block_size = geo->ecc_chunk_size;
+
+	this->bch_flashlayout0 =
+		BF_BCH_FLASH0LAYOUT0_NBLOCKS(geo->ecc_chunk_count - 1) |
+		BF_BCH_FLASH0LAYOUT0_META_SIZE(geo->metadata_size) |
+		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
+		BF_BCH_FLASH0LAYOUT0_GF(gf_len, this) |
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(block_size, this);
+
+	this->bch_flashlayout1 =
+		BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(geo->page_size) |
+		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
+		BF_BCH_FLASH0LAYOUT1_GF(gf_len, this) |
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this);
+}
+
 static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 			      int oob_required, int page)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
+	struct bch_geometry *geo = &this->bch_geometry;
+	unsigned int max_bitflips;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
+	gpmi_bch_layout_std(this);
+	this->bch = true;
 
-	ret = gpmi_ecc_read_page_data(chip, buf);
-	if (ret < 0)
-		return ret;
+	nand_read_page_op(chip, page, 0, buf, geo->page_size);
+
+	max_bitflips = gpmi_count_bitflips(chip, buf, 0,
+					   geo->ecc_chunk_count,
+					   geo->auxiliary_status_offset);
+
+	/* handle the block mark swapping */
+	block_mark_swapping(this, buf, this->auxiliary_virt);
 
 	if (oob_required) {
 		/*
@@ -1988,7 +1479,7 @@ static int gpmi_ecc_read_page(struct nand_chip *chip, uint8_t *buf,
 		chip->oob_poi[0] = ((uint8_t *)this->auxiliary_virt)[0];
 	}
 
-	return ret;
+	return max_bitflips;
 }
 
 /* Fake a virtual small page for the subpage read */
@@ -1996,17 +1487,14 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 				 uint32_t len, uint8_t *buf, int page)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
-	void __iomem *bch_regs = this->resources.bch_regs;
-	struct bch_geometry old_geo = this->bch_geometry;
 	struct bch_geometry *geo = &this->bch_geometry;
 	int size = chip->ecc.size; /* ECC chunk size */
 	int meta, n, page_size;
-	u32 r1_old, r2_old, r1_new, r2_new;
 	unsigned int max_bitflips;
+	unsigned int ecc_strength;
 	int first, last, marker_pos;
 	int ecc_parity_size;
 	int col = 0;
-	int old_swap_block_mark = this->swap_block_mark;
 
 	/* The size of ECC parity */
 	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
@@ -2039,43 +1527,31 @@ static int gpmi_ecc_read_subpage(struct nand_chip *chip, uint32_t offs,
 		buf = buf + first * size;
 	}
 
-	nand_read_page_op(chip, page, col, NULL, 0);
-
-	/* Save the old environment */
-	r1_old = r1_new = readl(bch_regs + HW_BCH_FLASH0LAYOUT0);
-	r2_old = r2_new = readl(bch_regs + HW_BCH_FLASH0LAYOUT1);
+	ecc_parity_size = geo->gf_len * geo->ecc_strength / 8;
 
-	/* change the BCH registers and bch_geometry{} */
 	n = last - first + 1;
 	page_size = meta + (size + ecc_parity_size) * n;
+	ecc_strength = geo->ecc_strength >> 1;
 
-	r1_new &= ~(BM_BCH_FLASH0LAYOUT0_NBLOCKS |
-			BM_BCH_FLASH0LAYOUT0_META_SIZE);
-	r1_new |= BF_BCH_FLASH0LAYOUT0_NBLOCKS(n - 1)
-			| BF_BCH_FLASH0LAYOUT0_META_SIZE(meta);
-	writel(r1_new, bch_regs + HW_BCH_FLASH0LAYOUT0);
+	this->bch_flashlayout0 = BF_BCH_FLASH0LAYOUT0_NBLOCKS(n - 1) |
+		BF_BCH_FLASH0LAYOUT0_META_SIZE(meta) |
+		BF_BCH_FLASH0LAYOUT0_ECC0(ecc_strength, this) |
+		BF_BCH_FLASH0LAYOUT0_GF(geo->gf_len, this) |
+		BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(geo->ecc_chunk_size, this);
 
-	r2_new &= ~BM_BCH_FLASH0LAYOUT1_PAGE_SIZE;
-	r2_new |= BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size);
-	writel(r2_new, bch_regs + HW_BCH_FLASH0LAYOUT1);
+	this->bch_flashlayout1 = BF_BCH_FLASH0LAYOUT1_PAGE_SIZE(page_size) |
+		BF_BCH_FLASH0LAYOUT1_ECCN(ecc_strength, this) |
+		BF_BCH_FLASH0LAYOUT1_GF(geo->gf_len, this) |
+		BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(geo->ecc_chunk_size, this);
 
-	geo->ecc_chunk_count = n;
-	geo->payload_size = n * size;
-	geo->page_size = page_size;
-	geo->auxiliary_status_offset = ALIGN(meta, 4);
+	this->bch = true;
+
+	nand_read_page_op(chip, page, col, buf, page_size);
 
 	dev_dbg(this->dev, "page:%d(%d:%d)%d, chunk:(%d:%d), BCH PG size:%d\n",
 		page, offs, len, col, first, n, page_size);
 
-	/* Read the subpage now */
-	this->swap_block_mark = false;
-	max_bitflips = gpmi_ecc_read_page_data(chip, buf);
-
-	/* Restore */
-	writel(r1_old, bch_regs + HW_BCH_FLASH0LAYOUT0);
-	writel(r2_old, bch_regs + HW_BCH_FLASH0LAYOUT1);
-	this->bch_geometry = old_geo;
-	this->swap_block_mark = old_swap_block_mark;
+	max_bitflips = gpmi_count_bitflips(chip, buf, first, last, meta);
 
 	return max_bitflips;
 }
@@ -2086,81 +1562,29 @@ static int gpmi_ecc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
-	const void *payload_virt;
-	dma_addr_t payload_phys;
-	const void *auxiliary_virt;
-	dma_addr_t auxiliary_phys;
-	int        ret;
+	int ret;
 
 	dev_dbg(this->dev, "ecc write page.\n");
 
-	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
+	gpmi_bch_layout_std(this);
+	this->bch = true;
+
+	memcpy(this->auxiliary_virt, chip->oob_poi, nfc_geo->auxiliary_size);
 
 	if (this->swap_block_mark) {
 		/*
-		 * If control arrives here, we're doing block mark swapping.
-		 * Since we can't modify the caller's buffers, we must copy them
-		 * into our own.
+		 * When doing bad block marker swapping we must always copy the
+		 * input buffer as we can't modify the const buffer.
 		 */
-		memcpy(this->payload_virt, buf, mtd->writesize);
-		payload_virt = this->payload_virt;
-		payload_phys = this->payload_phys;
-
-		memcpy(this->auxiliary_virt, chip->oob_poi,
-				nfc_geo->auxiliary_size);
-		auxiliary_virt = this->auxiliary_virt;
-		auxiliary_phys = this->auxiliary_phys;
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
+		memcpy(this->data_buffer_dma, buf, mtd->writesize);
+		buf = this->data_buffer_dma;
+		block_mark_swapping(this, this->data_buffer_dma,
+				    this->auxiliary_virt);
 	}
 
-	/* Ask the NFC. */
-	ret = gpmi_send_page(this, payload_phys, auxiliary_phys);
-	if (ret)
-		dev_err(this->dev, "Error in ECC-based write: %d\n", ret);
-
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
+	ret = nand_prog_page_op(chip, page, 0, buf, nfc_geo->page_size);
 
-	if (ret)
-		return ret;
-
-	return nand_prog_page_end_op(chip);
+	return ret;
 }
 
 /*
@@ -2228,7 +1652,6 @@ static int gpmi_ecc_read_oob(struct nand_chip *chip, int page)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 
-	dev_dbg(this->dev, "page number is %d\n", page);
 	/* clear the OOB buffer */
 	memset(chip->oob_poi, ~0, mtd->oobsize);
 
@@ -2292,8 +1715,7 @@ static int gpmi_ecc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	uint8_t *oob = chip->oob_poi;
 	int step;
 
-	nand_read_page_op(chip, page, 0, tmp_buf,
-			  mtd->writesize + mtd->oobsize);
+	nand_read_page_op(chip, page, 0, tmp_buf, mtd->writesize + mtd->oobsize);
 
 	/*
 	 * If required, swap the bad block marker and the data stored in the
@@ -2775,9 +2197,330 @@ static int gpmi_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
+static struct gpmi_transfer *get_next_transfer(struct gpmi_nand_data *this)
+{
+	struct gpmi_transfer *transfer = &this->transfers[this->ntransfers];
+
+	this->ntransfers++;
+
+	if (this->ntransfers == GPMI_MAX_TRANSFERS)
+		return NULL;
+
+	return transfer;
+}
+
+static struct dma_async_tx_descriptor *gpmi_chain_command(
+	struct gpmi_nand_data *this, u8 cmd, const u8 *addr, int naddr)
+{
+	struct dma_chan *channel = get_dma_chan(this);
+	struct dma_async_tx_descriptor *desc;
+	struct gpmi_transfer *transfer;
+	int chip = this->nand.cur_cs;
+	u32 pio[3];
+
+	/* [1] send out the PIO words */
+	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__WRITE)
+		| BM_GPMI_CTRL0_WORD_LENGTH
+		| BF_GPMI_CTRL0_CS(chip, this)
+		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
+		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_CLE)
+		| BM_GPMI_CTRL0_ADDRESS_INCREMENT
+		| BF_GPMI_CTRL0_XFER_COUNT(naddr + 1);
+	pio[1] = 0;
+	pio[2] = 0;
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, 0);
+	if (!desc)
+		return NULL;
+
+	transfer = get_next_transfer(this);
+	if (!transfer)
+		return NULL;
+
+	transfer->cmdbuf[0] = cmd;
+	if (naddr)
+		memcpy(&transfer->cmdbuf[1], addr, naddr);
+
+	sg_init_one(&transfer->sgl, transfer->cmdbuf, naddr + 1);
+	dma_map_sg(this->dev, &transfer->sgl, 1, DMA_TO_DEVICE);
+
+	transfer->direction = DMA_TO_DEVICE;
+
+	desc = dmaengine_prep_slave_sg(channel, &transfer->sgl, 1, DMA_MEM_TO_DEV,
+				       MXS_DMA_CTRL_WAIT4END);
+	return desc;
+}
+
+static struct dma_async_tx_descriptor *gpmi_chain_wait_ready(
+	struct gpmi_nand_data *this)
+{
+	struct dma_chan *channel = get_dma_chan(this);
+	u32 pio[2];
+
+	pio[0] =  BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__WAIT_FOR_READY)
+		| BM_GPMI_CTRL0_WORD_LENGTH
+		| BF_GPMI_CTRL0_CS(this->nand.cur_cs, this)
+		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
+		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
+		| BF_GPMI_CTRL0_XFER_COUNT(0);
+	pio[1] = 0;
+
+	return mxs_dmaengine_prep_pio(channel, pio, 2, DMA_TRANS_NONE,
+				MXS_DMA_CTRL_WAIT4END | MXS_DMA_CTRL_WAIT4RDY);
+}
+
+static struct dma_async_tx_descriptor *gpmi_chain_data_read(
+	struct gpmi_nand_data *this, void *buf, int raw_len, bool *direct)
+{
+	struct dma_async_tx_descriptor *desc;
+	struct dma_chan *channel = get_dma_chan(this);
+	struct gpmi_transfer *transfer;
+	u32 pio[6] = {};
+
+	transfer = get_next_transfer(this);
+	if (!transfer)
+		return NULL;
+
+	transfer->direction = DMA_FROM_DEVICE;
+
+	*direct = prepare_data_dma(this, buf, raw_len, &transfer->sgl,
+				   DMA_FROM_DEVICE);
+
+	pio[0] =  BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__READ)
+		| BM_GPMI_CTRL0_WORD_LENGTH
+		| BF_GPMI_CTRL0_CS(this->nand.cur_cs, this)
+		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
+		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
+		| BF_GPMI_CTRL0_XFER_COUNT(raw_len);
+
+	if (this->bch) {
+		pio[2] =  BM_GPMI_ECCCTRL_ENABLE_ECC
+			| BF_GPMI_ECCCTRL_ECC_CMD(BV_GPMI_ECCCTRL_ECC_CMD__BCH_DECODE)
+			| BF_GPMI_ECCCTRL_BUFFER_MASK(BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_PAGE
+				| BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_AUXONLY);
+		pio[3] = raw_len;
+		pio[4] = transfer->sgl.dma_address;
+		pio[5] = this->auxiliary_phys;
+	}
+
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE, 0);
+	if (!desc)
+		return NULL;
+
+	if (!this->bch)
+		desc = dmaengine_prep_slave_sg(channel, &transfer->sgl, 1,
+					     DMA_DEV_TO_MEM,
+					     MXS_DMA_CTRL_WAIT4END);
+
+	return desc;
+}
+
+static struct dma_async_tx_descriptor *gpmi_chain_data_write(
+	struct gpmi_nand_data *this, const void *buf, int raw_len)
+{
+	struct dma_chan *channel = get_dma_chan(this);
+	struct dma_async_tx_descriptor *desc;
+	struct gpmi_transfer *transfer;
+	u32 pio[6] = {};
+
+	transfer = get_next_transfer(this);
+	if (!transfer)
+		return NULL;
+
+	transfer->direction = DMA_TO_DEVICE;
+
+	prepare_data_dma(this, buf, raw_len, &transfer->sgl, DMA_TO_DEVICE);
+
+	pio[0] = BF_GPMI_CTRL0_COMMAND_MODE(BV_GPMI_CTRL0_COMMAND_MODE__WRITE)
+		| BM_GPMI_CTRL0_WORD_LENGTH
+		| BF_GPMI_CTRL0_CS(this->nand.cur_cs, this)
+		| BF_GPMI_CTRL0_LOCK_CS(LOCK_CS_ENABLE, this)
+		| BF_GPMI_CTRL0_ADDRESS(BV_GPMI_CTRL0_ADDRESS__NAND_DATA)
+		| BF_GPMI_CTRL0_XFER_COUNT(raw_len);
+
+	if (this->bch) {
+		pio[2] = BM_GPMI_ECCCTRL_ENABLE_ECC
+			| BF_GPMI_ECCCTRL_ECC_CMD(BV_GPMI_ECCCTRL_ECC_CMD__BCH_ENCODE)
+			| BF_GPMI_ECCCTRL_BUFFER_MASK(BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_PAGE |
+					BV_GPMI_ECCCTRL_BUFFER_MASK__BCH_AUXONLY);
+		pio[3] = raw_len;
+		pio[4] = transfer->sgl.dma_address;
+		pio[5] = this->auxiliary_phys;
+	}
+
+	desc = mxs_dmaengine_prep_pio(channel, pio, ARRAY_SIZE(pio),
+				      DMA_TRANS_NONE,
+				      (this->bch ? MXS_DMA_CTRL_WAIT4END : 0));
+	if (!desc)
+		return NULL;
+
+	if (!this->bch)
+		desc = dmaengine_prep_slave_sg(channel, &transfer->sgl, 1,
+					       DMA_MEM_TO_DEV,
+					       MXS_DMA_CTRL_WAIT4END);
+
+	return desc;
+}
+
+static int gpmi_nfc_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	const struct nand_op_instr *instr;
+	struct gpmi_nand_data *this = nand_get_controller_data(chip);
+	struct dma_async_tx_descriptor *desc = NULL;
+	int i, ret, buf_len = 0, nbufs = 0;
+	u8 cmd = 0;
+	void *buf_read = NULL;
+	const void *buf_write = NULL;
+	bool direct = false;
+	struct completion *completion;
+	unsigned long to;
+
+	this->ntransfers = 0;
+	for (i = 0; i < GPMI_MAX_TRANSFERS; i++)
+		this->transfers[i].direction = DMA_NONE;
+
+	ret = pm_runtime_get_sync(this->dev);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * This driver currently supports only one NAND chip. Plus, dies share
+	 * the same configuration. So once timings have been applied on the
+	 * controller side, they will not change anymore. When the time will
+	 * come, the check on must_apply_timings will have to be dropped.
+	 */
+	if (this->hw.must_apply_timings) {
+		this->hw.must_apply_timings = false;
+		gpmi_nfc_apply_timings(this);
+	}
+
+	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op->ninstrs);
+
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		nand_op_trace("  ", instr);
+
+		switch (instr->type) {
+		case NAND_OP_WAITRDY_INSTR:
+			desc = gpmi_chain_wait_ready(this);
+			break;
+		case NAND_OP_CMD_INSTR:
+			cmd = instr->ctx.cmd.opcode;
+
+			/*
+			 * When this command has an address cycle chain it
+			 * together with the address cycle
+			 */
+			if (i + 1 != op->ninstrs &&
+			    op->instrs[i + 1].type == NAND_OP_ADDR_INSTR)
+				continue;
+
+			desc = gpmi_chain_command(this, cmd, NULL, 0);
+
+			break;
+		case NAND_OP_ADDR_INSTR:
+			desc = gpmi_chain_command(this, cmd, instr->ctx.addr.addrs,
+						  instr->ctx.addr.naddrs);
+			break;
+		case NAND_OP_DATA_OUT_INSTR:
+			buf_write = instr->ctx.data.buf.out;
+			buf_len = instr->ctx.data.len;
+			nbufs++;
+
+			desc = gpmi_chain_data_write(this, buf_write, buf_len);
+
+			break;
+		case NAND_OP_DATA_IN_INSTR:
+			if (!instr->ctx.data.len)
+				break;
+			buf_read = instr->ctx.data.buf.in;
+			buf_len = instr->ctx.data.len;
+			nbufs++;
+
+			desc = gpmi_chain_data_read(this, buf_read, buf_len,
+						   &direct);
+			break;
+		}
+
+		if (!desc) {
+			ret = -ENXIO;
+			goto unmap;
+		}
+	}
+
+	dev_dbg(this->dev, "%s setup done\n", __func__);
+
+	if (nbufs > 1) {
+		dev_err(this->dev, "Multiple data instructions not supported\n");
+		ret = -EINVAL;
+		goto unmap;
+	}
+
+	if (this->bch) {
+		writel(this->bch_flashlayout0,
+		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT0);
+		writel(this->bch_flashlayout1,
+		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT1);
+	}
+
+	if (this->bch && buf_read) {
+		writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
+		       this->resources.bch_regs + HW_BCH_CTRL_SET);
+		completion = &this->bch_done;
+	} else {
+		desc->callback = dma_irq_callback;
+		desc->callback_param = this;
+		completion = &this->dma_done;
+	}
+
+	init_completion(completion);
+
+	dmaengine_submit(desc);
+	dma_async_issue_pending(get_dma_chan(this));
+
+	to = wait_for_completion_timeout(completion, msecs_to_jiffies(1000));
+	if (!to) {
+		dev_err(this->dev, "DMA timeout, last DMA\n");
+		gpmi_dump_info(this);
+		ret = -ETIMEDOUT;
+		goto unmap;
+	}
+
+	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
+	       this->resources.bch_regs + HW_BCH_CTRL_CLR);
+	gpmi_clear_bch(this);
+
+	ret = 0;
+
+unmap:
+	for (i = 0; i < this->ntransfers; i++) {
+		struct gpmi_transfer *transfer = &this->transfers[i];
+
+		if (transfer->direction != DMA_NONE)
+			dma_unmap_sg(this->dev, &transfer->sgl, 1,
+				     transfer->direction);
+	}
+
+	if (!ret && buf_read && !direct)
+		memcpy(buf_read, this->data_buffer_dma,
+		       gpmi_raw_len_to_len(this, buf_len));
+
+	this->bch = false;
+
+	pm_runtime_mark_last_busy(this->dev);
+	pm_runtime_put_autosuspend(this->dev);
+
+	return ret;
+}
+
 static const struct nand_controller_ops gpmi_nand_controller_ops = {
 	.attach_chip = gpmi_nand_attach_chip,
 	.setup_data_interface = gpmi_setup_data_interface,
+	.exec_op = gpmi_nfc_exec_op,
 };
 
 static int gpmi_nand_init(struct gpmi_nand_data *this)
@@ -2786,9 +2529,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	struct mtd_info  *mtd = nand_to_mtd(chip);
 	int ret;
 
-	/* init current chip */
-	this->current_chip	= -1;
-
 	/* init the MTD data structures */
 	mtd->name		= "gpmi-nand";
 	mtd->dev.parent		= this->dev;
@@ -2796,14 +2536,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	nand_set_controller_data(chip, this);
 	nand_set_flash_node(chip, this->pdev->dev.of_node);
-	chip->legacy.select_chip	= gpmi_select_chip;
-	chip->legacy.cmd_ctrl	= gpmi_cmd_ctrl;
-	chip->legacy.dev_ready	= gpmi_dev_ready;
-	chip->legacy.read_byte	= gpmi_read_byte;
-	chip->legacy.read_buf	= gpmi_read_buf;
-	chip->legacy.write_buf	= gpmi_write_buf;
-	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->legacy.block_markbad = gpmi_block_markbad;
+	chip->badblock_pattern	= &gpmi_bbt_descr;
 	chip->options		|= NAND_NO_SUBPAGE_WRITE;
 
 	/* Set up swap_block_mark, must be set before the gpmi_set_geometry() */
@@ -2819,7 +2553,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
-	chip->legacy.dummy_controller.ops = &gpmi_nand_controller_ops;
+	nand_controller_init(&this->base);
+	this->base.ops = &gpmi_nand_controller_ops;
+	chip->controller = &this->base;
+
 	ret = nand_scan(chip, GPMI_IS_MX6(this) ? 2 : 1);
 	if (ret)
 		goto err_out;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 51a070da84ed..fdc5ed7de083 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -103,6 +103,14 @@ struct gpmi_nfc_hardware_timing {
 	u32 ctrl1n;
 };
 
+#define GPMI_MAX_TRANSFERS	8
+
+struct gpmi_transfer {
+	u8 cmdbuf[8];
+	struct scatterlist sgl;
+	enum dma_data_direction direction;
+};
+
 struct gpmi_nand_data {
 	/* Devdata */
 	const struct gpmi_devdata *devdata;
@@ -126,23 +134,18 @@ struct gpmi_nand_data {
 	struct boot_rom_geometry rom_geometry;
 
 	/* MTD / NAND */
+	struct nand_controller	base;
 	struct nand_chip	nand;
 
-	/* General-use Variables */
-	int			current_chip;
-	unsigned int		command_length;
+	struct gpmi_transfer	transfers[GPMI_MAX_TRANSFERS];
+	int			ntransfers;
 
-	struct scatterlist	cmd_sgl;
-	char			*cmd_buffer;
+	bool			bch;
+	uint32_t		bch_flashlayout0;
+	uint32_t		bch_flashlayout1;
 
-	struct scatterlist	data_sgl;
 	char			*data_buffer_dma;
 
-	unsigned int		page_buffer_size;
-
-	void			*payload_virt;
-	dma_addr_t		payload_phys;
-
 	void			*auxiliary_virt;
 	dma_addr_t		auxiliary_phys;
 
diff --git a/include/linux/dma/mxs-dma.h b/include/linux/dma/mxs-dma.h
index 4a33f2c8a682..069d9f5a609e 100644
--- a/include/linux/dma/mxs-dma.h
+++ b/include/linux/dma/mxs-dma.h
@@ -5,6 +5,7 @@
 #include <linux/dmaengine.h>
 
 #define MXS_DMA_CTRL_WAIT4END	BIT(31)
+#define MXS_DMA_CTRL_WAIT4RDY	BIT(30)
 
 /*
  * The mxs dmaengine can do PIO transfers. We pass a pointer to the PIO words
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
