Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1080C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StSn1vosdxvcaLegs2nHfvOg6WV3cKQk9oNprgkx5aw=; b=uoykglfSxdbVPv
	0qtZkFMbDYhhJBsqIQPlmpWTN45+VIiwyh5jGd9t0bS6KrskZ6mkNHNx+iEYisHNBS8S6xqp7KKB3
	qV9Jgyf2bR6QnTePFytDwkUb10PdBFDcvDhTTf351WE56zcb3IOLNN4L2asRNCVOC5OTfV+dwnykO
	nxR30oVlaTkj+miTvHFtaX4Cq8W0Ky5nVajFM/4AVwADHG+DpCor1m2YktvfJv2LN5bcqkDcYE37f
	r2Ja3bDzv4P66Z8WK9odjzNHkNhZSejSozDF1vKOG/9Z3J2XTOiBr0vzDXeLbsivjodLVmypxLXXN
	DTezGF20pGptOGpVS8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqZxy-00AHDZ-7h; Fri, 26 Nov 2021 12:04:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZa8-00ABIU-MQ
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 11:39:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 15184FF812;
 Fri, 26 Nov 2021 11:39:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v2 19/20] spi: mxic: Add support for direct mapping
Date: Fri, 26 Nov 2021 12:39:23 +0100
Message-Id: <20211126113924.310459-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126113924.310459-1-miquel.raynal@bootlin.com>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_033957_056747_4C80618C 
X-CRM114-Status: GOOD (  16.50  )
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

Implement the ->dirmap_create() and ->dirmap_read/write() hooks to
provide a fast path for read and write accesses.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Zhengxun Li <zhengxunli@mxic.com.tw>
Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>
---
 drivers/spi/spi-mxic.c | 112 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 3c4e64cbe812..485a7f2afb44 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -172,6 +172,11 @@ struct mxic_spi {
 	struct clk *send_dly_clk;
 	void __iomem *regs;
 	u32 cur_speed_hz;
+	struct {
+		void __iomem *map;
+		dma_addr_t dma;
+		size_t size;
+	} linear;
 };
 
 static int mxic_spi_clk_enable(struct mxic_spi *mxic)
@@ -296,7 +301,8 @@ static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
 	       HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1);
 }
 
-static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op)
+static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
+				    unsigned int data_len)
 {
 	u32 cfg = OP_CMD_BYTES(op->cmd.nbytes) |
 		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
@@ -310,7 +316,8 @@ static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op)
 	if (op->dummy.nbytes)
 		cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
 
-	if (op->data.nbytes) {
+	/* Direct mapping data.nbytes field is not populated */
+	if (data_len) {
 		cfg |= OP_DATA_BUSW(fls(op->data.buswidth) - 1) |
 		       (op->data.dtr ? OP_DATA_DDR : 0);
 		if (op->data.dir == SPI_MEM_DATA_IN) {
@@ -371,6 +378,77 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 	return 0;
 }
 
+static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
+					u64 offs, size_t len, void *buf)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
+	int ret;
+	u32 sts;
+
+	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
+		return -EINVAL;
+
+	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+
+	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
+	       mxic->regs + LRD_CFG);
+	writel(desc->info.offset + offs, mxic->regs + LRD_ADDR);
+	len = min_t(size_t, len, mxic->linear.size);
+	writel(len, mxic->regs + LRD_RANGE);
+	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
+	       LMODE_SLV_ACT(desc->mem->spi->chip_select) |
+	       LMODE_EN,
+	       mxic->regs + LRD_CTRL);
+
+	memcpy_fromio(buf, mxic->linear.map, len);
+
+	writel(INT_LRD_DIS, mxic->regs + INT_STS);
+	writel(0, mxic->regs + LRD_CTRL);
+
+	ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
+				 sts & INT_LRD_DIS, 0, USEC_PER_SEC);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
+					 u64 offs, size_t len,
+					 const void *buf)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
+	u32 sts;
+	int ret;
+
+	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
+		return -EINVAL;
+
+	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0), mxic->regs + HC_CFG);
+
+	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
+	       mxic->regs + LWR_CFG);
+	writel(desc->info.offset + offs, mxic->regs + LWR_ADDR);
+	len = min_t(size_t, len, mxic->linear.size);
+	writel(len, mxic->regs + LWR_RANGE);
+	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
+	       LMODE_SLV_ACT(desc->mem->spi->chip_select) |
+	       LMODE_EN,
+	       mxic->regs + LWR_CTRL);
+
+	memcpy_toio(mxic->linear.map, buf, len);
+
+	writel(INT_LWR_DIS, mxic->regs + INT_STS);
+	writel(0, mxic->regs + LWR_CTRL);
+
+	ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
+				 sts & INT_LWR_DIS, 0, USEC_PER_SEC);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
@@ -396,6 +474,22 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 		return spi_mem_dtr_supports_op(mem, op);
 }
 
+static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
+{
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
+
+	if (!mxic->linear.map)
+		return -EINVAL;
+
+	if (desc->info.offset + desc->info.length > U32_MAX)
+		return -EINVAL;
+
+	if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
@@ -412,7 +506,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
 
-	writel(mxic_spi_mem_prep_op_cfg(op),
+	writel(mxic_spi_mem_prep_op_cfg(op, op->data.nbytes),
 	       mxic->regs + SS_CTRL(mem->spi->chip_select));
 
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
@@ -454,6 +548,9 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 	.supports_op = mxic_spi_mem_supports_op,
 	.exec_op = mxic_spi_mem_exec_op,
+	.dirmap_create = mxic_spi_mem_dirmap_create,
+	.dirmap_read = mxic_spi_mem_dirmap_read,
+	.dirmap_write = mxic_spi_mem_dirmap_write,
 };
 
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
@@ -583,6 +680,15 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(mxic->regs))
 		return PTR_ERR(mxic->regs);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
+	mxic->linear.map = devm_ioremap_resource(&pdev->dev, res);
+	if (!IS_ERR(mxic->linear.map)) {
+		mxic->linear.dma = res->start;
+		mxic->linear.size = resource_size(res);
+	} else {
+		mxic->linear.map = NULL;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	master->auto_runtime_pm = true;
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
