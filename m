Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE93CC10F25
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765AD24649
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yr/sCCGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765AD24649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HjyMnHgCVGqVluPpldx/4ZGIpWjMu3Bcnhhd3ytFkoc=; b=Yr/sCCGq2ORzt2WKVJPdVzlFFY
	V4mK8kZ/gkEEi3MDoOPXIDD4GfFOrxELfjwXgX+QArzhaDwmCmrZy2vznx9Kx+fBGroLzQoDWX3pp
	W8T+vBOj9MS5G9bft62R+dGdGFbtNNKjVybsoECK8tYtyEG/JXidWMnKW043xrBiat3D18sns0XcB
	5X/NO9Cb4WhTw/W/NA4Ozov77WRRNcdfu6G6bZTbVV1pHZjP5/Jj9bQ3HZ5BSDizhLTIExGV1o2/q
	45Fh1BvYE/DsojpB18MR3ZmV71tuGiCYwkpIMKWtrefNGbyGt0kZcwPFzmPbmhi8rNqGFpnlwI0jg
	TUSa8cqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBU5S-00055P-Dx; Tue, 10 Mar 2020 01:53:38 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBU4p-0004Up-8H
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 01:53:03 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 18:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="242155459"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2020 18:52:51 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org
Subject: [PATCH v12 4/4] spi: cadence-quadspi: Add qspi support for Intel LGM
 SoC
Date: Tue, 10 Mar 2020 09:52:13 +0800
Message-Id: <20200310015213.1734-5-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_185259_379436_4FAEB5F0 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, tien.fong.chee@intel.com,
 tudor.ambarus@gmail.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@free-electrons.com, richard@nod.at, qi-ming.wu@intel.com,
 simon.k.r.goldschmidt@gmail.com, dinguyen@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cheol.yong.kim@intel.com, cyrille.pitchen@atmel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 david.oberhollenzer@sigma-star.at
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add support for the Cadence QSPI controller. This controller support
on the Intel Lightning Mountain(LGM), TI and Altera SoC's.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 137 ++++++++++++++++++++++++++++++--------
 1 file changed, 111 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 7b52e109036e..3afe0aac8447 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for Cadence QSPI Controller
- *
- * Copyright Altera Corporation (C) 2012-2014. All rights reserved.
- * Copyright Intel Corporation (C) 2019-2020. All rights reserved.
- * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
- */
+//
+// Driver for Cadence QSPI Controller
+//
+// Copyright Altera Corporation (C) 2012-2014. All rights reserved.
+// Copyright Intel Corporation (C) 2019-2020. All rights reserved.
+// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
+//
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -35,6 +35,7 @@
 /* Quirks */
 #define CQSPI_NEEDS_WR_DELAY		BIT(0)
 #define CQSPI_DISABLE_DAC_MODE		BIT(1)
+#define CQSPI_NEEDS_ADDR_SWAP		BIT(1)
 
 /* Capabilities*/
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
@@ -76,6 +77,8 @@ struct cqspi_st {
 	unsigned long		master_ref_clk_hz;
 	u32			fifo_depth;
 	u32			fifo_width;
+	u32			bus_num;
+	u32			num_chipselect;
 	bool			rclk_en;
 	u32			trigger_address;
 	u32			wr_delay;
@@ -132,6 +135,9 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
 #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
 #define CQSPI_REG_WR_INSTR_TYPE_DATA_LSB	16
+#define CQSPI_REG_WR_INSTR_TYPE_ADDR_MASK	3
+#define CQSPI_REG_WR_INSTR_TYPE_DATA_MASK	3
+#define CQSPI_REG_WR_INSTR_TYPE_WEL_DIS_POS	8
 
 #define CQSPI_REG_DELAY				0x0C
 #define CQSPI_REG_DELAY_TSLCH_LSB		0
@@ -262,25 +268,43 @@ static u32 cqspi_get_rd_sram_level(struct cqspi_st *cqspi)
 	return reg & CQSPI_REG_SDRAMLEVEL_RD_MASK;
 }
 
