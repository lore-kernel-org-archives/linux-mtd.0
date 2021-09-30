Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26218C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 10:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E732761884
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 10:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E732761884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQwhlY92uC9O1JlDfXmUhDgnqwgEBc6B5I08X0eOjaY=; b=imiXDSHLAwlRvM
	w549x4Am5DLIaULE2yq/VVsTQx2EQHvWxHgJ8+cvECzfBOvWwDj8l2PNY7QH/O7qqPF7NCl7cdNQE
	GArQRqnokfn1Lij2nfL8dTqVhVySxkmt/4sLUt2Dgv0uJ0HZCps+kK/e+omFhWte1PZX7Foa1aQ5+
	gbdkL4c47gfx0v6Augv9GB1k/vUerIN4AdNtVFxRVZXJ3w3r8+dhreUoKqJb+7zxNOPZkje5Ltsze
	F+HPqd5HW1JbKkE4RgiXUm36o1oYNrqvnvqZjkI/LEfgws/OSxeffQohSEEXfKJNCTfwzjQUoN+ZM
	WonCqrpf8YoOxSQoSiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVsyI-00DjSM-Gl; Thu, 30 Sep 2021 10:07:22 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVsyE-00DjQL-OV
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 10:07:21 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="288808498"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="288808498"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="457387603"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 30 Sep 2021 03:07:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id BE37F177; Thu, 30 Sep 2021 13:07:19 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH 1/3] mtd: spi-nor: intel-spi: Disable write protection only if
 asked
Date: Thu, 30 Sep 2021 13:07:17 +0300
Message-Id: <20210930100719.2176-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_030718_922248_E428A2B2 
X-CRM114-Status: GOOD (  27.09  )
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

Currently the driver tries to disable the BIOS write protection
automatically even if this is not what the user wants. For this reason
modify the driver so that by default it does not touch the write
protection. Only if specifically asked by the user (setting writeable=1
command line parameter) the driver tries to disable the BIOS write
protection.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mfd/lpc_ich.c                         | 59 +++++++++++++++++--
 .../mtd/spi-nor/controllers/intel-spi-pci.c   | 29 +++++----
 drivers/mtd/spi-nor/controllers/intel-spi.c   | 41 ++++++-------
 include/linux/platform_data/x86/intel-spi.h   |  6 +-
 4 files changed, 96 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index f10e53187f67..9ffab9aafd81 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -63,6 +63,8 @@
 #define SPIBASE_BYT		0x54
 #define SPIBASE_BYT_SZ		512
 #define SPIBASE_BYT_EN		BIT(1)
+#define BYT_BCR			0xfc
+#define BYT_BCR_WPD		BIT(0)
 
 #define SPIBASE_LPT		0x3800
 #define SPIBASE_LPT_SZ		512
@@ -1084,12 +1086,57 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
 	return ret;
 }
 
