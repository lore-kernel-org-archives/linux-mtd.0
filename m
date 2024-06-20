Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8447C2BA1A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTHYdcNsUPpN1t9GfpDXO04a7Vt9N+bCDSAGKa2jEPg=; b=MZwKjuSQ6hgx+T
	hY15Jn2utOHQbau5ZpMiiNRgMrjaMVZHhegWENLPpqNopUsXNKnCaKj1C23liPT4+AtE06pV5tvR/
	LB1qr2rKfSYKxG33bjcmCRtNGUKlqLG+PSWRLnXyo0xa3aiSDA6TaVBKZseQ4DkIUI7sH8G8wf34n
	Cd77b4ywaX2rxnb5mG+ytBZc94m/g7S2OHqWqPo67doVH6SsseZOarvvBFCymR6cMyxsYp3zNf751
	KEPTxq20hPfF9+dgMgInin0K6uLzfQn1JHox+cbuQ6fJaGsQjM/QWq6e1fTmuntrhhqEC5UmyPDuv
	1bOReXu9oYdQLqlBPzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM49-00000006BZj-3Qqt;
	Thu, 20 Jun 2024 17:59:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3r-00000006BHo-0aBi
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 17:59:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a6ef46d25efso136935666b.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906341; x=1719511141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJI26duvfMm0hH2VM1fi6stFJmPonSLGaDj169i8hcM=;
        b=NrpDK7u1rax5gQjPzWWtIoAfQMlFj0UACw2l57VFonJTYnEY/1Aope8KvGMUuWeFQQ
         997GbiqUDCzrxtqbb4/qeNxCG2GFa1AwwdF+GRI23i2a5q3PnHAYLSs8wRi0KW/c846u
         ulcNkZqkwn9pHE0254A+ulqIm1NQZB6iEZ/Asgu/ybnNNmmwby/aJE1X5YA8yxsIF//K
         h/jJQm3uJntYHgIYSl+CxD4QiyqrPFGEk7eMu79y4tcLPbFNvrT2o49tlPVzKG16YoFC
         8quoS8AOdLyVhxQYXt6up5k+OKVqo1tFqkRXdIbiRVD9/ERKC9V8jAKyBdfTC7IH7Jks
         /Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906341; x=1719511141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJI26duvfMm0hH2VM1fi6stFJmPonSLGaDj169i8hcM=;
        b=H4UeNP1X8hzxB/PIXhMNySYZ4QDbzFncPuQmHjzYgvHcBFKvgWbPIIt4UVaN2bWxyG
         4IpC1PeCFqhNqLHab8rikUvtBm78ASzr+Yozw0o57fLRjLoOa2a2uNyvHI06AYYKxYgq
         ODhP7LQ1xsbO57L2sqCgl+/AoR8Jv7g1dm0SP3H1giyVpQHzIqdDIqtUZmuQVvBoeUel
         cnr2OpCwZs245YlL6kJ2HC91H3cHRNVQ2HeBfaUtxeERtVhYHcpCf4gPaHiN1pCbKHdB
         i7zEiIJI0xr9qsnMKYZgVOZ+XdazVXnJGkmNO0CY6zb0tvCOPC90LPA6eaGyPViRVbsw
         Hy4A==
X-Forwarded-Encrypted: i=1; AJvYcCUBBnXSV87p8RCiNCp4ZqKcQNYgFwcbfWY9REqct331DC9tsHTUjus4tukbr4AOOEC6rUustKeVRJlWsxxlZKlEc5h5EZJolCeMr6vD/g==
X-Gm-Message-State: AOJu0YzBxWv2Xkp75IpffD1VQMI4WRgiC31R4IKRQnY/Qstn2YixFZHB
	pyDmuJZEjoSSRLeLL+w7+ASNYIG6YkgBX1RsVYpVn5fHdsyZkRmQmT5zPBM75Fc=
X-Google-Smtp-Source: AGHT+IFE99yiH6KlSLSijoysmvGidn2b7gOkfW49nNmYq3cUnll4tztljhinaCegKpYiciiy0oFs8g==
X-Received: by 2002:a17:907:1606:b0:a6f:b19d:90ac with SMTP id a640c23a62f3a-a6fb19d9667mr375299966b.69.1718906340595;
        Thu, 20 Jun 2024 10:59:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:00 -0700 (PDT)
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
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s properties
Date: Thu, 20 Jun 2024 19:56:35 +0200
Message-Id: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105903_622402_A42FE379 
X-CRM114-Status: GOOD (  16.76  )
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

Adds properties declared in the new DT bindings:
 - nxp,lpc3220-i2s.yaml
 - nxp,lpc3220-dmamux.yaml
for dma router/mux and I2S interface.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is renamed from
  "ARM: dts: lpc32xx: Add missing properties for the i2s interfaces"
  to describe dma changes as well
- Added dmas and dma-names properties in to all node which have dma request signals
- Add bus properties to pl08x dma node since they are removed from platform data in phy3250.c
- Put clock-controller@0 and dma-router@7c under the same syscon, simple-mfd device

Changes for v3:
- Split previous commit for separate subsystems
- Add properties to match dt binding

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 53 +++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..c58dc127e59f 100644
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
 
@@ -215,12 +232,19 @@ spi2: spi@20090000 {
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
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -231,12 +255,19 @@ sd: sd@20098000 {
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
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -312,21 +343,27 @@ fab {
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
-			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+				reg = <0x40004000 0x114>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x114>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
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
@@ -362,6 +399,8 @@ uart1: serial@40014000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40014000 0x1000>;
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 6 1>, <&dma 5 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -369,6 +408,8 @@ uart2: serial@40018000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40018000 0x1000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 8 1>, <&dma 7 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -376,6 +417,8 @@ uart7: serial@4001c000 {
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
