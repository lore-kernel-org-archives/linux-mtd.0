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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A8C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:12:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8D361050
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA8D361050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5rpJYR/+BPXvZYZzZ5Zk9qc6o+shghr4eLdPfUb5Ao=; b=iYozIQnlyimHdL
	Ke9CUqDwYQnr2zDiSgSxVNjHZ7QuOKIWcIRj+P9xAv2MlgqZLpAsbkMpcOZET9sJTK+ITmJ8dvhSe
	qY8wSjhPATDtAoA5Ji3fKStvDr9XzaCSwCFfz1wDnKG9B307TntqY5MY5MtSN/Rfz7+W3nfV6vdZJ
	/EvxRuP/MMpTh1Ij87hyl8hVhqys5t/qKeVOAfqRhbgv8GRrtBRVV8ooHQVKtb4ufQtrhOAONgDYh
	DK0/Yh8lFA0AUpk4KblOd33EQefF7DEs1VtwTcot18bPje7Ovife1dmoLI6jC1ffrWeN6pNV1tLcR
	S8UD9Cs265j4/i9o5Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVp8-00H7cB-EI; Sun, 12 Sep 2021 20:11:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnM-00H6M7-4e
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:45 +0000
Received: by mail-wm1-x32a.google.com with SMTP id i3so5130695wmq.3
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=dgfruC3Cp7h5J9EBqCGafMKFXt20sGTs0YsYPkR7d1TWRr8oLswsvyCKcBSxy4nulu
 0ZbxVa4QFZQfmClH9qJ+sj0/aqr1Oj4x/2i4oRtkgdsKe6uRyet4NtuDNfxNskm/LaL3
 8G3liXSQkeLLElx3zNZ5Jg4yey7pZ9YhZxU9IXTtiBUnML34vHWNB7u27oXvTml/Yx+T
 nKYVv/4i3YYIKnpQV2d8M+QJSBaCu5P1QMYCVCbFOiXdv/zaOWdhIPOBsiZBvSYznQTm
 1cx/B8qabHGSZgtGF8U4kZD8Mq0cMv4HZzfWjRheyzvnTcjs6shxv/6yp7El7CNX7MWp
 awFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=azJO16PBS0aaEX5vOfJpmf9jn1x1mJqiJpQpMZ0azY4=;
 b=eK9CCFfgELnsf0YpiLjl8H54Zddjk6R/8z96Ils4Uh+Lp2p2Pkc5wKIJ/YKDcVgtOp
 w3A6Rcn9+7hQxOd5uOGpeHdJiwyiwJF77c/7lfbwScSwOQFvQMSa/E/CAh7uk7pvFCHz
 V5eFekSH5CM5XgyImH5GtPwPnerrj4G6y/09zh21nY8YHQ1KD5gIih44e7nuMM6DhFi/
 rbWVG36IWHbmz+iJXZvt2/NpoK5DiC2HsNchQTKWBhr1bVsyszovfnvte9NTEQSzO+zl
 KpxZH+sxBwPPry5+TkAkw6wR4PN2q8rHOU3/ERRJXi76WGHUb3s6rtZogSv7V+alkJBV
 0mag==
X-Gm-Message-State: AOAM532+r8eQSEtKvAiQvxxqw7mFgux6o4qCoRKYOYjRfZQTn2CZ9rQR
 koVNcvfsNkSWtZGXua0OWwg=
X-Google-Smtp-Source: ABdhPJwmxULcCBMXR6BD0JLAazGByGQYAT6BgoTu1ONDbXSqkFAZZJt5z69GiuVGoP2Im9fwPD+HbA==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr7819882wmj.68.1631477382665; 
 Sun, 12 Sep 2021 13:09:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:42 -0700 (PDT)
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
Subject: [PATCH v11 04/34] soc/tegra: Don't print error message when OPPs not
 available
Date: Sun, 12 Sep 2021 23:08:02 +0300
Message-Id: <20210912200832.12312-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130944_221827_8FCF001B 
X-CRM114-Status: GOOD (  15.29  )
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

Previously we assumed that devm_tegra_core_dev_init_opp_table() will
be used only by drivers that will always have device with OPP table,
but this is not true anymore. For example now Tegra30 will have OPP table
for PWM, but Tegra20 not and both use the same driver. Hence let's not
print the error message about missing OPP table in the common helper,
we can print it elsewhere.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd33e99249c3..a42d4f98c078 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -111,9 +111,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	 */
 	err = devm_pm_opp_of_add_table(dev);
 	if (err) {
-		if (err == -ENODEV)
-			dev_err_once(dev, "OPP table not found, please update device-tree\n");
-		else
+		if (err != -ENODEV)
 			dev_err(dev, "failed to add OPP table: %d\n", err);
 
 		return err;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
