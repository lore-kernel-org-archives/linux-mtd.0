Return-Path: <SRS0=cSwW=6C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7A1C352BE
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A159921BE5
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 19:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNPqr4EL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A159921BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhxlfrFEVp4JUIMlS1/uoIfXhZLSa1fxzn/xMSKga1I=; b=tNPqr4ELkOxII5
	nnLBJMOIO23yP1S2P1dtyZKQB/KG5Pwl7Oj+wNLnyuq0CINnTnvZDowRA3VtfRxZFSKx4YSayKaUO
	YEDqZK3wXF5wYm0tHYE/wcZS90rQiJT0C/XE52M0p28QWvUy2lsx4H12utAW0lN/UgIqgQMYx74P7
	cyYuTv94tuh+Qgkv8lWmp8FZhST2DsvPP2PAmv7Z/X/p7MGtvz1Jxkvu8fwXfTKRhj5OU6eOiX3Bm
	l0iFBAuSwHiIT8lbNprE6fMRsrlblFouYkRFbkSl/NnC8UTbhVu2Gp1EIJb6+QnlIeoY4yYjgU3uj
	9qkktFaB1ebdp/QnObLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPtTe-0001oT-OE; Sat, 18 Apr 2020 19:50:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPtTa-0000je-3o
 for linux-mtd@lists.infradead.org; Sat, 18 Apr 2020 19:50:09 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 78B752A13EE;
 Sat, 18 Apr 2020 20:50:04 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Sat, 18 Apr 2020 21:49:59 +0200
Message-Id: <20200418194959.1017197-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200418194959.1017197-1-boris.brezillon@collabora.com>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_125006_443506_EABBE61F 
X-CRM114-Status: GOOD (  19.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both SMC and HSMC are converted to exec_op(), meaning that we have one
less driver using the legacy interface.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Only compile-tested, having someone to test the changes on real HW
would be great!
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 424 +++++++++++++------
 1 file changed, 286 insertions(+), 138 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3ba17a98df4d..7736f63f7f2f 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -202,6 +202,8 @@ struct atmel_nand_controller_ops {
 	int (*ecc_init)(struct nand_chip *chip);
 	int (*setup_data_interface)(struct atmel_nand *nand, int csline,
 				    const struct nand_data_interface *conf);
+	int (*exec_op)(struct atmel_nand *nand,
+		       const struct nand_operation *op, bool check_only);
 };
 
 struct atmel_nand_controller_caps {
@@ -414,29 +416,12 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	return -EIO;
 }
 
-static u8 atmel_nand_read_byte(struct nand_chip *chip)
+static void atmel_nand_read_buf(struct atmel_nand *nand, u8 *buf, int len,
+				bool force_8bit)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	return ioread8(nand->activecs->io.virt);
-}
-
-static void atmel_nand_write_byte(struct nand_chip *chip, u8 byte)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		iowrite16(byte | (byte << 8), nand->activecs->io.virt);
-	else
-		iowrite8(byte, nand->activecs->io.virt);
-}
-
-static void atmel_nand_read_buf(struct nand_chip *chip, u8 *buf, int len)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
 
-	nc = to_nand_controller(chip->controller);
+	nc = to_nand_controller(nand->base.controller);
 
 	/*
 	 * If the controller supports DMA, the buffer address is DMA-able and
@@ -444,23 +429,23 @@ static void atmel_nand_read_buf(struct nand_chip *chip, u8 *buf, int len)
 	 * a DMA transfer. If it fails, fallback to PIO mode.
 	 */
 	if (nc->dmac && virt_addr_valid(buf) &&
-	    len >= MIN_DMA_LEN &&
+	    len >= MIN_DMA_LEN && !force_8bit &&
 	    !atmel_nand_dma_transfer(nc, buf, nand->activecs->io.dma, len,
 				     DMA_FROM_DEVICE))
 		return;
 
-	if (chip->options & NAND_BUSWIDTH_16)
+	if ((nand->base.options & NAND_BUSWIDTH_16) && !force_8bit)
 		ioread16_rep(nand->activecs->io.virt, buf, len / 2);
 	else
 		ioread8_rep(nand->activecs->io.virt, buf, len);
 }
 
-static void atmel_nand_write_buf(struct nand_chip *chip, const u8 *buf, int len)
+static void atmel_nand_write_buf(struct atmel_nand *nand, const u8 *buf,
+				 int len, bool force_8bit)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_nand_controller *nc;
 
