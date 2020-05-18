Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B0CC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3A720709
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nidAZcCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3A720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8k7kmFTkyEzZvcP2n9D+MkXfC77cEfljXLkYjSR+v1M=; b=nidAZcCNgSVlEx
	/Pm1x52Nw20fl89zjqhLdnsW7RNh5v3tqJ4roE6oueoiarV6NW2GiFbreyqaUBHcl8o5aV1lNS7Q2
	dMsJvo/hDjO61XJNwwMEvBl4oI61+jJd4uqkn1QB53DaMOyrNNJbrnv+360CqkDa50PU9xro9akHg
	wLMwAoB1qoIahqD+hFhK0gejD10eOakiGyisr2/Uv3ZRHHtOvvD6eTbU/zWHwblgIPhay4tLa7DFc
	o0T2laOWVTdURrAbpgSH7/8rKcaQRz5NX5X6j3wX7UUmLlLhBJlYJfizJP7KqkGcj3ML+W8qlBDnM
	1BDiarOTgJnO4ddUkEDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jajGW-0004vi-Sf; Mon, 18 May 2020 17:09:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jajGT-0004v7-3q
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 17:09:22 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CFE372A0815;
 Mon, 18 May 2020 18:09:15 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: tango: Convert the driver to exec_op()
Date: Mon, 18 May 2020 19:09:12 +0200
Message-Id: <20200518170912.328988-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_100921_421015_7BBE757A 
X-CRM114-Status: GOOD (  16.39  )
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

Let's convert the driver to exec_op() to have one less driver relying
on the legacy interface.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/tango_nand.c | 145 ++++++++++++++++++------------
 1 file changed, 89 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/tango_nand.c b/drivers/mtd/nand/raw/tango_nand.c
index b92de603e6db..fee31598e6b0 100644
--- a/drivers/mtd/nand/raw/tango_nand.c
+++ b/drivers/mtd/nand/raw/tango_nand.c
@@ -113,53 +113,11 @@ struct tango_chip {
 
 #define TIMING(t0, t1, t2, t3) ((t0) << 24 | (t1) << 16 | (t2) << 8 | (t3))
 
-static void tango_cmd_ctrl(struct nand_chip *chip, int dat, unsigned int ctrl)
-{
-	struct tango_chip *tchip = to_tango_chip(chip);
-
-	if (ctrl & NAND_CLE)
-		writeb_relaxed(dat, tchip->base + PBUS_CMD);
-
-	if (ctrl & NAND_ALE)
-		writeb_relaxed(dat, tchip->base + PBUS_ADDR);
-}
-
-static int tango_dev_ready(struct nand_chip *chip)
-{
-	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
-
-	return readl_relaxed(nfc->pbus_base + PBUS_CS_CTRL) & PBUS_IORDY;
-}
-
-static u8 tango_read_byte(struct nand_chip *chip)
-{
-	struct tango_chip *tchip = to_tango_chip(chip);
-
-	return readb_relaxed(tchip->base + PBUS_DATA);
-}
-
-static void tango_read_buf(struct nand_chip *chip, u8 *buf, int len)
-{
-	struct tango_chip *tchip = to_tango_chip(chip);
-
-	ioread8_rep(tchip->base + PBUS_DATA, buf, len);
-}
-
-static void tango_write_buf(struct nand_chip *chip, const u8 *buf, int len)
-{
-	struct tango_chip *tchip = to_tango_chip(chip);
-
-	iowrite8_rep(tchip->base + PBUS_DATA, buf, len);
-}
-
-static void tango_select_chip(struct nand_chip *chip, int idx)
+static void tango_select_target(struct nand_chip *chip, unsigned int cs)
 {
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
 	struct tango_chip *tchip = to_tango_chip(chip);
 
-	if (idx < 0)
-		return; /* No "chip unselect" function */
-
 	writel_relaxed(tchip->timing1, nfc->reg_base + NFC_TIMING1);
 	writel_relaxed(tchip->timing2, nfc->reg_base + NFC_TIMING2);
 	writel_relaxed(tchip->xfer_cfg, nfc->reg_base + NFC_XFER_CFG);
@@ -168,6 +126,69 @@ static void tango_select_chip(struct nand_chip *chip, int idx)
 	writel_relaxed(tchip->bb_cfg, nfc->reg_base + NFC_BB_CFG);
 }
 
+static int tango_waitrdy(struct nand_chip *chip, unsigned int timeout_ms)
+{
+	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
+	u32 status;
+
+	return readl_relaxed_poll_timeout(nfc->pbus_base + PBUS_CS_CTRL,
+					  status, status & PBUS_IORDY, 20,
+					  timeout_ms);
+}
+
+static int tango_exec_instr(struct nand_chip *chip,
+			    const struct nand_op_instr *instr)
+{
+	struct tango_chip *tchip = to_tango_chip(chip);
+	unsigned int i;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		writeb_relaxed(instr->ctx.cmd.opcode, tchip->base + PBUS_CMD);
+		return 0;
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			writeb_relaxed(instr->ctx.addr.addrs[i],
+				       tchip->base + PBUS_ADDR);
+		return 0;
+	case NAND_OP_DATA_IN_INSTR:
+		ioread8_rep(tchip->base + PBUS_DATA, instr->ctx.data.buf.in,
+			    instr->ctx.data.len);
+		return 0;
+	case NAND_OP_DATA_OUT_INSTR:
+		iowrite8_rep(tchip->base + PBUS_DATA, instr->ctx.data.buf.out,
+			     instr->ctx.data.len);
+		return 0;
+	case NAND_OP_WAITRDY_INSTR:
+		return tango_waitrdy(chip,
+				     instr->ctx.waitrdy.timeout_ms);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int tango_exec_op(struct nand_chip *chip,
+			 const struct nand_operation *op,
+			 bool check_only)
+{
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	tango_select_target(chip, op->cs);
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = tango_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 /*
  * The controller does not check for bitflips in erased pages,
  * therefore software must check instead.
@@ -279,6 +300,7 @@ static int tango_read_page(struct nand_chip *chip, u8 *buf,
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
 	int err, res, len = mtd->writesize;
 
+	tango_select_target(chip, chip->cur_cs);
 	if (oob_required)
 		chip->ecc.read_oob(chip, page);
 
@@ -300,22 +322,30 @@ static int tango_write_page(struct nand_chip *chip, const u8 *buf,
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
-	int err, status, len = mtd->writesize;
+	const struct nand_sdr_timings *timings;
+	int err, len = mtd->writesize;
+	u8 status;
 
 	/* Calling tango_write_oob() would send PAGEPROG twice */
 	if (oob_required)
 		return -ENOTSUPP;
 
+	tango_select_target(chip, chip->cur_cs);
 	writel_relaxed(0xffffffff, nfc->mem_base + METADATA);
 	err = do_dma(nfc, DMA_TO_DEVICE, NFC_WRITE, buf, len, page);
 	if (err)
 		return err;
 
-	status = chip->legacy.waitfunc(chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
+	timings = nand_get_sdr_timings(&chip->data_interface);
+	err = tango_waitrdy(chip, PSEC_TO_MSEC(timings->tR_max));
+	if (err)
+		return err;
 
-	return 0;
+	err = nand_status_op(chip, &status);
+	if (err)
+		return err;
+
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 static void aux_read(struct nand_chip *chip, u8 **buf, int len, int *pos)
@@ -326,7 +356,9 @@ static void aux_read(struct nand_chip *chip, u8 **buf, int len, int *pos)
 		/* skip over "len" bytes */
 		nand_change_read_column_op(chip, *pos, NULL, 0, false);
 	} else {
-		tango_read_buf(chip, *buf, len);
+		struct tango_chip *tchip = to_tango_chip(chip);
+
+		ioread8_rep(tchip->base + PBUS_DATA, *buf, len);
 		*buf += len;
 	}
 }
@@ -339,7 +371,9 @@ static void aux_write(struct nand_chip *chip, const u8 **buf, int len, int *pos)
 		/* skip over "len" bytes */
 		nand_change_write_column_op(chip, *pos, NULL, 0, false);
 	} else {
-		tango_write_buf(chip, *buf, len);
+		struct tango_chip *tchip = to_tango_chip(chip);
+
+		iowrite8_rep(tchip->base + PBUS_DATA, *buf, len);
 		*buf += len;
 	}
 }
