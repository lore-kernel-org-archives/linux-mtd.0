Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F9DC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8DE960EAF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 01:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8DE960EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePICa09x+LNoaP2njcM8ussEUxeWMw/ro3Xko5YgWCw=; b=lZQjBInCsVVu4K
	uyA8WcOOiB8A4QgVCyRzx13Mgx0y9usI982NRSTipTh03xsTZ4SXS9wiQSGrWKdBJGn5hNUl8rtyx
	KzmKuebpwhve5JsPW9CJ6OCOtrbKrao5VUCdbcZ6CVs2hNMw1ICktxPINQ8HsGRa47oNl2CkmJnev
	JMHAiIes6qZQOHMWbItO+zVfDIo5pC1PyrLTQzpAMpv1DTDoum3EuE0kQuUBIW+M93yhncNa9ZXnw
	5/8+syK2NlLoZ92Qg9dCk38gMmaj8ECWYDaqb2nQne7cZv/sPujbHQy5W39sci/bsJir2hO9OCte8
	qNoCTi8+kCGqcX9U3AHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFoDA-000kTz-7i; Tue, 17 Aug 2021 01:48:16 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnvq-000grD-9L
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:28 +0000
Received: by mail-lf1-f53.google.com with SMTP id i9so17435671lfg.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=kvVJK68rK2YZFnYH8LrFoceFEfWX8v2ppJhtJN3FQtc/XATIT5s9S++aE6VkEC9DYG
 pPWSlJsOJO1b8DlywD0Isw2szPQhLAalyo/vn4NIId4qqB70lZRXqyD99GHeDF20S2+e
 s4FCcdFSP2sZOlaAe1yaHa3/lSK7TBLCfTc1rhYcwZgeWTO0SGJw1L1+hW41irMlRuiO
 7GyUipnboEW5APuePEelNLTy6r4iWOw3fauB5LOn9xOqBTJzmU+qHr0EiHewqV6In+qF
 z9UYR5Iz3M/DDK0jPFJUiTaEyXhln+hqNTZk67UhWbAETTV8Q2N46Uq2ruOz+21d/skT
 2qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=798UaN2O7BsVLG2b7m1c5jRBaYmhXVVyGNLo4voHgAg=;
 b=jnAj28VPCH4YNUL+jEUUqQeMUxJd+drakkJvtNfAGNv6C8Rg3Bz1cjV49uQUk8IttD
 nYwedwNpJnfmNMApwS5SUTwQI1VS6wMFmyh5qZexqRE5SumIeMTzpaRsutWF2TQLV53E
 14eMXXrXmJLkWhMG9VPYShD84H/+GWK18RXyLM8fTEtFR0NdtKmCy4AFdt3sdWwrjCgt
 qOFHCSoLNhbwjzg4egUT/Wn8bG+oqlZQGvV07rJmRPH7J71yQNuL8hoCWBB2JUAZdd2D
 AFD1frFLHTI08vAw72uVGy9blWRAYGdE7ehPkT+2kzbgGu8sLdfi/YdjckBM5X7nFFK5
 JNpw==
X-Gm-Message-State: AOAM531PqpdDLRqeFwBGB1Sc84EztLyPgd2aSbwKJN88+eGjpIEtlgNf
 LfSBVAgnryTOR8+ZOX8r2eA=
X-Google-Smtp-Source: ABdhPJyYy8hUiWmuOExv2ofTHn5i3TqgWVouaLyBH4QsjrVfyVuz3wXI+GZKIfHGO5W1gt6UIhmJEg==
X-Received: by 2002:a05:6512:3190:: with SMTP id
 i16mr508725lfe.340.1629163820646; 
 Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:20 -0700 (PDT)
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
Subject: [PATCH v8 16/34] drm/tegra: vic: Support system suspend
Date: Tue, 17 Aug 2021 04:27:36 +0300
Message-Id: <20210817012754.8710-17-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183022_403322_867E4824 
X-CRM114-Status: GOOD (  14.06  )
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
