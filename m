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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBE0C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:00:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586F060ED5
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 586F060ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu+SSE+/8/zQZNQoYf+4bCNIpqTWAB+rSGGTBAVwPgI=; b=tK3KL9ghuHC+XH
	ZI33xZ9l1MccYJdC1SPs1hxV28JbqhiPAaQUoCMiy61HxcNxMGJsz8WB0kN04tnxU8vtZ70sTTnRH
	AVq0Qo1paL4N/gaFNC8JIvInXuR9gb+sueEi7Odr+oQlOczHNYGtbcW8oPxIV+3M6dizXfjOUY2Ku
	GzmlEPGLPY5dnr35Luk9V1360B/qAwjB06DWNBRmNkZvbeK1JVy2D1UlL2s8N8BxZ5KSCpUZkVjPv
	H2Z2Oz3jKDsMTxVVwfya9bq672CQf68RJdQ3TvNbwXGYR24iGADiwHUux8IticsPCjV0XaoNVUJA5
	vKxCiaHKXDDgBVN02WXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpKi-000t31-98; Tue, 17 Aug 2021 03:00:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFoLO-000lKJ-H0
 for linux-mtd@bombadil.infradead.org; Tue, 17 Aug 2021 01:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=/lkMe1kfjyl72aACDUoar04Z3kVJXU/K1V2K/vaWhQI=; b=Iwn6bXpWdhztUld+ZNf2OBrUrT
 n9hX9YzJMVa4uLmbk9vQHt6deQwKJoUUurVP8stoLVEaXs+nQZOWdjQHZKWGm5FFBLlCAithSkDDv
 OAL43OhXZeX6ysOBs2FLBiPszygiyNIzIDZX6uyDl9d6lgxbcFcT4Lf8G7yiamV580mb0umc1Wc+G
 cAzqX5JLMy6+j0cSuskgWHekO+irDELF5xLQz/uHLgA/pqvQhuynqCXvRnuh8/eQ3T1XiCdOItPpc
 eCGWm3h/SedZzaZv650+x+A4ROOPN+bttpKaO8IRQAa2ujpWbXuW2pVRHQKI0A+dZ1joyTGn9hQ3f
 h1etA1NA==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvx-00AJyV-8Q
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:32 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p38so38352716lfa.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lkMe1kfjyl72aACDUoar04Z3kVJXU/K1V2K/vaWhQI=;
 b=TMnJpzJzzXGpq158U+0IfMSpvwwi/z4KC4LQ/QwbhAdPyykV5omzv0e3JvjHpMG+jm
 YjYKDXJVQ1JLw2rXknVxP1MQP0poHeFLpr7HGZsxsoU/CuhzelIEIup9ZTenjT1uM38I
 N/j10YqNOcgRvUbX/Lw6NTygd3q7ZV9vVf6q742bHPl7A8seSzy1RjCKe28HX2D5uLzW
 CdjwqAU6b8SdLcnpOKDx1hsKgeIrJl2K3HnIkNAldm0zdhar4OARY/MuRL/yT+3e1l4Q
 gJWVLVsKe3aU7cCfDIidNssk5wE2KSDQli8QJG+FBBckRAXgNsSkHvgXAkUUIHBGDhPW
 UyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lkMe1kfjyl72aACDUoar04Z3kVJXU/K1V2K/vaWhQI=;
 b=E4IrJVrncoWW/3NTId+zGOIVMyNWAJ3WNW5Lo/nh77K+LQEOSXiO6tNyUSXPNMkVBL
 4XqxZsC9CR+5mY9kFPBpZBLs/V4w+ceSdpgOAPqM7MPWuYG+84bevXfKYxtamlIJcjLe
 wKZv1vt9ioFC86pg5wfMw7CmtWQwZzN8iwve3pW0bRSt2phA+uKIWcTEqm80CK/SEIgo
 XB7J+d1WmpoRCF3AUgXEj6slHA99sdI6X5o9gBwJO6PmqLMAHXWxMDAyyCnQJ3iCKG50
 Jlwf1Xd5J8Od7GDubiddnMBmXqsyfFiU5ATOG1YHQBeyB4/tTYFVVuY/mFDz7yNnPtyI
 U2EQ==
