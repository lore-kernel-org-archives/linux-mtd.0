Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BA3C43140
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDD220870
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jg5wonXK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFbERyZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EDD220870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nUTqp9/cZVEysOC2gSXvl8UOayAl6+NYgmIG7YjR2JQ=; b=jg5wonXKkjj5/JL5MDFgrwQ5Oi
	yrpY3jDs2O+hn1rOSAdWORWPWGFCNa28f4BlPq2P+yLXlFcm8jMnSP81ETQAQZ6/pId+6FS0XJUM1
	a/N++imqDywdLGpK1GxVw1x/y5CbSgdOxwDqDBheB+7MbvtKUsdcFli3Pe38rwDkQd4bmbjpI2SUF
	iTW+2k4j4jTer56jLvIddrklO0ozZoE/G2ky2c8T5r8to3avOUv9IhBrUca6MB290m8IHfuC1vpro
	Jnvd5Xu7TIeXlPC6GUDeWnzMRHp0hBFHuaJILTfdz8wcXWmmviaAbAozaHtt6tF9iPXqe9jDVvGTc
	ZdG4tY8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uU9-0002x7-J7; Thu, 05 Sep 2019 16:19:49 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSZ-0000zM-Qn
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:14 +0000
Received: by mail-pf1-x443.google.com with SMTP id x127so2068118pfb.7
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NoTtLr1lztWfrS92BUWnGWn3zk0jvQAYseg1lZWuSGs=;
 b=GFbERyZ9NRV2dkkLT4vQsg2O43TovjaGYNn6dZQb4zlipk1hrBEI93ONy4uCdy17BN
 qs6turZaX0cjL2hsvD0XQcPWWyT5eGXz7QIlN5q8rtchZ5viCWRBDwkHQ7obcrcC3Uar
 1ortXnAwgQMvUwFZEFdfF67Zd3yS6nt3iV9SSsbRUiIhAZwUvGND/emO1CKYf2KWOr28
 VxlM82pRtImf20eiipHbpwiiWXaq0nZI2+bBsKhiaerAHkOFKlpVyiIpgMWISCo/STX0
 lWqLo+YlveCj4WJwPQ/Qdyw/LyipxCRHxudVAm/baaKD40BYKWBjg0PjlTT0keABvYme
 Sx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NoTtLr1lztWfrS92BUWnGWn3zk0jvQAYseg1lZWuSGs=;
 b=HMp7w+DO5jaLJEsH8+E62j1mUkudQpTvXCEYVDk3qLIdZ93UzyhYqRhnwMs6lpiDAj
 3ciN0Efdr26gY3M2psNyMhCaLeGMBdbSmhPmp2GMOH69wvdJdufTQphd9t/dmCbzY1Tw
 4iASeWY+Bft8va3Kays/mqRZMQe+234a9dFMfHXOsRgUZc/zHhL3qvZKwTeycmZquNZ+
 +RPZyNIbNZ0PVxNI0E6rnIZOsaymTiDIBoiKnxchQCvyPZjIIFPs2+tLvKSn8bXJzLQ/
 mZ6lFJtmqOdV43Ar2DdqbYCEK+Mpx53Hg9fF596eIBHPClQqA8HsUSxzjuU7nnOYBJJO
 uYAg==
X-Gm-Message-State: APjAAAVdLQigey9LzRmyWINl8rrM4OdfDNefQ/kBdi0C5J5QalY+hd1V
 R54Qp95WPCT5d07lnSO6u1P6XUkZJ+8=
X-Google-Smtp-Source: APXvYqxTYivq/efmoU5WtwxZv5cSxczPS7YC9boEJTkxinNAbnn0GjS2kdu7p4Li6YOQRyRvVr3Cpw==
X-Received: by 2002:a63:60a:: with SMTP id 10mr3873993pgg.381.1567700290813;
 Thu, 05 Sep 2019 09:18:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:10 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 08/18] mtd: spi-nor: cadence-quadspi: add a delay in
 write sequence
Date: Thu,  5 Sep 2019 10:17:49 -0600
Message-Id: <20190905161759.28036-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091811_948385_9F3A1F21 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Vignesh R <vigneshr@ti.com>

commit 61dc8493bae9ba82a1c72edbc6c6065f6a94456a upstream

As per 66AK2G02 TRM[1] SPRUHY8F section 11.15.5.3 Indirect Access
Controller programming sequence, a delay equal to couple of QSPI master
clock(~5ns) is required after setting CQSPI_REG_INDIRECTWR_START bit and
writing data to the flash. Introduce a quirk flag CQSPI_NEEDS_WR_DELAY
to handle this and set this flag for TI 66AK2G SoC.

[1]http://www.ti.com/lit/ug/spruhy8f/spruhy8f.pdf

Signed-off-by: Vignesh R <vigneshr@ti.com>
Acked-by: Marek Vasut <marek.vasut@gmail.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index f22dd34f4f83..ff4edf4bb23c 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -38,6 +38,9 @@
 #define CQSPI_NAME			"cadence-qspi"
 #define CQSPI_MAX_CHIPSELECT		16
 
+/* Quirks */
+#define CQSPI_NEEDS_WR_DELAY		BIT(0)
+
 struct cqspi_st;
 
 struct cqspi_flash_pdata {
@@ -76,6 +79,7 @@ struct cqspi_st {
 	u32			fifo_depth;
 	u32			fifo_width;
 	u32			trigger_address;
+	u32			wr_delay;
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 };
 
@@ -623,6 +627,15 @@ static int cqspi_indirect_write_execute(struct spi_nor *nor,
 	reinit_completion(&cqspi->transfer_complete);
 	writel(CQSPI_REG_INDIRECTWR_START_MASK,
 	       reg_base + CQSPI_REG_INDIRECTWR);
+	/*
+	 * As per 66AK2G02 TRM SPRUHY8F section 11.15.5.3 Indirect Access
+	 * Controller programming sequence, couple of cycles of
+	 * QSPI_REF_CLK delay is required for the above bit to
+	 * be internally synchronized by the QSPI module. Provide 5
+	 * cycles of delay.
+	 */
+	if (cqspi->wr_delay)
+		ndelay(cqspi->wr_delay);
 
 	while (remaining > 0) {
 		size_t write_words, mod_bytes;
@@ -1184,6 +1197,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
+	unsigned long data;
 	int ret;
 	int irq;
 
@@ -1241,6 +1255,10 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
+	data  = (unsigned long)of_device_get_match_data(dev);
+	if (data & CQSPI_NEEDS_WR_DELAY)
+		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
+						   cqspi->master_ref_clk_hz);
 
 	ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
 			       pdev->name, cqspi);
@@ -1312,7 +1330,14 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
 #endif
 
 static const struct of_device_id cqspi_dt_ids[] = {
-	{.compatible = "cdns,qspi-nor",},
+	{
+		.compatible = "cdns,qspi-nor",
+		.data = (void *)0,
+	},
+	{
+		.compatible = "ti,k2g-qspi",
+		.data = (void *)CQSPI_NEEDS_WR_DELAY,
+	},
 	{ /* end of table */ }
 };
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
