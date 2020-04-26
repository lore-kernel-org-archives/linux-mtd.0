Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B0EC54FCB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7E8206BF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AV60O0tw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="cbFA/vev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7E8206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzka6QmlKXc06ILGVB4WRYy2j7SaHE3wv9fyUHw19AU=; b=AV60O0twYGpnuB
	XQ2KlWU/3k2DDlQhMCRvAVWOwqnPmm58Xx53rOJnSSixv4JGgKrzeffffdhQbTUtFBychkjerKcLp
	nZM8IrV5ELZOZ1sMZjVlvkMga16lx2H23sqyVPCAJZa3ovKWImS8OIvPUpFP9Je459sIghDVlWVkI
	mS6zpBmiuI8tmbh1S9zDA4MJGMO7F5O6blaStYUku1lIcS0TIkxVT0xMnYnIiH3RAjnXxtM6JfviN
	ZKmhHPTqQed2gBLX9+EakmTBUhV7dbTgSK8cO8wuqU2R9uagRh0+M9+YLDPXK3ZcZa1co5xOKwfBB
	Pss2BIZgjQvkMP0m1oLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSmWG-0002TG-IU; Sun, 26 Apr 2020 19:00:48 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSmVH-0007Ys-Ni
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 18:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587927548; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvwbxhO24Vvd0/eSeXNptqa2IAYj59oLL7W7lFaPOCE=;
 b=cbFA/veva5UdC+PkNmLpeeLGY8R9Im+824fYqmiCZ9bnB0pU8Mzpqfbr7X+c7qu9YZ46JR
 /tRct0tQjB7mhktkCMg5Mg8NT23GKRph6rhrw2ncyQTku1M6I19tiBeFNUF/Qm56MeHQqJ
 nbfmPzS/BEKQWlh0atUE9LSvYLeAt2A=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/8] dt-bindings: memory: Convert ingenic,
 jz4780-nemc.txt to YAML
Date: Sun, 26 Apr 2020 20:58:52 +0200
Message-Id: <20200426185856.38826-4-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_115948_275886_CB3E1F4B 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the ingenic,jz4780-nemc.txt doc file to ingenic,nemc.yaml.

The ingenic,jz4725b-nemc compatible string was added in the process,
with a fallback to ingenic,jz4740-nemc.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../ingenic,jz4780-nemc.txt                   | 76 ---------------
 .../ingenic,nemc-client.yaml                  | 45 +++++++++
 .../memory-controllers/ingenic,nemc.yaml      | 95 +++++++++++++++++++
 3 files changed, 140 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
