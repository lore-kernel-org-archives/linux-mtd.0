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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DAAC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC52060ED8
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 21:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC52060ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx8w/Cjik3baIjeTyoD18fDTgAqD9oECZxnSRLu+6x0=; b=y2uOIOrEztKLce
	4qq5cdXe+qG9QNc/XVYwGcguZlkxJu76K+bucofpaOtAQhtKCeQPjAmRk8y7seg8Wxr2XYS17rmMB
	F/ofmjOGPIMchdRl1xnMnTFNjAP1kD4DtaDREjLi15GHGD5I5VrMF326F5gyTArh1SlXrt7zKanXD
	L2bYiEqk5UYfQiq91wljF0P3xHp5G2XgM1uv2UOxwuXGyIagsMDJk8QF2bx/ZXs11GmzJ7DFjjarT
	TJypMNMRVcN43kd3/9j3sVUEEwcy5imZV9Yw8C1Mt2fXiZwECp6J8SokUGeOukDgIMkCxArn2dmS9
	0MhARPvto4Fh8YqO4BTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPWtp-00HHoa-EG; Sun, 12 Sep 2021 21:20:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVoM-00H77s-5B
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:10:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id m9so11323558wrb.1
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/fuQ9/4B7O6NkGtlvGWmoFCTTuIvWwpexDnS+rspmU=;
 b=KqnSWSQwDdW+LsvhctV39BvkSonyOFoR8QZGL7wOrdePQCSFcXxBl/w5qvUrkyWCTf
 j/cfCy5Iw/mulmidbJzcfnMT1d9vxz0lmUcn3+e2cllkjmFEu9TkMN2YK4jbXamBj8f1
 qckhs3v3e7W2vjUni0tk4wmjOxt6uJG4GbpATnfH3pGBcCQjmcQqfSYN+V09NCV9rcZN
 TacNyjSdgre93p6KLKixeUnN7Kw8F/V5phgXRtEHZ5TaelM/s5p//+bw4Ck3Outu2D/S
 fg3vzFHm1zZLJCFr4E+jI62feQVIpBbKoChYrjaPqZFNM2EHoXfjGJ67uJLjRyYmzPAR
 GhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/fuQ9/4B7O6NkGtlvGWmoFCTTuIvWwpexDnS+rspmU=;
 b=GZbyxSgqEUF78qzKBNOZPo+PtmMuZfia7yzrcu0mIR67wRAzy9J1ul2b+3Zzm6IyPw
 7Py9n1mZQiO71QGfJtWWrWKo0JzpqrzFgdxmh0brrbqBFa6XL2FL/5s76jyhP+4+/bvX
 04ZhDJ4fy1eAunJ2B070mVPt3xe8WrbZX8p/jCZqJGRQZHLym5ue0XQAaw29/nEcmyET
 iMnKMPrcBZKizUPltJ8AROgFMXZ772eRfLP/PNROvNsAt8ow+mEwVPkQZ8Hnk4glG4LV
 FvLNx55NIK0Hv03vpgZO2GioRuEiDjvDC8zjy+T8EeUH/8vRMVgTfQP+Tzb3OXIfB6Q6
 ZjUA==
X-Gm-Message-State: AOAM5338xKAJnsKyIwGQPwtbqLRNFgJBdRQZu6cmMKqXa4Eo3A3s+KDx
 lc++QN12akEalBDJNTmWoIg=
X-Google-Smtp-Source: ABdhPJx2T8jeUvLIRwUiWYF42kYGMTgqyMxMsfziWllGOoP3lQwH9NfZN9gWz+QVvhs3feNVef169w==
X-Received: by 2002:adf:f911:: with SMTP id b17mr8988366wrr.412.1631477444652; 
 Sun, 12 Sep 2021 13:10:44 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:44 -0700 (PDT)
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
Subject: [PATCH v11 29/34] soc/tegra: pmc: Enable core domain support for
 Tegra20 and Tegra30
Date: Sun, 12 Sep 2021 23:08:27 +0300
Message-Id: <20210912200832.12312-30-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_131046_247335_655CC4E4 
X-CRM114-Status: GOOD (  14.65  )
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

All device drivers got runtime PM and OPP support. Flip the core domain
support status for Tegra20 and Tegra30 SoCs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5e1fc873bf8f..74de84a014e9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3042,7 +3042,7 @@ static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 }
 
 static const struct tegra_pmc_soc tegra20_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra20_powergates),
 	.powergates = tegra20_powergates,
 	.num_cpu_powergates = 0,
@@ -3103,7 +3103,7 @@ static const char * const tegra30_reset_sources[] = {
 };
 
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
-	.supports_core_domain = false,
+	.supports_core_domain = true,
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
 	.num_cpu_powergates = ARRAY_SIZE(tegra30_cpu_powergates),
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
