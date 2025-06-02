Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD9EC5B549
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL74y6rgl7IkIWfPzpa81wg9yxZtBfP4bYlWiQWLYBk=; b=wPVQ+qgifD4BtW
	Gp0hTK+d2eb9hYe+x/GLnyvj+Sr05kDGOQh/h6tqC1YZuhVe48ATA8RzMHB3zcJ0emq+gUYBsYszj
	Xi++/5/abrCZlyMGHXFsGEGHn5+qHBfLwsPTT9Mzt7NOD7BRvI5YGuJ8bK1pmtImj1H8f//JklL3h
	TFMuzebAXNlPjxz0f39S8/waUmuSxLT391U/zgzEq97kBmcACethFQRBEaOXmnQTtLseQDk9tehWy
	qWI8bg+xlBgZ+1To7bGaq96gMiXxqmvFNswzGlyyPBaD6mvnhMeKHSt8aIkKfEa+vFlvawaU9ux2B
	x9yG59LM1s67BYV+xL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxs7-00000006lXy-3xrQ;
	Mon, 02 Jun 2025 05:38:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpu-00000006l2E-1jw2;
	Mon, 02 Jun 2025 05:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842550; x=1780378550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CH/shYwOulFjgTTQNhfgHG+mvVTyTTEDZV1wuACT1V4=;
  b=wub0x4WubsoaIUNRgnduRddLvWe9jL2WbvSmyrZfFcWJSC0tbDUspalA
   BXRE/4FWrT4WZaAE/MZRpjm2A8oyxtONxx153VtT08odwvn9gkAxs3v0+
   hwOgI8ARTeNPWURANRO9hba6dVwhOWgMHTdHaOOHGhhFBkQz0AQF3yCuN
   j3m0eF/RFgfkR8kVuCt+S042D8Xwjy64IBQcuQBXn8ZiV+B48qNb0iiPp
   5M7L38LJsPZz6veq8+UepvJeFVLnn3UGywqyLRKCW8FCyEksTYqH8RCWk
   U+dhZS0EIAR0O6+3Kcbp2PsteSfcATKdsagYj65by6a12agk7dmF44LvH
   Q==;
