Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E61C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D2920811
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJbGcOC2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H9aO8HQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D2920811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TGu8zOkZBgniiHyuk2kTgmGnrUxX6EquzAz4o6/nW2U=; b=EJbGcOC21S/Dw0HOv0MHd29rl+
	BboZzPFgn4mRjJJ51+oQiIWAk/RPdtw2SovvYFmt5X/8X08bzeVWng73gEyw9+1oE9jRawtDLnDIU
	U8bShIuBWE1DUrTXSPYynJMFPzPiRf9PPIP6HluZxWLefggUfw/dE13P2khXuCvq1xNRjhnOKptoT
	mbXF3oAqMdaYzConOoYMQ4zZYi/cBQcuAneGx5RxI4vLB9vSDSZsPsd3aPt0K5mNMXZNT+w94udQZ
	4mkE/MM9cZX0/l94Z7jOeFvroKa8qpAxXevXutxNX6OYlPGInb776J5aXdBr3fbGghYcgQ3mYMjIJ
	PaVXw3yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9S5n-0006Px-CR; Thu, 28 Mar 2019 10:17:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9S5Z-0005XL-NX
 for linux-mtd@bombadil.infradead.org; Thu, 28 Mar 2019 10:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4KD1cZHKjH2Gnm6FM0B7Ci7J0sa0JGaQWDwPyjmJnxQ=; b=H9aO8HQtdeiiu7X75+bEr2M9y
 5wEr4aH4t0gLmPWEVl370nae12wN/cCO/N6rRhouor8F8GOjjLBsY9Vt2IQNjHgl3w2/NSGbzWUb0
 HDOnSATXSyezpNMn7audfVd88HsRGIJHpha97yMYzFQCcV77cvc+lYL5SbIgL5wwTlD8Xqoc5hL6Q
 cKuy53xmuGo0+dRbgOC4P9dErAxZIFg9s3/xXyIdJmb/UV/YFLeI4stL/LvDG6U16xHycawBM9jAv
 ANM1IUwfLa/hdjvJHkvEKRusYe2cLRTVkFtHcU0+juN1iHgry88pbIYh0OZobosPzdlE19DoOHLqP
 eVivJz4DQ==;
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9RpH-0006o3-Hs
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:00:02 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x2S9wlJO052359;
 Thu, 28 Mar 2019 17:58:52 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bbrezillon@kernel.org, dwmw2@infradead.org,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 computersforpeace@gmal.com, paul.burton@mips.com, stefan@agner.ch,
 christophe.kerello@st.com, liang.yang@amlogic.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 5/7] spi: Add direct mapping mode for Macronix SPI controller
Date: Thu, 28 Mar 2019 18:18:36 +0800
Message-Id: <1553768318-23149-6-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x2S9wlJO052359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_100000_240613_32205C38 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add direct mapping read mode for Macronix SPI controller driver.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 129 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 100 insertions(+), 29 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index fbebf89..9f5ff2b 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -19,6 +19,7 @@ struct mxic_spi {
 	struct clk *send_clk;
 	struct clk *send_dly_clk;
 	void __iomem *regs;
+	void __iomem *dirmap;
 	u32 cur_speed_hz;
 };
 
@@ -128,6 +129,42 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
 	       mxic->regs + HC_CFG);
 }
 
+static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op)
+{
+	u32 cfg = OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
+
+	if (op->addr.nbytes)
+		cfg |= OP_ADDR_BYTES(op->addr.nbytes) |
+		       OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
+
+	if (op->dummy.nbytes)
+		cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
+
+	if (op->data.nbytes) {
+		cfg |= OP_DATA_BUSW(fls(op->data.buswidth) - 1);
+		if (op->data.dir == SPI_MEM_DATA_IN)
+			cfg |= OP_READ;
+	}
+
+	return cfg;
+}
+
+static void mxic_spi_set_hc_cfg(struct spi_device *spi, u32 flags)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(spi->master);
+	int nio = 1;
+
+	if (spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
+		nio = 4;
+	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
+		nio = 2;
+
+	writel(flags | HC_CFG_NIO(nio) |
+	       HC_CFG_TYPE(spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
+	       HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1),
+	       mxic->regs + HC_CFG);
+}
+
 static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 			      void *rxbuf, unsigned int len)
 {
@@ -201,43 +238,18 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
 	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
-	int nio = 1, i, ret;
-	u32 ss_ctrl;
+	int i, ret;
 	u8 addr[8];
 
 	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
 	if (ret)
 		return ret;
 
-	if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
-		nio = 4;
-	else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
-		nio = 2;
+	mxic_spi_set_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN);
 
