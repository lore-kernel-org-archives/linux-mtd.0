Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7112FC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:04:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6D220758
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FM+nkF6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E6D220758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Ij2xDD3ORAAVhEi7bN+vFPH6Y4CZ2rIDPd02eEgjJ4=; b=FM+nkF6Nbj65n1
	5PBylRWeTQzYLhtLvnyFTWYOQRWqJytkaA4iMhXMS2p9YIEMVP9Bl8GKvVh1SiHGx65wjbOoLZ3En
	nfzeqH1XoA5i7YGLq+77R5fu34f8F+C0C9EsXH2X/tWtBXrfFrjXQdH2fLGzwG9aCXYUxmVxOudrj
	3J3ATS9lB6oHfc6DvCFttoWhUkMYVvED48MFyh5pl/tOEmdwIr+VqhYzLqsAWKCNqICSUXgUeNyXE
	tkJseOZxtPsEyAK4IRihA3odNUOt3OiQt1dIy5YVoFXqzoUIfxK767pfe/82coqXhnuV/Zmx4RTMq
	W5iNTgOZd9dz3SF04DoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jajBC-0001Yb-0b; Mon, 18 May 2020 17:03:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jajAn-0001FU-OV; Mon, 18 May 2020 17:03:32 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9D5F32A0FD2;
 Mon, 18 May 2020 18:03:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: mtk: Convert the driver to exec_op()
Date: Mon, 18 May 2020 19:03:21 +0200
Message-Id: <20200518170321.321697-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_100330_076962_758B6A20 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Let's convert the driver to exec_op() to have one less driver relying
on the legacy interface.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 116 +++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index e7ec30e784fd..f3b519bef0ea 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -387,44 +387,6 @@ static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
 	return 0;
 }
 
-static void mtk_nfc_select_chip(struct nand_chip *nand, int chip)
-{
-	struct mtk_nfc *nfc = nand_get_controller_data(nand);
-	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
-
-	if (chip < 0)
-		return;
-
-	mtk_nfc_hw_runtime_config(nand_to_mtd(nand));
-
-	nfi_writel(nfc, mtk_nand->sels[chip], NFI_CSEL);
-}
-
-static int mtk_nfc_dev_ready(struct nand_chip *nand)
-{
-	struct mtk_nfc *nfc = nand_get_controller_data(nand);
-
-	if (nfi_readl(nfc, NFI_STA) & STA_BUSY)
-		return 0;
-
-	return 1;
-}
-
-static void mtk_nfc_cmd_ctrl(struct nand_chip *chip, int dat,
-			     unsigned int ctrl)
-{
-	struct mtk_nfc *nfc = nand_get_controller_data(chip);
-
-	if (ctrl & NAND_ALE) {
-		mtk_nfc_send_address(nfc, dat);
-	} else if (ctrl & NAND_CLE) {
-		mtk_nfc_hw_reset(nfc);
-
-		nfi_writew(nfc, CNFG_OP_CUST, NFI_CNFG);
-		mtk_nfc_send_command(nfc, dat);
-	}
-}
-
 static inline void mtk_nfc_wait_ioready(struct mtk_nfc *nfc)
 {
 	int rc;
@@ -501,6 +463,74 @@ static void mtk_nfc_write_buf(struct nand_chip *chip, const u8 *buf, int len)
 		mtk_nfc_write_byte(chip, buf[i]);
 }
 
+static int mtk_nfc_exec_instr(struct nand_chip *chip,
+			      const struct nand_op_instr *instr)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	unsigned int i;
+	u32 status;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		mtk_nfc_send_command(nfc, instr->ctx.cmd.opcode);
+		return 0;
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			mtk_nfc_send_address(nfc, instr->ctx.addr.addrs[i]);
+		return 0;
+	case NAND_OP_DATA_IN_INSTR:
+		mtk_nfc_read_buf(chip, instr->ctx.data.buf.in,
+				 instr->ctx.data.len);
+		return 0;
+	case NAND_OP_DATA_OUT_INSTR:
+		mtk_nfc_write_buf(chip, instr->ctx.data.buf.out,
+				  instr->ctx.data.len);
+		return 0;
+	case NAND_OP_WAITRDY_INSTR:
+		return readl_poll_timeout(nfc->regs + NFI_STA, status,
+					  status & STA_BUSY, 20,
+					  instr->ctx.waitrdy.timeout_ms);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static void mtk_nfc_select_target(struct nand_chip *nand, unsigned int cs)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(nand);
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
+
+	mtk_nfc_hw_runtime_config(nand_to_mtd(nand));
+
+	nfi_writel(nfc, mtk_nand->sels[cs], NFI_CSEL);
+}
+
+static int mtk_nfc_exec_op(struct nand_chip *chip,
+			   const struct nand_operation *op,
+			   bool check_only)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	mtk_nfc_hw_reset(nfc);
+	nfi_writew(nfc, CNFG_OP_CUST, NFI_CNFG);
+	mtk_nfc_select_target(chip, op->cs);
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = mtk_nfc_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 					const struct nand_data_interface *conf)
 {
@@ -803,6 +833,7 @@ static int mtk_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	u32 reg;
 	int ret;
 
+	mtk_nfc_select_target(chip, chip->cur_cs);
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 
 	if (!raw) {
@@ -920,6 +951,7 @@ static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	u8 *buf;
 	int rc;
 
+	mtk_nfc_select_target(chip, chip->cur_cs);
 	start = data_offs / chip->ecc.size;
 	end = DIV_ROUND_UP(data_offs + readlen, chip->ecc.size);
 
@@ -1326,6 +1358,7 @@ static int mtk_nfc_attach_chip(struct nand_chip *chip)
 static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.attach_chip = mtk_nfc_attach_chip,
 	.setup_data_interface = mtk_nfc_setup_data_interface,
+	.exec_op = mtk_nfc_exec_op,
 };
 
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
@@ -1381,13 +1414,6 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand_set_controller_data(nand, nfc);
 
 	nand->options |= NAND_USES_DMA | NAND_SUBPAGE_READ;
-	nand->legacy.dev_ready = mtk_nfc_dev_ready;
-	nand->legacy.select_chip = mtk_nfc_select_chip;
-	nand->legacy.write_byte = mtk_nfc_write_byte;
-	nand->legacy.write_buf = mtk_nfc_write_buf;
-	nand->legacy.read_byte = mtk_nfc_read_byte;
-	nand->legacy.read_buf = mtk_nfc_read_buf;
-	nand->legacy.cmd_ctrl = mtk_nfc_cmd_ctrl;
 
 	/* set default mode in case dt entry is missing */
 	nand->ecc.mode = NAND_ECC_HW;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
