Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75282C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VLQxq+qgttn/uYhMWkE8medw626T9pzmSeCejgzPPM=; b=u5ZdP2CcEKFIVa
	tVRouWBCPgT3ODzrIvb9txVa9ioLPoaboV5iDIgWCBaaF2O2XrEStbQgres69UBcMOxPZwn2Y+880
	hb0nCVU+yuyojHsjT580eR0VJgNN2h/GjEqJwPy+INFmiOsccSkWYvmpCSQuFBbe6//1Igrbiybx/
	sjzH6mW+xhFHX4AEtjNwtryr3bD3YU9zIL41ogaaGJ4yPcxQb0lKXn8IdBF0WB3S6h10E8hAgcvaB
	0/06iQaFR+XcZIxrzlnHtqtDX1usrsCvtl3wM5N5imNNVffLI7pc+kKeWmAoVk7DgHR6jjrmNRPz4
	FvGa0zeAvxOtk5Cw/b+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmosw-0000000FZ1G-3tXz;
	Wed, 20 Mar 2024 05:53:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmost-0000000FZ0E-1qmx;
	Wed, 20 Mar 2024 05:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710913987; x=1742449987;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=COAVE7vXC85Z8Tas67uNZMjiwz4RRVQgdV0b0DGVTYU=;
  b=pPaeJj1SKfJLCkdMMPmjOtIpOWFUI9BGw9+vR7DgHwmFW4K4vlk1YJHi
   ChC6qW69wX1/81n2WgjIJmvZTXybyfieehUgXbpMRP3FpZI7MKcsHJmA0
   xGGckOvjsSF0gCOHOjUdxgQBhJVdyHt2Hdj8WLlVDQaTPFefZcHthtre7
   29vFhVGoEiXSEsuDjDcF40uAghWUB3ep0Wp9kDLvfgm5iYFHAYxoG0HcR
   h4widzTfwIhV66A4oTaIkeGoIuwPDE2Gpx3QvmvV8iuhiQit53h80xS7G
   xV+501HgfpHeXu28+x649fhP26UXgiGILmpngenusOJu5uOP2+xZTFFuN
   g==;
X-CSE-ConnectionGUID: JdC9FX/zRcy0DPyWmaJLzA==
X-CSE-MsgGUID: LzlreK2PRgukWJ3FeGft+A==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="scan'208";a="17851047"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 22:53:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 22:52:56 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 22:52:49 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Date: Wed, 20 Mar 2024 11:22:07 +0530
Subject: [PATCH 1/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
MIME-Version: 1.0
Message-ID: <20240320-linux-next-nand-yaml-v1-1-2d2495363e88@microchip.com>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
In-Reply-To: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_225307_858066_C34D63A2 
X-CRM114-Status: GOOD (  22.62  )
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

Convert text to yaml for atmel nand controller

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         |  50 -------
 .../devicetree/bindings/mtd/atmel-nand.yaml        | 166 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +-
 3 files changed, 167 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 4598930851d9..e332515c499a 100644
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
diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.yaml b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
new file mode 100644
index 000000000000..a5482d292293
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/atmel-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel NAND flash controller
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description: |
+  The NAND flash controller node should be defined under the EBI bus (see
+  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt|yaml).
+  One or several NAND devices can be defined under this NAND controller.
+  The NAND controller might be connected to an ECC engine.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - atmel,at91rm9200-nand-controller
+              - atmel,at91sam9260-nand-controller
+              - atmel,at91sam9261-nand-controller
+              - atmel,at91sam9g45-nand-controller
+              - atmel,sama5d3-nand-controller
+              - microchip,sam9x60-nand-controller
+
+  ranges:
+    description: empty ranges property to forward EBI ranges definitions.
+
+  ecc-engine:
+    description:
+      phandle to the PMECC block. Only meaningful if the SoC embeds a PMECC
+      engine.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - atmel,at91rm9200-nand-controller
+              - atmel,at91sam9260-nand-controller
+              - atmel,at91sam9261-nand-controller
+              - atmel,at91sam9g45-nand-controller
+              - atmel,sama5d3-nand-controller
+              - microchip,sam9x60-nand-controller
+    then:
+      properties:
+        "#address-cells":
+          const: 2
+
+        "#size-cells":
+          const: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,sama5d3-nand-controller
+    then:
+      properties:
+        atmel,nfc-io:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: phandle to the NFC IO block.
+
+        atmel,nfc-sram:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description: phandle to the NFC SRAM block
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
+    $ref: nand-chip.yaml#
+    description:
+      NAND chip bindings. All generic properties described in
+      Documentation/devicetree/bindings/mtd/{common,nand}.txt also apply to
+      the NAND device node, and NAND partitions should be defined under the
+      NAND node as described in
+      Documentation/devicetree/bindings/mtd/partition.txt.
+
+    properties:
+      reg:
+        minItems: 1
+        description:
+          describes the CS lines assigned to the NAND device. If the NAND device
+          exposes multiple CS lines (multi-dies chips), your reg property will
+          contain X tuples of 3 entries.
+         reg = <0x3 0x0 0x800000>;
+          1st entry - the CS line this NAND chip is connected to
+          2nd entry - the base offset of the memory region assigned to this
+                      device (always 0)
+          3rd entry - the memory region size (always 0x800000)
+
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
+      "atmel,rb":
+        description:
+          an integer identifying the native Ready/Busy pin. Only meaningful
+          on sama5 SoCs.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nfc_io: nfc-io@70000000 {
+            compatible = "atmel,sama5d3-nfc-io", "syscon";
+            reg = <0x70000000 0x8000000>;
+    };
+
+    pmecc: ecc-engine@ffffc070 {
+            compatible = "atmel,at91sam9g45-pmecc";
+            reg = <0xffffc070 0x490>,
+                  <0xffffc500 0x100>;
+    };
+
+    ebi: ebi@10000000 {
+            compatible = "atmel,sama5d3-ebi";
+            #address-cells = <2>;
+            #size-cells = <1>;
+            atmel,smc = <&hsmc>;
+            reg = <0x10000000 0x10000000
+                   0x40000000 0x30000000>;
+            ranges = <0x0 0x0 0x10000000 0x10000000
+                      0x1 0x0 0x40000000 0x10000000
+                      0x2 0x0 0x50000000 0x10000000
+                      0x3 0x0 0x60000000 0x10000000>;
+            clocks = <&mck>;
+
+            nandflash_controller: nandflash-controller {
+                    compatible = "atmel,sama5d3-nand-controller";
+                    ecc-engine = <&pmecc>;
+                    #address-cells = <2>;
+                    #size-cells = <1>;
+                    ranges;
+
+                    nand@3 {
+                            reg = <0x3 0x0 0x800000>;
+                            atmel,rb = <0>;
+
+                            /*
+                             * Put generic NAND/MTD properties and
+                             * subnodes here.
+                             */
+                    };
+             };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b6582bd3eb2c..3f2a6756223f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14503,7 +14503,7 @@ MICROCHIP NAND DRIVER
 M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
-F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
+F:	Documentation/devicetree/bindings/mtd/atmel-*.yaml
 F:	drivers/mtd/nand/raw/atmel/*
 
 MICROCHIP OTPC DRIVER

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
