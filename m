Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E25C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 18:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4903221741
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 18:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NxCrrIo3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCzDXQVg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4903221741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EoPrCpvcM6u/7//PHapZTBqbZ3FuxQqWROvo8snPeM=; b=NxCrrIo3tPiJPciDq2MOJh12Mh
	UC28DCcIx1GRaexgq58ZL6/LYlgRAY8iJGEmk5zxVj1L+z5opLa+ZuO++4xUAMcc3BS/s27P6+P4a
	1paYQ+xb2nPwoAJ3WaYbnLSJ2dT7Pl7dGxC6w2LKnSrKVOxlXnIOkE31YcBhThWX8kKn/r4uZtTz3
	dftR7wlrmpaa9pGEhsyBbMMNNIBGcNJ6DFFbiTRQA5sUGz/EWxk5cr7VzJqaMk/zWvX0Pkip5I22x
	YDbJey8WqjoWP5KzEx9rEN3IT2eACDiY+B8Q1nQXnBWdaLxG5ROnllyp59CRJ3zHW8KTJZ84muwfG
	LawPa//w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9sjz-0006qA-4Y; Sun, 23 Aug 2020 16:21:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sfy-0004Og-2W; Sun, 23 Aug 2020 16:16:59 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 193DD2078A;
 Sun, 23 Aug 2020 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199417;
 bh=VqDD3KFuiRD86Z7+w0i17rgKkKCPFxI1DEBp8fL8MEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MCzDXQVgp12mbtB449hvqtg7DzFdqsO50NCG20CPk1CsZdLEJfHDaLpgv7hQiFozl
 65k5IkpH4qZJ/JxrPVyr6VCgjsJNsUFOxZFdgzzJK9n3KQX0m6DpPrmDLR7D6+wrHK
 Z0iUD8IrtKeucGsZayZVT8FCgSjVCTBh+IVhWc6o=
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
Subject: [PATCH 13/22] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Date: Sun, 23 Aug 2020 18:15:41 +0200
Message-Id: <20200823161550.3981-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121658_293189_043E2075 
X-CRM114-Status: GOOD (  12.63  )
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

DTSes with new i.MX 8M SoCs use two compatibles so update the binding to
fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000: compatible:1: 'syscon' was expected
    From schema: Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
    compatible: ['fsl,imx8mn-ocotp', 'fsl,imx8mm-ocotp', 'syscon'] is too long

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
    compatible: Additional items are not allowed ('syscon' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 39 ++++++++++++-------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index 1c9d7f05f173..b5b250185afd 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -19,21 +19,30 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - fsl,imx6q-ocotp
-          - fsl,imx6sl-ocotp
-          - fsl,imx6sx-ocotp
-          - fsl,imx6ul-ocotp
-          - fsl,imx6ull-ocotp
-          - fsl,imx7d-ocotp
-          - fsl,imx6sll-ocotp
-          - fsl,imx7ulp-ocotp
-          - fsl,imx8mq-ocotp
-          - fsl,imx8mm-ocotp
-          - fsl,imx8mn-ocotp
-          - fsl,imx8mp-ocotp
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx6q-ocotp
+              - fsl,imx6sl-ocotp
+              - fsl,imx6sx-ocotp
+              - fsl,imx6ul-ocotp
+              - fsl,imx6ull-ocotp
+              - fsl,imx7d-ocotp
+              - fsl,imx6sll-ocotp
+              - fsl,imx7ulp-ocotp
+              - fsl,imx8mq-ocotp
+              - fsl,imx8mm-ocotp
+              - fsl,imx8mn-ocotp
+              - fsl,imx8mp-ocotp
+          - const: syscon
+      - items:
+          # The devices are not really compatible with fsl,imx8mm-ocotp, however
+          # the code for getting SoC revision depends on fsl,imx8mm-ocotp compatible.
+          - enum:
+              - fsl,imx8mn-ocotp
+              - fsl,imx8mp-ocotp
+          - const: fsl,imx8mm-ocotp
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
