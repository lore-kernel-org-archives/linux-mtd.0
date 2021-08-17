Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD26C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:05:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC82460F14
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC82460F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKbGckJs/h+eCuc1TB7ahNWoe4hiQ+xgzu9JNzqUNj8=; b=q8MzW2lOqyzxQ4
	E5WiHeeDcz4iN5ScYsbDkH5iUqaDaC1ijLtvKirE/6aHX2v0JhDVeqoF898zwOZU7LQylAAgmaL9n
	H1COX0LA4KAxvuoHZjzQ3d8O/C4BCPjhavcp6W0Qk/PmIPRAQ0f+kfC6LBgqvcT7No5FETWGsZFuu
	bB/3XaIxY4xnpUFomvJMt8NEDJKxNgKXdgugzguyIIUMsIyM8Slh647yq+Bk+wLJRLlBarU0/SrFH
	E7kFtqtN/Qj+KCqp+3WKSCz87SFRh5AfEENnXJHX9Zbe5A3s+ZcTKkJEAZvQXsqNA+6EdjeiDarWG
	E1Zt6ZEIivhcQKf5cSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpP5-000tYq-Rs; Tue, 17 Aug 2021 03:04:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFoLN-000lKJ-9P
 for linux-mtd@bombadil.infradead.org; Tue, 17 Aug 2021 01:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gwm4vp8rjsWjjGf8PWBUulpfDpYNBiPAbn25BacEPVI=; b=IyximQH41i1X30x1/KqTDNTrcQ
 MZLjaB366AGjNKcnEYjx7/OswFx5xF93yolr47RL9JYx37BaIp6F4PaGMp5FfCqYBOFrcZsu8cnol
 QUhR96v8uI3gXlMUvYCSlS+ggZ/0EjjgNfpkmrz1D5PIu8uvLvZZA+VC4e+0ORHGMJO5v9aA6jdNk
 awHflvb9yrTKtWITo9pCzunGMg2qvHCzbqKyLgsC9yQ6HrG3N1ZGICLiBgnGyv5Bu+Fs1avrtFazB
 4oaJqieuYUBsBTYykYUxHg42GBdJXlQ9aIpk9h+InfqDQL31n7tQVhweJr7IguTshnpN1MJBjuwS2
 zQOFy0ug==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvx-00AJya-9D
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:32 +0000
Received: by mail-lj1-x232.google.com with SMTP id x7so30211692ljn.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwm4vp8rjsWjjGf8PWBUulpfDpYNBiPAbn25BacEPVI=;
 b=Fy8KLmK2MoY/leSpwNqjHGVp48kRMOP+zK0R/VkPTKJXa6g4LXq1IAxsbBdgx9XyB2
 Lm4fBoFQcvh6TRV/uZuzuZrJi61xAAxe5uZzXfbyRE4HzXVVCesvQKmQyKka5icgdAQg
 MYbGj85PiqGMJ/wZC6EhwGoa6Rat5q0i6TVwuVOVlBnh1N/GcJcDHbYmk84r/2gXwltl
 fpYjeSZBD7Ghuug6wq9nQLucom+sLNoQszbwctdjOH9VNzyM1rB2+B7VCbl6Wfo5feu9
 8rNpaujmlpMX+klV4qjnKV2TL7Vip/w2/yIJG8wYoKXgY5BTp+hRDzT8uEsG0CUu+mYz
 io5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwm4vp8rjsWjjGf8PWBUulpfDpYNBiPAbn25BacEPVI=;
 b=R1OAJxFtZqXcpHJVY9jiyAPkiko6mzsik9s/s7gPVzo+bj0kYLx4mcBXlF56m5HTHK
 dOKDI8NnnT68PhdLANiQrrWvT4nSEb9wMWvxh1HU9tcySqty26Z4z+asyjwb4Jm4jyxr
 7F5/EckKf3rErEnhPL0r8vU/ZRjB6wdwcQnY1wJxmvkebCnSILbfwds0wSeWG0DailTM
 kKHxdx6A7ibTvFc9804/9hbhV0YisYbROGaI4P/MU8iRyovYNvxnfmb70K0yAPw12jVg
 O7lhyfgh9id79RDEiTT7nluPpBMFLZzsQY3ZjZrPLE1roMs4Ft/NCC7+ZxXQnLxNxQRE
 Sc0A==
