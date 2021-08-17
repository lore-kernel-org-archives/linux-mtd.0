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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740A8C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250EE60C3F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 02:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 250EE60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+wKKaYopr/NUilabxNX3hSCbpzMctQ5uVupaQUKmcw=; b=OvN3nq3k1/POrb
	NGxEyVTygLeLTrJaIIECgbNhU6b6BpkgyqWoojANR3Mv+oIGzCqqUxCpCT5KSef1zrA6/FUoNkSF7
	1/SM1ZsI+c8Pl8amOYf7I9aiCQd0LH7vejgFz6JWo1+j8OMqFjV2b+wcSjEZ5Ho/0oh2xaY+SqRWc
	hWbXurvH5YmpdshNkaQoAyC6c70i5PRDKChYp2JkCjSOBkYBygvkaJYP54cRAcXo1wmzsor6lnogm
	VyaeR7DIeI/s6+SnaMOcXHUqWAHqWN4EWGuoyGyw4IodxhiwFlgNVVkvUpppQ2Qrb3UdGik0mL3Cq
	jw6Q1QExGQfMpNnoqajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFov5-000ppW-ES; Tue, 17 Aug 2021 02:33:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnw8-000h4t-SE
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 01:30:48 +0000
Received: by mail-lj1-x230.google.com with SMTP id n6so30170286ljp.9
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwsrDMqvWpJJAGAghG99RBI6rqTk8tR3VH4OuAhZgdw=;
 b=MAbX1kZyTAib0NFk5HMkji4hZI6KSYikH4MdXoQIia/ppL2rWtrvOLUevZyKTqI4R1
 9v3TOJ9TgSl6trmxqTPsVbS5XDDQ5npSYPPT2rzjMb0jWwM80c3AIgnOP1xw//VX6RS2
 QbWSBj7gHrMOJQjXGGr6Lb6FAWTvLgSZG6oknGmpPAqvvYLN7LQ5MXBgNKt0zeF6Bjbg
 WteRvBhX8kRNNkFjMB8K32oPhsTvpw7CA6LlvKbjesLvpyAmXsg9agtN0y7MsBmb7uKf
 hqKYNfnM1cik2l3YyRHRB3VgdtAUOb7qAFMcWuKEHFNS4qvzLRemTcokMm8UTk5OFNu5
 rQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwsrDMqvWpJJAGAghG99RBI6rqTk8tR3VH4OuAhZgdw=;
 b=jPiTB1Gc72Fb/GScB/x1u2b2aCmk7acxOiF7NosdKuxU4qj2/E+AygtXdrdb04K8Om
 WqftQZuzagQAM777h7dFRcqGexEsJbQcYXsRrjFnB43TO9pzJUX6SEO+cDoTD2tyc5An
 At2Ewyq9wHBqcV2tgNIWYjDfiaGM88ueB/8/6rhrd3hXaOVG+lCPMDUG/T7uM2PuEwod
 denOnhERER3mTBDGH0zQ/oSEWUqvwY7g/UrvJOOeghjTcx1TC451p6+aROdc4hK8HDQN
 vsIKTsXp9GuhP9xfqqFmJUVSWQXDdS6BvPytPWHu0R/5C4Rgu34pngh2DMTnFkABeXw8
 fQXg==
X-Gm-Message-State: AOAM532k4QDFgUA/L3WQhMiK9cr09ynEk07JKsFw+la1CQ6MB8+h+EXd
 E5kWK9j+CSR7/jMfeaKGN4s=
X-Google-Smtp-Source: ABdhPJymhUa7ob+dx2CKSb3iD3hMvuzIQhMVT38tcQMt4odNZTaqU3FDkCiOBT/eALQn/tQWfxCv8Q==
X-Received: by 2002:a05:651c:1303:: with SMTP id
 u3mr894767lja.358.1629163839538; 
 Mon, 16 Aug 2021 18:30:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:39 -0700 (PDT)
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
Subject: [PATCH v8 32/34] ARM: tegra: Add Memory Client resets to Tegra20 GR2D,
 GR3D and Host1x
Date: Tue, 17 Aug 2021 04:27:52 +0300
Message-Id: <20210817012754.8710-33-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_183040_977605_DBAED397 
X-CRM114-Status: GOOD (  12.58  )
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

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 5c74cc76b5e3..2cb31bdd9eea 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -40,8 +40,8 @@ host1x@50000000 {
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
 		clock-names = "host1x";
-		resets = <&tegra_car 28>;
-		reset-names = "host1x";
+		resets = <&tegra_car 28>, <&mc TEGRA20_MC_RESET_HC>;
+		reset-names = "host1x", "mc";
 		operating-points-v2 = <&host1x_dvfs_opp_table>;
 		power-domains = <&pd_core>;
 
@@ -98,8 +98,8 @@ gr2d@54140000 {
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_GR2D>;
-			resets = <&tegra_car 21>;
-			reset-names = "2d";
+			resets = <&tegra_car 21>, <&mc TEGRA20_MC_RESET_2D>;
+			reset-names = "2d", "mc";
 			operating-points-v2 = <&gr2d_dvfs_opp_table>;
 			power-domains = <&pd_core>;
 		};
@@ -108,8 +108,8 @@ gr3d@54180000 {
 			compatible = "nvidia,tegra20-gr3d";
 			reg = <0x54180000 0x00040000>;
 			clocks = <&tegra_car TEGRA20_CLK_GR3D>;
-			resets = <&tegra_car 24>;
-			reset-names = "3d";
+			resets = <&tegra_car 24>, <&mc TEGRA20_MC_RESET_3D>;
+			reset-names = "3d", "mc";
 			operating-points-v2 = <&gr3d_dvfs_opp_table>;
 			power-domains = <&pd_3d>;
 		};
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
