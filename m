Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44ADC43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87372074D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yOH5/M09";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDpqGE7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87372074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jwzs8FlpZS45yU/Tr++w+z8/GsjcMna5gj6xUo0zAQ=; b=yOH5/M09r8SbYRuMvfE4q61Sgy
	MEp7ShW7ncSXZ9HuL51USWAd1SpV5C9W0AuDRsVtM13viIKxZo7tU3YKNPOOr0jwvGTU4aMwnaJ45
	C8pXTKq8BUrcfUlHmuL8Dr7nwlRcvbJpQW/qWj3M7CpYqvWLH2gl4UPSqlJjWrALsfir2gfqVAXmP
	0uZMGTZPpxT48OvTxI16PAn4dZFovcTcaVwZHa9aN2M3VxfbaxsrDZIVsHF5uAVT+lnhltvtdb+Jh
	9FEA+jBe4phBILDprANaTvAJ3jNkqTd2hzKns1eB3dTWiRG4ya2ZZDgGgPEX/vmHAcKUUh1+m1Ky9
	yTfTYy2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDcu-0000mV-KH; Fri, 04 Sep 2020 15:27:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDaB-0007ZR-RI; Fri, 04 Sep 2020 15:24:57 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60DEF20772;
 Fri,  4 Sep 2020 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233095;
 bh=AsONb93CXsGCysEwXEAxnPU7VWFjSTyiaEX2pb1M2ZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QDpqGE7KH8BNydNe5y8eAGpsNvjKveDRcRWy/plCr6Zn+t+lb/me7GDRN3F98FfMK
 VIaoZuwzOlnAA1eMW+icWk5gDnZmWYnCkSo60x2a11m+TrFMCeDG0tzx5dqZPYq5gF
 e6IMCVUblw5xbGOYT9yDPPQ+uLCnIJ4etg6bSX6o=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 08/14] dt-bindings: nvmem: imx-ocotp: Update i.MX 8M
 compatibles
Date: Fri,  4 Sep 2020 17:23:58 +0200
Message-Id: <20200904152404.20636-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112456_110130_1A3A4012 
X-CRM114-Status: GOOD (  12.94  )
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

DTSes with new i.MX 8M SoCs use two compatibles so update the binding to
fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000: compatible:1: 'syscon' was expected
    From schema: Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
    compatible: ['fsl,imx8mn-ocotp', 'fsl,imx8mm-ocotp', 'syscon'] is too long

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: efuse@30350000:
    compatible: Additional items are not allowed ('syscon' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Remove moved compatibles.
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index 1c9d7f05f173..5a7284737229 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -19,21 +19,29 @@ allOf:
 
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
+          - const: syscon
+      - items:
+          - enum:
+              - fsl,imx8mn-ocotp
+              # i.MX8MP not really compatible with fsl,imx8mm-ocotp, however
+              # the code for getting SoC revision depends on fsl,imx8mm-ocotp
+              # compatible.
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