X-Gm-Message-State: AOAM532y6/rmWk9pgkbbt2UIQEIOW+iGCjKricI6gO5k7oq3iRNIbw13
 fMLksWyP9Dyn59tDCganxYs=
X-Google-Smtp-Source: ABdhPJy+goByVOHZLAqSVCo0afpBXrtrvBCR0ezq6OWZlwehQ2YkImXl+HsmkceKK7965D+ImAdEuQ==
X-Received: by 2002:a05:651c:118:: with SMTP id
 a24mr878911ljb.158.1629163825346; 
 Mon, 16 Aug 2021 18:30:25 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:25 -0700 (PDT)
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
Subject: [PATCH v8 20/34] mmc: sdhci-tegra: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:40 +0300
Message-Id: <20210817012754.8710-21-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_023029_404324_8E3FF35D 
X-CRM114-Status: GOOD (  24.63  )
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

The SDHCI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now SDHCI must be resumed using
runtime PM API in order to initialize the SDHCI power state. The SDHCI
clock rate must be changed using OPP API that will reconfigure the power
domain performance state in accordance to the rate. Add runtime PM and OPP
support to the SDHCI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 146 ++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 41 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 387ce9cdbd7c..a3583359c972 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -15,6 +15,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/mmc/card.h>
@@ -24,6 +26,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/ktime.h>
 
+#include <soc/tegra/common.h>
+
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
 
@@ -123,6 +127,12 @@
 					 SDHCI_TRNS_BLK_CNT_EN | \
 					 SDHCI_TRNS_DMA)
 
+enum {
+	TEGRA_CLK_BULK_SDHCI,
+	TEGRA_CLK_BULK_TMCLK,
+	TEGRA_CLK_BULK_NUM,
+};
+
 struct sdhci_tegra_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	u64 dma_mask;
@@ -171,6 +181,8 @@ struct sdhci_tegra {
 	bool enable_hwcq;
 	unsigned long curr_clk_rate;
 	u8 tuned_tap_delay;
+
+	struct clk_bulk_data clocks[TEGRA_CLK_BULK_NUM];
 };
 
 static u16 tegra_sdhci_readw(struct sdhci_host *host, int reg)
@@ -758,10 +770,15 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	struct device *dev = mmc_dev(host->mmc);
 	unsigned long host_clk;
+	int err;
 
-	if (!clock)
-		return sdhci_set_clock(host, clock);
+	if (!clock) {
+		sdhci_set_clock(host, clock);
+		dev_pm_opp_set_rate(dev, clock);
+		return;
+	}
 
 	/*
 	 * In DDR50/52 modes the Tegra SDHCI controllers require the SDHCI
@@ -776,7 +793,12 @@ static void tegra_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * from clk_get_rate() is used.
 	 */
 	host_clk = tegra_host->ddr_signaling ? clock * 2 : clock;
-	clk_set_rate(pltfm_host->clk, host_clk);
+
+	err = dev_pm_opp_set_rate(dev, host_clk);
+	if (err)
+		dev_err(dev, "failed to set clk rate to %luHz: %d\n",
+			host_clk, err);
+
 	tegra_host->curr_clk_rate = host_clk;
 	if (tegra_host->ddr_signaling)
 		host->max_clk = host_clk;
@@ -1653,6 +1675,21 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		goto err_power_req;
 	}
 
+	tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].id = NULL;
+	tegra_host->clocks[TEGRA_CLK_BULK_TMCLK].id = "tmclk";
+
+	rc = devm_clk_bulk_get_optional(&pdev->dev, TEGRA_CLK_BULK_NUM,
+					tegra_host->clocks);
+
+	/* controller clock is mandatory */
+	if (!rc && !tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].clk)
+		rc = -ENOENT;
+
+	if (rc) {
+		dev_err_probe(&pdev->dev, rc, "failed to get clock\n");
+		goto err_power_req;
+	}
+
 	/*
 	 * Tegra210 has a separate SDMMC_LEGACY_TM clock used for host
 	 * timeout clock and SW can choose TMCLK or SDCLK for hardware
@@ -1669,34 +1706,19 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	 */
 
 	if (soc_data->nvquirks & NVQUIRK_HAS_TMCLK) {
-		clk = devm_clk_get(&pdev->dev, "tmclk");
-		if (IS_ERR(clk)) {
-			rc = PTR_ERR(clk);
-			if (rc == -EPROBE_DEFER)
-				goto err_power_req;
-
-			dev_warn(&pdev->dev, "failed to get tmclk: %d\n", rc);
-			clk = NULL;
-		}
+		clk = tegra_host->clocks[TEGRA_CLK_BULK_TMCLK].clk;
+		if (!clk)
+			dev_warn(&pdev->dev, "failed to get tmclk");
 
 		clk_set_rate(clk, 12000000);
-		rc = clk_prepare_enable(clk);
-		if (rc) {
-			dev_err(&pdev->dev,
-				"failed to enable tmclk: %d\n", rc);
-			goto err_power_req;
-		}
-
-		tegra_host->tmclk = clk;
 	}
 