X-CSE-ConnectionGUID: 8pkaetzaTf2iFp4Ql+AwUg==
X-CSE-MsgGUID: aSMFeWLSTFOUWF4ONPgagQ==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865332"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:35:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:32 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:24 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: mtd: microchip-nand: convert txt to yaml
Date: Mon, 2 Jun 2025 11:05:04 +0530
Message-ID: <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223550_516711_E819AFC5 
X-CRM114-Status: GOOD (  20.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert text to yaml for microchip nand controller

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt    |  50 ------
 .../mtd/microchip,nand-controller.yaml        | 169 ++++++++++++++++++
 2 files changed, 169 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index e36c35b17873..dbbc17a866f2 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,53 +1,3 @@
-Atmel NAND flash controller bindings
-
-The NAND flash controller node should be defined under the EBI bus (see
-Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt).
-One or several NAND devices can be defined under this NAND controller.
-The NAND controller might be connected to an ECC engine.
-
-* NAND controller bindings:
-
-Required properties:
-- compatible: should be one of the following
-	"atmel,at91rm9200-nand-controller"
-	"atmel,at91sam9260-nand-controller"
-	"atmel,at91sam9261-nand-controller"
-	"atmel,at91sam9g45-nand-controller"
-	"atmel,sama5d3-nand-controller"
-	"microchip,sam9x60-nand-controller"
-- ranges: empty ranges property to forward EBI ranges definitions.
-- #address-cells: should be set to 2.
-- #size-cells: should be set to 1.
-- atmel,nfc-io: phandle to the NFC IO block. Only required for sama5d3
-		controllers.
-- atmel,nfc-sram: phandle to the NFC SRAM block. Only required for sama5d3
-		  controllers.
-
-Optional properties:
-- ecc-engine: phandle to the PMECC block. Only meaningful if the SoC embeds
-	      a PMECC engine.
-
-* NAND device/chip bindings:
-
-Required properties:
-- reg: describes the CS lines assigned to the NAND device. If the NAND device
-       exposes multiple CS lines (multi-dies chips), your reg property will
-       contain X tuples of 3 entries.
-       1st entry: the CS line this NAND chip is connected to
-       2nd entry: the base offset of the memory region assigned to this
-		  device (always 0)
-       3rd entry: the memory region size (always 0x800000)
-
-Optional properties:
-- rb-gpios: the GPIO(s) used to check the Ready/Busy status of the NAND.
-- cs-gpios: the GPIO(s) used to control the CS line.
-- det-gpios: the GPIO used to detect if a Smartmedia Card is present.
-- atmel,rb: an integer identifying the native Ready/Busy pin. Only meaningful
-	    on sama5 SoCs.
-
-All generic properties are described in the generic yaml files under
-Documentation/devicetree/bindings/mtd/.
-
 * ECC engine (PMECC) bindings:
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
new file mode 100644
index 000000000000..2b0d03343611
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip NAND flash controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description: |
+  The NAND flash controller node should be defined under the EBI bus (see
+  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt).
+  One or several NAND devices can be defined under this NAND controller.
+  The NAND controller might be connected to an ECC engine.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-nand-controller
+      - atmel,at91sam9260-nand-controller
+      - atmel,at91sam9261-nand-controller
+      - atmel,at91sam9g45-nand-controller
+      - atmel,sama5d3-nand-controller
+      - microchip,sam9x60-nand-controller
+
+  ranges:
+    description: empty ranges property to forward EBI ranges definitions.
+
+  ecc-engine:
+    description:
+      phandle to the PMECC block. Only meaningful if the SoC embeds a PMECC
+      engine. Refer microchip,pmecc.yaml
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 1
+
+  atmel,nfc-io:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the NFC IO block. Only applicable for atmel,sama5d3-nand-controller
+
+  atmel,nfc-sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the NFC SRAM block. Only applicable for atmel,sama5d3-nand-controller
+
+required:
+  - compatible
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml#
+    description:
+      NAND chip bindings.
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        items:
+          - items:
+              - description: describes the CS lines assigned to the NAND device.
+              - description: the base offset of the memory region assigned to this device (always 0)
+              - description: the memory region size (always 0x800000)
+      rb-gpios:
+        description:
+          the GPIO(s) used to check the Ready/Busy status of the NAND.
+
+      cs-gpios:
+        description:
+          the GPIO(s) used to control the CS line.
+
+      det-gpios:
+        description:
+          the GPIO used to detect if a Smartmedia Card is present.
+
+      atmel,rb:
+        description: |
+          an integer identifying the native Ready/Busy pin.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      nand-ecc-step-size:
+        const: 512
+
+      nand-ecc-strength:
+        enum: [2, 4, 8]
+
+      nand-ecc-mode:
+        enum: [soft, hw]
+
+      nand-bus-width:
+        const: 8
+
+      nand-on-flash-bbt: true
+
+      partitions:
+        $ref: /schemas/mtd/partitions/partitions.yaml
+
+      label:
+        description: Name or Label of the device
+
+    allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: atmel,sama5d3-nand-controller
+        then:
+          properties:
+            "atmel,rb":
+              description: an integer identifying the native Ready/Busy pin.
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nfc_io: nfc-io@70000000 {
+        compatible = "atmel,sama5d3-nfc-io", "syscon";
+        reg = <0x70000000 0x8000000>;
+    };
+
+    nfc_sram: sram@200000 {
+        compatible = "mmio-sram";
+        no-memory-wc;
+        reg = <0x200000 0x2400>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x200000 0x2400>;
+    };
+
+    ebi@10000000 {
+        compatible = "atmel,sama5d3-ebi";
+        #address-cells = <2>;
+        #size-cells = <1>;
+        atmel,smc = <&hsmc>;
+        reg = <0x10000000 0x10000000
+               0x40000000 0x30000000>;
+        ranges = <0x0 0x0 0x10000000 0x10000000
+                  0x1 0x0 0x40000000 0x10000000
+                  0x2 0x0 0x50000000 0x10000000
+                  0x3 0x0 0x60000000 0x10000000>;
+        clocks = <&mck>;
+
+        nand_controller: nand-controller {
+            compatible = "atmel,sama5d3-nand-controller";
+            atmel,nfc-sram = <&nfc_sram>;
+            atmel,nfc-io = <&nfc_io>;
+            ecc-engine = <&pmecc>;
+            #address-cells = <2>;
+            #size-cells = <1>;
+            ranges;
+
+            nand@3 {
+                reg = <0x3 0x0 0x800000>;
+                atmel,rb = <0>;
+                /*
+                 * Put generic NAND/MTD properties and
+                 * subnodes here.
+                 */
+            };
+        };
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