-	nc = to_nand_controller(chip->controller);
+	nc = to_nand_controller(nand->base.controller);
 
 	/*
 	 * If the controller supports DMA, the buffer address is DMA-able and
@@ -468,72 +453,69 @@ static void atmel_nand_write_buf(struct nand_chip *chip, const u8 *buf, int len)
 	 * a DMA transfer. If it fails, fallback to PIO mode.
 	 */
 	if (nc->dmac && virt_addr_valid(buf) &&
-	    len >= MIN_DMA_LEN &&
+	    len >= MIN_DMA_LEN && !force_8bit &&
 	    !atmel_nand_dma_transfer(nc, (void *)buf, nand->activecs->io.dma,
 				     len, DMA_TO_DEVICE))
 		return;
 
-	if (chip->options & NAND_BUSWIDTH_16)
+	if ((nand->base.options & NAND_BUSWIDTH_16) && !force_8bit)
 		iowrite16_rep(nand->activecs->io.virt, buf, len / 2);
 	else
 		iowrite8_rep(nand->activecs->io.virt, buf, len);
 }
 
-static int atmel_nand_dev_ready(struct nand_chip *chip)
+static int atmel_nand_waitrdy(struct atmel_nand *nand, unsigned int timeout_ms)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
+	if (nand->activecs->rb.type == ATMEL_NAND_NO_RB)
+		return nand_soft_waitrdy(&nand->base, timeout_ms);
 
-	return gpiod_get_value(nand->activecs->rb.gpio);
+	return nand_gpio_waitrdy(&nand->base, nand->activecs->rb.gpio,
+				 timeout_ms);
 }
 
-static void atmel_nand_select_chip(struct nand_chip *chip, int cs)
+static int atmel_hsmc_nand_waitrdy(struct atmel_nand *nand,
+				   unsigned int timeout_ms)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_hsmc_nand_controller *nc;
+	u32 status, mask;
 
-	if (cs < 0 || cs >= nand->numcs) {
-		nand->activecs = NULL;
-		chip->legacy.dev_ready = NULL;
+	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB)
+		return atmel_nand_waitrdy(nand, timeout_ms);
+
+	nc = to_hsmc_nand_controller(nand->base.controller);
+	mask = ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);
+	return regmap_read_poll_timeout(nc->base.smc, ATMEL_HSMC_NFC_SR,
+					status, status & mask,
+					20, timeout_ms * 1000);
+}
+
+static void atmel_nand_select_die(struct atmel_nand *nand,
+				  unsigned int cs)
+{
+	if (WARN_ON(cs >= nand->numcs))
 		return;
-	}
 
 	nand->activecs = &nand->cs[cs];
-
-	if (nand->activecs->rb.type == ATMEL_NAND_GPIO_RB)
-		chip->legacy.dev_ready = atmel_nand_dev_ready;
+	gpiod_set_value(nand->activecs->csgpio, 0);
 }
 
-static int atmel_hsmc_nand_dev_ready(struct nand_chip *chip)
+static void atmel_nand_unselect_die(struct atmel_nand *nand)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_hsmc_nand_controller *nc;
-	u32 status;
-
-	nc = to_hsmc_nand_controller(chip->controller);
-
-	regmap_read(nc->base.smc, ATMEL_HSMC_NFC_SR, &status);
-
-	return status & ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);
+	gpiod_set_value(nand->activecs->csgpio, 1);
+	nand->activecs = NULL;
 }
 
-static void atmel_hsmc_nand_select_chip(struct nand_chip *chip, int cs)
+static void atmel_hsmc_nand_select_die(struct atmel_nand *nand,
+				       unsigned int cs)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct mtd_info *mtd = nand_to_mtd(&nand->base);
 	struct atmel_hsmc_nand_controller *nc;
 
-	nc = to_hsmc_nand_controller(chip->controller);
-
-	atmel_nand_select_chip(chip, cs);
-
-	if (!nand->activecs) {
-		regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CTRL,
-			     ATMEL_HSMC_NFC_CTRL_DIS);
+	if (WARN_ON(cs >= nand->numcs))
 		return;
-	}
-
-	if (nand->activecs->rb.type == ATMEL_NAND_NATIVE_RB)
-		chip->legacy.dev_ready = atmel_hsmc_nand_dev_ready;
 
