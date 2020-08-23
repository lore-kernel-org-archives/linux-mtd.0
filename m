Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE68C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455852072D
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="djpq57Ks";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wY4K7oe3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 455852072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW0uP6ZcYV43bS0GzYbgfRAIXD1B//jfcAqPCgbN6UA=; b=djpq57KsoZJz9mroRNfUhJPDtb
	QhJ5tcfA4sv2jK4/AdvsU2zt8YRFszB0vPW7+sJ4c/Jlj5AVQHFnun5EJ+g/GGIGY18aAQPPABZwD
	l073VmeEWXl5Z+EjqM8NuDfdiGoJVugYCs+pdfPL38xtElnDBUTVQ4VTNcemw2oN1lCp9erZvq266
	OdU0PakyNTp+d1FV8wvpLLHOj/c5wcstELNv1vehw55O6/9PWOcrFbzrA790dDycxcLoiidH4qe/3
	wB8W8NeKbFd7WfcT7DjupJEn+g03lFjMyAASRobc1RbAzy9DBh39AJ6fju4oq8sYCfmUp5Lanv2Sr
	zYtPXCoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9smU-0000O3-CK; Sun, 23 Aug 2020 16:23:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sgQ-0004hA-R3; Sun, 23 Aug 2020 16:17:29 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 269932076D;
 Sun, 23 Aug 2020 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199446;
 bh=sQld/rHqgvWMEGDYoBvDchJJetnYPftabvD886fB5Os=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wY4K7oe3cC/0huZbBIyhotqb9FgN9nL+Ghie/J1XqWk+hu2foVGRXX+rYUew4b1Yj
 u/V+EQTvWwGmcTMA0z1atfQpJxu/IQnq4wjxMXJ8cvQEacwG1elHKuyhCsGXml9BTT
 IccFjTRwut+1LETjAo0m2lfT0M7yQzZVpgEo+OOQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 19/22] arm64: dts: imx8mm: Remove i.MX7 compatible from USDHC
Date: Sun, 23 Aug 2020 18:15:47 +0200
Message-Id: <20200823161550.3981-19-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121728_296018_A3991A02 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anson Huang <Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The USDHC on i.MX 8M Mini has its own compatible described in bindings
and used in the driver (with its own quirks).  Remove additional
fsl,imx7d-usdhc compatible to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: mmc@30b40000: compatible: ['fsl,imx8mm-usdhc', 'fsl,imx7d-usdhc'] is too long
    From schema: Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: mmc@30b40000: compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 76f040e4be5e..38bf41184489 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -784,7 +784,7 @@
 			};
 
 			usdhc1: mmc@30b40000 {
-				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
+				compatible = "fsl,imx8mm-usdhc";
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
@@ -798,7 +798,7 @@
 			};
 
 			usdhc2: mmc@30b50000 {
-				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
+				compatible = "fsl,imx8mm-usdhc";
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
@@ -812,7 +812,7 @@
 			};
 
 			usdhc3: mmc@30b60000 {
-				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
+				compatible = "fsl,imx8mm-usdhc";
 				reg = <0x30b60000 0x10000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
