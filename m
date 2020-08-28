Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE0CC433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:57:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED8732074A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2BXe8lq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZsn4rx/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED8732074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+oPXF10SIWoq59ewoVSIdmRdoRnfb9iyvzW/8QPYhQ=; b=I2BXe8lqAVnm+0n8GZ2uKNcFBO
	SgygGYitpBDmkGIW7BmUhNvgtXM4I+19emBxt5Q2o9ftDxP0XMHa5DVv7Z8vxtn768j9H9etB+w8+
	zvUpSnzYAzjMcW5SvWK9S6OARufkA8Iz75GFx+e1njP9fhdP/m9B6fSSl6MRSD53c5vaP0nK3+zkI
	LPL61oFwYlGOKkH6tFEYqWUZROqJEziEKnL3PNB/ksy1cDuXyMMtGXnJQO0Sorr/wH3VdxFmFKlfR
	U+Rdk+Br4UuI5ymQbWxk7Q1aqWy/gUltQcLa3pwksl569Oio/BIO1TKm2DEkgXWRGHYBfua+dpLZB
	3cscMVXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhf0-0000KK-UR; Fri, 28 Aug 2020 16:55:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZU-0005KP-Pg; Fri, 28 Aug 2020 16:49:50 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8443320B80;
 Fri, 28 Aug 2020 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633388;
 bh=tMAMGxqIF7yzVEB7ojVRCLXtOkuEnHAvF6XNEXvOM7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uZsn4rx/cQ04tzbfnAuHAAkpRFU8dfexY1NW0tyaF7Ll870+UHpuh/f9d3xP71xgf
 cJ/dKXyq7CcSN9Z8DWeBUqfavbyXOEMVvWO55XMUXjeNsbS8+6x+BL0QrWscfV0ynn
 9fXZxJYmBCR4e59710N90WQPWJLA9X1Ym2IuPdvs=
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
Subject: [PATCH v2 11/19] arm64: dts: imx8mn-ddr4-evk: Align regulator names
 with schema
Date: Fri, 28 Aug 2020 18:47:42 +0200
Message-Id: <20200828164750.10377-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124949_424075_8BE8EED9 
X-CRM114-Status: GOOD (  12.59  )
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

Device tree schema expects regulator names to be lowercase.  Changing to
lowercase has multiple effects:
1. LDO6 supply is now properly configured, because regulator driver
   looks for supplies by lowercase name,
2. User-visible names via sysfs or debugfs are now lowercase,
2. dtbs_check warnings are fixed:

    pmic@4b: regulators:LDO1:regulator-name:0: 'LDO1' does not match '^ldo[1-6]$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
index 3ac8f9d3c372..8f7155716c84 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
@@ -60,7 +60,7 @@
 
 		regulators {
 			buck1_reg: BUCK1 {
-				regulator-name = "BUCK1";
+				regulator-name = "buck1";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
@@ -69,7 +69,7 @@
 			};
 
 			buck2_reg: BUCK2 {
-				regulator-name = "BUCK2";
+				regulator-name = "buck2";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1300000>;
 				regulator-boot-on;
@@ -79,14 +79,14 @@
 
 			buck3_reg: BUCK3 {
 				// BUCK5 in datasheet
-				regulator-name = "BUCK3";
+				regulator-name = "buck3";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1350000>;
 			};
 
 			buck4_reg: BUCK4 {
 				// BUCK6 in datasheet
-				regulator-name = "BUCK4";
+				regulator-name = "buck4";
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
@@ -95,7 +95,7 @@
 
 			buck5_reg: BUCK5 {
 				// BUCK7 in datasheet
-				regulator-name = "BUCK5";
+				regulator-name = "buck5";
 				regulator-min-microvolt = <1605000>;
 				regulator-max-microvolt = <1995000>;
 				regulator-boot-on;
@@ -104,7 +104,7 @@
 
 			buck6_reg: BUCK6 {
 				// BUCK8 in datasheet
-				regulator-name = "BUCK6";
+				regulator-name = "buck6";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <1400000>;
 				regulator-boot-on;
@@ -112,7 +112,7 @@
 			};
 
 			ldo1_reg: LDO1 {
-				regulator-name = "LDO1";
+				regulator-name = "ldo1";
 				regulator-min-microvolt = <1600000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
@@ -120,7 +120,7 @@
 			};
 
 			ldo2_reg: LDO2 {
-				regulator-name = "LDO2";
+				regulator-name = "ldo2";
 				regulator-min-microvolt = <800000>;
 				regulator-max-microvolt = <900000>;
 				regulator-boot-on;
@@ -128,7 +128,7 @@
 			};
 
 			ldo3_reg: LDO3 {
-				regulator-name = "LDO3";
+				regulator-name = "ldo3";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
@@ -136,7 +136,7 @@
 			};
 
 			ldo4_reg: LDO4 {
-				regulator-name = "LDO4";
+				regulator-name = "ldo4";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
@@ -144,7 +144,7 @@
 			};
 
 			ldo6_reg: LDO6 {
-				regulator-name = "LDO6";
+				regulator-name = "ldo6";
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
