Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614E1C10F06
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A22520882
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1gTOu0f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A22520882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNvtSN+YyPgMUMAlS+srlwXltaWqXkg5iBB/AtI+33c=; b=I1gTOu0fM4fPN5
	8SIklPcKflHE3WLTqFr8mrw5GqStgBvOeYb3oIfwmZbXjWA9WkweZhaQ6qjusexggBWvWrde7o8Sx
	NX9PVd85XfWkJD8bfKtiy4sHHQQtq1suVaCESZYORbHuUuAm1FLFPMZKg70o3OOJgRrtkJjXOooWF
	AdHPkvN4nJ8ED71iDGDpvAasE2Wa5/iLusVlAa0qY7sNsMgKZWc8IkcR9fuhwCJwq2M4d6vydohIq
	7BjvjtftB3R+09+oICX69iIMjvedNJ70eUsqbVlqwWIdMdq1UNfp1hgtWPj4WZJnbOPvi/+qLKNdR
	7Ey3wgzJJbHgswrt8yxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBadG-0001Q4-4f; Wed, 03 Apr 2019 07:48:26 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBad6-0001HH-Bt; Wed, 03 Apr 2019 07:48:18 +0000
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CA6BE10000B;
 Wed,  3 Apr 2019 07:48:11 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
Date: Wed,  3 Apr 2019 09:48:05 +0200
Message-Id: <98fcc297e7387228ef8bfd825bbd7cfd4c8e0a37.1554277681.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
References: <88ac1ca97bc5dd0a0e40d7d828199331b3e01fb9.1554277681.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_004816_706524_8FCEB9A3 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Switch the DT binding to a YAML schema to enable the DT validation.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2
  - Fix the regex for the NAND chip node
  - Added Rob's R-b tag

Changes from v1
  - Added controller constraints to the generic options
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
 2 files changed, 96 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
new file mode 100644
index 000000000000..d5834b197e96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/allwinner,sun4i-a10-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 NAND Controller Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#address-cells": true
+  "#size-cells": true
+
+  compatible:
+    const: allwinner,sun4i-a10-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: ahb
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+  pinctrl-names: true
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+  "^nand@[a-f0-9]+$":
+    properties:
+      reg:
+        maxItems: 1
+        minimum: 0
+        maximum: 7
+
+      nand-ecc-mode: true
+
+      nand-ecc-algo:
+        const: bch
+
+      nand-ecc-step-size:
+        enum: [ 512, 1024 ]
+
+      nand-ecc-strength:
+        maximum: 80
+
+      allwinner,rb:
+        description:
+          Contains the native Ready/Busy IDs.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+          - minItems: 1
+            maxItems: 2
+            items:
+              minimum: 0
+              maximum: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
deleted file mode 100644
index dcd5a5d80dc0..000000000000
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Allwinner NAND Flash Controller (NFC)
-
-Required properties:
-- compatible : "allwinner,sun4i-a10-nand".
-- reg : shall contain registers location and length for data and reg.
-- interrupts : shall define the nand controller interrupt.
-- #address-cells: shall be set to 1. Encode the nand CS.
-- #size-cells : shall be set to 0.
-- clocks : shall reference nand controller clocks.
-- clock-names : nand controller internal clock names. Shall contain :
-    * "ahb" : AHB gating clock
-    * "mod" : nand controller clock
-
-Optional properties:
-- dmas : shall reference DMA channel associated to the NAND controller.
-- dma-names : shall be "rxtx".
-
-Optional children nodes:
-Children nodes represent the available nand chips.
-
-Optional properties:
-- reset : phandle + reset specifier pair
-- reset-names : must contain "ahb"
-- allwinner,rb : shall contain the native Ready/Busy ids.
-- nand-ecc-mode : one of the supported ECC modes ("hw", "soft", "soft_bch" or
-		  "none")
-
-see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
-
-
-Examples:
-nfc: nand@1c03000 {
-	compatible = "allwinner,sun4i-a10-nand";
-	reg = <0x01c03000 0x1000>;
-	interrupts = <0 37 1>;
-	clocks = <&ahb_gates 13>, <&nand_clk>;
-	clock-names = "ahb", "mod";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
-
-	nand@0 {
-		reg = <0>;
-		allwinner,rb = <0>;
-		nand-ecc-mode = "soft_bch";
-	};
-};
-- 
git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
