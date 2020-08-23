Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDE8C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1872072D
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtdHSLnF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="alxYw3w0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1872072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2nd0R8q/U3Kt7y80f2ocWNseYxyOP/PahJNSK+FwcU=; b=YtdHSLnFf5wN2oTN8ghdFHaEPA
	IZsbeoDMNjWCzVSHwwIzetrn9Wp/F4kZ74WAV28yOpJEasjVaMaj4zk+IsPTTUepbiZG113fQ54SC
	5tOVmfv0rVWCWQkyoF42Q2owGn2LFOF4bIZEOIIiN9Ssx2TE06G5hZI5t6gUnNeDhFlpIqkZEEHJ1
	m0ImgXm4K1QHTYxpjFRl5zaiW0eXPRduJP9nJMuGK8uZRGJcyQ36jjS33L4/Lo19chFEBTE8+AJvu
	AQWeh4mrRH+CeboU5EzPOB+gzQhike7SgHrl5ZdhLOQBGbBFynqwGNvl1tHyI+gliwHv5ShhqAphM
	PuArOLtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9siL-0005xE-47; Sun, 23 Aug 2020 16:19:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sfj-0004Iz-T8; Sun, 23 Aug 2020 16:16:44 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CC512072D;
 Sun, 23 Aug 2020 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199403;
 bh=Dm+3LfgmxlFk7lfKGosmt5pRH6F3QaIaaVYrmFBasII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=alxYw3w0Yojxo8jsqF6OWmbny22Aq5p49ceacHXctvdMTGq8lrsNE0znpfK1f+5Oo
 rLtD7QUVvLsv8msNK0W4qxahHmXsJC3GvITu6EU5tGYRkfxTmX9fLCyEmYsl8mOVZz
 uPlUjFBDUkJBUddPpfnyPkYarqtGTtofEtSF2PjU=
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
Subject: [PATCH 10/22] dt-bindings: reset: fsl,
 imx7-src: Add i.MX 8M compatibles
Date: Sun, 23 Aug 2020 18:15:38 +0200
Message-Id: <20200823161550.3981-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121644_097974_5EE19FAF 
X-CRM114-Status: GOOD (  11.78  )
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

DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible:0: 'fsl,imx8mm-src' is not one of ['fsl,imx7d-src', 'fsl,imx8mq-src', 'fsl,imx8mp-src']
    From schema: Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible:1: 'syscon' was expected

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible: ['fsl,imx8mm-src', 'fsl,imx8mq-src', 'syscon'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/reset/fsl,imx7-src.yaml          | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml b/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
index 569cd3bd3a70..00430e2eabc8 100644
--- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
+++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
@@ -22,12 +22,19 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - fsl,imx7d-src
-          - fsl,imx8mq-src
-          - fsl,imx8mp-src
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx7d-src
+              - fsl,imx8mq-src
+              - fsl,imx8mp-src
+          - const: syscon
+      - items:
+          - enum:
+              - fsl,imx8mm-src
+              - fsl,imx8mn-src
+          - const: fsl,imx8mq-src
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
