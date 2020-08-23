Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D28C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F8420767
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ClcV2OPd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQKrnvwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F8420767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoOYg3yP1Y5JYSo2Jv0RVYCnY8QbMHInVvAsIdOo6Gs=; b=ClcV2OPdWP/qkz36EOHP5Ebiss
	iu823cmD3cjSzdf/a5qv/aeBxGVp1wqRJCRg12XFYzZ3B6wkOYllcS0UpG0PLHYsF8xelTEYdWbpi
	7v6xo7dYVzfwyx41eeeyfLFFXJAp87pEMCJidONZEL5MtqlfE0OBiW2rD6z04/wl9wWkj4f2wnX8c
	OH4Rg6tIw8Xu22as0OY7OuvgN7oYiiE5m6CJee1NYTVZueviNIZX94yPKU9t09J56HIXdgYYu7b+a
	Fb2P5h9p9jr9EE5bNZXFzDlHnpZfZuiYN/XFCkMAktc5X9yUjKTWYEtw6sA7kRBo6ON8RBNlRwaUO
	HaoLGrDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9smg-0000Ri-8v; Sun, 23 Aug 2020 16:23:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sgX-0004jc-6I; Sun, 23 Aug 2020 16:17:35 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 723892075B;
 Sun, 23 Aug 2020 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199451;
 bh=FgDauWijE2v2zG1uUmpQp0k3ggKYFyDzL5p9qK38cTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iQKrnvwOPFy36zo9ouWkzK/k66jZBtwE1DCl0+FuKAc2CgHeyOrQ5moiyAj1WqiAY
 uF7zNC19Jf2QR/TpzqOO7bPHGqzuKaCiNASOMBvMr2UgOvStlsr8RD5J0BczCkYabW
 byjfqz7daDcQ65RwP0IJAkDuLqXYySK83JNx8+8Y=
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
Subject: [PATCH 20/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from UART
Date: Sun, 23 Aug 2020 18:15:48 +0200
Message-Id: <20200823161550.3981-20-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121734_101065_51B4878E 
X-CRM114-Status: GOOD (  12.98  )
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

The UART on i.MX 8QXP has its own compatible described in bindings
and used in the driver (with its own quirks).  Remove additional
fsl,imx7ulp-lpuart compatible to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: ['fsl,imx8qxp-lpuart', 'fsl,imx7ulp-lpuart'] is too long
    From schema: Documentation/devicetree/bindings/serial/fsl-lpuart.yaml

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: Additional items are not allowed ('fsl,imx7ulp-lpuart' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index e46faac1fe71..61bccb69f09e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -257,7 +257,7 @@
 		};
 
 		adma_lpuart0: serial@5a060000 {
-			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
+			compatible = "fsl,imx8qxp-lpuart";
 			reg = <0x5a060000 0x1000>;
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART0_IPG_CLK>,
@@ -268,7 +268,7 @@
 		};
 
 		adma_lpuart1: serial@5a070000 {
-			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
+			compatible = "fsl,imx8qxp-lpuart";
 			reg = <0x5a070000 0x1000>;
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART1_IPG_CLK>,
@@ -279,7 +279,7 @@
 		};
 
 		adma_lpuart2: serial@5a080000 {
-			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
+			compatible = "fsl,imx8qxp-lpuart";
 			reg = <0x5a080000 0x1000>;
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART2_IPG_CLK>,
@@ -290,7 +290,7 @@
 		};
 
 		adma_lpuart3: serial@5a090000 {
-			compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
+			compatible = "fsl,imx8qxp-lpuart";
 			reg = <0x5a090000 0x1000>;
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&adma_lpcg IMX_ADMA_LPCG_UART3_IPG_CLK>,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
