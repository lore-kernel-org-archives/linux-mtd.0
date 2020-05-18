Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F75C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A51220674
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLzxQZ1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A51220674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMBsSyH7ZdDXx0VBhiZ/PI4fEQNX7RGlt80wQNXeKPQ=; b=WLzxQZ1sU1vr+C
	GWXb2JEQV3EhEjXR+MRYCC9qQ50MQU97i/FfEasjnrB8CtGrp2PLK2aN/k8q21W3sY1apVkyS5c64
	GvZGy1zO/GrupJyGpQxW8sl7Rr7CploF+8rK1AGBPOMWVnezYrIt39aLdPHfTtVaTqRu6ybVv96ak
	kGPFAjiiCmCHS1ZjAA5wpmS1icUdgdErWmJ7bOT4j0xJ4+QoyCnkvyunu/6dREv2H6BaJ0OKQPrDz
	Xg+L2r7dS1rc9X/k40mf7FuR9GBQ7pOdEI7hvdot9NocTOs6shlt2jSatZqFd6g1kAgz23gBOfJV5
	8XgonThEOHhZUfq3qoHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaiTt-0008EX-Jd; Mon, 18 May 2020 16:19:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaiSo-0006pl-Pc
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:18:05 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 56D9F2A0A85;
 Mon, 18 May 2020 17:18:00 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH v3 5/6] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Mon, 18 May 2020 18:17:53 +0200
Message-Id: <20200518161754.302415-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200518161754.302415-1-boris.brezillon@collabora.com>
References: <20200518161754.302415-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_091803_124708_4EA7AA87 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both SMC and HSMC are converted to exec_op().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
* Tweak a few things to improve perfs on sama5

Changes in v2:
* Fix the data-in/out patterns
* Drop all WARN_ON() on things that should be checked by the core
* Split changes to make the diff more readable
* Fix bugs reported by Tudor
* Add Miquel's R-b
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 269 +++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 1ef8cff5ab72..301ff1275057 100644
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
@@ -259,6 +261,7 @@ struct atmel_hsmc_nand_controller {
 	struct regmap *io;
 	struct atmel_nfc_op op;
 	struct completion complete;
+	u32 cfg;
 	int irq;
 
 	/* Only used when instantiating from legacy DT bindings. */
@@ -638,6 +641,254 @@ static void atmel_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
 		writeb(cmd, nand->activecs->io.virt + nc->caps->cle_offs);
 }
 
