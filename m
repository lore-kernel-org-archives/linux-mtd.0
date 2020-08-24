Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FC4C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:09:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB392078D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBrXOUwU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/Dj1dbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FB392078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCcIFFqcU4O1+MHoBJBUlHba3K+udnja3nIAxBEk8h8=; b=pBrXOUwUfZOtkHrWyng6b+aGeg
	2KjQ/0QhG4hNRwIhgLmwBImJEeVRgjPsO36iEdNWTeziZyAkKZDqCwIrNGBI4C93+c+yczCiQOuJH
	PqOlq+hME2Ri12pG61S8IxWBA5aYKH7e0Gwfy3HN1NAQ3vclk5S/yhvtun7ywUATnfvDYXec06eYO
	qaPFv9EEWmKoPAAykyJLoTyjnPzMtsm8MsNmAF+QzX8JGcWvBtuc2pVDkI+1cYFD0i7kMVWyc+QA2
	711vKchZ4t0cFiQTsk5nmmjUomgGLj5EoKAnTyLq0SFSu1d2alwOllMENtOKvHvC1iHoqIfdNShlI
	CAB61sQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAHpo-0005vp-5Y; Mon, 24 Aug 2020 19:08:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAHof-0005PF-Js; Mon, 24 Aug 2020 19:07:38 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0861220897;
 Mon, 24 Aug 2020 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598296056;
 bh=oEcLyFzzzoRu+O9dRmWrcqh+WugXQFGAASOZgfojBhE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V/Dj1dbRz3YiRHltLmm2UIt8jCyJxu7+zSwy9fZemLRs2jlU5O4lNdbF6lCAn14fI
 m8VPTtzQ82az2T1DSwl7PmBASo43WmI1ldq5sPT7G2CUucNKiPQ50GHYAP4uLKUjWV
 zIBlS6FYWF4Mi94MS1k3fkuVhjYfn2x1+vs8LpaQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Adam Ford <aford173@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
 Li Jun <jun.li@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/16] arm64: dts: imx8mm-beacon: Align pin configuration
 group names with schema
Date: Mon, 24 Aug 2020 21:06:50 +0200
Message-Id: <20200824190701.8447-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824190701.8447-1-krzk@kernel.org>
References: <20200824190701.8447-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_150737_915546_F1819C13 
X-CRM114-Status: GOOD (  12.68  )
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
index 5b5af8b381df..d6b9dedd168f 100644
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
