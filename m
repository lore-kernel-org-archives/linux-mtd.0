Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF57C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 05:57:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C19E2225E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 05:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xKgawL02"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C19E2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL5gVxtKmjf/JUR31BOI4esI1YDfCnaQ8SNRXh9Ha4Q=; b=xKgawL02E/NJASHnpQ9TvE8UC/
	01GPtzoeH/n72/lMoA+UBRuKj2IYit3Ll7cJnNPoh420L7RmqHd22HVOFy2UBKDN6mAH07kHLlJKZ
	1QaEqSZ01sIAwn9kyWVhZ0rW5vo461GW8BJL3MOv04lMsI9MYPpCg0jOM+n4B8OOjL6Nka+iCmETX
	FzbgxSFJssUBvEGJ03d0A7EsxHi4Z/9gnR+kCaAr7TZIfG/4HoJOcCANoXAoOxFQ5ylcm6ml81UCZ
	V6USaHtrxd77zuViOzd3g3A877pWJ2sj/WSVJ6+McuLymeQyEenQ53QllFSaeWGBokH8zzokcH/0A
	NXj/aD7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfcvc-00067r-Il; Thu, 19 Nov 2020 05:56:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfcvS-00065D-Jr
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 05:56:11 +0000
IronPort-SDR: n4gTdTPxddG4upiQ0p3htOro1ohaK077NHIYr2p20XaWOjd5A5Bu2ouVftO5M2+3Rd8Jza1QHC
 +M+Lezs2UUHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="170455385"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="170455385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 21:56:09 -0800
IronPort-SDR: 9uBxVasPUCKDhPaAGMzn6MMbAfroMvWRRlAJNKMORKZJLjhUcYfcGMzLzg2rdvJozCE4gS97oK
 vzcYGyCU3OXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="544867340"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga005.jf.intel.com with ESMTP; 18 Nov 2020 21:56:06 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v8 3/6] spi: cadence-quadspi: Add multi-chipselect support for
 Intel LGM SoC
Date: Thu, 19 Nov 2020 13:55:51 +0800
Message-Id: <20201119055551.26493-4-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_005610_853881_C4A77E10 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: cheol.yong.kim@intel.com, vigneshr@ti.com,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add multiple chipselect support for Intel LGM SoCs,
currently QSPI-NOR and QSPI-NAND supported.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/spi/spi-cadence-quadspi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index d12b765e87be..337778f75d5d 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -38,6 +38,7 @@
 
 /* Capabilities */
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
+#define CQSPI_SUPPORTS_MULTI_CHIPSELECT BIT(1)
 
 struct cqspi_st;
 
@@ -75,6 +76,7 @@ struct cqspi_st {
 	bool			is_decoded_cs;
 	u32			fifo_depth;
 	u32			fifo_width;
+	u32			num_chipselect;
 	bool			rclk_en;
 	u32			trigger_address;
 	u32			wr_delay;
@@ -1049,6 +1051,7 @@ static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
 
 static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
 {
+	const struct cqspi_driver_platdata *ddata;
 	struct device *dev = &cqspi->pdev->dev;
 	struct device_node *np = dev->of_node;
 
@@ -1070,6 +1073,14 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
 		return -ENXIO;
 	}
 
+	ddata  = of_device_get_match_data(dev);
+	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT) {
+		if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect)) {
+			dev_err(dev, "couldn't determine number of cs\n");
+			return -ENXIO;
+		}
+	}
+
 	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
 
 	return 0;
@@ -1302,6 +1313,9 @@ static int cqspi_probe(struct platform_device *pdev)
 	cqspi->current_cs = -1;
 	cqspi->sclk = 0;
 
+	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT)
+		master->num_chipselect = cqspi->num_chipselect;
+
 	ret = cqspi_setup_flash(cqspi);
 	if (ret) {
 		dev_err(dev, "failed to setup flash parameters %d\n", ret);
@@ -1391,6 +1405,7 @@ static const struct cqspi_driver_platdata am654_ospi = {
 };
 
 static const struct cqspi_driver_platdata intel_lgm_qspi = {
+	.hwcaps_mask = CQSPI_SUPPORTS_MULTI_CHIPSELECT,
 	.quirks = CQSPI_DISABLE_DAC_MODE,
 };
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
