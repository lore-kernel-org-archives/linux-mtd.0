Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CAAC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26754207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8pPMx2e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="e3Zdf4CN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26754207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BlU1QOIEnDRh4MjN6O2OUPmckLPM2vFsjU2WrWcUyp4=; b=m8pPMx2eDV3uGnFHAeGrVYjw+
	6RVWGgR8T5musFRvtgzeU6Pibd1CF1zrLEY+dDZbxJxLfJVTSJH0ax5ZVik01HSUZ6+7WNlI9jeMK
	syNb0qi2Bsp5hjgo81CDpz4zmdv34FKwHpMvY05Ek6D/zNliRHqqjNvGh1QLuBuXh01thH3WPq+OI
	L3CDTszR9aLrbpHunIapxbgKCAbAmv7A8mIH7xoqgF/OGhbTzSGuMOi73UclZ7Qj+Sg01ug/LerNu
	Y6PORcV93QmPGPWSe0Tf3ONnZhsY/iu8Dp+g0O5vKzri7DsufH3Lin4VIIGDmahXq+rsNm4DVNvlN
	PtAVkBb6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPZ-0006Ne-Mc; Mon, 20 Jul 2020 04:28:21 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPV-0006Me-1D
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219296; x=1626755296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNbaetNUGGofqgduj0cEzPBRG8b7+kIHlkwTUAJUK1k=;
 b=e3Zdf4CN3EA3YSClaUT+8ZDdV7nHV4FnfCu+sjcXZ9ySa2bcwaYSWKMX
 J4jeeXcZ4JiWc7aUFgSGFyOzwqg/Vi2+kdS0Y2mrZWNhnW4JtBtgbO5Gf
 KHhFPMZt0YUScEf01UJItzb10zQThcBPVuCtonQnhlAoHjzwKlEaKd6Yh
 0iEvEJq0LhgZD9kRnUzciGRutAF3/9GTxiP//+7koTfxubc5QJ5YRB5qx
 X04TukBw1GxVVsy9qnm1HYvveCE/mR1Ub6QPMVdHM26iYBgAt8qetFW2E
 oS+JY7h+HLww+5viw3TnxOs4JiyBoIFlmV9j1laB2tCfNThloxOcWPKCt g==;
IronPort-SDR: WBa7REBSTljBWahph5MBtohtNrQv2Xmu9eFYSlQ4TRm2I4v5zVWNzh9nEHmoIL6DIxBpgrlWBw
 LSpKRhePN1UJ9REzMTZaU9SNwHb/0GSIpuHx8WuABKphJLPfeBDApBbsldg8kZ+6+LiZTed8o2
 lzzsXbVdRyECIlNpylzpA+wgNxIr9y76GovNA1pDt9w6Bxr+KJ4cYnYXaYm7QZLvI6Pr5qaTfl
 fvIO9b8DydA2dmfkwguRSWuLzh7Yg//wmdhHnCV+FywlUdWzYa1uJ03fyKecU+jm6tHodweiKn
 f/0=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="80520598"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:27:37 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 5/6] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Mon, 20 Jul 2020 07:27:58 +0300
Message-ID: <20200720042759.1482341-6-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002817_391173_75460FCD 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Both SMC and HSMC are converted to exec_op().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 269 +++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 3fe0b3caa5b9..ffeda6a1d1b3 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -202,6 +202,8 @@ struct atmel_nand_controller_ops {
 	int (*ecc_init)(struct nand_chip *chip);
 	int (*setup_interface)(struct atmel_nand *nand, int csline,
 			       const struct nand_interface_config *conf);
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
@@ -1447,6 +1700,18 @@ static int atmel_nand_setup_interface(struct nand_chip *chip, int csline,
 	return nc->caps->ops->setup_interface(nand, csline, conf);
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
 	.setup_interface = atmel_nand_setup_interface,
+	.exec_op = atmel_nand_exec_op,
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
@@ -2304,6 +2570,7 @@ static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.ecc_init = atmel_hsmc_nand_ecc_init,
 	.nand_init = atmel_hsmc_nand_init,
 	.setup_interface = atmel_hsmc_nand_setup_interface,
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
 	.setup_interface = atmel_smc_nand_setup_interface,
+	.exec_op = atmel_smc_nand_exec_op,
 };
 
 static const struct atmel_nand_controller_caps atmel_sam9260_nc_caps = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
