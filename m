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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF5CC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:41:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC2D60EE4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AC2D60EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilz1pXEwdOaasWqctDQaYZjBacILXQMWOd7HMOkgDeA=; b=gkXqhIKupE7Ktd
	B51ukAx4RH1c6RnX1qDzqe6yV5tcalnmefeCSE2VB28HdfgbufdDjCHJ5+KQuQ7h/jU6QCbJzJjkX
	9oE8y0Ywo68Cy2UEpgjxUMcVkfiFFgis/zWk/AMfrtBF0GUnjejyJVmUAQudXcxCM9fh682RBXkQJ
	Qir0meUnbgpI/Ti563oNQwMNtnosfBc+HowSpbwQdGVhMYndoYInC71Mv9FlrUyXkljz/DT32vryG
	da2mGi8L4F+J77wrOVnw2JLmSbNF/DSIB+8/JDrvoBEQYT0V11+7KgpIdGfnhNwm3/p3E3YHXCsUN
	Ij78Eq3eeJDdyHXDW0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFo69-000jYN-R4; Tue, 17 Aug 2021 01:41:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvl-000glz-S0
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id p38so38352182lfa.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPjoO7213ncEQO3had/PKOowLO8AvF8+e1hZH6AGNkg=;
 b=afXQTrhk1k1C/vh26JvfNmlZszhr6uun1TZF4/jqNovH/TpoAn+pkABdGZYH1o23ZF
 QiLhxlcxpbGHNMdRG6+NrhIfnOjSkqg84i7jeuesiBMHp8l/6II/0oJ2BQQuBgExDr6Z
 AzquDpGevLYrYFzYcALbqQcW0FIb5Sbkt/tgEwshtaEtTq0VQg/sqRViZq//NpGkwa87
 6mb7+8fuLZygA/4yBXZNPunbGUdcLDkhVAaUaNSqCk8ZTZGtyVELJMe/t+HG2x7S2C0J
 wx3kKdVdPGgckoMQOf5Ehg8qEJ0dijrDGxhbKdhXtv0zPzEaLsLG6e79WQnP/qSSlmm0
 8HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPjoO7213ncEQO3had/PKOowLO8AvF8+e1hZH6AGNkg=;
 b=UYiXLpzYJ4fAoms957U4PPF4Gq2at745g72LH/gDPiSr2wwq/EMptmN/bNzdvEqXhy
 sjMUj8FJ6H/cJhppzb0IhH7tTlwVQUNWTbyAs3/BoahPDVkz+bb7KCLJ8W8yxnDPvjGk
 mtqdl66mRfkkI9veidxRAdUe1LPuiQtI8rCmUvggw21xuEpwS9poKsIINAos6qLV4kvZ
 2yIqL0Lcuinyk+6avYoXmVfhhglKOlRzBj0RcZDjBybiDDwte/gFxBixQKTnCwTAk7Hw
 tMyw2mtBlMUwXSR0YnHyZOFNUmWbICOzrSaqMmpcY5CEUU39cy/j9lgZ/OxVvzdezlro
 kHwA==
X-Gm-Message-State: AOAM532QSlcZHF1EH+apaJHHxPIwUSrqidU9293Pk4dhclAh1sD9afPO
 uFt7lzHbFZSucC7qMQcgPqA=
X-Google-Smtp-Source: ABdhPJzo9zkvVO8HLn0YI7esTDIJQaYPt1Tf+SYrjtzJl58XEoAB+Cak+dDOjeUmcJGASHQQ2DghAw==
X-Received: by 2002:a19:4958:: with SMTP id l24mr499818lfj.48.1629163815838;
 Mon, 16 Aug 2021 18:30:15 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:15 -0700 (PDT)
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
Subject: [PATCH v8 12/34] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Date: Tue, 17 Aug 2021 04:27:32 +0300
Message-Id: <20210817012754.8710-13-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183017_999982_622EB210 
X-CRM114-Status: GOOD (  21.14  )
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