+	nand->activecs = &nand->cs[cs];
+	nc = to_hsmc_nand_controller(nand->base.controller);
 	regmap_update_bits(nc->base.smc, ATMEL_HSMC_NFC_CFG,
 			   ATMEL_HSMC_NFC_CFG_PAGESIZE_MASK |
 			   ATMEL_HSMC_NFC_CFG_SPARESIZE_MASK |
@@ -546,6 +528,66 @@ static void atmel_hsmc_nand_select_chip(struct nand_chip *chip, int cs)
 		     ATMEL_HSMC_NFC_CTRL_EN);
 }
 
+static void atmel_hsmc_nand_unselect_die(struct atmel_nand *nand)
+{
+	struct atmel_hsmc_nand_controller *nc;
+
+	nc = to_hsmc_nand_controller(nand->base.controller);
+	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CTRL,
+		     ATMEL_HSMC_NFC_CTRL_DIS);
+	nand->activecs = NULL;
+}
+
+static int atmel_smc_nand_exec_op(struct atmel_nand *nand,
+				  const struct nand_operation *op,
+				  bool check_only)
+{
+	struct atmel_nand_controller *nc;
+	unsigned int i, j;
+
+	if (check_only)
+		return 0;
+
+	nc = to_nand_controller(nand->base.controller);
+	atmel_nand_select_die(nand, op->cs);
+	for (i = 0; i < op->ninstrs; i++) {
+		const struct nand_op_instr *instr = &op->instrs[i];
+		int ret;
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			writeb(instr->ctx.cmd.opcode,
+			       nand->activecs->io.virt + nc->caps->cle_offs);
+			break;
+		case NAND_OP_ADDR_INSTR:
+			for (j = 0; j < instr->ctx.addr.naddrs; j++)
+				writeb(instr->ctx.addr.addrs[j],
+				       nand->activecs->io.virt +
+				       nc->caps->ale_offs);
+			break;
+		case NAND_OP_DATA_IN_INSTR:
+			atmel_nand_read_buf(nand, instr->ctx.data.buf.in,
+					    instr->ctx.data.len,
+					    instr->ctx.data.force_8bit);
+			break;
+		case NAND_OP_DATA_OUT_INSTR:
+			atmel_nand_write_buf(nand, instr->ctx.data.buf.out,
+					     instr->ctx.data.len,
+					     instr->ctx.data.force_8bit);
+			break;
+		case NAND_OP_WAITRDY_INSTR:
+			ret = atmel_nand_waitrdy(nand,
+						 instr->ctx.waitrdy.timeout_ms);
+			if (ret)
+				return ret;
+			break;
+		}
+	}
+	atmel_nand_unselect_die(nand);
+
+	return 0;
+}
+
 static int atmel_nfc_exec_op(struct atmel_hsmc_nand_controller *nc, bool poll)
 {
 	u8 *addrs = nc->op.addrs;
@@ -596,51 +638,108 @@ static int atmel_nfc_exec_op(struct atmel_hsmc_nand_controller *nc, bool poll)
 	return ret;
 }
 
-static void atmel_hsmc_nand_cmd_ctrl(struct nand_chip *chip, int dat,
-				     unsigned int ctrl)
+static int atmel_hsmc_exec_cmd_addr(struct nand_chip *chip,
+				    const struct nand_subop *subop)
 {
-	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_hsmc_nand_controller *nc;
+	unsigned int i, j;
+
+	if (WARN_ON_ONCE(subop->ninstrs > 3))
+		return -EINVAL;
 
 	nc = to_hsmc_nand_controller(chip->controller);
 
-	if (ctrl & NAND_ALE) {
-		if (nc->op.naddrs == ATMEL_NFC_MAX_ADDR_CYCLES)
-			return;
+	nc->op.cs = subop->cs;
 
-		nc->op.addrs[nc->op.naddrs++] = dat;
-	} else if (ctrl & NAND_CLE) {
-		if (nc->op.ncmds > 1)
-			return;
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
 
-		nc->op.cmds[nc->op.ncmds++] = dat;
+		if (instr->type == NAND_OP_CMD_INSTR) {
+			nc->op.cmds[nc->op.ncmds++] = instr->ctx.cmd.opcode;
+			continue;
+		}
+
+		if (WARN_ON_ONCE(instr->type != NAND_OP_ADDR_INSTR))
+			return -EINVAL;
+
+		for (j = nand_subop_get_addr_start_off(subop, i);
+		     j < nand_subop_get_num_addr_cyc(subop, j); j++) {
+			if (WARN_ON_ONCE(j >= 5))
+				return -EINVAL;
+
+			nc->op.addrs[nc->op.naddrs] = instr->ctx.addr.addrs[j];
+			nc->op.naddrs++;
+		}
 	}
 
-	if (dat == NAND_CMD_NONE) {
-		nc->op.cs = nand->activecs->id;
-		atmel_nfc_exec_op(nc, true);
-	}
+	return atmel_nfc_exec_op(nc, true);
 }
 
