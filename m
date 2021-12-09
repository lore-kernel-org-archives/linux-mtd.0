Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD671C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA2SjXjh7SFEoq0q6mRh3YWtHh/F2yHJTFi1GGmcotU=; b=LNU6McAfP8hmKH
	JVQyTMajTB4KkHfNOhvWtpJ2+9W/8zLSq55PNYpKKHN9iv511OyO6nhzyARzd/tSgSmUnU8Wbaw1r
	wNrgUYoiIMwV4PKbjpzLbBbPqTY8qGng9/zCUdkcQbzQ7LiKXG1wEM8JRJIRznYILViYxhJXyJdNl
	Dy7qugBxdJByoByx/ZROxMpDCCqABnHExY0a9KlkHhO5pSzwPW/lT5llThiXs31QRFuUlb553jycB
	Wt5AQ/Rt1PWr/ArDggzcVok3kqOJxLxWzLnilbyo56i9Qj7NgDUlyYcBisQkZd+XtWQLsLwz6dbou
	5EhSbtQC16JHsqFe0Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNV6-00H39D-HF; Thu, 09 Dec 2021 17:46:36 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPl-00H1I8-VQ
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:41:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7FFF524000D;
 Thu,  9 Dec 2021 17:41:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 09/12] spi: mxic: Create a helper to ease the start of an
 operation
Date: Thu,  9 Dec 2021 18:40:43 +0100
Message-Id: <20211209174046.535229-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209174046.535229-1-miquel.raynal@bootlin.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094106_207026_95D8BE62 
X-CRM114-Status: GOOD (  10.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Create the mxic_spi_mem_prep_op_cfg() helper to provide the content to
write to the register controlling the next IO command. This helper will
soon be used by the dirmap implementation and having this code
factorized out earlier will clarify this addition.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mxic.c | 53 +++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 068543c40ce7..3c4e64cbe812 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -296,6 +296,33 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
 	       HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1);
 }
 
+static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op)
+{
+	u32 cfg = OP_CMD_BYTES(op->cmd.nbytes) |
+		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
+		  (op->cmd.dtr ? OP_CMD_DDR : 0);
+
+	if (op->addr.nbytes)
+		cfg |= OP_ADDR_BYTES(op->addr.nbytes) |
+		       OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
+		       (op->addr.dtr ? OP_ADDR_DDR : 0);
+
+	if (op->dummy.nbytes)
+		cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
+
+	if (op->data.nbytes) {
+		cfg |= OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
+		       (op->data.dtr ? OP_DATA_DDR : 0);
+		if (op->data.dir == SPI_MEM_DATA_IN) {
+			cfg |= OP_READ;
+			if (op->data.dtr)
+				cfg |= OP_DQS_EN;
+		}
+	}
+
+	return cfg;
+}
+
 static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 			      void *rxbuf, unsigned int len)
 {
@@ -374,7 +401,6 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 {
 	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
 	int i, ret;
-	u32 ss_ctrl;
 	u8 addr[8], cmd[2];
 
 	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
@@ -386,29 +412,8 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
 
-	ss_ctrl = OP_CMD_BYTES(op->cmd.nbytes) |
-		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
-		  (op->cmd.dtr ? OP_CMD_DDR : 0);
-
-	if (op->addr.nbytes)
-		ss_ctrl |= OP_ADDR_BYTES(op->addr.nbytes) |
-			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
-			   (op->addr.dtr ? OP_ADDR_DDR : 0);
-
-	if (op->dummy.nbytes)
-		ss_ctrl |= OP_DUMMY_CYC(op->dummy.nbytes);
-
-	if (op->data.nbytes) {
-		ss_ctrl |= OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
-			   (op->data.dtr ? OP_DATA_DDR : 0);
-		if (op->data.dir == SPI_MEM_DATA_IN) {
-			ss_ctrl |= OP_READ;
-			if (op->data.dtr)
-				ss_ctrl |= OP_DQS_EN;
-		}
-	}
-
-	writel(ss_ctrl, mxic->regs + SS_CTRL(mem->spi->chip_select));
+	writel(mxic_spi_mem_prep_op_cfg(op),
+	       mxic->regs + SS_CTRL(mem->spi->chip_select));
 
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
 	       mxic->regs + HC_CFG);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
