Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09027C10F25
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA73B24649
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 01:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i6KrlWfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA73B24649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GgWBoj7PDm71Hm25K6+g6ge4Qd0YCy/zCla4pas0QfM=; b=i6KrlWfX+UjaLgmI4qG+YkXf5o
	iBvGNsOJDwR9xiRgEX09MGqHE1s+DthTdm2XX9rtYVXYM+TG5xkgujfma/pAA4GRnpXVAfetiNlil
	ceP9S/G4jyHq0JZrHGdSUWP/koomH2xf0eAlEkFTFEXh5sSYOqRmKwLeSE7pE816QgO97WXyLOJLO
	dFHaryQMUU9PKAK3zLsIcJn5E2BPoHd78C2SDAH4UCokSMZSDdrgJsoYMo7i3wTAn0cCvV3TXh7x8
	7pxpDAGuSFU/ZpQwJ6Li3DEj1ulPjkH9S4KYlDu7p2bOOIbtXYH7FUS614HwTbsUlDvsZRuuaFTfm
	Nc7rBeDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBU5B-0004pW-UK; Tue, 10 Mar 2020 01:53:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBU4h-0004Nl-UH
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 01:52:55 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 18:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="388759100"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2020 18:52:45 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, vigneshr@ti.com, robh+dt@kernel.org
Subject: [PATCH v12 3/4] spi: cadence-quadspi: Add support for the Cadence
 QSPI controller
Date: Tue, 10 Mar 2020 09:52:12 +0800
Message-Id: <20200310015213.1734-4-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_185252_022969_42212317 
X-CRM114-Status: GOOD (  12.66  )
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

This patch moves a file from drivers/mtd/spi-nor/cadence-quadspi.c to
driver/spi/spi-cadence-quadspi.c, also update the Kconfig and Makefiles
accordingly.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/Kconfig                                   | 11 -----------
 drivers/mtd/spi-nor/Makefile                                  |  1 -
 drivers/spi/Kconfig                                           | 10 ++++++++++
 drivers/spi/Makefile                                          |  1 +
 .../spi-nor/cadence-quadspi.c => spi/spi-cadence-quadspi.c}   |  0
 5 files changed, 11 insertions(+), 12 deletions(-)
 rename drivers/{mtd/spi-nor/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (100%)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index c1eda67d1ad2..de1c82c8137c 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -34,17 +34,6 @@ config SPI_ASPEED_SMC
 	  and support for the SPI flash memory controller (SPI) for
 	  the host firmware. The implementation only supports SPI NOR.
 
-config SPI_CADENCE_QUADSPI
-	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || ARM64 || COMPILE_TEST)
-	help
-	  Enable support for the Cadence Quad SPI Flash controller.
-
-	  Cadence QSPI is a specialized controller for connecting an SPI
-	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
-	  device with a Cadence QSPI controller and want to access the
-	  Flash as an MTD device.
-
 config SPI_HISI_SFC
 	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 9c5ed03cdc19..747e4386273d 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
-obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
 obj-$(CONFIG_SPI_MTK_QUADSPI)    += mtk-quadspi.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index d6ed0c355954..2735569ed2ea 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -193,6 +193,16 @@ config SPI_CADENCE
 	  This selects the Cadence SPI controller master driver
 	  used by Xilinx Zynq and ZynqMP.
 
+config SPI_CADENCE_QUADSPI
+	tristate "Cadence Quad SPI controller"
+	depends on OF && (ARM || ARM64 || COMPILE_TEST || X86)
+	help
+	  Enable support for the Cadence Quad SPI Flash controller.
+
+	  Cadence QSPI is a specialized controller for connecting an SPI
+	  Flash over 1/2/4/8-bit wide bus. This enables support for the Octal
+	  and Quad SPI variants of Cadence QSPI IP.
+
 config SPI_CLPS711X
 	tristate "CLPS711X host SPI controller"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 9b65ec5afc5e..a73cf7a7e635 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_SPI_BCM_QSPI)		+= spi-iproc-qspi.o spi-brcmstb-qspi.o spi-bcm-qspi.
 obj-$(CONFIG_SPI_BITBANG)		+= spi-bitbang.o
 obj-$(CONFIG_SPI_BUTTERFLY)		+= spi-butterfly.o
 obj-$(CONFIG_SPI_CADENCE)		+= spi-cadence.o
+obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= spi-cadence-quadspi.o
 obj-$(CONFIG_SPI_CLPS711X)		+= spi-clps711x.o
 obj-$(CONFIG_SPI_COLDFIRE_QSPI)		+= spi-coldfire-qspi.o
 obj-$(CONFIG_SPI_DAVINCI)		+= spi-davinci.o
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
similarity index 100%
rename from drivers/mtd/spi-nor/cadence-quadspi.c
rename to drivers/spi/spi-cadence-quadspi.c
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
