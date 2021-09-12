Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C56C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00C9260EE7
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00C9260EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQll7JHv1pqM42hkfXU+9JyY/1dprkx2PKKGj07fe6s=; b=XihjbQUas2uNVd
	xGYiABXYP1T2fGhx76nv6qxiHYyhRwM2csLR+zgnn1I+3pRlDxUoHltyM83SKhynopu5LM4yfLYFl
	L4bdELvi7X0EU6qa5aIBielGL5MtmsX7VNEc7EET0AbI4v/ANB63u7VtiBdSj6Sjlxh1ZYXBNm20s
	6Y4xam+W2EUl/J874LFTXQVYFzTGyE6jdD0HEKSlCpQmXhoI1Gs5vqnpcolYgQLbvOfHoo8oN16qK
	YVqym/zmBl/5ktm482RajkqiO2QsDLBfVXQdhG+hjw5PIhInqxO2p5aTfIxIRP+a5iOBQHSXYJZvJ
	OUjJyy/NszeHt8j5rVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPWDL-00HCIe-0S; Sun, 12 Sep 2021 20:36:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnu-00H6ks-VV
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id i23so11323466wrb.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
 b=G0spcEnCzOQCkuNQgfrt9aJ1s9cBMwbonJ21TiGcPfDH6BwdcSAKB34wnjhKexl1aX
 l4QKGmRZilMs7SIMnsyw/rzMW6Tq89W0VtF00UUpWh39GqdRIeJlpORK0Sm6pzwg12UU
 A9ns1EUAcijc8JvCglvlpmlJp8eB5LZeDDHQQe4+0e/fcg+b75UHm/se/iYa5CJAyyvO
 g/Bv0tRIsHs06qgWJ49GwtSqQp0iStg29EIqZA8Iv1iGZ+DC2i7FLd9aX8PKc82j9r5K
 N4R9eOcakSQ2dMJpvhQ6vKuDg6bAPiCCyUoMFFFgJoc3QG11NvM5MKSucOKzgHCGn6Ed
 gZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TplqdteIbqpMA+cRsM4zt2txSdRrivaAa9SZu7q2V5k=;
 b=E9i0854oi9aJMZXw7xROkeFHOJSX0prOVZSR3w/AnNFfjpKbPwt8EZnc0+IRjBRE7o
 dvhZzPF2NwuMFP+7FjQPmUDXwfEgwof20m2SXk3HEZ9PiIPvGcNcoXgJiX3RQpStRXdu
 DuhUj38OtecEpsCpRwD6+FEkj+uAQDaOce1nMIh1ZdGID/wMq5xTzIyo9sYtD7NF3w73
 RLHSCR2klvDmhxj/47NzcLHp3UcsOiH48mFAST66L0xwDK2CdaBJwQ2hxvB/eMM8/kQp
 8d85vJli/YpxoSDqTAn9G7NG+3bS4HPU2sR+JV1gKN0QgLrOyGcvekv44orD1/eGv4zF
 z0Gw==
X-Gm-Message-State: AOAM530lJrWHdyJyrtUSS+8BxJg3KUEcZ0zXxgEDLnOmsj9OaQkUmFaP
 LVu0bM9eF0j4w5Nk8uL8vVA=
X-Google-Smtp-Source: ABdhPJygGmsQdbqJ3F8jYp9/me38locbgNBHzvCseDlDLbb0hvBjdzuJidprL1L6Sn7B6LE3nPX+FA==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr8991443wre.380.1631477417535; 
 Sun, 12 Sep 2021 13:10:17 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:17 -0700 (PDT)
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
Subject: [PATCH v11 18/34] pwm: tegra: Add runtime PM and OPP support
Date: Sun, 12 Sep 2021 23:08:16 +0300
Message-Id: <20210912200832.12312-19-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131019_084821_91B9E5B4 
X-CRM114-Status: GOOD (  23.02  )
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

The PWM on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now PWM must be resumed using
runtime PM API in order to initialize the PWM power state. The PWM clock
rate must be changed using OPP API that will reconfigure the power domain
performance state in accordance to the rate. Add runtime PM and OPP
support to the PWM driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/pwm/pwm-tegra.c | 88 ++++++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 11a10b575ace..afb5ecde007e 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -42,12 +42,16 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pwm.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #define PWM_ENABLE	(1 << 31)
 #define PWM_DUTY_WIDTH	8
 #define PWM_DUTY_SHIFT	16
