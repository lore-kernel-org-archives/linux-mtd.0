Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96925C433E4
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:20:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 692402075B
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhWJOLzB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/E0sV3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 692402075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNc5dJMURsJfEk9SbW8OpF5YhhT7jSjXsASPtAggvbQ=; b=mhWJOLzBarGH0pLqOJvCV7Cob/
	hQeVzhqZd2TkTIWva8xUDDwuE1WaMDuV6nD0I8l40LkZl9eo7TtIp9Hohe9BUgkEGWhDFv9da2fjr
	YEUx4gs60ydJKsQw/XD/qNLCJ/JMCwyQacb01Cw+FTHK1EuBROSIuWiFVP04WzHhHveFIL6LvKVGR
	ekjepu6+PLBFuk14UCuDVVnosF2+IBR4uJLT7vNnsZlrVRzLc496965fzdbQsEQ1ir7vsoAkxJvNI
	HXyerhZtfkWelMFNkoxh4bIkHRR4qhT7KSrWoV/UuBu5T2OeiZ5iovx2Klk1xcxBTwwXRoofFgRWe
	dm5P0NyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9shn-0005aj-KF; Sun, 23 Aug 2020 16:18:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sff-0004HV-6g; Sun, 23 Aug 2020 16:16:40 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84E8020767;
 Sun, 23 Aug 2020 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199398;
 bh=D0lGql3068l0qoya1++oR3DiMvBwPOUE4frjDG+x5vE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/E0sV3kwDQRaFmn8EdN7bwjcXjd8MTgJEGTp73HqPVT4rQNhHCoD8KfzDzzcKy2z
 sqZzm5CLgq76fFj0BdYO9NbFl8Ku8n7GzzdFGj0jMqiVQBQDD1FZgG5+dPPjkEWNIu
 6wPmKkb/QE93ZeTgXR+Rg8/vErI34DbgrE9UBs2Y=
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
Subject: [PATCH 09/22] dt-bindings: mtd: gpmi-nand: Add i.MX 8M compatibles
Date: Sun, 23 Aug 2020 18:15:37 +0200
Message-Id: <20200823161550.3981-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121639_404519_EBE75FB0 
X-CRM114-Status: GOOD (  11.91  )
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

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
    compatible:0: 'fsl,imx8mm-gpmi-nand' is not one of ['fsl,imx23-gpmi-nand', 'fsl,imx28-gpmi-nand', 'fsl,imx6q-gpmi-nand', 'fsl,imx6sx-gpmi-nand', 'fsl,imx7d-gpmi-nand']
    From schema: Documentation/devicetree/bindings/mtd/gpmi-nand.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
    compatible: ['fsl,imx8mm-gpmi-nand', 'fsl,imx7d-gpmi-nand'] is too long

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: nand-controller@33002000:
    compatible: Additional items are not allowed ('fsl,imx7d-gpmi-nand' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/mtd/gpmi-nand.yaml     | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 3201372b7f85..28ff8c581837 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -20,12 +20,18 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx23-gpmi-nand
-      - fsl,imx28-gpmi-nand
-      - fsl,imx6q-gpmi-nand
-      - fsl,imx6sx-gpmi-nand
-      - fsl,imx7d-gpmi-nand
+    oneOf:
+      - enum:
+          - fsl,imx23-gpmi-nand
+          - fsl,imx28-gpmi-nand
+          - fsl,imx6q-gpmi-nand
+          - fsl,imx6sx-gpmi-nand
+          - fsl,imx7d-gpmi-nand
+      - items:
+          - enum:
+              - fsl,imx8mm-gpmi-nand
+              - fsl,imx8mn-gpmi-nand
+          - const: fsl,imx7d-gpmi-nand
 
   reg:
     items:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
