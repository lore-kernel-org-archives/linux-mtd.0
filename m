Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E02C41517
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC7D22CB9
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 22:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j4jJ+sgJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="R7IJK1g9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC7D22CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=An9GjcueXJXStLSRPLia8DcdKRY5g02o4CA/+3aHGS4=; b=j4jJ+sgJAUN1Xx
	g7/yKLJWdDi9oYHnVp64oC01+KfGr7ChanOxSczYVpV4z5UFjUgYyY4IV65Gy84uLrANfWBTXbajo
	j9MQ5rOnhp66Ipj3kJJ7NBaxOhU/QrMv+Gf5BKf0V8ieHWs8Xe1/RsFxEyOmO8VDqnAD9y9IjRC4Z
	r+8pFXo67swPylpjk7QVjFILSgj5yblzrT5PNkcnlrS4Y45LVwoxWDdt1xJd9+cKPVnxhGe6zQx6v
	r0MzZrItITeHpaFAsDCR9FM5P4l6EbVqae+pKmutXgZh0nLhSj78Nu1v1YIzjVChUlxdPQlA4yOUA
	CjuUYUhxolrLKZ9t3PMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqlpH-0002Vh-M8; Thu, 25 Jul 2019 22:03:03 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqlp2-0002Kp-LE
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 22:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092161; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cgv/Eiyx9lwjgkpl2A6sQ/WtPGxxm4pZLEOSbUVch0U=;
 b=R7IJK1g97S4k1gcbeoey4ogXdrzb3s9X+T39rMxayhmX4cpAGcFsbT9iIkPOYMoh4FUSvm
 iMTR60Ab/vbRsW6z7htwMM1jOfRt7lC4YoKs+PTwPNADPMHZOW6bhu/q7EG9x778CbbYA0
 nyLqmuqyOFIpFW0ZrTMCL8bDdP9LOoM=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/11] MIPS: DTS: jz4740: Add missing nodes
Date: Thu, 25 Jul 2019 18:02:05 -0400
Message-Id: <20190725220215.460-2-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_150249_149059_2E43B8DE 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add nodes for the MMC, AIC, ADC, CODEC, MUSB, LCD, memory,
and BCH controllers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 3ffaf63f22dd..bceabf494af5 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -132,6 +132,35 @@
 		};
 	};
 
+	aic: audio-controller@10020000 {
+		compatible = "ingenic,jz4740-i2s";
+		reg = <0x10020000 0x38>;
+
+		#sound-dai-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <18>;
+
+		clocks = <&cgu JZ4740_CLK_AIC>,
+			 <&cgu JZ4740_CLK_I2S>,
+			 <&cgu JZ4740_CLK_EXT>,
+			 <&cgu JZ4740_CLK_PLL_HALF>;
+		clock-names = "aic", "i2s", "ext", "pll half";
+
+		dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
+		dma-names = "rx", "tx";
+	};
+
+	codec: audio-codec@100200a4 {
+		compatible = "ingenic,jz4740-codec";
+		reg = <0x10020080 0x8>;
+
+		#sound-dai-cells = <0>;
+
+		clocks = <&cgu JZ4740_CLK_AIC>;
+		clock-names = "aic";
+	};
+
 	mmc: mmc@10021000 {
 		compatible = "ingenic,jz4740-mmc";
 		reg = <0x10021000 0x1000>;
@@ -172,6 +201,38 @@
 		clock-names = "baud", "module";
 	};
 
+	adc: adc@10070000 {
+		compatible = "ingenic,jz4740-adc";
+		reg = <0x10070000 0x30>;
+		#io-channel-cells = <1>;
+
+		clocks = <&cgu JZ4740_CLK_ADC>;
+		clock-names = "adc";
+
+		interrupt-parent = <&intc>;
+		interrupts = <12>;
+	};
+
+	nemc: memory-controller@13010000 {
+		compatible = "ingenic,jz4740-nemc";
+		reg = <0x13010000 0x54>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <1 0 0x18000000 0x4000000
+			  2 0 0x14000000 0x4000000
+			  3 0 0x0c000000 0x4000000
+			  4 0 0x08000000 0x4000000>;
+
+		clocks = <&cgu JZ4740_CLK_MCLK>;
+	};
+
+	ecc: ecc-controller@13010100 {
+		compatible = "ingenic,jz4740-ecc";
+		reg = <0x13010100 0x2C>;
+
+		clocks = <&cgu JZ4740_CLK_MCLK>;
+	};
+
 	dmac: dma-controller@13020000 {
 		compatible = "ingenic,jz4740-dma";
 		reg = <0x13020000 0xbc
@@ -197,4 +258,27 @@
 
 		status = "disabled";
 	};
+
+	udc: usb@13040000 {
+		compatible = "ingenic,jz4740-musb";
+		reg = <0x13040000 0x10000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+		interrupt-names = "mc";
+
+		clocks = <&cgu JZ4740_CLK_UDC>;
+		clock-names = "udc";
+	};
+
+	lcd: lcd-controller@13050000 {
+		compatible = "ingenic,jz4740-lcd";
+		reg = <0x13050000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+
+		clocks = <&cgu JZ4740_CLK_LCD_PCLK>, <&cgu JZ4740_CLK_LCD>;
+		clock-names = "lcd_pclk", "lcd";
+	};
 };
-- 
2.21.0.593.g511ec345e18


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
