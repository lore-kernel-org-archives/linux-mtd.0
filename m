Return-Path: <SRS0=FVTc=6K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0F4C54FCB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC382206BF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Apr 2020 19:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pA3J7oCI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="O5EufCZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC382206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJYASmyqfR010kddpPMrZZnVi0as5Nc9x0x8M/IMvKU=; b=pA3J7oCIsvatUB
	V+13wHPv0N7FiTcaBJpumvDxOZF57g0k8LsyKqTaMVzyBk1L09zEzuG5gmFwrHK9/eFezq6GFnMiq
	/9/68tRuzZtHVdmcHLMoFWgBa6znfTLzveEXPHCGaboEuWpf8Q88rDPNdUgooPYK2vZ1SsHCUVHlS
	n7PsDNgQjzyzrQX1Wf4X2Z2YbmdMbXzcVn3fKbGjMdboH4BfZof7DVsUDS9d3p8LbZlgaR6rOWi4z
	uHZUC4VU4ezFk1KbMUVwyAr00s+VEISKsxZ/6uZy/T3ql0Szdib14B/f9Cas4MBWNndamzdYBYajJ
	49+91BghBN0ojN0z3i+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSmWm-0002xv-Ou; Sun, 26 Apr 2020 19:01:20 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSmVR-0007mE-HC
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2020 19:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1587927549; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcPYXBQWWEakfdDh0+58PZ8fYrMYUkgAapK6RXkbctg=;
 b=O5EufCZryTGF4MtIFGJnDH4Mq090BQri4cjf70EXas0dqO1V+jk5ebrVn/Tc98QgjA/7kP
 QNNugGlXrL++xGPXbEfqI+zVcoZXhfH746DfYVdXd5E94vzE80+M5Q5yQ1svT/st6FQwkr
 Akn6f2K1aBaB/4VI/4HDLqh3gOzZx3o=
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/8] dt-bindings: mtd: Convert ingenic, jz4780-nand.txt to YAML
Date: Sun, 26 Apr 2020 20:58:53 +0200
Message-Id: <20200426185856.38826-5-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_115958_043800_0B80FFC3 
X-CRM114-Status: GOOD (  13.73  )
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

Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
 .../devicetree/bindings/mtd/ingenic,nand.yaml | 133 ++++++++++++++++++
 2 files changed, 133 insertions(+), 92 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
