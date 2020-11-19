Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E162C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 05:57:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0578B22227
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 05:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXzlRuGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0578B22227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaI0j6LcazzNkaD/p+o2fhy5CsIlzUYJFtV01pvKJHs=; b=FXzlRuGP9CpCLsJNvHxlbtb7Nn
	wjjteAFUWd0srJBKh8I4S5kMwUpipKVgJKn0kE3mMuHiDznLde7h2l3jbWr5a6zpp8d4O8rGdxaRj
	4vWDToV7Ap6v83HO88fKLKwr+j8OQIupg7KCUE6RLBLcBVzZubSgWtOTpLx8SJjQqwt9Ziq8FVC+3
	Q2DQ/sPSD0A8h+2QxXHh6nYGrCE+mEW8e84i6gUASEb/V46W8ECm78GG4XrN8Qp8Qy5wjGD6CaIDR
	RuPXY/jXIKJyhgUGbLmSv+ImiCy22gJeW6+zyX2f3ccAw4FmWxBWZC+zXlqrXSrui9JdXCOZ1CLFf
	abM+Lo5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfcve-00068K-QI; Thu, 19 Nov 2020 05:56:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfcvS-00065E-NU
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 05:56:12 +0000
IronPort-SDR: qwV6jwsMFL+6DkSj8jTdH5xeGDWQS9TC60R7iiAMCkGi26qRjOuDC09crcKIX01NmMYurzscH+
 ivW5jGj7A+mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="159008584"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="159008584"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 21:56:06 -0800
IronPort-SDR: NIHVA54biUQpFvy7sdiau2+F6e5Jwb4O9y/su962MifuStnvod73OwgXTFjM4oHJJmoYFlNpcD
 1tvhIQEUad5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="401404952"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga001.jf.intel.com with ESMTP; 18 Nov 2020 21:56:03 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v8 2/6] spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
Date: Thu, 19 Nov 2020 13:55:50 +0800
Message-Id: <20201119055551.26493-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_005610_960954_A856DD8F 
X-CRM114-Status: GOOD (  16.52  )
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

On Intel Lightning Mountain(LGM) SoCs QSPI controller do not use
Direct Access Controller(DAC).

This patch adds a quirk to disable the Direct Access Controller
for data transfer instead it uses indirect data transfe

DAC bit resets to 1 so there is no need to explicitly set it.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/spi/spi-cadence-quadspi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index d7b10c46fa70..d12b765e87be 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1101,10 +1101,12 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
 	writel(cqspi->fifo_depth * cqspi->fifo_width / 8,
 	       cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
 
-	/* Enable Direct Access Controller */
-	reg = readl(cqspi->iobase + CQSPI_REG_CONFIG);
-	reg |= CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
-	writel(reg, cqspi->iobase + CQSPI_REG_CONFIG);
+	/* Disable direct access controller */
+	if (!cqspi->use_direct_mode) {
+		reg = readl(cqspi->iobase + CQSPI_REG_CONFIG);
+		reg &= ~CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
+		writel(reg, cqspi->iobase + CQSPI_REG_CONFIG);
+	}
 
 	cqspi_controller_enable(cqspi, 1);
 }
@@ -1388,6 +1390,10 @@ static const struct cqspi_driver_platdata am654_ospi = {
 	.quirks = CQSPI_NEEDS_WR_DELAY,
 };
 
+static const struct cqspi_driver_platdata intel_lgm_qspi = {
+	.quirks = CQSPI_DISABLE_DAC_MODE,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
@@ -1403,6 +1409,7 @@ static const struct of_device_id cqspi_dt_ids[] = {
 	},
 	{
 		.compatible = "intel,lgm-qspi",
+		.data = &intel_lgm_qspi,
 	},
 	{ /* end of table */ }
 };
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