deleted file mode 100644
index 59b8dcc118ee..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-* Ingenic JZ4780 NAND/external memory controller (NEMC)
-
-This file documents the device tree bindings for the NEMC external memory
-controller in Ingenic JZ4780
-
-Required properties:
-- compatible: Should be set to one of:
-    "ingenic,jz4740-nemc" (JZ4740)
-    "ingenic,jz4780-nemc" (JZ4780)
-- reg: Should specify the NEMC controller registers location and length.
-- clocks: Clock for the NEMC controller.
-- #address-cells: Must be set to 2.
-- #size-cells: Must be set to 1.
-- ranges: A set of ranges for each bank describing the physical memory layout.
-  Each should specify the following 4 integer values:
-
-    <cs number> 0 <physical address of mapping> <size of mapping>
-
-Each child of the NEMC node describes a device connected to the NEMC.
-
-Required child node properties:
-- reg: Should contain at least one register specifier, given in the following
-  format:
-
-    <cs number> <offset> <size>
-
-  Multiple registers can be specified across multiple banks. This is needed,
-  for example, for packaged NAND devices with multiple dies. Such devices
-  should be grouped into a single node.
-
-Optional child node properties:
-- ingenic,nemc-bus-width: Specifies the bus width in bits. Defaults to 8 bits.
-- ingenic,nemc-tAS: Address setup time in nanoseconds.
-- ingenic,nemc-tAH: Address hold time in nanoseconds.
-- ingenic,nemc-tBP: Burst pitch time in nanoseconds.
-- ingenic,nemc-tAW: Access wait time in nanoseconds.
-- ingenic,nemc-tSTRV: Static memory recovery time in nanoseconds.
-
-If a child node references multiple banks in its "reg" property, the same value
-for all optional parameters will be configured for all banks. If any optional
-parameters are omitted, they will be left unchanged from whatever they are
-configured to when the NEMC device is probed (which may be the reset value as
-given in the hardware reference manual, or a value configured by the boot
-loader).
-
-Example (NEMC node with a NAND child device attached at CS1):
-
-nemc: nemc@13410000 {
-	compatible = "ingenic,jz4780-nemc";
-	reg = <0x13410000 0x10000>;
-
-	#address-cells = <2>;
-	#size-cells = <1>;
-
-	ranges = <1 0 0x1b000000 0x1000000
-		  2 0 0x1a000000 0x1000000
-		  3 0 0x19000000 0x1000000
-		  4 0 0x18000000 0x1000000
-		  5 0 0x17000000 0x1000000
-		  6 0 0x16000000 0x1000000>;
-
-	clocks = <&cgu JZ4780_CLK_NEMC>;
-
-	nand: nand@1 {
-		compatible = "ingenic,jz4780-nand";
-		reg = <1 0 0x1000000>;
-
-		ingenic,nemc-tAS = <10>;
-		ingenic,nemc-tAH = <5>;
-		ingenic,nemc-tBP = <10>;
-		ingenic,nemc-tAW = <15>;
-		ingenic,nemc-tSTRV = <100>;
-
-		...
-	};
-};
diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
new file mode 100644
index 000000000000..682e6f7e74fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc-client.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc-client.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+  Ingenic SoCs NAND / External Memory Controller (NEMC)
+  client-specific properties
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+description:
+  This document lists the various properties that child nodes of the NEMC node
+  can use.
+
+properties:
+  ingenic,nemc-bus-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [8, 16]
+    description: Specifies the bus width in bits.
+
+  ingenic,nemc-tAS:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address setup time in nanoseconds.
+
+  ingenic,nemc-tAH:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address hold time in nanoseconds.
+
+  ingenic,nemc-tBP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Burst pitch time in nanoseconds.
+
+  ingenic,nemc-tAW:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Address wait time in nanoseconds.
+
+  ingenic,nemc-tSTRV:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Static memory recovery time in nanoseconds.
+
+...
diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
new file mode 100644
index 000000000000..c7fd28462fd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ingenic,nemc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs NAND / External Memory Controller (NEMC) devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^memory-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-nemc
+        - ingenic,jz4780-nemc
+      - items:
+        - const: ingenic,jz4725b-nemc
+        - const: ingenic,jz4740-nemc
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  "^(nand-controller|ethernet)@[0-9]+$":
+    type: object
+    allOf:
+      - $ref: ingenic,nemc-client.yaml#
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    #include <dt-bindings/gpio/gpio.h>
+    nemc: memory-controller@13410000 {
+      compatible = "ingenic,jz4780-nemc";
+      reg = <0x13410000 0x10000>;
+      #address-cells = <2>;
+      #size-cells = <1>;
+      ranges = <1 0 0x1b000000 0x1000000>,
+         <2 0 0x1a000000 0x1000000>,
+         <3 0 0x19000000 0x1000000>,
+         <4 0 0x18000000 0x1000000>,
+         <5 0 0x17000000 0x1000000>,
+         <6 0 0x16000000 0x1000000>;
+
+      clocks = <&cgu JZ4780_CLK_NEMC>;
+
+      ethernet@6 {
+        compatible = "davicom,dm9000";
+        davicom,no-eeprom;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pins_nemc_cs6>;
+
+        reg = <6 0 1>, /* addr */
+              <6 2 1>; /* data */
+
+        ingenic,nemc-tAS = <15>;
+        ingenic,nemc-tAH = <10>;
+        ingenic,nemc-tBP = <20>;
+        ingenic,nemc-tAW = <50>;
+        ingenic,nemc-tSTRV = <100>;
+
+        reset-gpios = <&gpf 12 GPIO_ACTIVE_HIGH>;
+        vcc-supply = <&eth0_power>;
+
+        interrupt-parent = <&gpe>;
+        interrupts = <19 4>;
+      };
+    };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
