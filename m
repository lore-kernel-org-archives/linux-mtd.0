Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FEFC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF01020738
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ne82W38A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3TwHkT8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF01020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v/pH0ExaZYpUxihWRvTnoVyKVfzerrsuSzyF2oY50c=; b=Ne82W38ANSGSwmDLRaUjERoSAy
	NhMHswqwXYaOrSt7ue7tv1qkZMnDsdzFqvxtxZAi7VxU23OhWgH7bzZzXbzTWHHm9jI1uj/S5hmV6
	UPAXIEdYoEcQiL79RGL0i9XLbROpVJV9j9nxzyY74u1sunpd+4ThonZAY0tWZIzIGsBLEe/XmfEVm
	IhyFJJ5e+BU138ZYFkQpYSdY/BHRrfEzBxxwEGH3i0Ts7i6Y7YszkFml4zjU+EM/vhDzTJiPcDcjC
	3/2alvLgoDrudg0VlEyCjMswdz6Vx+kt4//4eUAuyAuBJlftBtyn5PJ7uBHs9qDzICCaynfvollAv
	jOJVNlQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhbM-0006Gs-DX; Fri, 28 Aug 2020 16:51:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZ9-000594-Ic; Fri, 28 Aug 2020 16:49:28 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C882520848;
 Fri, 28 Aug 2020 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633366;
 bh=JMjwvcNs4b37P7xm+7gxQw/xSmaryGBbQ40tRtlOM9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I3TwHkT8ZSUalQOaGJQmePU3Dz1GwJ4qYWBvs7AkbCMxbPqd9xk58a4Boj0CkVMmR
 L2NxplrVlvGN8c7tulbF95z9oDWmS5otNt/L/HwYg5ItWCrNYTOIY3ufmOTzW7RxER
 LXU8NYktR7BpSyPfc1AzD+IlcxUY5clTmeMna2DE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/19] arm64: dts: imx8mm-beacon: Align pin configuration
 group names with schema
Date: Fri, 28 Aug 2020 18:47:37 +0200
Message-Id: <20200828164750.10377-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124927_844849_6891B7E6 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Device tree schema expects pin configuration groups to end with 'grp'
suffix.  This fixes dtbs_check warnings like:

  pinctrl@30330000: 'pcal6414-gpio', 'pmicirq', 'usdhc1grp100mhz', 'usdhc1grp200mhz', 'usdhc1grpgpio',
    'usdhc2grp100mhz', 'usdhc2grp200mhz', 'usdhc2grpgpio', 'usdhc3grp100mhz', 'usdhc3grp200mhz'
    do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/freescale/imx8mm-beacon-baseboard.dtsi  |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index bf0859f1e1fa..16e4910aeb1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -210,7 +210,7 @@
 		>;
 	};
 
-	pinctrl_pcal6414: pcal6414-gpio {
+	pinctrl_pcal6414: pcal6414-gpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x19
 		>;
@@ -240,7 +240,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2grpgpio {
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x41
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
@@ -259,7 +259,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK	0x194
 			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD	0x1d4
@@ -271,7 +271,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK	0x196
 			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD	0x1d6
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 620a124dfb5f..502faf6144b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -290,7 +290,7 @@
 			>;
 		};
 
-		pinctrl_pmic: pmicirq {
+		pinctrl_pmic: pmicirqgrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
 			>;
@@ -309,7 +309,7 @@
 			>;
 		};
 
-		pinctrl_usdhc1_gpio: usdhc1grpgpio {
+		pinctrl_usdhc1_gpio: usdhc1gpiogrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10	0x41
 			>;
@@ -326,7 +326,7 @@
 			>;
 		};
 
-		pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
+		pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
 				MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
@@ -337,7 +337,7 @@
 			>;
 		};
 
-		pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
+		pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
 				MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
@@ -364,7 +364,7 @@
 			>;
 		};
 
-		pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+		pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
 				MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
@@ -380,7 +380,7 @@
 			>;
 		};
 
-		pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+		pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 			fsl,pins = <
 				MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
 				MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
