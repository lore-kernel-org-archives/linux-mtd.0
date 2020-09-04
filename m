Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A82FC2D0A7
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:26:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF54F2087C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gr52naH2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoWZJaag"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF54F2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et1aaFCGAauGX0wD/Ux0R0iXDtZIWc82oS6wchaOOL8=; b=Gr52naH2n/xXnUF/0Aeve4nNrn
	tQiiPG0IG8Oy7o2o6E6LfByNJV4lyOGJK96HFafWJlcGomzeJVa+LZgtS0gQ8One0kk8j2oD4alHO
	3UxMmh4nqI6ugynmNxXH27JcsXWc/CJGWJL032zcdjfXwbur5L2ZRHf+Nyza4jrAnSmLEItIsmqD+
	/tuKC9qYHvuZc7qxGHFU0boopTQ/lqaYo0bGKjm9mIN5aU7wM7Aa3EdE9ef4hvUTd4jIp6jjYd+rF
	s3ba8UzRNzdW7cpo34Q8SHLQ/vV46u6aONgAog4ahoaXP4ieSgyhVm+ZurUW4yCx7tCiAk7XOgRBP
	9VLDFR9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDbD-00085j-R2; Fri, 04 Sep 2020 15:25:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDZy-0007Sr-QR; Fri, 04 Sep 2020 15:24:43 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD344207EA;
 Fri,  4 Sep 2020 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233082;
 bh=7ETwMr2woIdl6WmCKhWye9ZYfEI514T+ZyzZWn5CT8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FoWZJaagfp5IWcPyqFJnSqZN1o7c6hZJr4jH2FTrJjHMmkX8nZUQuGncGh6Z/hRW/
 CxGHmJjgGM3959BM0hTZqSyUX3MTb6EGY/8QlKZFq3ybiJQws+x21A+nas/DmLp9YQ
 DOxRgVxFOM6i/y2A621fDktzdpgHjO2OqAPf8dMM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 05/14] dt-bindings: watchdog: fsl-imx-wdt: Add i.MX 8M
 compatibles
Date: Fri,  4 Sep 2020 17:23:55 +0200
Message-Id: <20200904152404.20636-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112442_990543_B1509387 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
    compatible:0: 'fsl,imx8mm-wdt' is not one of ['fsl,imx21-wdt']
    From schema: Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml

  arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
    compatible: ['fsl,imx8mm-wdt', 'fsl,imx21-wdt'] is too long

  arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dt.yaml: watchdog@30280000:
    compatible: Additional items are not allowed ('fsl,imx21-wdt' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml     | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index d96b93b11fad..991b4e33486e 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -14,8 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx21-wdt
+    oneOf:
+      - const: fsl,imx21-wdt
+      - items:
+          - enum:
+              - fsl,imx8mm-wdt
+              - fsl,imx8mn-wdt
+              - fsl,imx8mp-wdt
+              - fsl,imx8mq-wdt
+          - const: fsl,imx21-wdt
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
