Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F6AC3064D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvgU+QCYBUrGLVlVcB3rK2/WQUGCDZ1kgMjlYDIA25g=; b=CvdDBsrXaXF7XT
	OrFpG+YSEhhXH2XVQHLgZ7oKDtyt9Ya/nSLrvz0I56tnkSLPOn6V8Uj8pzAqJS4eQVKIyqvW9X8Yx
	Q5n1+Cf7O4IIp1PJZho56IJpMLnAkS7CEPtv3s7/vFj6s4xqmHSgj7F+d3A2TywdQMbvde6jAGvkq
	sQpHVzfiF0fBO1Gl86Q5ze7mTEU/UMsHO+QYdmjexWLBHUderINO3dFL4JU/idoCiLohdeB6rRCoK
	M/pMF0eYW1UrVyXloOHvtFfGan0q63Sxz1Oyrn4hH2Rrv8JtJ9vsM/6pBT5hTRbJW1Cf9rnEoEOGN
	Vl1rUK6m6qIiSLHvnp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqeU-0000000AleZ-11DE;
	Thu, 27 Jun 2024 15:03:10 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqeM-0000000AlaI-0x7t
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:03:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so6327351fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500580; x=1720105380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=10AJW+yK8i2eAOmaYbEuOnmaAocQxExQGcp0Gpq39qwS9NCAGfJ8iUsPunt4554rSw
         gO13oj1EJhZyyMsqOWMy3iuc22LVQ/MU6Y9SRzt5IuwCuBqVaFi52yccUhBMZ5XsAo4r
         w1BJ89VwntXvi8NOWPeahC7u3qwJldkb6EG81d96I8IYG5JOTKB8LThnA3SYebnm8l2C
         sbrJj/Y2ovcp2br70nqPaTGc06X4kEJUzYJF6cZk+0qkwSsq6zbj4BmuEkHeojWf8YBJ
         dpB7r4SO8dIshEJzLw8wMC6weay177gRzPhveVKvB6TjzD9aM/Y7Dh7YItL2O2bGlrrJ
         YcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500580; x=1720105380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=WmUEUA/LtfeNS2sjGzk8mmN57xc1Ee3qbksPhp+YPgzifNWpA1LXRi6mWRhOVfEemA
         KEGN9dSgD0Wc3U++zYt8DDEVI/DCFxBdfhqIQLy+rD2TKwk0+zSFFRv0PoDRcgOOY4DO
         WMgat3bLvv6j+dtrnKx+Gqv9sXnXroXiMEsFg5jsV462kKsJ4Qy2grh0XIPSY78jvHwN
         QUiMFqKne8e7zBUjc+uRBF53XT7i5Q7i/N7hlssfkKZxJXFAWIJGJ50hF0ZmiLB9UrVW
         T2TvFCVOu61bB2XRXgd+I3fUnRxDGhlRIksQhFNHTaYWnfiRCiAVla35O9GeAvWL/mZt
         /0iA==
X-Forwarded-Encrypted: i=1; AJvYcCXruWARMRUd92y7cxTTNGKAy7BxzFUdhm01X1oPQF2BwFb8iK4Kxnd/VOlcQojzypBntEbCUWZXHIqfyvO49ohNH5e7uJS4O+HsHefmhg==
X-Gm-Message-State: AOJu0YzJ7L+NWDkmR53QIV+VqbGCDnWig73orhziFnF0aReLn/M/3d6q
	UY5P2szcJ386B+WJUlHTqUn39lB+d2n4F9ylEAVs53fJkL+mSbsZ38KBC6mF6DI=
X-Google-Smtp-Source: AGHT+IGZ1++Ks98/Qf/5imxTRRLFDrmwBrTqFEXDtzEcoEhTACvV1BuNeYZAcogKlXox/ewKi1ymKA==
X-Received: by 2002:a19:6455:0:b0:52c:db0e:6c4a with SMTP id 2adb3069b0e04-52ce182bea2mr10424279e87.2.1719500580105;
        Thu, 27 Jun 2024 08:03:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:59 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 05/12] ARM: dts: lpc32xx: Add missing dma properties
Date: Thu, 27 Jun 2024 17:00:23 +0200
Message-Id: <20240627150046.258795-6-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080302_383588_F9124555 
X-CRM114-Status: GOOD (  13.94  )
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

Adds properties declared in the new DT binding nxp,lpc3220-dmamux.yaml
and corresponding phandles.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 8bf88d141e5b..6135ce4dde61 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -67,6 +67,8 @@ slc: flash@20020000 {
 			reg = <0x20020000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
 			status = "disabled";
+			dmas = <&dma 1 1>;
+			dma-names = "rx-tx";
 		};
 
 		mlc: flash@200a8000 {
@@ -75,6 +77,8 @@ mlc: flash@200a8000 {
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MLC>;
 			status = "disabled";
+			dmas = <&dma 12 1>;
+			dma-names = "rx-tx";
 		};
 
 		dma: dma@31000000 {
@@ -83,6 +87,13 @@ dma: dma@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+			dma-channels = <8>;
+			dma-requests = <16>;
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
 		};
 
 		usb {
@@ -182,6 +193,8 @@ ssp0: spi@20084000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 14 1 1>, <&dmamux 15 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -191,6 +204,8 @@ spi1: spi@20088000 {
 				clocks = <&clk LPC32XX_CLK_SPI1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 11 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
@@ -206,6 +221,8 @@ ssp1: spi@2008c000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 1>, <&dmamux 11 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -215,12 +232,16 @@ spi2: spi@20090000 {
 				clocks = <&clk LPC32XX_CLK_SPI2>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -231,12 +252,16 @@ sd: sd@20098000 {
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SD>;
 				clock-names = "apb_pclk";
+				dmas = <&dma 4 1>;
+				dma-names = "rx";
 				status = "disabled";
 			};
 
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -326,6 +351,13 @@ clk: clock-controller@0 {
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
+
+				dmamux: dma-router@7c {
+					compatible = "nxp,lpc3220-dmamux";
+					reg = <0x7c 0x8>;
+					#dma-cells = <3>;
+					dma-masters = <&dma>;
+				};
 			};
 
 			mic: interrupt-controller@40008000 {
@@ -361,6 +393,8 @@ uart1: serial@40014000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40014000 0x1000>;
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 6 1>, <&dma 5 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -368,6 +402,8 @@ uart2: serial@40018000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40018000 0x1000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 8 1>, <&dma 7 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -375,6 +411,8 @@ uart7: serial@4001c000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x4001c000 0x1000>;
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux 10 1 0>, <&dma 9 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
