Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D9FC6379F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:19:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854A220857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IyzwYuj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854A220857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaI0j6LcazzNkaD/p+o2fhy5CsIlzUYJFtV01pvKJHs=; b=IyzwYuj68qamU14lzfeJ8xPyc/
	/86flZ6vIKH+zO/IN59l9KYX7OsuoZrDkQtQ3w/cr0Y684RI4bpQ7Ic/U7cAM+tK+DImdif8Zdmyp
	hR9zb0TkzdXiNMmkomBj3PoN01vvaQZmnPS+BE6M+qiW2k+GMGMANhQLrm+Ugn4OrHNpPDjnQlJrP
	skOaRwr5CICOBuNcrMlXXIcuUtxGB04IjtOK8HISjkTRU0vXJM4yrCwC/tO2ilyF+81AsqZ/496v2
	72qw+VCznCKauGXFBbYXp/9Dqvulqj7zjh3OSDvWorpaCHcemnHjbI9FarZC5pL36Zg39XuzE/lwW
	3ky6SM4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khPnF-0004oH-VU; Tue, 24 Nov 2020 04:19:06 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khPn6-0004jq-WE
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 04:18:58 +0000
IronPort-SDR: Lrzz0naXwYfiDjy08xXSTJh+hputOG9adm1mgrbHOSaRPr0yDlCLLbz1mTOKaUXYiotAMkH7K2
 RIXsd/X8C18A==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="159655719"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="159655719"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:18:55 -0800
IronPort-SDR: sBvWoYr74p3lWqqnUy+GsmydSZt6zi34vvPqv+loX2QigTV1lcwwOoglLotbf9NkFCuzUSrlK8
 OWYwl0KvlQfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="343029843"
Received: from sgsxdev004.isng.phoenix.local (HELO localhost) ([10.226.81.179])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2020 20:18:53 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v9 2/5] spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
Date: Tue, 24 Nov 2020 12:18:37 +0800
Message-Id: <20201124041840.31066-3-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_231857_225398_737454CA 
X-CRM114-Status: GOOD (  15.89  )
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
