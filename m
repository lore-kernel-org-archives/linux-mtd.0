Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF12C433E9
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8759F64E08
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8759F64E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDy2muJNjTD7CprfkPzQoHSNrP+GVSXF6PQZKov3zy4=; b=KkzDGRwYyrfR8PNBM6u1IFqVR2
	J12uNECX0ST1OGSQflK7v6UT6zFZ/GvG3NDykjQ8ZrCDnOvVHP1rOXU1AorjFSEjGSv9LsU8qrX2O
	P4LchOY9KPAtwgPk3WlVmcoeNN9kRkn3u+deDjR/TK5k23zgptn8pYpFi3WWqcTCtPzKvzaGT9dpy
	dXF+DmB/tPBAPCOHPHw44bLlxSFC4iDPCBrVYCNDQYeObu6pR3V/a0j2MMYOcDpIJ2U605g3lOV6Z
	AtpTXYH5IHIkxbsFyyT10IcsZGaolGoXb9H+F2IIyOfRnS0iMBoAHD83wsXlZO/opQScaHOc8hX+X
	4NYDgXNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OwV-0002Bu-8h; Fri, 29 Jan 2021 08:15:47 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OwP-000296-Pp
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 08:15:43 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 10T8FEbC076586;
 Fri, 29 Jan 2021 16:15:17 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: zhengxunli <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Subject: [PATCH 2/3] spi: mxic: patch for octal DTR mode support
Date: Fri, 29 Jan 2021 16:13:37 +0800
Message-Id: <1611908018-29937-3-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 10T8FEbC076586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031542_289996_87649E96 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 zhengxunli <zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver patch for octal 8D-8D-8D mode support.

Signed-off-by: zhengxunli <zhengxunli@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 96b4182..821328a 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -335,8 +335,8 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
-	if (op->data.buswidth > 4 || op->addr.buswidth > 4 ||
-	    op->dummy.buswidth > 4 || op->cmd.buswidth > 4)
+	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
+	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
 		return false;
 
 	if (op->data.nbytes && op->dummy.nbytes &&
@@ -346,7 +346,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 7)
 		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	return true;
 }
 
 static int mxic_spi_mem_exec_op(struct spi_mem *mem,
@@ -355,14 +355,15 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
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
@@ -374,19 +375,25 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
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
@@ -394,7 +401,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
 	       mxic->regs + HC_CFG);
 
-	ret = mxic_spi_data_xfer(mxic, &opcode, NULL, 1);
+	for (i = 0; i < op->cmd.nbytes; i++)
+		cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
+
+	ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
 	if (ret)
 		goto out;
 
@@ -567,7 +577,8 @@ static int mxic_spi_probe(struct platform_device *pdev)
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
