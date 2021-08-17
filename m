Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1358C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB1A60F39
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FB1A60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALEaePBKusairXQf/mxqtRs48Jhuh1AUz9+qahNkcvs=; b=FR1Y58AUNO3IqB
	PBZepMxN3ZC3eviIlrTX5FF7mdo/c4YZv0/h7gOaRsC0FBJ2ynTXIv0bpRge+fKEaTi7Zg3Aw7kIy
	59Zjy2g9W3j2P1CNX9Z2HY7/GwGL+J+z2DPbEfafn5FMVjI0rq5rCmiXS1C4X6UaGHc9jmocxbn6u
	thLA26/SoPyFbKqNylyWim3mam13ytzjPOF1vDu6QDc4th7U1ZmUOiUPOA7BJ+1nuU5Q7CIjjf7A8
	oQmFlSwrmDpab9pOsq46Jztjg/OCiQjmw1PvuuhhIyccrRw0FPCd3CfTaaZCBPrVWTxWfUFGNXifR
	1fFNuIO4YIbeswZTN0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoIW-000l9p-9c; Tue, 17 Aug 2021 01:53:49 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvt-000gtN-FY
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:31 +0000
Received: by mail-lf1-f49.google.com with SMTP id t9so38199456lfc.6
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVewrQPLqMIzX/eUr1ccRXf6dVPwW04CHGi9g8P6H2I=;
 b=Ngw0q21CDl+yxQ7xI6sFiWFDLy1/jXJWCzDmmHgTyR7UHFdWvRHsZx+fwwbTxV2Cyv
 gN6KKIyDdmn9trt+zxJhnrKxJcVQ+dnkic/3q9GtmrOvXqnunqZ+3rLOZ5UuPH5SKRXQ
 wHnnssBODCzWhAf3IXJsR51tcgLbdYamJQnd58q7DpKGQ4YxYliB2agkeVrrv0VQH3WD
 yX57PPPDbCytK20teu7FFGxH65vic3f2b3gEAv0Mzw0Wl85PutrUYT2zIxxGhQmXSuej
 il2Sc7DptAVhnwSP4QkipTWxTtJR6TstiShQkQRUQrPcr1noWm9NKLF1HbC63QkYiuH+
 PRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVewrQPLqMIzX/eUr1ccRXf6dVPwW04CHGi9g8P6H2I=;
 b=sLw3kEtm1394WnXXNrkx1zpNDZoCO5quSQjl8cf2rOLGWtPa/NRYvnUWJL75CLDfQ9
 zwzrCJPwjZQ37bwI0tKQii8MCaUYc3t10DQuNEipqrrjpYONmvzQi4ozVNgTCkuTWkTk
 s4ERv8QIz4DL3TtpydQ4olEVcdKqQ5eGCbhi8s1b6JZm/HePsMJIQSnLcj8SDg0aEAYD
 tbaoLR4GvsTJJYGHRTtsMpOf7O0vzhjUPmUBY+NAwCwgvD31iYM0Vj5N1BJyoXhn8qbB
 8ohIQ77qajPYPS8vNp7tSD4EWEL0WVT2BxKpgD5mgh0Ah8rbps8nztcZl39cF9S29EHr
 vVLQ==
X-Gm-Message-State: AOAM532ku2TpScx2byUffrKc+8mcZ1BTTpP3S9lAqTRtDILeIFg8c/bP
 GwqHJO2WGSD9zWuz/RRsYAE=
X-Google-Smtp-Source: ABdhPJwQhGPy+Iac60Z/w+/X1SqDXqcJNZewEFmLnX1JN/Qye3BOu6cFpYRzvaojzNHG7UQlI4Pj5A==
X-Received: by 2002:a05:6512:304a:: with SMTP id
 b10mr522160lfb.442.1629163823026; 
 Mon, 16 Aug 2021 18:30:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 18/34] bus: tegra-gmi: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:38 +0300
Message-Id: <20210817012754.8710-19-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183025_610842_3423BC41 
X-CRM114-Status: GOOD (  21.39  )
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

The GMI bus on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now GMI must be resumed using
runtime PM API in order to initialize the GMI power state. Add runtime PM
and OPP support to the GMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/bus/tegra-gmi.c | 92 ++++++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 24 deletions(-)

diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index a6570789f7af..51cac6822f20 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -13,8 +13,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define TEGRA_GMI_CONFIG		0x00
 #define TEGRA_GMI_CONFIG_GO		BIT(31)
 #define TEGRA_GMI_BUS_WIDTH_32BIT	BIT(30)
@@ -54,36 +58,20 @@ static int tegra_gmi_enable(struct tegra_gmi *gmi)
 {
 	int err;
 
-	err = clk_prepare_enable(gmi->clk);
-	if (err < 0) {
-		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+	pm_runtime_enable(gmi->dev);
+	err = pm_runtime_resume_and_get(gmi->dev);
+	if (err) {
+		pm_runtime_disable(gmi->dev);
 		return err;
 	}
 
-	reset_control_assert(gmi->rst);
-	usleep_range(2000, 4000);
-	reset_control_deassert(gmi->rst);
-
-	writel(gmi->snor_timing0, gmi->base + TEGRA_GMI_TIMING0);
-	writel(gmi->snor_timing1, gmi->base + TEGRA_GMI_TIMING1);
-
-	gmi->snor_config |= TEGRA_GMI_CONFIG_GO;
-	writel(gmi->snor_config, gmi->base + TEGRA_GMI_CONFIG);
-
 	return 0;
 }
 
 static void tegra_gmi_disable(struct tegra_gmi *gmi)
 {
-	u32 config;
-
-	/* stop GMI operation */
-	config = readl(gmi->base + TEGRA_GMI_CONFIG);
-	config &= ~TEGRA_GMI_CONFIG_GO;
-	writel(config, gmi->base + TEGRA_GMI_CONFIG);
-
-	reset_control_assert(gmi->rst);
-	clk_disable_unprepare(gmi->clk);
+	pm_runtime_put(gmi->dev);
+	pm_runtime_disable(gmi->dev);
 }
 
 static int tegra_gmi_parse_dt(struct tegra_gmi *gmi)
@@ -213,6 +201,7 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 	if (!gmi)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, gmi);
 	gmi->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -232,6 +221,10 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return PTR_ERR(gmi->rst);
 	}
 
+	err = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (err)
+		return err;
+
 	err = tegra_gmi_parse_dt(gmi);
 	if (err)
 		return err;
@@ -247,8 +240,6 @@ static int tegra_gmi_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, gmi);
-
 	return 0;
 }
 
@@ -262,6 +253,58 @@ static int tegra_gmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused tegra_gmi_runtime_resume(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+	int err;
+
+	err = dev_pm_opp_sync(gmi->dev);
+	if (err) {
+		dev_err(gmi->dev, "failed to sync OPP: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(gmi->clk);
+	if (err < 0) {
+		dev_err(gmi->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	reset_control_assert(gmi->rst);
+	usleep_range(2000, 4000);
+	reset_control_deassert(gmi->rst);
+
+	writel(gmi->snor_timing0, gmi->base + TEGRA_GMI_TIMING0);
+	writel(gmi->snor_timing1, gmi->base + TEGRA_GMI_TIMING1);
+
+	gmi->snor_config |= TEGRA_GMI_CONFIG_GO;
+	writel(gmi->snor_config, gmi->base + TEGRA_GMI_CONFIG);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_gmi_runtime_suspend(struct device *dev)
+{
+	struct tegra_gmi *gmi = dev_get_drvdata(dev);
+	u32 config;
+
+	/* stop GMI operation */
+	config = readl(gmi->base + TEGRA_GMI_CONFIG);
+	config &= ~TEGRA_GMI_CONFIG_GO;
+	writel(config, gmi->base + TEGRA_GMI_CONFIG);
+
+	reset_control_assert(gmi->rst);
+
+	clk_disable_unprepare(gmi->clk);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_gmi_pm = {
+	SET_RUNTIME_PM_OPS(tegra_gmi_runtime_suspend, tegra_gmi_runtime_resume,
+			   NULL)
+};
+
 static const struct of_device_id tegra_gmi_id_table[] = {
 	{ .compatible = "nvidia,tegra20-gmi", },
 	{ .compatible = "nvidia,tegra30-gmi", },
@@ -275,6 +318,7 @@ static struct platform_driver tegra_gmi_driver = {
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
+		.pm = &tegra_gmi_pm,
 	},
 };
 module_platform_driver(tegra_gmi_driver);
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