+static void atmel_nand_data_in(struct atmel_nand *nand, void *buf,
+			       unsigned int len, bool force_8bit)
+{
+	struct atmel_nand_controller *nc;
+
+	nc = to_nand_controller(nand->base.controller);
+
+	/*
+	 * If the controller supports DMA, the buffer address is DMA-able and
+	 * len is long enough to make DMA transfers profitable, let's trigger
+	 * a DMA transfer. If it fails, fallback to PIO mode.
+	 */
+	if (nc->dmac && virt_addr_valid(buf) &&
+	    len >= MIN_DMA_LEN && !force_8bit &&
+	    !atmel_nand_dma_transfer(nc, buf, nand->activecs->io.dma, len,
+				     DMA_FROM_DEVICE))
+		return;
+
+	if ((nand->base.options & NAND_BUSWIDTH_16) && !force_8bit)
+		ioread16_rep(nand->activecs->io.virt, buf, len / 2);
+	else
+		ioread8_rep(nand->activecs->io.virt, buf, len);
+}
+
+static void atmel_nand_data_out(struct atmel_nand *nand, const void *buf,
+				unsigned int len, bool force_8bit)
+{
+	struct atmel_nand_controller *nc;
+
+	nc = to_nand_controller(nand->base.controller);
+
+	/*
+	 * If the controller supports DMA, the buffer address is DMA-able and
+	 * len is long enough to make DMA transfers profitable, let's trigger
+	 * a DMA transfer. If it fails, fallback to PIO mode.
+	 */
+	if (nc->dmac && virt_addr_valid(buf) &&
+	    len >= MIN_DMA_LEN && !force_8bit &&
+	    !atmel_nand_dma_transfer(nc, (void *)buf, nand->activecs->io.dma,
+				     len, DMA_TO_DEVICE))
+		return;
+
+	if ((nand->base.options & NAND_BUSWIDTH_16) && !force_8bit)
+		iowrite16_rep(nand->activecs->io.virt, buf, len / 2);
+	else
+		iowrite8_rep(nand->activecs->io.virt, buf, len);
+}
+
+static int atmel_nand_waitrdy(struct atmel_nand *nand, unsigned int timeout_ms)
+{
+	if (nand->activecs->rb.type == ATMEL_NAND_NO_RB)
+		return nand_soft_waitrdy(&nand->base, timeout_ms);
+
+	return nand_gpio_waitrdy(&nand->base, nand->activecs->rb.gpio,
+				 timeout_ms);
+}
+
+static int atmel_hsmc_nand_waitrdy(struct atmel_nand *nand,
+				   unsigned int timeout_ms)
+{
+	struct atmel_hsmc_nand_controller *nc;
+	u32 status, mask;
+
+	if (nand->activecs->rb.type != ATMEL_NAND_NATIVE_RB)
+		return atmel_nand_waitrdy(nand, timeout_ms);
+
+	nc = to_hsmc_nand_controller(nand->base.controller);
+	mask = ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);
+	return regmap_read_poll_timeout_atomic(nc->base.smc, ATMEL_HSMC_NFC_SR,
+					       status, status & mask,
+					       10, timeout_ms * 1000);
+}
+
+static void atmel_nand_select_target(struct atmel_nand *nand,
+				     unsigned int cs)
+{
+	nand->activecs = &nand->cs[cs];
+}
+
+static void atmel_hsmc_nand_select_target(struct atmel_nand *nand,
+					  unsigned int cs)
+{
+	struct mtd_info *mtd = nand_to_mtd(&nand->base);
+	struct atmel_hsmc_nand_controller *nc;
+	u32 cfg = ATMEL_HSMC_NFC_CFG_PAGESIZE(mtd->writesize) |
+		  ATMEL_HSMC_NFC_CFG_SPARESIZE(mtd->oobsize) |
+		  ATMEL_HSMC_NFC_CFG_RSPARE;
+
+	nand->activecs = &nand->cs[cs];
+	nc = to_hsmc_nand_controller(nand->base.controller);
+	if (nc->cfg == cfg)
+		return;
+
+	regmap_update_bits(nc->base.smc, ATMEL_HSMC_NFC_CFG,
+			   ATMEL_HSMC_NFC_CFG_PAGESIZE_MASK |
+			   ATMEL_HSMC_NFC_CFG_SPARESIZE_MASK |
+			   ATMEL_HSMC_NFC_CFG_RSPARE |
+			   ATMEL_HSMC_NFC_CFG_WSPARE,
+			   cfg);
+	nc->cfg = cfg;
+}
+
+static int atmel_smc_nand_exec_instr(struct atmel_nand *nand,
+				     const struct nand_op_instr *instr)
+{
+	struct atmel_nand_controller *nc;
+	unsigned int i;
+
+	nc = to_nand_controller(nand->base.controller);
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		writeb(instr->ctx.cmd.opcode,
+		       nand->activecs->io.virt + nc->caps->cle_offs);
+		return 0;
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			writeb(instr->ctx.addr.addrs[i],
+			       nand->activecs->io.virt + nc->caps->ale_offs);
+		return 0;
+	case NAND_OP_DATA_IN_INSTR:
+		atmel_nand_data_in(nand, instr->ctx.data.buf.in,
+				   instr->ctx.data.len,
+				   instr->ctx.data.force_8bit);
+		return 0;
+	case NAND_OP_DATA_OUT_INSTR:
+		atmel_nand_data_out(nand, instr->ctx.data.buf.out,
+				    instr->ctx.data.len,
+				    instr->ctx.data.force_8bit);
+		return 0;
+	case NAND_OP_WAITRDY_INSTR:
+		return atmel_nand_waitrdy(nand,
+					  instr->ctx.waitrdy.timeout_ms);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int atmel_smc_nand_exec_op(struct atmel_nand *nand,
+				  const struct nand_operation *op,
+				  bool check_only)
+{
+	struct atmel_nand_controller *nc;
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	nc = to_nand_controller(nand->base.controller);
+	atmel_nand_select_target(nand, op->cs);
+	gpiod_set_value(nand->activecs->csgpio, 0);
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = atmel_smc_nand_exec_instr(nand, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+	gpiod_set_value(nand->activecs->csgpio, 1);
+
+	return ret;
+}
+
+static int atmel_hsmc_exec_cmd_addr(struct nand_chip *chip,
+				    const struct nand_subop *subop)
+{
+	struct atmel_nand *nand = to_atmel_nand(chip);
+	struct atmel_hsmc_nand_controller *nc;
+	unsigned int i, j;
+
+	nc = to_hsmc_nand_controller(chip->controller);
+
+	nc->op.cs = nand->activecs->id;
+	for (i = 0; i < subop->ninstrs; i++) {
+		const struct nand_op_instr *instr = &subop->instrs[i];
+
+		if (instr->type == NAND_OP_CMD_INSTR) {
+			nc->op.cmds[nc->op.ncmds++] = instr->ctx.cmd.opcode;
+			continue;
+		}
+
+		for (j = nand_subop_get_addr_start_off(subop, i);
+		     j < nand_subop_get_num_addr_cyc(subop, i); j++) {
+			nc->op.addrs[nc->op.naddrs] = instr->ctx.addr.addrs[j];
+			nc->op.naddrs++;
+		}
+	}
+
+	return atmel_nfc_exec_op(nc, true);
+}
+
+static int atmel_hsmc_exec_rw(struct nand_chip *chip,
+			      const struct nand_subop *subop)
+{
+	const struct nand_op_instr *instr = subop->instrs;
+	struct atmel_nand *nand = to_atmel_nand(chip);
+
+	if (instr->type == NAND_OP_DATA_IN_INSTR)
+		atmel_nand_data_in(nand, instr->ctx.data.buf.in,
+				   instr->ctx.data.len,
+				   instr->ctx.data.force_8bit);
+	else
+		atmel_nand_data_out(nand, instr->ctx.data.buf.out,
+				    instr->ctx.data.len,
+				    instr->ctx.data.force_8bit);
+
+	return 0;
+}
+
+static int atmel_hsmc_exec_waitrdy(struct nand_chip *chip,
+				   const struct nand_subop *subop)
+{
+	const struct nand_op_instr *instr = subop->instrs;
+	struct atmel_nand *nand = to_atmel_nand(chip);
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
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
+	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_rw,
+		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0)),
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
+	atmel_hsmc_nand_select_target(nand, op->cs);
+	ret = nand_op_parser_exec_op(&nand->base, &atmel_hsmc_op_parser, op,
+				     false);
+
+	return ret;
+}
+
 static void atmel_nfc_copy_to_sram(struct nand_chip *chip, const u8 *buf,
 				   bool oob_required)
 {
@@ -904,6 +1155,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
+	atmel_hsmc_nand_select_target(nand, chip->cur_cs);
 	nc = to_hsmc_nand_controller(chip->controller);
 
 	atmel_nfc_copy_to_sram(chip, buf, false);
@@ -964,6 +1216,7 @@ static int atmel_hsmc_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
+	atmel_hsmc_nand_select_target(nand, chip->cur_cs);
 	nc = to_hsmc_nand_controller(chip->controller);
 
 	/*
@@ -1447,6 +1700,18 @@ static int atmel_nand_setup_data_interface(struct nand_chip *chip, int csline,
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
@@ -1937,6 +2202,7 @@ static int atmel_nand_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops atmel_nand_controller_ops = {
 	.attach_chip = atmel_nand_attach_chip,
 	.setup_data_interface = atmel_nand_setup_data_interface,
+	.exec_op = atmel_nand_exec_op,
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
@@ -2304,6 +2570,7 @@ static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.ecc_init = atmel_hsmc_nand_ecc_init,
 	.nand_init = atmel_hsmc_nand_init,
 	.setup_data_interface = atmel_hsmc_nand_setup_data_interface,
+	.exec_op = atmel_hsmc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_sama5_nc_caps = {
@@ -2370,6 +2637,7 @@ static const struct atmel_nand_controller_ops at91rm9200_nc_ops = {
 	.remove = atmel_smc_nand_controller_remove,
 	.ecc_init = atmel_nand_ecc_init,
 	.nand_init = atmel_smc_nand_init,
+	.exec_op = atmel_smc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_rm9200_nc_caps = {
@@ -2385,6 +2653,7 @@ static const struct atmel_nand_controller_ops atmel_smc_nc_ops = {
 	.ecc_init = atmel_nand_ecc_init,
 	.nand_init = atmel_smc_nand_init,
 	.setup_data_interface = atmel_smc_nand_setup_data_interface,
+	.exec_op = atmel_smc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_sam9260_nc_caps = {
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