+static bool lpc_ich_byt_set_writeable(void __iomem *base, void *data)
+{
+	u32 val;
+
+	val = readl(base + BYT_BCR);
+	if (!(val & BYT_BCR_WPD)) {
+		val |= BYT_BCR_WPD;
+		writel(val, base + BYT_BCR);
+		val = readl(base + BYT_BCR);
+	}
+
+	return val & BYT_BCR_WPD;
+}
+
+static bool lpc_ich_lpt_set_writeable(void __iomem *base, void *data)
+{
+	struct pci_dev *pdev = data;
+	u32 bcr;
+
+	pci_read_config_dword(pdev, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_write_config_dword(pdev, BCR, bcr);
+		pci_read_config_dword(pdev, BCR, &bcr);
+	}
+
+	return bcr & BCR_WPD;
+}
+
+static bool lpc_ich_bxt_set_writeable(void __iomem *base, void *data)
+{
+	unsigned int spi = PCI_DEVFN(13, 2);
+	struct pci_bus *bus = data;
+	u32 bcr;
+
+	pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_bus_write_config_dword(bus, spi, BCR, bcr);
+		pci_bus_read_config_dword(bus, spi, BCR, &bcr);
+	}
+
+	return bcr & BCR_WPD;
+}
+
 static int lpc_ich_init_spi(struct pci_dev *dev)
 {
 	struct lpc_ich_priv *priv = pci_get_drvdata(dev);
 	struct resource *res = &intel_spi_res[0];
 	struct intel_spi_boardinfo *info;
-	u32 spi_base, rcba, bcr;
+	u32 spi_base, rcba;
 
 	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -1103,6 +1150,8 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 		if (spi_base & SPIBASE_BYT_EN) {
 			res->start = spi_base & ~(SPIBASE_BYT_SZ - 1);
 			res->end = res->start + SPIBASE_BYT_SZ - 1;
+
+			info->set_writeable = lpc_ich_byt_set_writeable;
 		}
 		break;
 
@@ -1113,8 +1162,8 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base + SPIBASE_LPT;
 			res->end = res->start + SPIBASE_LPT_SZ - 1;
 
-			pci_read_config_dword(dev, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			info->set_writeable = lpc_ich_lpt_set_writeable;
+			info->data = dev;
 		}
 		break;
 
@@ -1135,8 +1184,8 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base & 0xfffffff0;
 			res->end = res->start + SPIBASE_APL_SZ - 1;
 
-			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			info->set_writeable = lpc_ich_bxt_set_writeable;
+			info->data = bus;
 		}
 
 		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 1bc53b8bb88a..508f7ca098ef 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -16,12 +16,30 @@
 #define BCR		0xdc
 #define BCR_WPD		BIT(0)
 
