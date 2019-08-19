Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C6DC3A59D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 11:54:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3F02085A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 11:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGhUk19W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED3F02085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=17W6UpHqH8fbcCJu2ocfuA0J1SJeigkQ7bb6dngK92U=; b=pGhUk19WI6n79KdBnhMnFIG89n
	4avL3eteiAc4IkiKYXbVS/XVRczTuVqoVJnc72lXANY1qpU1MysSa/p9j3ILmgEnxlM+6V2UWxUnj
	XzVFF5wupxGMgDUkfhQlF5Aa3xqCsVP/4vPQNzORczWxaBXos0dFBlgYWSLAK55c8CUZnheFnSbe+
	KyZSbd73JM34NWmGhPQeFOgd5NMZpEh/uUfpTt7rp1IorIA1abGouEk7ZPIrfs4MsIgbXPGMx5j16
	OQBZsN/ZVlEMuWsk/0qZ72c7FXGeL7sKJJCOIgJ2K0WNzIitPfkmwYALah3dR1xgzol0uNiTBZIz1
	v1T5AY5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzgFC-0003mS-C0; Mon, 19 Aug 2019 11:54:38 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzgF7-0003eG-Uv
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 11:54:35 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 04:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="189510281"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2019 04:54:30 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 2/2] mtd: spi-nor: cadence-quadspi: disable the DMA,
 DAC and auto poll
Date: Mon, 19 Aug 2019 19:54:24 +0800
Message-Id: <20190819115424.41479-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819115424.41479-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20190819115424.41479-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_045434_052407_A64E7628 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: devicetree@vger.kernel.org, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 jwboyer@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 cyrille.pitchen@atmel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

On Intel Lightening Mountain(LGM) SoCs QSPI controller do not use
Direct Memory Access(DMA), Direct Access Controller(DAC) and
auto-poll features. This patch introduces to properly disable DMA,
DAC for data transfer instead it uses indirect data transfer.
and also auto polling.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/spi-nor/Kconfig           |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c | 62 ++++++++++++++++++++++++++++++-----
 2 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6de83277ce8b..ba2e372ae514 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -34,7 +34,7 @@ config SPI_ASPEED_SMC
 
 config SPI_CADENCE_QUADSPI
 	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || ARM64 || COMPILE_TEST)
