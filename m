Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2140EC43460
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:23:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F9E6143B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 08:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F9E6143B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKSWLyDB6D9540jAmuAr2oZTg+WPMByaONb4BZpooqQ=; b=cI8WYt4kqdh7j0FbrlYVtDcVrD
	4BbK0HIyVtpyrOw7kpN7rUIUQdb0ahaAxlw9nwujTFHU7woDAMwR6FIihlBXQFPtgEVxphTeKFNO0
	OZK3YXxH0b813z0b/omMYC4zoXL0avMM7fRPnxF0HAyCq6wnrsrpKBptVKSjU6T5thvTYl93z/4m2
	2syBjZEAoXybMOuMU0qwvmwdCuvBfgLBSj0LPLlP8wtG/WOnhlVasy3ftm2bdALXCcwFWmrDCFOD5
	UckuMHZE1vs+Ieejf0DzP+o2hLKXR0Tj+po9g94Sg++TxXUlYEnvnpbprc/LTRHpTzsb/OPx77+QK
	Ry4hU3xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1BK-00Dc1x-Nr; Mon, 10 May 2021 08:22:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1B5-00Dc0j-3f
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 08:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zvruZHn2zmJSpkiHgXkR8SUNBMHY/XbIljGK8dNgW88=; b=gAcBmMzgdJmqH8bAzRyVQtvssB
 A3Gd9oN3yNn/XMSJNtjWuK1GJBsJ4tZ+qmHwnxdqYGz4AxGco97cRhwVndQSh4OxGvD5DlFP8sHF/
 FHQaqdCeB3t6rdv2Q4u3gDZPR665QO9RBqaoDKgsSABrvWSqE2mxhwPXD14wPZ9bIE8ZlBEnx/q6o
 pqdh5AgY15sXGyKGv3HpZ/UrbP8/EY301qAxeyRYLzESfIBfjedv/qUYLH/T5VwDZJEuSSLLWYF1V
 y2UQvZng6atX4ZBA722SEXAornuRIEnX14yrOWm7fwhLgqd6VfCDDwwyqziw0llYKyZOdcftyczQo
 3ZrW2Beg==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1B1-008PNi-PD
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 08:22:09 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG3.macronix.com with ESMTP id 14A8Ldmo031761;
 Mon, 10 May 2021 16:21:47 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 broonie@kernel.org, jaimeliao@mxic.com.tw,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v4 2/2] spi: mxic: patch for octal DTR mode support
Date: Mon, 10 May 2021 16:20:36 +0800
Message-Id: <1620634836-13181-3-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1620634836-13181-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1620634836-13181-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 14A8Ldmo031761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_012208_087829_958D4773 
X-CRM114-Status: GOOD (  15.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver patch for octal DTR mode support.

Owing to the spi_mem_default_supports_op() is not support dtr
operation. Based on Pratyush patch "spi: spi-mem: add spi_mem_dtr
_supports_op()" add spi_mem_dtr_supports_op() to support dtr and
keep checking the buswidth and command bytes.

Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 96b4182..32e757a 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -335,8 +335,10 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
-	if (op->data.buswidth > 4 || op->addr.buswidth > 4 ||
-	    op->dummy.buswidth > 4 || op->cmd.buswidth > 4)
+	bool all_false;
+
+	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
+	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
 		return false;
 
 	if (op->data.nbytes && op->dummy.nbytes &&
@@ -346,7 +348,13 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 7)
 		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
+		    !op->data.dtr;
+
+	if (all_false)
+		return spi_mem_default_supports_op(mem, op);
+	else
+		return spi_mem_dtr_supports_op(mem, op);
 }
 
 static int mxic_spi_mem_exec_op(struct spi_mem *mem,
@@ -355,14 +363,15 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
 	int nio = 1, i, ret;
 	u32 ss_ctrl;
-	u8 addr[8];
-	u8 opcode = op->cmd.opcode;
+	u8 addr[8], cmd[2];
 
 	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
 	if (ret)
 		return ret;
 
-	if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
+	if (mem->spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
+		nio = 8;
+	else if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
 		nio = 4;
 	else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
 		nio = 2;
@@ -374,19 +383,25 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	       mxic->regs + HC_CFG);
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
 
-	ss_ctrl = OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
+	ss_ctrl = OP_CMD_BYTES(op->cmd.nbytes) |
+		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
+		  (op->cmd.dtr ? OP_CMD_DDR : 0);
 
 	if (op->addr.nbytes)
 		ss_ctrl |= OP_ADDR_BYTES(op->addr.nbytes) |
-			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
+			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
+			   (op->addr.dtr ? OP_ADDR_DDR : 0);
 
 	if (op->dummy.nbytes)
 		ss_ctrl |= OP_DUMMY_CYC(op->dummy.nbytes);
 
 	if (op->data.nbytes) {
-		ss_ctrl |= OP_DATA_BUSW(fls(op->data.buswidth) - 1);
+		ss_ctrl |= OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
+			   (op->data.dtr ? OP_DATA_DDR : 0);
 		if (op->data.dir == SPI_MEM_DATA_IN)
 			ss_ctrl |= OP_READ;
+			if (op->data.dtr)
+				ss_ctrl |= OP_DQS_EN;
 	}
 
 	writel(ss_ctrl, mxic->regs + SS_CTRL(mem->spi->chip_select));
@@ -394,7 +409,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
 	       mxic->regs + HC_CFG);
 
-	ret = mxic_spi_data_xfer(mxic, &opcode, NULL, 1);
+	for (i = 0; i < op->cmd.nbytes; i++)
+		cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
+
+	ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
 	if (ret)
 		goto out;
 
@@ -567,7 +585,8 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
 	master->mode_bits = SPI_CPOL | SPI_CPHA |
 			SPI_RX_DUAL | SPI_TX_DUAL |
-			SPI_RX_QUAD | SPI_TX_QUAD;
+			SPI_RX_QUAD | SPI_TX_QUAD |
+			SPI_RX_OCTAL | SPI_TX_OCTAL;
 
 	mxic_spi_hw_init(mxic);
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
