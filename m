Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD39BC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:17:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C94A2078D
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VDLaIAoU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4jcEMVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C94A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14NdkVy6jtFXB6jbmX0BuRPXUrXaSktcOEpHQCceGb0=; b=VDLaIAoUMA7b8gZdx7Bpb/6Gd/
	X5ptSjp/rM37XynkkWbj4mHVnX+J0F5pMK0nWiA/I+tVSOUMYMJmzf1JqJUleebvBTYMoXRIvOjRm
	pAi5PBY708SLZMmr4gNiVa3ph1z0VgSjvT5bLNCexWMnKpqzbPxuV3mGab+NWDwbKwpkXr01Mtzgw
	6iVaCPIw0if74gpJ51z0haazJBA4GWJ4J3T5Ezcp1nw8zTzqBX+VlAFWxIWVu+f7sOXVID9mv9hMH
	AnFOmNUMcpBHhWxr5ou5NfwTbJmV+SckD8A5TGmVJtiNj4vaSPgG+JvYBkBDfY+OPh/egZxFn715h
	lq5uhCqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9sfH-0004B8-7c; Sun, 23 Aug 2020 16:16:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sf5-00049e-L2; Sun, 23 Aug 2020 16:16:06 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 685DC2072D;
 Sun, 23 Aug 2020 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199361;
 bh=lnBHoUXioLOrOWNKvWtcrwmt13u6QaY0trxOTodHtew=;
 h=From:To:Cc:Subject:Date:From;
 b=M4jcEMVojBCm6n6VI1JLybJ3HkimOMO74lwgXpcMV4RvKKHZeawHTgV8XtBvp9UtQ
 ULqXZ3K+wsEaxZPwJSqX2sGxr7+iuFaZhY48Xna/0DmrwbZmpnIbv+wrnX/1RoSgBl
 yb2ljxrWBvbfEbhd6Rk/f+zaCNTZCX+gnvm5j4Ys=
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
Subject: [PATCH 01/22] dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8 compatibles
Date: Sun, 23 Aug 2020 18:15:29 +0200
Message-Id: <20200823161550.3981-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121603_862510_E28BC9DC 
X-CRM114-Status: GOOD (  11.60  )
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

DTSes with new i.MX 8 SoCs introduce their own compatibles so add them
to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
    compatible:0: 'fsl,imx8mm-gpio' is not one of ['fsl,imx1-gpio', 'fsl,imx21-gpio', 'fsl,imx31-gpio', 'fsl,imx35-gpio', 'fsl,imx7d-gpio']
    From schema: Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
    compatible: ['fsl,imx8mm-gpio', 'fsl,imx35-gpio'] is too long

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: gpio@30200000:
    compatible: Additional items are not allowed ('fsl,imx35-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/gpio/fsl-imx-gpio.yaml           | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 0b223abe8cfb..454db20c2d1a 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -11,12 +11,21 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx1-gpio
-      - fsl,imx21-gpio
-      - fsl,imx31-gpio
-      - fsl,imx35-gpio
-      - fsl,imx7d-gpio
+    oneOf:
+      - enum:
+          - fsl,imx1-gpio
+          - fsl,imx21-gpio
+          - fsl,imx31-gpio
+          - fsl,imx35-gpio
+          - fsl,imx7d-gpio
+      - items:
+          - enum:
+              - fsl,imx8mm-gpio
+              - fsl,imx8mn-gpio
+              - fsl,imx8mp-gpio
+              - fsl,imx8mq-gpio
+              - fsl,imx8qxp-gpio
+          - const: fsl,imx35-gpio
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