Add OPP and SoC core voltage scaling support to the display controller
driver. This is required for enabling system-wide DVFS on pre-Tegra186
SoCs.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 74 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.h |  2 ++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..435dd8139c6e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -11,9 +11,12 @@
 #include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
 #include <soc/tegra/pmc.h>
 
 #include <drm/drm_atomic.h>
@@ -1762,6 +1765,47 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 	return 0;
 }
 
+static void tegra_dc_update_voltage_state(struct tegra_dc *dc,
+					  struct tegra_dc_state *state)
+{
+	unsigned long rate, pstate;
+	struct dev_pm_opp *opp;
+	int err;
+
+	if (!dc->has_opp_table)
+		return;
+
+	/* calculate actual pixel clock rate which depends on internal divider */
+	rate = DIV_ROUND_UP(clk_get_rate(dc->clk) * 2, state->div + 2);
+
+	/* find suitable OPP for the rate */
+	opp = dev_pm_opp_find_freq_ceil(dc->dev, &rate);
+
+	if (opp == ERR_PTR(-ERANGE))
+		opp = dev_pm_opp_find_freq_floor(dc->dev, &rate);
+
+	if (IS_ERR(opp)) {
+		dev_err(dc->dev, "failed to find OPP for %luHz: %pe\n",
+			rate, opp);
+		return;
+	}
+
+	pstate = dev_pm_opp_get_required_pstate(opp, 0);
+	dev_pm_opp_put(opp);
+
+	/*
+	 * The minimum core voltage depends on the pixel clock rate (which
+	 * depends on internal clock divider of the CRTC) and not on the
+	 * rate of the display controller clock. This is why we're not using
+	 * dev_pm_opp_set_rate() API and instead controlling the power domain
+	 * directly.
+	 */
+	err = dev_pm_genpd_set_performance_state(dc->dev, pstate);
+	if (err)
+		dev_err(dc->dev, "failed to set power domain state to %lu: %d\n",
+			pstate, err);
+}
+
 static void tegra_dc_commit_state(struct tegra_dc *dc,
 				  struct tegra_dc_state *state)
 {
@@ -1801,6 +1845,8 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 		value = SHIFT_CLK_DIVIDER(state->div) | PIXEL_CLK_DIVIDER_PCD1;
 		tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
 	}
+
+	tegra_dc_update_voltage_state(dc, state);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
@@ -1994,6 +2040,13 @@ static void tegra_crtc_atomic_disable(struct drm_crtc *crtc,
 	err = host1x_client_suspend(&dc->client);
 	if (err < 0)
 		dev_err(dc->dev, "failed to suspend: %d\n", err);
+
+	if (dc->has_opp_table) {
+		err = dev_pm_genpd_set_performance_state(dc->dev, 0);
+		if (err)
+			dev_err(dc->dev,
+				"failed to clear power domain state: %d\n", err);
+	}
 }
 
 static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -2976,6 +3029,23 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_init_opp_table(struct tegra_dc *dc)
+{
+	struct tegra_core_opp_params opp_params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dc->dev, &opp_params);
+	if (err && err != -ENODEV)
+		return err;
+
+	if (err)
+		dc->has_opp_table = false;
+	else
+		dc->has_opp_table = true;
+
+	return 0;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	u64 dma_mask = dma_get_mask(pdev->dev.parent);
@@ -3041,6 +3111,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		tegra_powergate_power_off(dc->powergate);
 	}
 
+	err = tegra_dc_init_opp_table(dc);
+	if (err < 0)
+		return err;
+
 	dc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dc->regs))
 		return PTR_ERR(dc->regs);
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index f0cb691852a1..26ad1e448c44 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -106,6 +106,8 @@ struct tegra_dc {
 	struct drm_info_list *debugfs_files;
 
 	const struct tegra_dc_soc_info *soc;
+
+	bool has_opp_table;
 };
 
 static inline struct tegra_dc *
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
