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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A47C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:51:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44FF60C3F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A44FF60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm22nHGmfArLRO4byozhJQS3cUNMsB1AtrZevZ2JmcE=; b=RilT+a8qHlBpTm
	nctIBesACaC0T44GZhhMIW6usGb8wnWzmTwAtnZ3FDMS/WKI5/TsK5lovkjV+Jj1Pqk/acrKtCWAv
	bmtdoHzZItJnh4ucHeCXnGOo4LZWwaP/sjmS7RCRbF8gPjLPj0u3G/TUH5yxUXmZweeBYwdSKJ0pz
	/voiEg13agCP8oyQyP2oOXtP5TmcAXpdi4Jb88PrqfwWLGpP3QhrvRSHikiyvUYp+qGv4CLsvA19J
	XivEXZKnyqU97WdPFoWzciNssmhNl/67+zvg6WNsFh9Ah35VOIAmX9OqmZC8xVpsPHB4xEPQa8Vvv
	sxhdqCNr+vpnlf9BRVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpBM-000rm1-H4; Tue, 17 Aug 2021 02:50:29 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnwB-000h6y-Vm
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:54 +0000
Received: by mail-lj1-x235.google.com with SMTP id y6so13446457lje.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iOx0CWJJWTap5wEALtflt5TD5too2w66bm1HP4jwmAM=;
 b=dreUCBMrVhYah6QEsUyRd1PPgDd5hIy+DesXjyoqwsziCnPgxwHOO3/ccoapjG7aZi
 gdOB9YWHykn9CBHVoMbolMqh3iE0EhyvsLH+qGOvgVt03Deot8AtFfdcyWSVoXnQ1eVU
 UwnBkCAe+2Tdsf1MZCRe5vcw/RW+uiM52YnRIY+ENijj5tE+Yemi7r9GgE89BUMAmAUM
 jsAI1v0kF23+iatkXiKJaiEtA3oBFi0ltiMZfhH9/3bz05xizmamYpTc+zUn/W5V1sbL
 UBn+LlIxSaB1dLLVkfigh8u7UEPw4trFV1Yo47xqq5JHzpNLRZYYxHJ4WQuJ3EDJfhHi
 RPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iOx0CWJJWTap5wEALtflt5TD5too2w66bm1HP4jwmAM=;
 b=ct/fYrBsG0IgKXsy4ADdfTCFAbOL/PZFFVk7GWjyLC2K/DDbg4nsnHEQ+i2KXwdJuq
 Oy4LdBFmNgCUiTSDxEG40/XZRJEOjLc86nolJU3jBXua7zI87q33V71QZo4O+GQM75IM
 y3X700SWsKmfbM9YbA/Z5zGeBht1q6d2ETNEck0wDzIEGkwFTyiAo9tJl8CspFSKvM7W
 KM7C4cxhhnbVAnQ+qv+l3TPFjuLN7Y9emGav8poebbb/nBHJyI53nr+FJ0Kixgtp5J1+
 T3QamQJHkLeflgXwH87zUtNqPKCc60jbqaasnyrHqdY8D28RK8+wYDivKk2qJ5taGQrS
 GIvA==
X-Gm-Message-State: AOAM531mcJUMTZghneqT9E01aVKZNBFFzI4x9Ln6FtuJj+faL2IVVtfm
 nYH4vixYshyRR0Tb74RlESM=
X-Google-Smtp-Source: ABdhPJyJWT1KmD0sqd2sSotoMjtfPR5X64L14svV6ntEW3IdWZmW/kCpAtqR9QrK1vxFDyAhpmSYDQ==
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr864074ljp.498.1629163841949; 
 Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
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
Subject: [PATCH v8 34/34] ARM: tegra20/30: Disable unused host1x hardware
Date: Tue, 17 Aug 2021 04:27:54 +0300
Message-Id: <20210817012754.8710-35-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183044_147337_A1D2C0E6 
X-CRM114-Status: GOOD (  13.79  )
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

MPE, VI, EPP and ISP were never used and we don't have drivers for them.
Since these modules are enabled by default in a device-tree, a device is
created for them, blocking voltage scaling because there is no driver to
bind, and thus, state of PMC driver is never synced. Disable them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2cb31bdd9eea..32abe559645f 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -59,6 +59,7 @@ mpe@54040000 {
 			reset-names = "mpe";
 			operating-points-v2 = <&mpe_dvfs_opp_table>;
 			power-domains = <&pd_mpe>;
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -70,6 +71,7 @@ vi@54080000 {
 			reset-names = "vi";
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -81,6 +83,7 @@ epp@540c0000 {
 			reset-names = "epp";
 			operating-points-v2 = <&epp_dvfs_opp_table>;
 			power-domains = <&pd_core>;
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -91,6 +94,7 @@ isp@54100000 {
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
 			power-domains = <&pd_venc>;
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index be6fd700838c..55718e44ca98 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -145,6 +145,8 @@ mpe@54040000 {
 			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
+
+			status = "disabled";
 		};
 
 		vi@54080000 {
@@ -158,6 +160,8 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
+
+			status = "disabled";
 		};
 
 		epp@540c0000 {
@@ -171,6 +175,8 @@ epp@540c0000 {
 			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
+
+			status = "disabled";
 		};
 
 		isp@54100000 {
@@ -183,6 +189,8 @@ isp@54100000 {
 			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
+
+			status = "disabled";
 		};
 
 		gr2d@54140000 {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