+	depends on OF && (ARM || ARM64 || COMPILE_TEST || X86)
 	help
 	  Enable support for the Cadence Quad SPI Flash controller.
 
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 67f15a1f16fd..83ae28e055f4 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -67,6 +67,7 @@ struct cqspi_st {
 
 	void __iomem		*iobase;
 	void __iomem		*ahb_base;
+	resource_size_t		ahb_phy_addr;
 	resource_size_t		ahb_size;
 	struct completion	transfer_complete;
 	struct mutex		bus_mutex;
@@ -134,6 +135,8 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK	0x3
 #define CQSPI_REG_RD_INSTR_DUMMY_MASK		0x1F
 
+#define CQSPI_REG_WR_COMPLETION_CTRL	0x38
+#define CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL	BIT(14)
 #define CQSPI_REG_WR_INSTR			0x08
 #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
 #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
@@ -214,6 +217,7 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_INDIRECTWRWATERMARK		0x74
 #define CQSPI_REG_INDIRECTWRSTARTADDR		0x78
 #define CQSPI_REG_INDIRECTWRBYTES		0x7C
+#define CQSPI_REG_INDIRECTTRIGGERADDRRANGE	0x80
 
 #define CQSPI_REG_CMDADDRESS			0x94
 #define CQSPI_REG_CMDREADDATALOWER		0xA0
@@ -470,6 +474,18 @@ static int cqspi_command_write_addr(struct spi_nor *nor,
 	return cqspi_exec_flash_cmd(cqspi, reg);
 }
 
+static int cqspi_disable_auto_poll(struct cqspi_st *cqspi)
+{
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+	reg |= CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL;
+	writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+
+	return 0;
+}
+
 static int cqspi_read_setup(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
@@ -507,6 +523,11 @@ static int cqspi_read_setup(struct spi_nor *nor)
 	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
 	reg |= (nor->addr_width - 1);
 	writel(reg, reg_base + CQSPI_REG_SIZE);
+
+	/* Disable auto-polling */
+	if (!f_pdata->use_direct_mode)
+		cqspi_disable_auto_poll(cqspi);
+
 	return 0;
 }
 
@@ -517,12 +538,16 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
 	void __iomem *ahb_base = cqspi->ahb_base;
+	resource_size_t ahb_phy_addr = cqspi->ahb_phy_addr;
 	unsigned int remaining = n_rx;
 	unsigned int mod_bytes = n_rx % 4;
 	unsigned int bytes_to_read = 0;
 	u8 *rxbuf_end = rxbuf + n_rx;
 	int ret = 0;
 
+	if (!f_pdata->use_direct_mode)
+		writel(ahb_phy_addr, reg_base + CQSPI_REG_INDIRECTTRIGGER);
+
 	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
 	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
 
@@ -609,6 +634,14 @@ static int cqspi_write_setup(struct spi_nor *nor)
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
 
+	/* Disable the DMA and direct access controller */
+	if (!f_pdata->use_direct_mode) {
+		reg = readl(reg_base + CQSPI_REG_CONFIG);
+		reg &= ~CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
+		reg &= ~CQSPI_REG_CONFIG_DMA_MASK;
+		writel(reg, reg_base + CQSPI_REG_CONFIG);
+	}
+
 	/* Set opcode. */
 	reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
 	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
@@ -619,6 +652,11 @@ static int cqspi_write_setup(struct spi_nor *nor)
 	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
 	reg |= (nor->addr_width - 1);
 	writel(reg, reg_base + CQSPI_REG_SIZE);
+
+	/* Disable auto-polling */
+	if (!f_pdata->use_direct_mode)
+		cqspi_disable_auto_poll(cqspi);
+
 	return 0;
 }
 
@@ -1165,13 +1203,16 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	if (of_property_read_u32(np, "cdns,trigger-address",
-				 &cqspi->trigger_address)) {
-		dev_err(&pdev->dev, "couldn't determine trigger-address\n");
-		return -ENXIO;
-	}
+	if (!of_device_is_compatible(np, "intel,lgm-qspi")) {
+		if (of_property_read_u32(np, "cdns,trigger-address",
+					 &cqspi->trigger_address)) {
+			dev_err(&pdev->dev,
+				"couldn't determine trigger-address\n");
+			return -ENXIO;
+		}
 
-	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
+		cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
+	}
 
 	return 0;
 }
@@ -1301,7 +1342,8 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 		f_pdata->registered = true;
 
 		if (mtd->size <= cqspi->ahb_size) {
-			f_pdata->use_direct_mode = true;
+			f_pdata->use_direct_mode =
+				!(of_device_is_compatible(np, "intel,lgm-qspi"));
 			dev_dbg(nor->dev, "using direct mode for %s\n",
 				mtd->name);
 
@@ -1347,7 +1389,10 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	/* Obtain QSPI clock. */
-	cqspi->clk = devm_clk_get(dev, NULL);
+	if (of_device_is_compatible(np, "intel,lgm-qspi"))
+		cqspi->clk = devm_clk_get(dev, "qspi");
+	else
+		cqspi->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(cqspi->clk)) {
 		dev_err(dev, "Cannot claim QSPI clock.\n");
 		return PTR_ERR(cqspi->clk);
@@ -1369,6 +1414,7 @@ static int cqspi_probe(struct platform_device *pdev)
 		return PTR_ERR(cqspi->ahb_base);
 	}
 	cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
+	cqspi->ahb_phy_addr = res_ahb->start;
 	cqspi->ahb_size = resource_size(res_ahb);
 
 	init_completion(&cqspi->transfer_complete);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
