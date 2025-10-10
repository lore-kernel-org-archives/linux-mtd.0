Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58767CCD187
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDgGoBX8L8HczqdypOCQwxr9/SGIkvbJqLT18QaC5s4=; b=NvrEAM0+U7YCOw
	HTEGsIaOHpFJz0blPLvpKcTFfdyiZ7pIB/+2l6dNo84uoitoxcZxAWPgg9pu5Vyg2I3lIp8JUsBAR
	Zv0hUdLIx3pcWo8K7FlRUKR/K3DdJcuKnoM+Mw/LPhTOH4lnLRpO0j3VFdNFfhLARGWIV6KpQxh99
	h85hhMnwUWwG01ClZrDS4vleYUQf+R2qcSKjDZfFFpqSSayqgn8jyXNEnlmCmruv4FOhT0HzHj5Id
	PTSWwQtToA2VCtbNLgcdYzKwbrns1sMyh7vA6VXVkM6A5wddBJKRmaC64ExCp6h19lhK/qLIgN28p
	GwKP9YMWx3Q57enrMKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h5-000000081Rs-2Ulf;
	Fri, 10 Oct 2025 08:41:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h1-000000081Lm-0SuO;
	Fri, 10 Oct 2025 08:41:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 96B621A127D;
	Fri, 10 Oct 2025 08:41:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAFB60667;
	Fri, 10 Oct 2025 08:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63206102F2204;
	Fri, 10 Oct 2025 10:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085696; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLUI3DAeOf8Gf/4795RSqwfpn1jrg6BWZGq810jHUE4=;
	b=y8phVoq8g2wcSrJsqn8y2JdqJUR8dFEW9/j4t3nDpBDLbY5CvPoiRl9A7HYeMR2wPcv1zn
	ibcYf67gZJs5b8/51Mk0vtTcg4ueao9J1qgGBTN+ZKTycbF4nnisRmVZki3vdgtyQhUw1v
	uT613Xta3u40dAgd+sOgVMF/305o227he+bWqA9EU6Sn14sy2PXkWqhp6OPvcSvdAmGYuN
	OT5zDHb93cFUxVkLC0zLof/koSW6ujqGy1LBiy9wZ1NpANCLzt/ODzCpnzIuRdBLFbpmDS
	nCGwsAUxWBzajNNXlJ4J21hYkp7MQFFRbVnKoO21aLKeQHODOThkXM1UhBRRxw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 03/15] arm64: dts: allwinner: h616: add NAND controller
Date: Fri, 10 Oct 2025 10:40:30 +0200
Message-ID: <20251010084042.341224-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014139_319657_6187D3C6 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

The H616 has a NAND controller quite similar to the A10/A23 ones, but
with some register differences, more clocks (for ECC and MBUS), more ECC
strengths, so this requires a new compatible string.

This patch adds the NAND controller node and pins in the device tree.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index ceedae9e399b..60626eba7f7c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -278,6 +278,37 @@ ir_rx_pin: ir-rx-pin {
 				function = "ir_rx";
 			};
 
+			nand_pins: nand-pins {
+				pins = "PC0", "PC1", "PC2", "PC5", "PC8", "PC9",
+				       "PC10", "PC11", "PC12", "PC13", "PC14",
+				       "PC15", "PC16";
+				function = "nand0";
+			};
+
+			nand_cs0_pin: nand-cs0-pin {
+				pins = "PC4";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			nand_cs1_pin: nand-cs1-pin {
+				pins = "PC3";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			nand_rb0_pin: nand-rb0-pin {
+				pins = "PC6";
+				function = "nand0";
+				bias-pull-up;
+			};
+
+			nand_rb1_pin: nand-rb1-pin {
+				pins = "PC7";
+				function = "nand0";
+				bias-pull-up;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -440,6 +471,25 @@ mmc2: mmc@4022000 {
 			#size-cells = <0>;
 		};
 
+		nfc: nand-controller@4011000 {
+			compatible = "allwinner,sun50i-h616-nand-controller";
+			reg = <0x04011000 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND0>,
+				<&ccu CLK_NAND1>, <&ccu CLK_MBUS_NAND>;
+			clock-names = "ahb", "mod", "ecc", "mbus";
+			resets = <&ccu RST_BUS_NAND>;
+			reset-names = "ahb";
+			dmas = <&dma 10>;
+			dma-names = "rxtx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&nand_pins>, <&nand_cs0_pin>,
+				<&nand_cs1_pin>, <&nand_rb0_pin>,
+				<&nand_rb1_pin>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart0: serial@5000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x05000000 0x400>;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