X-Gm-Message-State: AOAM531atZfhC8hU0u8tu1z8UfA7HVk8rLcilFjMlg6i6UXMTwVtlTE0
 bRE8oFEmulZv6620dPJTj68=
X-Google-Smtp-Source: ABdhPJyKm8MUjPwNU/XaPhkpCC07f4s3U0TJC71msPXy5iUJTdJeDCVsEUr34EX+MR86aW6pHwjnsw==
X-Received: by 2002:a05:6512:3a8b:: with SMTP id
 q11mr491818lfu.582.1629163824182; 
 Mon, 16 Aug 2021 18:30:24 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:23 -0700 (PDT)
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
Subject: [PATCH v8 19/34] pwm: tegra: Add runtime PM and OPP support
Date: Tue, 17 Aug 2021 04:27:39 +0300
Message-Id: <20210817012754.8710-20-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_023029_368730_35250979 
X-CRM114-Status: GOOD (  25.40  )
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
 drivers/pwm/pwm-tegra.c | 104 ++++++++++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 19 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 11a10b575ace..bb6d184946b9 100644
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
@@ -145,12 +149,25 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		required_clk_rate =
 			(NSEC_PER_SEC / period_ns) << PWM_DUTY_WIDTH;
 
-		err = clk_set_rate(pc->clk, required_clk_rate);
-		if (err < 0)
+		/*
+		 * GENPD performance state should be changed only for
+		 * the resumed device because GENPD core tracks performance
+		 * state and drops/restores the state on RPM suspend/resume.
+		 */
+		err = pm_runtime_resume_and_get(pc->dev);
+		if (err)
+			return err;
+
+		err = dev_pm_opp_set_rate(pc->dev, required_clk_rate);
+		if (err < 0) {
+			pm_runtime_put(pc->dev);
 			return -EINVAL;
+		}
 
 		/* Store the new rate for further references */
 		pc->clk_rate = clk_get_rate(pc->clk);
+
+		pm_runtime_put(pc->dev);
 	}
 
 	rate = pc->clk_rate >> PWM_DUTY_WIDTH;
@@ -181,8 +198,8 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -193,7 +210,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * If the PWM is not enabled, turn the clock off again to save power.
 	 */
 	if (!pwm_is_enabled(pwm))
-		clk_disable_unprepare(pc->clk);
+		pm_runtime_put(pc->dev);
 
 	return 0;
 }
@@ -204,8 +221,8 @@ static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	int rc = 0;
 	u32 val;
 
-	rc = clk_prepare_enable(pc->clk);
-	if (rc < 0)
+	rc = pm_runtime_resume_and_get(pc->dev);
+	if (rc)
 		return rc;
 
 	val = pwm_readl(pc, pwm->hwpwm);
@@ -224,7 +241,7 @@ static void tegra_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	val &= ~PWM_ENABLE;
 	pwm_writel(pc, pwm->hwpwm, val);
 
-	clk_disable_unprepare(pc->clk);
+	pm_runtime_put_sync(pc->dev);
 }
 
 static const struct pwm_ops tegra_pwm_ops = {
@@ -256,11 +273,21 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->clk))
 		return PTR_ERR(pwm->clk);
 
+	ret = devm_tegra_core_dev_init_opp_table_simple(&pdev->dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		goto disable_pm;
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
@@ -278,7 +305,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm->rst)) {
 		ret = PTR_ERR(pwm->rst);
 		dev_err(&pdev->dev, "Reset control is not found: %d\n", ret);
-		return ret;
+		goto put_pm;
 	}
 
 	reset_control_deassert(pwm->rst);
@@ -291,34 +318,70 @@ static int tegra_pwm_probe(struct platform_device *pdev)
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
+disable_pm:
+	pm_runtime_disable(&pdev->dev);
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
+	pm_runtime_disable(pc->dev);
 
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
@@ -344,7 +407,10 @@ static const struct of_device_id tegra_pwm_of_match[] = {
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
