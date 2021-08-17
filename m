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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E2EC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534D560C3F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 534D560C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnq0ZEL2pgDJvRh6doi4w7bPBEGzlKmDyux2OrTQ/yI=; b=cvfVcEvLzFHvDY
	d+6KTfnF37/XcN289zkX1pEmYGC7WNzFmIx7wemtx9EHV/jAs6xL9G0JTxXIJOSieL1toM4IVn6WH
	7bIYXUsX556+2qSzO/qeDYtVlf4xuwVHi3TYNNPiaX922V3+sIvUZbGHdHZ+3Y6HrekmgkL7P+PsK
	If5YRt6j19mLrFesXNK17aIG18gjjX+AVQQP+1KEWn0gWyzrMCeQK9phVPPqT2x+zMwb3tW8DjFx8
	690eT2YZlt2kwjODCmLNbdxpEunLY+4myQq/CL+csvuGkA4oP+RgRbv7J1enrRqJnXH/rRH3IVZ3X
	AEmTqt+R3DXTKSi1PvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFp6t-000rE9-Js; Tue, 17 Aug 2021 02:45:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnwA-000h5l-5B
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:52 +0000
Received: by mail-lj1-x22e.google.com with SMTP id x7so30213562ljn.10
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60J1zKMGqQClpjAlwfYK3w3hOCvKtUPwW+X62rifSl4=;
 b=nZrs0079PTPS3BljR7ivklSfIKMYjzJRwaLKLnOuwvosKUmsst450ETTKnKhG3Cbdf
 ra7TeqHqIiw3U3vQ9t6qZsok2irD3NpgBOk1kU5WPn31ddlj/R4HImbc0+Lx2DQB2e2a
 c7oXkBau4gvZYaogfRuy0ONWH+vNFr8Ao4O3xvasenwyHjAkGDL8H5FTCvahAXYMcmUo
 8btctGRo+i3ZlQXEJQBfD7UDZOQqXUPR3Tg4XciA4KhhyOv28kv7soFvX+fEoFyZNFoB
 dyFEQXO25dh527x4rMe4SwiLvdM5EEKAYSIGA4SC241Oh25xPixJnfAF9dgYPOpWDoEF
 pyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60J1zKMGqQClpjAlwfYK3w3hOCvKtUPwW+X62rifSl4=;
 b=Nete6csWcjUPKdVvXXTxBhXMLFKDZa5x0ba6rGDGwHm8+ptgevIrisMjQTlTK3tjip
 ccUdu5Gsz6wYpTXkWg12hItm16ZeahbIIg4VhyW8sa3Bt7ZizXjmtJcylfs0U6cacYnq
 TUArTOE54DaMn1OIDQHUnSbUQzf/M/KgwTkmHu3d/dZb9/jA0bYskdPVZqu8L+tfpJW8
 +cldonyZA+YcuuOGwAFYmf0HGMEIeGwRijGlTOinAdP9a8/UPzkmZZoOJy68ecSArfoc
 VD3/S4iDtv8rIYz84YxhEPZvkOL+FpxtCjVG3m9erBNiAvQZchRLsqwYL5zCvNEF6U42
 LUMw==
X-Gm-Message-State: AOAM5328vTSnDCs205f23BrMTLIvF+Frjthe6oquCF7QXFdfp6iaJKDI
 l8q1BaPQgFdDmmISIO4gdzg=
X-Google-Smtp-Source: ABdhPJwuvwD1gib4BDhWflO433FhV9Cf3uhsE1hmVRkKHj0DPugMv1U9RdezbdxuyL2MZzrg/itOlw==
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr841295ljp.335.1629163840772; 
 Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
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
Subject: [PATCH v8 33/34] ARM: tegra: Add Memory Client resets to Tegra30 GR2D,
 GR3D and Host1x
Date: Tue, 17 Aug 2021 04:27:53 +0300
Message-Id: <20210817012754.8710-34-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183042_287309_925C1C31 
X-CRM114-Status: GOOD (  12.42  )
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

Memory access must be blocked before hardware reset is asserted and before
power is gated, otherwise a serious hardware fault is inevitable. Add
reset for memory clients to the GR2D, GR3D and Host1x nodes.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 46e7bfa1e894..be6fd700838c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -123,8 +123,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA30_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_heg>;
@@ -190,8 +190,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA30_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_heg>;
 
@@ -205,8 +205,10 @@ gr3d@54180000 {
 				 <&tegra_car TEGRA30_CLK_GR3D2>;
 			clock-names = "3d", "3d2";
 			resets = <&tegra_car 24>,
-				 <&tegra_car 98>;
-			reset-names = "3d", "3d2";
+				 <&tegra_car 98>,
+				 <&mc TEGRA30_MC_RESET_3D>,
+				 <&mc TEGRA30_MC_RESET_3D2>;
+			reset-names = "3d", "3d2", "mc", "mc2";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d0>, <&pd_3d1>;
 			power-domain-names = "3d0", "3d1";
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
