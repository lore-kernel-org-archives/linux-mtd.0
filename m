Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B037AC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DC0E61050
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DC0E61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePICa09x+LNoaP2njcM8ussEUxeWMw/ro3Xko5YgWCw=; b=rUUvD1+F2m0KUc
	3ynwLEWCCNbB/yWmY3fydHuF66r1J3pwjw+3BvO4zfz48+ktiBntjYBgnryZ1SEOjvqjrSWXylbNt
	1jCCiTbjn3hDn37GWGUMfV/5a1htvyEsCfT7nfVHDNze84l7DyOSDQ3lsOgJcmHRL/NWV9Veuhz7Q
	1woO1DYfLKCVytv2cFGxBlHXkwYBL5oH9KpJvmQuiDYVIslJp/gwLtWsCxwBr/jJw8HywDagnwg1T
	YJ9hkqDxJOOnfkTwC4elcn4/wKB295TMYknl1SfTNm2MHTK53klwqSpxyAWN8tzwv8iU0gF7do0gB
	YX0141nHwEUmgEhwP3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPW4q-00HB1p-Vg; Sun, 12 Sep 2021 20:27:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnn-00H6fh-JV
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q11so11296949wrr.9
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=MeT9W24Jr2f9RvjUC5EbBHXQOyy115v+4M/+W1kU/o08i4o+XtIkF3zaTkNILlsp3n
 QZ2vhRuQXCvwm1YePWgyHa3xQfnXKyksuI6Oeu9eTPhdhHhWOFCW3QPI3nmBrkq1f6ff
 JbG1uaz8WrgNCEHiPIAkUsNaBI/Ui2bxy2QuvcKSNJjxqh7yAe1S3IjEok4s4epX8HXN
 y+e8MqPONDOga34MZsm9+g8TIov9EiuV889Gpmb+rsWKXS5rk1ZJHZM0VpUkd/iuTVIn
 DdvPqlVezTjnVrgbYvjCurd9bHHM5//w4NKpvYVBWyJ4Gq40Ow8SphSrrZbPfgX3gT/a
 PFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=j19fT2qtWUZONzBjlt99cOVyD8oHlphiz/kiT7IJL1mPbakRvifu79xBpwi9cryVgn
 kEZWNpRDM/pfsRpACxBuFr2z04zUx+r/60Wi4tnTY5FLkVHS/lBj0+Kyvb/KaDUgLvJD
 bOXqFF/ncNTaDHiQTA1p7KQo7blCCnQjLUE8Kv5msNqwWO39EXcGDtAZI02oJqwFboB7
 nv+92uEnwgu3MajFPSY7zeGks1IleQid/JITL5DZoM4NKae43JXJRih4yMC6ykPvLmAf
 5L48brfYhs17RyF2/9Q9CXaFTf6uMRVsB/7bXDiK+tNw7ssvc4y2AhaCoxkpzt1fZAdi
 JxRA==
X-Gm-Message-State: AOAM532Zad8NifG6iarDaQITWlsGp2TZeTLrVCg7pxxRxoPDbSrLPc34
 M6XQGzcl2K0XpPulxrBJjiU=
X-Google-Smtp-Source: ABdhPJzu7MzyAyEOUCRr750amNJVBtVQ2utB+Xjt8OlkPvZv2p6LYKW9k094ppdCb1q26Tn+61kFew==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr8787352wrs.183.1631477410012; 
 Sun, 12 Sep 2021 13:10:10 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:09 -0700 (PDT)
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
Subject: [PATCH v11 15/34] drm/tegra: vic: Support system suspend
Date: Sun, 12 Sep 2021 23:08:13 +0300
Message-Id: <20210912200832.12312-16-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131011_732039_380828A7 
X-CRM114-Status: GOOD (  13.59  )
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

Hardware must be stopped before system is suspended. Add suspend-resume
callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c02010ff2b7f..359dd77f8b85 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -315,6 +315,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -517,6 +519,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