-static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
+static irqreturn_t cqspi_irq_handler(int irq, void *dev_id)
 {
-	struct cqspi_st *cqspi = dev;
+	struct cqspi_st *cqspi = dev_id;
 	unsigned int irq_status;
 
+	if (readl(cqspi->iobase + CQSPI_REG_IRQSTATUS) == 0)
+		return IRQ_NONE;
+
 	/* Read interrupt status */
 	irq_status = readl(cqspi->iobase + CQSPI_REG_IRQSTATUS);
-
 	/* Clear interrupt */
 	writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
-
 	irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
 
-	if (irq_status)
-		complete(&cqspi->transfer_complete);
+	complete(&cqspi->transfer_complete);
 
 	return IRQ_HANDLED;
 }
 
+static u32 cqspi_cmd2addr(const struct spi_mem_op *op)
+{
+	const u8 *addrbuf = (u8 *)&op->addr.val;
+	unsigned int addr = 0;
+	int i;
+
+	/* Invalid address return zero. */
+	if (op->addr.nbytes > 4)
+		return 0;
+
+	for (i = 0; i < op->addr.nbytes; i++) {
+		addr = addr << 8;
+		addr |= addrbuf[i];
+	}
+
+	return addr;
+}
+
 static unsigned int cqspi_calc_rdreg(struct cqspi_flash_pdata *f_pdata)
 {
 	u32 rdreg = 0;
@@ -352,11 +376,14 @@ static int cqspi_exec_flash_cmd(struct cqspi_st *cqspi, unsigned int reg)
 static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 			      const struct spi_mem_op *op)
 {
+	const struct cqspi_driver_platdata *ddata;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
+	struct device *dev = &cqspi->pdev->dev;
 	void __iomem *reg_base = cqspi->iobase;
 	u8 *rxbuf = op->data.buf.in;
 	u8 opcode = op->cmd.opcode;
 	size_t n_rx = op->data.nbytes;
+	unsigned int addr_value;
 	unsigned int rdreg;
 	unsigned int reg;
 	size_t read_len;
@@ -376,6 +403,16 @@ static int cqspi_command_read(struct cqspi_flash_pdata *f_pdata,
 
 	reg |= (0x1 << CQSPI_REG_CMDCTRL_RD_EN_LSB);
 
+	ddata  = of_device_get_match_data(dev);
+	if ((ddata->quirks & CQSPI_NEEDS_ADDR_SWAP) & op->addr.nbytes) {
+		reg |= BIT(CQSPI_REG_CMDCTRL_ADDR_EN_LSB);
+		reg |= ((op->addr.nbytes - 1) & CQSPI_REG_CMDCTRL_ADD_BYTES_MASK)
+			<< CQSPI_REG_CMDCTRL_ADD_BYTES_LSB;
+		addr_value = cqspi_cmd2addr(op);
+
+		writel(addr_value, reg_base + CQSPI_REG_CMDADDRESS);
+	}
+
 	/* 0 means 1 byte. */
 	reg |= (((n_rx - 1) & CQSPI_REG_CMDCTRL_RD_BYTES_MASK)
 		<< CQSPI_REG_CMDCTRL_RD_BYTES_LSB);
@@ -424,7 +461,7 @@ static int cqspi_command_write(struct cqspi_flash_pdata *f_pdata,
 	if (op->addr.nbytes) {
 		reg |= (0x1 << CQSPI_REG_CMDCTRL_ADDR_EN_LSB);
 		reg |= ((op->addr.nbytes - 1) & CQSPI_REG_CMDCTRL_ADD_BYTES_MASK)
-		<< CQSPI_REG_CMDCTRL_ADD_BYTES_LSB;
+			<< CQSPI_REG_CMDCTRL_ADD_BYTES_LSB;
 
 		writel(op->addr.val, reg_base + CQSPI_REG_CMDADDRESS);
 	}
@@ -453,10 +490,20 @@ static int cqspi_command_write(struct cqspi_flash_pdata *f_pdata,
 static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
 			    const struct spi_mem_op *op)
 {
+	const struct cqspi_driver_platdata *ddata;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
+	struct device *dev = &cqspi->pdev->dev;
+	unsigned int reg, addr_value;
 	unsigned int dummy_clk = 0;
-	unsigned int reg;
+
+	ddata  = of_device_get_match_data(dev);
+	if ((ddata->quirks & CQSPI_NEEDS_ADDR_SWAP) & op->addr.nbytes) {
+		addr_value = cqspi_cmd2addr(op);
+		writel(addr_value, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
+		reg |= (op->data.buswidth & CQSPI_REG_RD_INSTR_TYPE_DATA_MASK)
+			<< CQSPI_REG_RD_INSTR_TYPE_DATA_LSB;
+	}
 
 	reg = op->cmd.opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
 	reg |= cqspi_calc_rdreg(f_pdata);
@@ -468,7 +515,7 @@ static int cqspi_read_setup(struct cqspi_flash_pdata *f_pdata,
 
 	if (dummy_clk / 8)
 		reg |= (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
-		       << CQSPI_REG_RD_INSTR_DUMMY_LSB;
+			<< CQSPI_REG_RD_INSTR_DUMMY_LSB;
 
 	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
 
@@ -508,7 +555,7 @@ static int cqspi_indirect_read_execute(struct cqspi_flash_pdata *f_pdata,
 
 	while (remaining > 0) {
 		if (!wait_for_completion_timeout(&cqspi->transfer_complete,
-						 msecs_to_jiffies(CQSPI_READ_TIMEOUT_MS)))
+				msecs_to_jiffies(CQSPI_READ_TIMEOUT_MS)))
 			ret = -ETIMEDOUT;
 
 		bytes_to_read = cqspi_get_rd_sram_level(cqspi);
@@ -575,9 +622,12 @@ static int cqspi_indirect_read_execute(struct cqspi_flash_pdata *f_pdata,
 static int cqspi_write_setup(struct cqspi_flash_pdata *f_pdata,
 			     const struct spi_mem_op *op)
 {
-	unsigned int reg;
+	const struct cqspi_driver_platdata *ddata;
 	struct cqspi_st *cqspi = f_pdata->cqspi;
+	struct device *dev = &cqspi->pdev->dev;
 	void __iomem *reg_base = cqspi->iobase;
+	const u8 *txbuf = &op->cmd.opcode;
+	unsigned int reg;
 
 	/* Set opcode. */
 	reg = op->cmd.opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
@@ -585,6 +635,24 @@ static int cqspi_write_setup(struct cqspi_flash_pdata *f_pdata,
 	reg = cqspi_calc_rdreg(f_pdata);
 	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
 
+	ddata  = of_device_get_match_data(dev);
+	if (ddata->quirks & CQSPI_NEEDS_ADDR_SWAP) {
+		/* Set opcode. */
+		reg = txbuf[0] << CQSPI_REG_WR_INSTR_OPCODE_LSB;
+		reg |= BIT(CQSPI_REG_WR_INSTR_TYPE_WEL_DIS_POS);
+		/* Configure the mode for address */
+		reg |= (op->addr.buswidth & CQSPI_REG_WR_INSTR_TYPE_ADDR_MASK)
+			<< CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB;
+
+		/* Configure the mode for data */
+		reg |= (op->data.buswidth & CQSPI_REG_WR_INSTR_TYPE_DATA_MASK)
+			<< CQSPI_REG_WR_INSTR_TYPE_DATA_LSB;
+		writel(reg, reg_base + CQSPI_REG_WR_INSTR);
+		/* Setup write address. */
+		reg = cqspi_cmd2addr(op);
+		writel(reg, reg_base + CQSPI_REG_INDIRECTWRSTARTADDR);
+	}
+
 	reg = readl(reg_base + CQSPI_REG_SIZE);
 	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
 	reg |= (op->addr.nbytes - 1);
@@ -644,7 +712,7 @@ static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdata,
 		}
 
 		if (!wait_for_completion_timeout(&cqspi->transfer_complete,
-						 msecs_to_jiffies(CQSPI_TIMEOUT_MS))) {
+					msecs_to_jiffies(CQSPI_TIMEOUT_MS))) {
 			dev_err(dev, "Indirect write timeout\n");
 			ret = -ETIMEDOUT;
 			goto failwr;
@@ -903,7 +971,7 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
 				     u_char *buf, loff_t from, size_t len)
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
-	struct device *dev = &cqspi->pdev->dev;
+	struct device *dev = cqspi->rx_chan->device->dev;
 	enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
 	dma_addr_t dma_src = (dma_addr_t)cqspi->mmap_phys_base + from;
 	int ret = 0;
@@ -1053,6 +1121,8 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
 	struct device *dev = &cqspi->pdev->dev;
 	struct device_node *np = dev->of_node;
 
+	cqspi->is_decoded_cs = of_property_read_bool(np, "cdns,is-decoded-cs");
+
 	if (of_property_read_u32(np, "cdns,fifo-depth", &cqspi->fifo_depth)) {
 		dev_err(dev, "couldn't determine fifo-depth\n");
 		return -ENXIO;
@@ -1098,10 +1168,6 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
 	writel(cqspi->fifo_depth * cqspi->fifo_width / 8,
 	       cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
 
-	/*
-	 * Disable Direct Access Controller and Auto polling when not
-	 * supported.
-	 */
 	if (!cqspi->use_dac_mode) {
 		u32 reg;
 
@@ -1128,7 +1194,7 @@ static int cqspi_request_mmap_dma(struct cqspi_st *cqspi)
 	if (IS_ERR(cqspi->rx_chan)) {
 		int ret = PTR_ERR(cqspi->rx_chan);
 
-		if (ret == -EPROBE_DEFER)
+		if (ret != -EPROBE_DEFER)
 			dev_err(&cqspi->pdev->dev, "No Rx DMA available\n");
 		cqspi->rx_chan = NULL;
 
@@ -1273,6 +1339,11 @@ static int cqspi_probe(struct platform_device *pdev)
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
 	ddata  = of_device_get_match_data(dev);
+	if (!ddata) {
+		dev_err(dev, "Could not retrieve QSPI caps\n");
+		goto probe_reset_failed;
+	}
+
 	if (ddata) {
 		if (ddata->quirks & CQSPI_NEEDS_WR_DELAY)
 			cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
@@ -1281,9 +1352,15 @@ static int cqspi_probe(struct platform_device *pdev)
 			master->mode_bits |= SPI_RX_OCTAL;
 		if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE))
 			cqspi->use_dac_mode = true;
+		if (ddata->quirks & CQSPI_NEEDS_ADDR_SWAP) {
+			master->bus_num = 0;
+			master->num_chipselect = 2;
+			master->mode_bits = SPI_CS_HIGH | SPI_CPOL | SPI_CPHA |
+						SPI_TX_QUAD;
+		}
 	}
 
-	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
+	ret = devm_request_irq(dev, irq, cqspi_irq_handler, IRQF_SHARED,
 			       pdev->name, cqspi);
 	if (ret) {
 		dev_err(dev, "Cannot request IRQ.\n");
@@ -1381,6 +1458,10 @@ static const struct cqspi_driver_platdata am654_ospi = {
 	.quirks = CQSPI_NEEDS_WR_DELAY,
 };
 
+static const struct cqspi_driver_platdata intel_lgm_qspi = {
+	.quirks = CQSPI_NEEDS_ADDR_SWAP,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
@@ -1394,6 +1475,10 @@ static const struct of_device_id cqspi_dt_ids[] = {
 		.compatible = "ti,am654-ospi",
 		.data = &am654_ospi,
 	},
+	{
+		.compatible = "intel,lgm-qspi",
+		.data = &intel_lgm_qspi,
+	},
 	{ /* end of table */ }
 };
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