deleted file mode 100644
index c02259353327..000000000000
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ /dev/null
@@ -1,92 +0,0 @@
-* Ingenic JZ4780 NAND/ECC
-
-This file documents the device tree bindings for NAND flash devices on the
-JZ4780. NAND devices are connected to the NEMC controller (described in
-memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
-be children of the NEMC node.
-
-Required NAND controller device properties:
-- compatible: Should be one of:
-  * ingenic,jz4740-nand
-  * ingenic,jz4725b-nand
-  * ingenic,jz4780-nand
-- reg: For each bank with a NAND chip attached, should specify a bank number,
-  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
-
-Optional NAND controller device properties:
-- ecc-engine: To make use of the hardware ECC controller, this
-  property must contain a phandle for the ECC controller node. The required
-  properties for this node are described below. If this is not specified,
-  software ECC will be used instead.
-
-Optional children nodes:
-- Individual NAND chips are children of the NAND controller node.
-
-Required children node properties:
-- reg: An integer ranging from 1 to 6 representing the CS line to use.
-
-Optional children node properties:
-- nand-ecc-step-size: ECC block size in bytes.
-- nand-ecc-strength: ECC strength (max number of correctable bits).
-- nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" by default
-- nand-on-flash-bbt: boolean to enable on flash bbt option, if not present false
-- rb-gpios: GPIO specifier for the busy pin.
-- wp-gpios: GPIO specifier for the write protect pin.
-
-Optional child node of NAND chip nodes:
-- partitions: see Documentation/devicetree/bindings/mtd/partition.txt
-
-Example:
-
-nemc: nemc@13410000 {
-	...
-
-	nandc: nand-controller@1 {
-		compatible = "ingenic,jz4780-nand";
-		reg = <1 0 0x1000000>;	/* Bank 1 */
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ecc-engine = <&bch>;
-
-		nand@1 {
-			reg = <1>;
-
-			nand-ecc-step-size = <1024>;
-			nand-ecc-strength = <24>;
-			nand-ecc-mode = "hw";
-			nand-on-flash-bbt;
-
-			rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
-			wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
-
-			partitions {
-				#address-cells = <2>;
-				#size-cells = <2>;
-				...
-			}
-		};
-	};
-};
-
-The ECC controller is a separate SoC component used for error correction on
-NAND devices. The following is a description of the device properties for a
-ECC controller.
-
-Required ECC properties:
-- compatible: Should be one of:
-  * ingenic,jz4740-ecc
-  * ingenic,jz4725b-bch
-  * ingenic,jz4780-bch
-- reg: Should specify the ECC controller registers location and length.
-- clocks: Clock for the ECC controller.
-
-Example:
-
-bch: bch@134d0000 {
-	compatible = "ingenic,jz4780-bch";
-	reg = <0x134d0000 0x10000>;
-
-	clocks = <&cgu JZ4780_CLK_BCH>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
new file mode 100644
index 000000000000..0e4cb1b55385
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs NAND controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: ../memory-controllers/ingenic,nemc-client.yaml#
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ingenic,jz4740-nand
+      - ingenic,jz4725b-nand
+      - ingenic,jz4780-nand
+
+  reg:
+    items:
+      - description: Bank number, offset and size of first attached NAND chip
+      - description: Bank number, offset and size of second attached NAND chip
+      - description: Bank number, offset and size of third attached NAND chip
+      - description: Bank number, offset and size of fourth attached NAND chip
+    minItems: 1
+
+  ecc-engine: true
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      rb-gpios:
+        description: GPIO specifier for the busy pin.
+        maxItems: 1
+
+      wp-gpios:
+        description: GPIO specifier for the write-protect pin.
+        maxItems: 1
+
+  "^partitions$":
+    type: object
+    description:
+      Node containing description of fixed partitions.
+      See Documentation/devicetree/bindings/mtd/partition.txt
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
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
+      nand-controller@1 {
+        compatible = "ingenic,jz4780-nand";
+        reg = <1 0 0x1000000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ecc-engine = <&bch>;
+
+        ingenic,nemc-tAS = <10>;
+        ingenic,nemc-tAH = <5>;
+        ingenic,nemc-tBP = <10>;
+        ingenic,nemc-tAW = <15>;
+        ingenic,nemc-tSTRV = <100>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pins_nemc>;
+
+        nand@1 {
+          reg = <1>;
+
+          nand-ecc-step-size = <1024>;
+          nand-ecc-strength = <24>;
+          nand-ecc-mode = "hw";
+          nand-on-flash-bbt;
+
+          pinctrl-names = "default";
+          pinctrl-0 = <&pins_nemc_cs1>;
+
+          partitions {
+            compatible = "fixed-partitions";
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            partition@0 {
+              label = "u-boot-spl";
+              reg = <0x0 0x0 0x0 0x800000>;
+            };
+
+            partition@800000 {
+              label = "u-boot";
+              reg = <0x0 0x800000 0x0 0x200000>;
+            };
+
+            partition@a00000 {
+              label = "u-boot-env";
+              reg = <0x0 0xa00000 0x0 0x200000>;
+            };
+
+            partition@c00000 {
+              label = "boot";
+              reg = <0x0 0xc00000 0x0 0x4000000>;
+            };
+
+            partition@4c00000 {
+              label = "system";
+              reg = <0x0 0x4c00000 0x1 0xfb400000>;
+            };
+          };
+        };
+      };
+    };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
