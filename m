Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DB3C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:56:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20FB20848
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yXTjMec2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhcjZjjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20FB20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK+rLVjgNE9JvMtW9OQnRU2RFcKNVGSE/K5kCXeJWXQ=; b=yXTjMec2gbqFQCiQ5Jz4fz/P0I
	gy1tBs6Qxd1Oe4AxhfYslNrgESJd4EphBpOf30jRfAcvARy9iqinykZyJxh9kbjMhW4XBiVMeps9B
	8jDQX8KmiUKQDiihHE5g4NM8dLRtaNrzBCtF3MsqmVX694Onr0G7C7xJqx4DJFonGXbDrxzoY0y/U
	5MlWhr93jAn5P6qKaInHbpjCkGf8QPl4eQgo4XKycts+U2eJTr+z7FgHADE/o5T9o27rZ8XvjrPp1
	L+++AFZNmigCP9etxu4/8prxvaM7wbK63RBoA8EGcd9OJAEKIb7XD94I0AX8rqsbHOaNvyv3r5rzM
	Q3JYMNiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhf3-0000L2-Qw; Fri, 28 Aug 2020 16:55:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZa-0005NC-22; Fri, 28 Aug 2020 16:49:55 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C8B2098B;
 Fri, 28 Aug 2020 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633393;
 bh=CFDMzcJagCMCiZtXxH7iFplsC+3dBIHoQLjxzKqhIcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XhcjZjjIH+dFzJpGeyiNdvWLA9A7I3yX0NhPQ/3r6mSCJRJbP3SDiV8QytJhzeQx1
 9QVXl/Ji9vQ4/eOJkxNsFCowMzJicTHuWtVGidgyr06fnodFWI/kxjs2tYtjoaZxnU
 +sS0Ave8IhrV+yC6kxoFHbuR8ebbSFXlGe8I+Oa8=
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
Subject: [PATCH v2 12/19] arm64: dts: imx8mn-evk: Align pin configuration
 group names with schema
Date: Fri, 28 Aug 2020 18:47:43 +0200
Message-Id: <20200828164750.10377-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124954_227967_C0601C24 
X-CRM114-Status: GOOD (  12.31  )
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
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 48892ed562b4..ed9b5241acc7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -221,13 +221,13 @@
 		>;
 	};
 
-	pinctrl_pmic: pmicirq {
+	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x41
 		>;
 	};
 
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 		>;
@@ -246,7 +246,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2grpgpio {
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
 		>;
@@ -264,7 +264,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
 			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
@@ -276,7 +276,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
 			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
@@ -304,7 +304,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000194
 			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
@@ -320,7 +320,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x40000196
 			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
