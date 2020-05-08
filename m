Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D248CC38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C9B21974
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 18:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZj4hgZZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y0oSUs4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C9B21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK4QLT9pZxupERjepnTQWAM/OnuyaDreJWUKhcxZna0=; b=NZj4hgZZPJfjTF
	EbMTmU/1M4QuGwViXBNZfmLCBgyfgQZPCso6in+cXz9u1BojbxflHmKToRDT/vXAeWye/6IqIXrdg
	uxrR9FwCcCMmIIZt7ClR1pz4UPmLZBiF8YdYiGnufmp+P1DbUQzLugWdd2HS5c5hoPdxGUH50iWUt
	mWv7HjYBs+HaaxJ7zynHGOwijlM2TaUJMU00vjQJHKKk80eziVfB5fqOknE3MOZ3j11ntsrDUdhMB
	zkcBAaMm9agtciI5cnW9axGCsSl26+/SaWW4H7cMeGm+Fv7WmQSy9L/XDnT0yN0GZsoRMpCtWpGNh
	VI7JB6V+SWlXwLi7bOAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX89A-0004df-Bm; Fri, 08 May 2020 18:54:56 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX890-0004Sa-2l
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 18:54:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 048IsUZS109532;
 Fri, 8 May 2020 13:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588964071;
 bh=nkappEe1i83p54vViA9x+JNin0qaWSexrXsQ2rwMEWQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y0oSUs4ta56KFOcKAX6HUrM1vNIfqGalnQP9VILwZXu293ArqM9GhW/XrP6IwtMM9
 agYb8gJFxLTx68U4K/Qn3q0dBTgQDWNBeJEVX9TcBFqWqGry0yAQc5+eAgCCUE5Nj8
 s6oHTyGR+y9Yd9B/6QCbuUEPo/NhRS7cpP/wSFhc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsU97117508;
 Fri, 8 May 2020 13:54:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 May
 2020 13:54:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 May 2020 13:54:30 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 048IsGpU077355;
 Fri, 8 May 2020 13:54:26 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 2/6] mtd: spi-nor: cadence-quadspi: Provide a way to disable
 DAC mode
Date: Sat, 9 May 2020 00:24:07 +0530
Message-ID: <20200508185411.487-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508185411.487-1-vigneshr@ti.com>
References: <20200508185411.487-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_115446_204960_90DA4CB1 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently direct access mode is used on platforms that have AHB window
(memory mapped window) larger than flash size. This feature is limited
to TI platforms as non TI platforms have < 1MB of AHB window.
Therefore introduce a driver quirk to disable DAC mode and set it for
non TI compatibles. This is in preparation to move to spi-mem framework
where flash geometry cannot be known.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
index fa54f85e16d7..4d2e732b85b1 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
@@ -34,6 +34,7 @@
 
 /* Quirks */
 #define CQSPI_NEEDS_WR_DELAY		BIT(0)
+#define CQSPI_DISABLE_DAC_MODE		BIT(1)
 
 /* Capabilities mask */
 #define CQSPI_BASE_HWCAPS_MASK					\
@@ -1254,7 +1255,8 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 
 		f_pdata->registered = true;
 
-		if (mtd->size <= cqspi->ahb_size) {
+		if (mtd->size <= cqspi->ahb_size &&
+		    !(ddata->quirks & CQSPI_DISABLE_DAC_MODE)) {
 			f_pdata->use_direct_mode = true;
 			dev_dbg(nor->dev, "using direct mode for %s\n",
 				mtd->name);
@@ -1450,6 +1452,7 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
 
 static const struct cqspi_driver_platdata cdns_qspi = {
 	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
+	.quirks = CQSPI_DISABLE_DAC_MODE,
 };
 
 static const struct cqspi_driver_platdata k2g_qspi = {
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