-	writel(HC_CFG_NIO(nio) |
-	       HC_CFG_TYPE(mem->spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
-	       HC_CFG_SLV_ACT(mem->spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1) |
-	       HC_CFG_MAN_CS_EN,
-	       mxic->regs + HC_CFG);
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
-
-	ss_ctrl = OP_CMD_BYTES(1) | OP_CMD_BUSW(fls(op->cmd.buswidth) - 1);
-
-	if (op->addr.nbytes)
-		ss_ctrl |= OP_ADDR_BYTES(op->addr.nbytes) |
-			   OP_ADDR_BUSW(fls(op->addr.buswidth) - 1);
-
-	if (op->dummy.nbytes)
-		ss_ctrl |= OP_DUMMY_CYC(op->dummy.nbytes);
-
-	if (op->data.nbytes) {
-		ss_ctrl |= OP_DATA_BUSW(fls(op->data.buswidth) - 1);
-		if (op->data.dir == SPI_MEM_DATA_IN)
-			ss_ctrl |= OP_READ;
-	}
-
-	writel(ss_ctrl, mxic->regs + SS_CTRL(mem->spi->chip_select));
-
+	writel(mxic_spi_mem_prep_op_cfg(op),
+	       mxic->regs + SS_CTRL(mem->spi->chip_select));
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
 	       mxic->regs + HC_CFG);
 
@@ -271,9 +283,64 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	return ret;
 }
 
+static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
+
+	if (!mxic->dirmap)
+		return -ENOTSUPP;
+
+	 /*
+	  * TODO: overcome this limitation by moving LWR/LRD_ADDR during a
+	  * read/write operation.
+	  */
+	if (desc->info.offset + desc->info.length > U32_MAX)
+		return -ENOTSUPP;
+
+	if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
+		return -ENOTSUPP;
+
+	if (desc->info.op_tmpl.data.dir == SPI_MEM_DATA_OUT)
+		return -ENOTSUPP;
+
+	return 0;
+}
+
+static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
+					u64 offs, size_t len, void *buf)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
+	int ret;
+	u32 sts;
+
+	mxic_spi_set_hc_cfg(desc->mem->spi, 0);
+
+	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl),
+	       mxic->regs + LRD_CFG);
+	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode >> 8) |
+	       (LMODE_CMD1(desc->info.op_tmpl.cmd.opcode) & 0xff00) |
+	       LMODE_SLV_ACT(desc->mem->spi->chip_select) |
+	       LMODE_EN, mxic->regs + LRD_CTRL);
+
+	memcpy_fromio(buf, mxic->dirmap + offs, len);
+
+	writel(INT_LRD_DIS, mxic->regs + INT_STS);
+	writel(0, mxic->regs + LRD_CTRL);
+
+	ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
+				 sts & INT_LRD_DIS, 0, USEC_PER_SEC);
+
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 	.supports_op = mxic_spi_mem_supports_op,
 	.exec_op = mxic_spi_mem_exec_op,
+	.dirmap_create = mxic_spi_mem_dirmap_create,
+	.dirmap_read = mxic_spi_mem_dirmap_read,
 };
 
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
@@ -404,6 +471,10 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(mxic->regs))
 		return PTR_ERR(mxic->regs);
 
+	mxic->dirmap = mxic_mfd->dirmap;
+	if (IS_ERR(mxic->dirmap))
+		mxic->dirmap = NULL;
+
 	pm_runtime_enable(&pdev->dev);
 	master->auto_runtime_pm = true;
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
