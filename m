Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69C9C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B1DA20758
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 16:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ql1/ibzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B1DA20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoaJiHJY3tJ5WN9qZGxBddQjA8YkNTmdLdmsZFAxGDg=; b=Ql1/ibzpoOrglx
	1xbKs8jJow8Jw9EI5HBd0183HiTcFuwDgQmZ4tSA7UA1EgPHPJrR4hZqOhFXM5LxWwEbGgiCwM6vq
	SUGDMEysHqY4PwMSSC5HBs2eJCmtRSEuSCKfTg6lRl5Sl7MpC6Bxuyl5y3PsuAEZxBDPFfDk+TujZ
	hFvje/hsAFqgYhZQ23fin5oXQlzt1bEKxOo/Ipiz8KqbVt99NYc2TMc/Hpc816cj0J/jnS48U0JrX
	WlqmlBDNA9Vz8tOMdI51ADODXKIVdUxfpknswbPQDwuwsEuF7nn1ua+i4NybIOpRaAsRsDP70ytfF
	X2POYBzfkGlNMpFvhnTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaj4K-0004LW-8D; Mon, 18 May 2020 16:56:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaj4H-0004Kx-TY
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 16:56:47 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7B8AA2A1010;
 Mon, 18 May 2020 17:56:43 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
Date: Mon, 18 May 2020 18:56:40 +0200
Message-Id: <20200518165640.312220-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_095646_211134_94011D2A 
X-CRM114-Status: GOOD (  16.49  )
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
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   | 136 ++++++++++--------
 1 file changed, 80 insertions(+), 56 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index e7bd845fdbf5..dcecd54af20b 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -27,9 +27,6 @@
 
 #define DRV_NAME	"ingenic-nand"
 
-/* Command delay when there is no R/B pin. */
-#define RB_DELAY_US	100
-
 struct jz_soc_info {
 	unsigned long data_offset;
 	unsigned long addr_offset;
@@ -49,7 +46,6 @@ struct ingenic_nfc {
 	struct nand_controller controller;
 	unsigned int num_banks;
 	struct list_head chips;
-	int selected;
 	struct ingenic_nand_cs cs[];
 };
 
@@ -142,51 +138,6 @@ static const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
 	.free = jz4725b_ooblayout_free,
 };
 
-static void ingenic_nand_select_chip(struct nand_chip *chip, int chipnr)
-{
-	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
-	struct ingenic_nfc *nfc = to_ingenic_nfc(nand->chip.controller);
-	struct ingenic_nand_cs *cs;
-
-	/* Ensure the currently selected chip is deasserted. */
-	if (chipnr == -1 && nfc->selected >= 0) {
-		cs = &nfc->cs[nfc->selected];
-		jz4780_nemc_assert(nfc->dev, cs->bank, false);
-	}
-
-	nfc->selected = chipnr;
-}
-
-static void ingenic_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
-				  unsigned int ctrl)
-{
-	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
-	struct ingenic_nfc *nfc = to_ingenic_nfc(nand->chip.controller);
-	struct ingenic_nand_cs *cs;
-
-	if (WARN_ON(nfc->selected < 0))
-		return;
-
-	cs = &nfc->cs[nfc->selected];
-
-	jz4780_nemc_assert(nfc->dev, cs->bank, ctrl & NAND_NCE);
-
-	if (cmd == NAND_CMD_NONE)
-		return;
-
-	if (ctrl & NAND_ALE)
-		writeb(cmd, cs->base + nfc->soc_info->addr_offset);
-	else if (ctrl & NAND_CLE)
-		writeb(cmd, cs->base + nfc->soc_info->cmd_offset);
-}
-
-static int ingenic_nand_dev_ready(struct nand_chip *chip)
-{
-	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
-
-	return !gpiod_get_value_cansleep(nand->busy_gpio);
-}
-
 static void ingenic_nand_ecc_hwctl(struct nand_chip *chip, int mode)
 {
 	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
@@ -298,8 +249,88 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
+static int ingenic_nand_exec_instr(struct nand_chip *chip,
+				   struct ingenic_nand_cs *cs,
+				   const struct nand_op_instr *instr)
+{
+	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
+	struct ingenic_nfc *nfc = to_ingenic_nfc(chip->controller);
+	unsigned int i;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		writeb(instr->ctx.cmd.opcode,
+		       cs->base + nfc->soc_info->cmd_offset);
+		return 0;
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			writeb(instr->ctx.addr.addrs[i],
+			       cs->base + nfc->soc_info->cmd_offset);
+		return 0;
+	case NAND_OP_DATA_IN_INSTR:
+		if (instr->ctx.data.force_8bit ||
+		    !(chip->options & NAND_BUSWIDTH_16))
+			ioread8_rep(cs->base + nfc->soc_info->data_offset,
+				    instr->ctx.data.buf.in,
+				    instr->ctx.data.len);
+		else
+			ioread16_rep(cs->base + nfc->soc_info->data_offset,
+				     instr->ctx.data.buf.in,
+				     instr->ctx.data.len);
+		return 0;
+	case NAND_OP_DATA_OUT_INSTR:
+		if (instr->ctx.data.force_8bit ||
+		    !(chip->options & NAND_BUSWIDTH_16))
+			iowrite8_rep(cs->base + nfc->soc_info->data_offset,
+				     instr->ctx.data.buf.out,
+				     instr->ctx.data.len);
+		else
+			iowrite16_rep(cs->base + nfc->soc_info->data_offset,
+				      instr->ctx.data.buf.out,
+				      instr->ctx.data.len);
+		return 0;
+	case NAND_OP_WAITRDY_INSTR:
+		if (!nand->busy_gpio)
+			return nand_soft_waitrdy(chip,
+						 instr->ctx.waitrdy.timeout_ms);
+
+		return nand_gpio_waitrdy(chip, nand->busy_gpio,
+					 instr->ctx.waitrdy.timeout_ms);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int ingenic_nand_exec_op(struct nand_chip *chip,
+				const struct nand_operation *op,
+				bool check_only)
+{
+	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
+	struct ingenic_nfc *nfc = to_ingenic_nfc(nand->chip.controller);
+	struct ingenic_nand_cs *cs;
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	cs = &nfc->cs[op->cs];
+	jz4780_nemc_assert(nfc->dev, cs->bank, true);
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = ingenic_nand_exec_instr(chip, cs, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+	jz4780_nemc_assert(nfc->dev, cs->bank, false);
+
+	return ret;
+}
+
 static const struct nand_controller_ops ingenic_nand_controller_ops = {
 	.attach_chip = ingenic_nand_attach_chip,
+	.exec_op = ingenic_nand_exec_op,
 };
 
 static int ingenic_nand_init_chip(struct platform_device *pdev,
@@ -339,8 +370,6 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 		ret = PTR_ERR(nand->busy_gpio);
 		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
 		return ret;
-	} else if (nand->busy_gpio) {
-		nand->chip.legacy.dev_ready = ingenic_nand_dev_ready;
 	}
 
 	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
@@ -359,12 +388,7 @@ static int ingenic_nand_init_chip(struct platform_device *pdev,
 		return -ENOMEM;
 	mtd->dev.parent = dev;
 
-	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
-	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
-	chip->legacy.chip_delay = RB_DELAY_US;
 	chip->options = NAND_NO_SUBPAGE_WRITE;
-	chip->legacy.select_chip = ingenic_nand_select_chip;
-	chip->legacy.cmd_ctrl = ingenic_nand_cmd_ctrl;
 	chip->ecc.mode = NAND_ECC_HW;
 	chip->controller = &nfc->controller;
 	nand_set_flash_node(chip, np);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
