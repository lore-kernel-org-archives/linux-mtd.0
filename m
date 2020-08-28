Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7866C2BB4D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:50:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A9421655
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtyvSUeD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+/vJbN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A9421655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POC/obN0eIrYzocBbh2LSQw/oq8626kdW//EnrmmNP0=; b=rtyvSUeDGCt63WCNnQtYW+fic/
	I5JkklDOns/k889CQu2dQ16t3+CjbRvQa5SA9vMwRzywuGPaHJODUfhwjxJJubvUCHYvDNlW+mM30
	G1MpFWfFNIxacrUivtG4YC8Z94dDfEw/IvgmOLktg6MIPGthlMDLC3Am9xWNo1M68hIs3Vsv2OJ4J
	UmQ/kr1zOhZoWTr0AwoSJVflf4/iZ5lW3iSZGeWSR1s/7Psksk3Z37JV11u/LQo35hcuDmUBnQjUK
	7ufXbzeyN2abvkOphgxWbzcDekTI8PBp1D0aQopZYdPHjVplNpu6au7hRmgejVJqTjXXDWmqm60fm
	du7cUlYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhZB-00059M-4M; Fri, 28 Aug 2020 16:49:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhYr-0004zc-4G; Fri, 28 Aug 2020 16:49:10 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D92822098B;
 Fri, 28 Aug 2020 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633348;
 bh=98AU22xTYMCZ0QAZTXK9ChSrXEOj0TuIT22qgKEeDKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r+/vJbN6iXqQNVME/w5zvRS3yUo/9L0rC5pX/zWzknm/6fbP93h1bn3NqmTmIgEWz
 csYos3Uuk3GSUnVkCTg3eK9GOC7QHsuoqHOpkujRz6MrDCcLJvgVhgnlM8efHskEv8
 XiZQr6wP7rk99B3/FaAZCoV9M9IkivQM9lh+HCI0=
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
Subject: [PATCH v2 02/19] dt-bindings: mtd: gpmi-nand: Fix matching of clocks
 on different SoCs
Date: Fri, 28 Aug 2020 18:47:33 +0200
Message-Id: <20200828164750.10377-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124909_316202_AF9DE015 
X-CRM114-Status: GOOD (  13.31  )
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

Driver requires different amount of clocks for different SoCs.  Describe
these requirements properly to fix dtbs_check warnings like:

    arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Do not require order of clocks (use pattern).
---
 .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 28ff8c581837..e08e0a50929e 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -9,9 +9,6 @@ title: Freescale General-Purpose Media Interface (GPMI) binding
 maintainers:
   - Han Xu <han.xu@nxp.com>
 
-allOf:
-  - $ref: "nand-controller.yaml"
-
 description: |
   The GPMI nand controller provides an interface to control the NAND
   flash chips. The device tree may optionally contain sub-nodes
@@ -58,22 +55,10 @@ properties:
   clocks:
     minItems: 1
     maxItems: 5
-    items:
-      - description: SoC gpmi io clock
-      - description: SoC gpmi apb clock
-      - description: SoC gpmi bch clock
-      - description: SoC gpmi bch apb clock
-      - description: SoC per1 bch clock
 
   clock-names:
     minItems: 1
     maxItems: 5
-    items:
-      - const: gpmi_io
-      - const: gpmi_apb
-      - const: gpmi_bch
-      - const: gpmi_bch_apb
-      - const: per1_bch
 
   fsl,use-minimum-ecc:
     type: boolean
@@ -107,6 +92,67 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: "nand-controller.yaml"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx23-gpmi-nand
+              - fsl,imx28-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+        clock-names:
+          items:
+            - const: gpmi_io
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6q-gpmi-nand
+              - fsl,imx6sx-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+            - description: SoC gpmi apb clock
+            - description: SoC gpmi bch clock
+            - description: SoC gpmi bch apb clock
+            - description: SoC per1 bch clock
+        clock-names:
+          items:
+            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
+            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
+            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
+            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
+            - pattern: "^(gpmi_(io|apb|bch|bch_apb)|per1_bch)$"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7d-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+            - description: SoC gpmi bch apb clock
+        clock-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - pattern: "^gpmi_(io|bch_apb)$"
+            - pattern: "^gpmi_(io|bch_apb)$"
+
 examples:
   - |
     nand-controller@8000c000 {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