+static bool intel_spi_pci_set_writeable(void __iomem *base, void *data)
+{
+	struct pci_dev *pdev = data;
+	u32 bcr;
+
+	/* Try to make the chip read/write */
+	pci_read_config_dword(pdev, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_write_config_dword(pdev, BCR, bcr);
+		pci_read_config_dword(pdev, BCR, &bcr);
+	}
+
+	return bcr & BCR_WPD;
+}
+
 static const struct intel_spi_boardinfo bxt_info = {
 	.type = INTEL_SPI_BXT,
+	.set_writeable = intel_spi_pci_set_writeable,
 };
 
 static const struct intel_spi_boardinfo cnl_info = {
 	.type = INTEL_SPI_CNL,
+	.set_writeable = intel_spi_pci_set_writeable,
 };
 
 static int intel_spi_pci_probe(struct pci_dev *pdev,
@@ -29,7 +47,6 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 {
 	struct intel_spi_boardinfo *info;
 	struct intel_spi *ispi;
-	u32 bcr;
 	int ret;
 
 	ret = pcim_enable_device(pdev);
@@ -41,15 +58,7 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 	if (!info)
 		return -ENOMEM;
 
-	/* Try to make the chip read/write */
-	pci_read_config_dword(pdev, BCR, &bcr);
-	if (!(bcr & BCR_WPD)) {
-		bcr |= BCR_WPD;
-		pci_write_config_dword(pdev, BCR, bcr);
-		pci_read_config_dword(pdev, BCR, &bcr);
-	}
-	info->writeable = !!(bcr & BCR_WPD);
-
+	info->data = pdev;
 	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
 	if (IS_ERR(ispi))
 		return PTR_ERR(ispi);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index a413892ff449..f35597cbea0c 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -131,7 +131,6 @@
  * @sregs: Start of software sequencer registers
  * @nregions: Maximum number of regions
  * @pr_num: Maximum number of protected range registers
- * @writeable: Is the chip writeable
  * @locked: Is SPI setting locked
  * @swseq_reg: Use SW sequencer in register reads/writes
  * @swseq_erase: Use SW sequencer in erase operation
@@ -149,7 +148,6 @@ struct intel_spi {
 	void __iomem *sregs;
 	size_t nregions;
 	size_t pr_num;
-	bool writeable;
 	bool locked;
 	bool swseq_reg;
 	bool swseq_erase;
@@ -304,6 +302,14 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
 				  INTEL_SPI_TIMEOUT * 1000);
 }
 
+static bool intel_spi_set_writeable(struct intel_spi *ispi)
+{
+	if (!ispi->info->set_writeable)
+		return false;
+
+	return ispi->info->set_writeable(ispi->base, ispi->info->data);
+}
+
 static int intel_spi_init(struct intel_spi *ispi)
 {
 	u32 opmenu0, opmenu1, lvscc, uvscc, val;
@@ -316,19 +322,6 @@ static int intel_spi_init(struct intel_spi *ispi)
 		ispi->nregions = BYT_FREG_NUM;
 		ispi->pr_num = BYT_PR_NUM;
 		ispi->swseq_reg = true;
-
-		if (writeable) {
-			/* Disable write protection */
-			val = readl(ispi->base + BYT_BCR);
-			if (!(val & BYT_BCR_WPD)) {
-				val |= BYT_BCR_WPD;
-				writel(val, ispi->base + BYT_BCR);
-				val = readl(ispi->base + BYT_BCR);
-			}
-
-			ispi->writeable = !!(val & BYT_BCR_WPD);
-		}
-
 		break;
 
 	case INTEL_SPI_LPT:
@@ -358,6 +351,12 @@ static int intel_spi_init(struct intel_spi *ispi)
 		return -EINVAL;
 	}
 
+	/* Try to disable write protection if user asked to do so */
+	if (writeable && !intel_spi_set_writeable(ispi)) {
+		dev_warn(ispi->dev, "can't disable chip write protection\n");
+		writeable = false;
+	}
+
 	/* Disable #SMI generation from HW sequencer */
 	val = readl(ispi->base + HSFSTS_CTL);
 	val &= ~HSFSTS_CTL_FSMIE;
@@ -884,9 +883,12 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 		/*
 		 * If any of the regions have protection bits set, make the
 		 * whole partition read-only to be on the safe side.
+		 *
+		 * Also if the user did not ask the chip to be writeable
+		 * mask the bit too.
 		 */
-		if (intel_spi_is_protected(ispi, base, limit))
-			ispi->writeable = false;
+		if (!writeable || intel_spi_is_protected(ispi, base, limit))
+			part->mask_flags |= MTD_WRITEABLE;
 
 		end = (limit << 12) + 4096;
 		if (end > part->size)
@@ -927,7 +929,6 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 
 	ispi->dev = dev;
 	ispi->info = info;
-	ispi->writeable = info->writeable;
 
 	ret = intel_spi_init(ispi);
 	if (ret)
@@ -945,10 +946,6 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 
 	intel_spi_fill_partition(ispi, &part);
 
-	/* Prevent writes if not explicitly enabled */
-	if (!ispi->writeable || !writeable)
-		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
-
 	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/include/linux/platform_data/x86/intel-spi.h b/include/linux/platform_data/x86/intel-spi.h
index 7f53a5c6f35e..7dda3f690465 100644
--- a/include/linux/platform_data/x86/intel-spi.h
+++ b/include/linux/platform_data/x86/intel-spi.h
@@ -19,11 +19,13 @@ enum intel_spi_type {
 /**
  * struct intel_spi_boardinfo - Board specific data for Intel SPI driver
  * @type: Type which this controller is compatible with
- * @writeable: The chip is writeable
+ * @set_writeable: Try to make the chip writeable (optional)
+ * @data: Data to be passed to @set_writeable can be %NULL
  */
 struct intel_spi_boardinfo {
 	enum intel_spi_type type;
-	bool writeable;
+	bool (*set_writeable)(void __iomem *base, void *data);
+	void *data;
 };
 
 #endif /* INTEL_SPI_PDATA_H */
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