@@ -420,6 +454,7 @@ static void raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
 static int tango_read_page_raw(struct nand_chip *chip, u8 *buf,
 			       int oob_required, int page)
 {
+	tango_select_target(chip, chip->cur_cs);
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	raw_read(chip, buf, chip->oob_poi);
 	return 0;
@@ -428,6 +463,7 @@ static int tango_read_page_raw(struct nand_chip *chip, u8 *buf,
 static int tango_write_page_raw(struct nand_chip *chip, const u8 *buf,
 				int oob_required, int page)
 {
+	tango_select_target(chip, chip->cur_cs);
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	raw_write(chip, buf, chip->oob_poi);
 	return nand_prog_page_end_op(chip);
@@ -435,6 +471,7 @@ static int tango_write_page_raw(struct nand_chip *chip, const u8 *buf,
 
 static int tango_read_oob(struct nand_chip *chip, int page)
 {
+	tango_select_target(chip, chip->cur_cs);
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	raw_read(chip, NULL, chip->oob_poi);
 	return 0;
@@ -442,6 +479,7 @@ static int tango_read_oob(struct nand_chip *chip, int page)
 
 static int tango_write_oob(struct nand_chip *chip, int page)
 {
+	tango_select_target(chip, chip->cur_cs);
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	raw_write(chip, NULL, chip->oob_poi);
 	return nand_prog_page_end_op(chip);
@@ -528,6 +566,7 @@ static int tango_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops tango_controller_ops = {
 	.attach_chip = tango_attach_chip,
 	.setup_data_interface = tango_set_timings,
+	.exec_op = tango_exec_op,
 };
 
 static int chip_init(struct device *dev, struct device_node *np)
@@ -562,12 +601,6 @@ static int chip_init(struct device *dev, struct device_node *np)
 	ecc = &chip->ecc;
 	mtd = nand_to_mtd(chip);
 
-	chip->legacy.read_byte = tango_read_byte;
-	chip->legacy.write_buf = tango_write_buf;
-	chip->legacy.read_buf = tango_read_buf;
-	chip->legacy.select_chip = tango_select_chip;
-	chip->legacy.cmd_ctrl = tango_cmd_ctrl;
-	chip->legacy.dev_ready = tango_dev_ready;
 	chip->options = NAND_USES_DMA |
 			NAND_NO_SUBPAGE_WRITE |
 			NAND_WAIT_TCCS;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
