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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D53AC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC6F60ED8
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DC6F60ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2Wbk1Nunxieh4om3bTBt8X6/Ws8YQX6x6kR3m5x8Bk=; b=CF1wZZgMuK7f8S
	wSOWSeUjsp+IZYdQnL5ujz3Gsx7p5vGTbPzxKE2+OcvdTF1b9SYHz1G0078ilJSq+KuNUpJl820Fq
	odZYXKbwzBfTlA12wAz7wTw8YlPS1CMArhDm8BkVVfiugWz64l0VQF4zU92E2xzOV+KKdSey1+Q39
	WVGu4QNWPE8VW/ttS73F7NiDNtINfKevgQ8Sk2MCx8CO+QGTa4lDppkG1r8bhYUC2Pj2EWDe3g6yT
	kgBoEI7FqttPE+gwl6PbLxZOdKV86xePlQSma5PNSEjVScWsI9hPUijGzGuOTtoVnznej9iv/NCsC
	9pwx5cpKRkP+ci8pNAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPWpk-00HHKN-7y; Sun, 12 Sep 2021 21:16:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVoJ-00H75L-Bs
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g16so11356099wrb.3
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6ifLJNQpWHL/aW6APbCXiXF4Xey3uNJjXkEDYLDpf0=;
 b=ZfKwSrRJYOUFhAoytmkutWh0G4OM3EDXtdlI9nE+QFtPei+2E4JdDl9Wka9E5pH3YS
 04uPK1Tw8S/mpSJek9+01/hZUOudukqiP1FHYcqijmNUw3d/ou4/LVcqog6TND7k1ctk
 nhrCXGQ6H7XuuSz39ea5BGGnr4/poWAHAjMjQDsmYxL4FiyE8A3sMYfTHP3veVbXO+uo
 d9x7efPI4RBayLlBeljU0f1eSkDX3OfNSksY6kDtJWGRBn8yGTD1egqNKbd5IoFywF9B
 P5raiK7sTUwh7OkLsuO0sINvzimEE1qvWRuqPCO+jbWgCSh5d3Bgwic9fGMsNaWhx7YO
 E6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H6ifLJNQpWHL/aW6APbCXiXF4Xey3uNJjXkEDYLDpf0=;
 b=vfWfji7TOQLUK7qvGULmWO9ciBXeFIiXj5cvEQNEv6ueHcs0b6mVfocqmNvJPu08MM
 IqQAT2Zq+9cM9v1wYYSisF9bEdhIHkJRsNfhZuRIzMpdHUpMSAF25CHGpSe7iycbHfEg
 X/91VDTvpVV4iZNi22GnGQYfgErTlcjBZR15N+n3fYaAr6TnEeKE5B7Pg36nDWdm38ib
 K5NWTO5ydSSVfhyr0GqPFu/xbshzFfSq1pkKEyGu2wEiufoYbd95f1oMviXWhGLHQCQJ
 i/wPjiqzW8eFHVntNiY4y237AP0CGC6xxAbxP82W0Q3G0jvnyz/s0eY9Vq3TH6uBlayp
 mRYA==
X-Gm-Message-State: AOAM532uEfT4WGVHYpq9CdafYj1qLELK9t84z38AHERYWODMSexZD7XR
 uveQK8fhHCPBmFCgCdWzrF8=
X-Google-Smtp-Source: ABdhPJy5R0R2cYZ9ytbAqF/pKeienf/EwQwWGSDMVrYLML+XPPmZs/giSU/21wa5JsLrvKFXP2DpUQ==
X-Received: by 2002:adf:8170:: with SMTP id 103mr9108790wrm.167.1631477442191; 
 Sun, 12 Sep 2021 13:10:42 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:41 -0700 (PDT)
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
Subject: [PATCH v11 28/34] soc/tegra: pmc: Change name of core power domain
Date: Sun, 12 Sep 2021 23:08:26 +0300
Message-Id: <20210912200832.12312-29-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131043_472986_368DEDF1 
X-CRM114-Status: GOOD (  13.60  )
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

CORE power domain uses name of device-tree node, which is inconsistent with
the names of PMC domains. Set the name to "core" to make it consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index fb8faf7b226a..5e1fc873bf8f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1353,7 +1353,7 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (!genpd)
 		return -ENOMEM;
 
-	genpd->name = np->name;
+	genpd->name = "core";
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