-static void atmel_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
-				unsigned int ctrl)
+static int atmel_hsmc_exec_rw(struct nand_chip *chip,
+			      const struct nand_subop *subop)
 {
+	const struct nand_op_instr *instr = subop->instrs;
 	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_nand_controller *nc;
 
-	nc = to_nand_controller(chip->controller);
+	if (WARN_ON_ONCE(subop->ninstrs != 1 ||
+			 (instr->type != NAND_OP_DATA_IN_INSTR &&
+			  instr->type != NAND_OP_DATA_OUT_INSTR)))
+		return -EINVAL;
 
-	if ((ctrl & NAND_CTRL_CHANGE) && nand->activecs->csgpio) {
-		if (ctrl & NAND_NCE)
-			gpiod_set_value(nand->activecs->csgpio, 0);
-		else
-			gpiod_set_value(nand->activecs->csgpio, 1);
-	}
+	if (instr->type == NAND_OP_DATA_IN_INSTR)
+		atmel_nand_read_buf(nand, instr->ctx.data.buf.in,
+				    instr->ctx.data.len,
+				    instr->ctx.data.force_8bit);
+	else
+		atmel_nand_write_buf(nand, instr->ctx.data.buf.out,
+				     instr->ctx.data.len,
+				     instr->ctx.data.force_8bit);
 
-	if (ctrl & NAND_ALE)
-		writeb(cmd, nand->activecs->io.virt + nc->caps->ale_offs);
-	else if (ctrl & NAND_CLE)
-		writeb(cmd, nand->activecs->io.virt + nc->caps->cle_offs);
+	return 0;
+}
+
+static int atmel_hsmc_exec_waitrdy(struct nand_chip *chip,
+				   const struct nand_subop *subop)
+{
+	const struct nand_op_instr *instr = subop->instrs;
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	if (WARN_ON_ONCE(subop->ninstrs != 1 ||
+			 instr->type != NAND_OP_WAITRDY_INSTR))
+		return -EINVAL;
+
+	return atmel_hsmc_nand_waitrdy(nand, instr->ctx.waitrdy.timeout_ms);
+}
+
+static const struct nand_op_parser atmel_hsmc_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_cmd_addr,
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+		NAND_OP_PARSER_PAT_CMD_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_rw,
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, UINT_MAX)),
+	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_rw,
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, UINT_MAX)),
+	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_waitrdy,
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+);
+
+static int atmel_hsmc_nand_exec_op(struct atmel_nand *nand,
+				   const struct nand_operation *op,
+				   bool check_only)
+{
+	int ret;
+
+	if (check_only)
+		return nand_op_parser_exec_op(&nand->base,
+					      &atmel_hsmc_op_parser, op, true);
+
+	atmel_hsmc_nand_select_die(nand, op->cs);
+	ret = nand_op_parser_exec_op(&nand->base, &atmel_hsmc_op_parser, op,
+				     false);
+	atmel_hsmc_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static void atmel_nfc_copy_to_sram(struct nand_chip *chip, const u8 *buf,
@@ -838,7 +937,7 @@ static int atmel_nand_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
 	if (ret)
 		return ret;
 
-	atmel_nand_write_buf(chip, buf, mtd->writesize);
+	atmel_nand_write_buf(nand, buf, mtd->writesize, false);
 
 	ret = atmel_nand_pmecc_generate_eccbytes(chip, raw);
 	if (ret) {
@@ -848,7 +947,7 @@ static int atmel_nand_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
 
 	atmel_nand_pmecc_disable(chip, raw);
 
-	atmel_nand_write_buf(chip, chip->oob_poi, mtd->oobsize);
+	atmel_nand_write_buf(nand, chip->oob_poi, mtd->oobsize, false);
 
 	return nand_prog_page_end_op(chip);
 }
@@ -856,19 +955,34 @@ static int atmel_nand_pmecc_write_pg(struct nand_chip *chip, const u8 *buf,
 static int atmel_nand_pmecc_write_page(struct nand_chip *chip, const u8 *buf,
 				       int oob_required, int page)
 {
-	return atmel_nand_pmecc_write_pg(chip, buf, oob_required, page, false);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_nand_pmecc_write_pg(chip, buf, oob_required, page, false);
+	atmel_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_nand_pmecc_write_page_raw(struct nand_chip *chip,
 					   const u8 *buf, int oob_required,
 					   int page)
 {
-	return atmel_nand_pmecc_write_pg(chip, buf, oob_required, page, true);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_nand_pmecc_write_pg(chip, buf, oob_required, page, true);
+	atmel_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 				    bool oob_required, int page, bool raw)
 {
+	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
@@ -878,8 +992,8 @@ static int atmel_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	if (ret)
 		return ret;
 
-	atmel_nand_read_buf(chip, buf, mtd->writesize);
-	atmel_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
+	atmel_nand_read_buf(nand, buf, mtd->writesize, false);
+	atmel_nand_read_buf(nand, chip->oob_poi, mtd->oobsize, false);
 
 	ret = atmel_nand_pmecc_correct_data(chip, buf, raw);
 
@@ -891,13 +1005,27 @@ static int atmel_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 static int atmel_nand_pmecc_read_page(struct nand_chip *chip, u8 *buf,
 				      int oob_required, int page)
 {
-	return atmel_nand_pmecc_read_pg(chip, buf, oob_required, page, false);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_nand_pmecc_read_pg(chip, buf, oob_required, page, false);
+	atmel_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_nand_pmecc_read_page_raw(struct nand_chip *chip, u8 *buf,
 					  int oob_required, int page)
 {
-	return atmel_nand_pmecc_read_pg(chip, buf, oob_required, page, true);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_nand_pmecc_read_pg(chip, buf, oob_required, page, true);
+	atmel_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
@@ -906,8 +1034,9 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct atmel_nand *nand = to_atmel_nand(chip);
+	const struct nand_sdr_timings *timings;
 	struct atmel_hsmc_nand_controller *nc;
-	int ret, status;
+	int ret;
 
 	nc = to_hsmc_nand_controller(chip->controller);
 
@@ -939,7 +1068,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	if (ret)
 		return ret;
 
-	atmel_nand_write_buf(chip, chip->oob_poi, mtd->oobsize);
+	atmel_nand_write_buf(nand, chip->oob_poi, mtd->oobsize, false);
 
 	nc->op.cmds[0] = NAND_CMD_PAGEPROG;
 	nc->op.ncmds = 1;
@@ -949,27 +1078,38 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 		dev_err(nc->base.dev, "Failed to program NAND page (err = %d)\n",
 			ret);
 
-	status = chip->legacy.waitfunc(chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
-
-	return ret;
+	timings = nand_get_sdr_timings(&chip->data_interface);
+	return atmel_hsmc_nand_waitrdy(nand, PSEC_TO_MSEC(timings->tPROG_max));
 }
 
 static int atmel_hsmc_nand_pmecc_write_page(struct nand_chip *chip,
 					    const u8 *buf, int oob_required,
 					    int page)
 {
-	return atmel_hsmc_nand_pmecc_write_pg(chip, buf, oob_required, page,
-					      false);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_hsmc_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_hsmc_nand_pmecc_write_pg(chip, buf, oob_required, page,
+					     false);
+	atmel_hsmc_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_hsmc_nand_pmecc_write_page_raw(struct nand_chip *chip,
 						const u8 *buf,
 						int oob_required, int page)
 {
-	return atmel_hsmc_nand_pmecc_write_pg(chip, buf, oob_required, page,
-					      true);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_hsmc_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_hsmc_nand_pmecc_write_pg(chip, buf, oob_required, page,
+					     true);
+	atmel_hsmc_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_hsmc_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
@@ -1029,16 +1169,30 @@ static int atmel_hsmc_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 static int atmel_hsmc_nand_pmecc_read_page(struct nand_chip *chip, u8 *buf,
 					   int oob_required, int page)
 {
-	return atmel_hsmc_nand_pmecc_read_pg(chip, buf, oob_required, page,
-					     false);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_hsmc_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_hsmc_nand_pmecc_read_pg(chip, buf, oob_required, page,
+					    false);
+	atmel_hsmc_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_hsmc_nand_pmecc_read_page_raw(struct nand_chip *chip,
 					       u8 *buf, int oob_required,
 					       int page)
 {
-	return atmel_hsmc_nand_pmecc_read_pg(chip, buf, oob_required, page,
-					     true);
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	int ret;
+
+	atmel_hsmc_nand_select_die(nand, chip->cur_cs);
+	ret = atmel_hsmc_nand_pmecc_read_pg(chip, buf, oob_required, page,
+					    true);
+	atmel_hsmc_nand_unselect_die(nand);
+
+	return ret;
 }
 
 static int atmel_nand_pmecc_init(struct nand_chip *chip)
@@ -1467,6 +1621,18 @@ static int atmel_nand_setup_data_interface(struct nand_chip *chip, int csline,
 	return nc->caps->ops->setup_data_interface(nand, csline, conf);
 }
 
+static int atmel_nand_exec_op(struct nand_chip *chip,
+			      const struct nand_operation *op,
+			      bool check_only)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_nand_controller *nc;
+
+	nc = to_nand_controller(nand->base.controller);
+
+	return nc->caps->ops->exec_op(nand, op, check_only);
+}
+
 static void atmel_nand_init(struct atmel_nand_controller *nc,
 			    struct atmel_nand *nand)
 {
@@ -1476,19 +1642,9 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	mtd->dev.parent = nc->dev;
 	nand->base.controller = &nc->base;
 
-	chip->legacy.cmd_ctrl = atmel_nand_cmd_ctrl;
-	chip->legacy.read_byte = atmel_nand_read_byte;
-	chip->legacy.write_byte = atmel_nand_write_byte;
-	chip->legacy.read_buf = atmel_nand_read_buf;
-	chip->legacy.write_buf = atmel_nand_write_buf;
-	chip->legacy.select_chip = atmel_nand_select_chip;
-
 	if (!nc->mck || !nc->caps->ops->setup_data_interface)
 		chip->options |= NAND_KEEP_TIMINGS;
 
-	/* Some NANDs require a longer delay than the default one (20us). */
-	chip->legacy.chip_delay = 40;
-
 	/*
 	 * Use a bounce buffer when the buffer passed by the MTD user is not
 	 * suitable for DMA.
@@ -1527,18 +1683,6 @@ static void atmel_smc_nand_init(struct atmel_nand_controller *nc,
 				   smc_nc->ebi_csa->nfd0_on_d16);
 }
 
-static void atmel_hsmc_nand_init(struct atmel_nand_controller *nc,
-				 struct atmel_nand *nand)
-{
-	struct nand_chip *chip = &nand->base;
-
-	atmel_nand_init(nc, nand);
-
-	/* Overload some methods for the HSMC controller. */
-	chip->legacy.cmd_ctrl = atmel_hsmc_nand_cmd_ctrl;
-	chip->legacy.select_chip = atmel_hsmc_nand_select_chip;
-}
-
 static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 {
 	struct nand_chip *chip = &nand->base;
@@ -1957,6 +2101,7 @@ static int atmel_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops atmel_nand_controller_ops = {
 	.attach_chip = atmel_nand_attach_chip,
 	.setup_data_interface = atmel_nand_setup_data_interface,
+	.exec_op = atmel_nand_exec_op,
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
@@ -2317,8 +2462,9 @@ static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.probe = atmel_hsmc_nand_controller_probe,
 	.remove = atmel_hsmc_nand_controller_remove,
 	.ecc_init = atmel_hsmc_nand_ecc_init,
-	.nand_init = atmel_hsmc_nand_init,
+	.nand_init = atmel_nand_init,
 	.setup_data_interface = atmel_hsmc_nand_setup_data_interface,
+	.exec_op = atmel_hsmc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_sama5_nc_caps = {
@@ -2385,6 +2531,7 @@ static const struct atmel_nand_controller_ops at91rm9200_nc_ops = {
 	.remove = atmel_smc_nand_controller_remove,
 	.ecc_init = atmel_nand_ecc_init,
 	.nand_init = atmel_smc_nand_init,
+	.exec_op = atmel_smc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_rm9200_nc_caps = {
@@ -2400,6 +2547,7 @@ static const struct atmel_nand_controller_ops atmel_smc_nc_ops = {
 	.ecc_init = atmel_nand_ecc_init,
 	.nand_init = atmel_smc_nand_init,
 	.setup_data_interface = atmel_smc_nand_setup_data_interface,
+	.exec_op = atmel_smc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_sam9260_nc_caps = {
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