-	clk = devm_clk_get(mmc_dev(host->mmc), NULL);
-	if (IS_ERR(clk)) {
-		rc = dev_err_probe(&pdev->dev, PTR_ERR(clk),
-				   "failed to get clock\n");
-		goto err_clk_get;
+	clk = tegra_host->clocks[TEGRA_CLK_BULK_SDHCI].clk;
+	if (!clk) {
+		dev_err(&pdev->dev, "failed to get sdhci clock\n");
+		rc = -ENOENT;
+		goto err_power_req;
 	}
-	clk_prepare_enable(clk);
 	pltfm_host->clk = clk;
 
 	tegra_host->rst = devm_reset_control_get_exclusive(&pdev->dev,
@@ -1704,9 +1726,18 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra_host->rst)) {
 		rc = PTR_ERR(tegra_host->rst);
 		dev_err(&pdev->dev, "failed to get reset control: %d\n", rc);
-		goto err_rst_get;
+		goto err_power_req;
 	}
 
+	rc = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (rc)
+		goto err_power_req;
+
+	pm_runtime_enable(&pdev->dev);
+	rc = pm_runtime_resume_and_get(&pdev->dev);
+	if (rc)
+		goto err_pm_get;
+
 	rc = reset_control_assert(tegra_host->rst);
 	if (rc)
 		goto err_rst_get;
@@ -1728,9 +1759,9 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 err_add_host:
 	reset_control_assert(tegra_host->rst);
 err_rst_get:
-	clk_disable_unprepare(pltfm_host->clk);
-err_clk_get:
-	clk_disable_unprepare(tegra_host->tmclk);
+	pm_runtime_put(&pdev->dev);
+err_pm_get:
+	pm_runtime_disable(&pdev->dev);
 err_power_req:
 err_parse_dt:
 	sdhci_pltfm_free(pdev);
@@ -1747,19 +1778,44 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
 
 	reset_control_assert(tegra_host->rst);
 	usleep_range(2000, 4000);
-	clk_disable_unprepare(pltfm_host->clk);
-	clk_disable_unprepare(tegra_host->tmclk);
+
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	sdhci_pltfm_free(pdev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
+static int __maybe_unused sdhci_tegra_runtime_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+
+	clk_bulk_disable_unprepare(TEGRA_CLK_BULK_NUM, tegra_host->clocks);
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_tegra_runtime_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	int err;
+
+	err = dev_pm_opp_sync(dev);
+	if (err)
+		return err;
+
+	return clk_bulk_prepare_enable(TEGRA_CLK_BULK_NUM, tegra_host->clocks);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int sdhci_tegra_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
 	int ret;
 
 	if (host->mmc->caps2 & MMC_CAP2_CQE) {
@@ -1774,17 +1830,22 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
 		return ret;
 	}
 
-	clk_disable_unprepare(pltfm_host->clk);
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		sdhci_resume_host(host);
+		cqhci_resume(host->mmc);
+		return ret;
+	}
+
 	return 0;
 }
 
-static int __maybe_unused sdhci_tegra_resume(struct device *dev)
+static int sdhci_tegra_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
-	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	int ret;
 
-	ret = clk_prepare_enable(pltfm_host->clk);
+	ret = pm_runtime_force_resume(dev);
 	if (ret)
 		return ret;
 
@@ -1803,13 +1864,16 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
 suspend_host:
 	sdhci_suspend_host(host);
 disable_clk:
-	clk_disable_unprepare(pltfm_host->clk);
+	pm_runtime_force_suspend(dev);
 	return ret;
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
-			 sdhci_tegra_resume);
+static const struct dev_pm_ops sdhci_tegra_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_tegra_runtime_suspend, sdhci_tegra_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_tegra_suspend, sdhci_tegra_resume)
+};
 
 static struct platform_driver sdhci_tegra_driver = {
 	.driver		= {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
