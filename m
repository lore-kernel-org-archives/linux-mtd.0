Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60772C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3033E20738
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfP5z0Gf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rM1dwyRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3033E20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+jpCaIAJWr6xeRD+suFu6wtye9uxS6sqIJeet4r6ls=; b=yfP5z0Gfxft2lQAYEEBHWnXY9Q
	BHh/gOvRMfzTAm4Uv2k05DhwAjCiKACFYXwm/VMHpkIoD2b3gHtftf56aF6IEC8HKeUR1IXHOilgB
	z+6pnZcyTHK/zjMtbY/f0K/j3PeIpdsUbEFE6WOc+Ym4/52oonLk22SAYYywrb6seRHQcDSIz8P4I
	lksXLZz8Jq8/RlS3faSPhbxvfuoi3fHdXlN+xzDvTy2n1Cre7dBrNPuOKyoBDQqbc1I53utuBoxLY
	ALPMukes5x1kbm5wI8CuRZjkVlLtKSqHW4Lt1aPi4Cp7xNt+XMuxqd8ig9edUDOOJkS4e2osclNIl
	ZI6Iwkig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhcV-0006xv-Az; Fri, 28 Aug 2020 16:52:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZM-0005Ey-3x; Fri, 28 Aug 2020 16:49:41 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97B9720B80;
 Fri, 28 Aug 2020 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633379;
 bh=FkLjw7Jcs543SiKoNIN05bHQA4tIrsY4ElZISGC6hZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rM1dwyRgJ3KIP0QWWY77IMjSthExMTWxWT5YYeEBwDfTvME0q5IyMTZCTJ8MgVZDB
 8+CKUzWnucoUCyZsoBFjl+D5S8PtxnCGVBCvDP4fBOHTWyPOv/YZBSAcA+bJFBBENz
 JXBpltlA5wgx+bDQTSqZsYcWFqAR2eMbGM2s1S50=
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
Subject: [PATCH v2 09/19] arm64: dts: imx8mm-evk: Align pin configuration
 group names with schema
Date: Fri, 28 Aug 2020 18:47:40 +0200
Message-Id: <20200828164750.10377-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124940_298981_C393BB9C 
X-CRM114-Status: GOOD (  12.20  )
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
suffix, otherwise dtbs_check complain with a warning like:

    ... do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 0115f07bbc9d..207dc8de3145 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -423,13 +423,13 @@
 		>;
 	};
 
-	pinctrl_pmic: pmicirq {
+	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
 		>;
 	};
 
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 		>;
@@ -457,7 +457,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2grpgpio {
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
 		>;
@@ -475,7 +475,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
 			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
@@ -487,7 +487,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
 			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
@@ -515,7 +515,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
 			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
@@ -531,7 +531,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
 			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
