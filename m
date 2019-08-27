Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B0FC3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 03:59:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D823206E0
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 03:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQVFD1PS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D823206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8BOO05ceLOvoMZoSYFQOwlsglGJTQB/1xSH38tVrdyA=; b=ZQVFD1PSNxVIXcZF22ltvNR5tx
	GVG2LE3gv9BuzwQ8KjcBfiAJD8os/OjrFFQBVKjwlruu4nhxDfMnCfK++rxaitoE3gd0hXe8EDmmZ
	WM6JJUJtrrQ5jEnkDIwTNAKPCsgAeFuq82i5i1u0YZZH5fGCor3OkeC2WnzOGZw7jZ8BQXR1CfT2R
	+/CaLHYuV4ON/GQrEKF0D30xa1vTmgEZrvNFZWa5N/AJ9fb26KnaYG9amk7eVeLAf0H0i08U/E+Lj
	K/JtJdP+zTFgnm6JvTsN5Qa+9lRAsqU7nLqvORRQDd2qeNo3zFBlbgPMBpbyyG5goThXnwrvEj+VX
	xVhKv4kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Sdd-0000Ps-GN; Tue, 27 Aug 2019 03:59:21 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2SdJ-0008Ux-CE
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 03:59:03 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 20:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="331686795"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 20:58:56 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/3] mtd: spi-nor: cadence-quadspi: disable DMA and DAC for
 Intel LGM
Date: Tue, 27 Aug 2019 11:58:26 +0800
Message-Id: <20190827035827.21024-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_205901_626116_773D90DF 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com, andriy.shevchenko@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

on Intel's Lightning Mountain(LGM) SoCs QSPI controller do not use
Direct Memory Access(DMA) and Direct Access Controller(DAC).

This patch introduces to properly disable the DMA and DAC
for data transfer instead it uses indirect data transfer.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/spi-nor/Kconfig           |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

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
index 67f15a1f16fd..69fa13e95110 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -517,12 +517,16 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
 	void __iomem *ahb_base = cqspi->ahb_base;
+	u32 trigger_address = cqspi->trigger_address;
 	unsigned int remaining = n_rx;
 	unsigned int mod_bytes = n_rx % 4;
 	unsigned int bytes_to_read = 0;
 	u8 *rxbuf_end = rxbuf + n_rx;
 	int ret = 0;
 
+	if (!f_pdata->use_direct_mode)
+		writel(trigger_address, reg_base + CQSPI_REG_INDIRECTTRIGGER);
+
 	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
 	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
 
@@ -609,6 +613,14 @@ static int cqspi_write_setup(struct spi_nor *nor)
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
@@ -1171,7 +1183,8 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
+	if (!of_device_is_compatible(np, "intel,lgm-qspi"))
+		cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
 
 	return 0;
 }
@@ -1301,7 +1314,8 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 		f_pdata->registered = true;
 
 		if (mtd->size <= cqspi->ahb_size) {
-			f_pdata->use_direct_mode = true;
+			f_pdata->use_direct_mode =
+				!(of_device_is_compatible(np, "intel,lgm-qspi"));
 			dev_dbg(nor->dev, "using direct mode for %s\n",
 				mtd->name);
 
@@ -1347,7 +1361,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	/* Obtain QSPI clock. */
-	cqspi->clk = devm_clk_get(dev, NULL);
+	cqspi->clk = devm_clk_get(dev, "qspi");
 	if (IS_ERR(cqspi->clk)) {
 		dev_err(dev, "Cannot claim QSPI clock.\n");
 		return PTR_ERR(cqspi->clk);
@@ -1369,6 +1383,7 @@ static int cqspi_probe(struct platform_device *pdev)
 		return PTR_ERR(cqspi->ahb_base);
 	}
 	cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
+	cqspi->trigger_address = res_ahb->start;
 	cqspi->ahb_size = resource_size(res_ahb);
 
 	init_completion(&cqspi->transfer_complete);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