@@ -145,7 +149,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		required_clk_rate =
 			(NSEC_PER_SEC / period_ns) << PWM_DUTY_WIDTH;
 
-		err = clk_set_rate(pc->clk, required_clk_rate);
+		err = dev_pm_opp_set_rate(pc->dev, required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
 
@@ -181,8 +185,8 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * before writing the register. Otherwise, keep it enabled.
 	 */
 	if (!pwm_is_enabled(pwm)) {
-		err = clk_prepare_enable(pc->clk);
-		if (err < 0)
+		err = pm_runtime_resume_and_get(pc->dev);
+		if (err)
 			return err;
 	} else
 		val |= PWM_ENABLE;
@@ -193,7 +197,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * If the PWM is not enabled, turn the clock off again to save power.
 	 */
 	if (!pwm_is_enabled(pwm))
-		clk_disable_unprepare(pc->clk);
+		pm_runtime_put(pc->dev);
 
 	return 0;
 }
@@ -204,8 +208,8 @@ static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	int rc = 0;
 	u32 val;
 
-	rc = clk_prepare_enable(pc->clk);
-	if (rc < 0)
+	rc = pm_runtime_resume_and_get(pc->dev);
+	if (rc)
 		return rc;
 
 	val = pwm_readl(pc, pwm->hwpwm);
@@ -224,7 +228,7 @@ static void tegra_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	val &= ~PWM_ENABLE;
 	pwm_writel(pc, pwm->hwpwm, val);
 
-	clk_disable_unprepare(pc->clk);
+	pm_runtime_put_sync(pc->dev);
 }
 
 static const struct pwm_ops tegra_pwm_ops = {
@@ -256,11 +260,23 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->clk))
 		return PTR_ERR(pwm->clk);
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	/* Set maximum frequency of the IP */
-	ret = clk_set_rate(pwm->clk, pwm->soc->max_frequency);
+	ret = dev_pm_opp_set_rate(pwm->dev, pwm->soc->max_frequency);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	/*
@@ -278,7 +294,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->rst)) {
 		ret = PTR_ERR(pwm->rst);
 		dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	reset_control_deassert(pwm->rst);
@@ -291,34 +307,67 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		reset_control_assert(pwm->rst);
-		return ret;
+		goto put_pm;
 	}
 
+	pm_runtime_put(&pdev->dev);
+
 	return 0;
+put_pm:
+	pm_runtime_put(&pdev->dev);
+	return ret;
 }
 
 static int tegra_pwm_remove(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pc = platform_get_drvdata(pdev);
+	int err;
 
 	pwmchip_remove(&pc->chip);
 
+	err = pm_runtime_resume_and_get(pc->dev);
+	if (err)
+		return err;
+
 	reset_control_assert(pc->rst);
+	pm_runtime_put(pc->dev);
 
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_pwm_suspend(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_suspend(struct device *dev)
 {
-	return pinctrl_pm_select_sleep_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	clk_disable_unprepare(pc->clk);
+
+	err = pinctrl_pm_select_sleep_state(dev);
+	if (err) {
+		clk_prepare_enable(pc->clk);
+		return err;
+	}
+
+	return 0;
 }
 
-static int tegra_pwm_resume(struct device *dev)
+static int __maybe_unused tegra_pwm_runtime_resume(struct device *dev)
 {
-	return pinctrl_pm_select_default_state(dev);
+	struct tegra_pwm_chip *pc = dev_get_drvdata(dev);
+	int err;
+
+	err = pinctrl_pm_select_default_state(dev);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pc->clk);
+	if (err) {
+		pinctrl_pm_select_sleep_state(dev);
+		return err;
+	}
+
+	return 0;
 }
-#endif
 
 static const struct tegra_pwm_soc tegra20_pwm_soc = {
 	.num_channels = 4,
@@ -344,7 +393,10 @@ static const struct of_device_id tegra_pwm_of_match[] = {
 MODULE_DEVICE_TABLE(of, tegra_pwm_of_match);
 
 static const struct dev_pm_ops tegra_pwm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_pwm_suspend, tegra_pwm_resume)
+	SET_RUNTIME_PM_OPS(tegra_pwm_runtime_suspend, tegra_pwm_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_pwm_driver = {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
