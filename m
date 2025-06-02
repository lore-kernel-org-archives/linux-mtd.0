Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F24C5B559
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylk9OyNxajANu+94UXpxqHURCc1YWHOA4PI6zY8AIn0=; b=AF5ZWs+dVCC3Ak
	NBaNywI7mlo4xTq0bXSGqdAtzPhf3tHAH3rb8PQ7qD2oOPmiscCYFmRySbazipDHzD4EESrkrwXNn
	F3u4BlMfGZTHQVy2uIZp9fgTJG3grXcXJ0nVkR0UZDnXsbaG8aNWBA/h9QiVhW1Hqe8NIRyhulM6X
	EcBMXgU7vMEs92Brl/yXv06adZ9hBDDTYUyoXS+bK7gFbhrMi/hEMzU9Weh0PnZWRcFVo98oE61CV
	G4qhuTQERdZQo66wqU2Gszj2mnMNPZxMtySht8jqPxU+3E/2/cWzRpJEwrbKAfzFwrq+tEQaEjHzZ
	jcwNKq2173ZKr7Z1iZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxwS-00000006lzR-0khO;
	Mon, 02 Jun 2025 05:42:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxqM-00000006lEK-3hrQ;
	Mon, 02 Jun 2025 05:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842579; x=1780378579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ioeH4uZthb19qLI5wYUgUMeD1rXLddPSxLk4rAXdQs=;
  b=ghibaYa4EBuwoKhaT/pZXcKl7x2dzSn9a8S/SbKhunJBjrykw/qhFU3x
   /h57XaiVY3V9E2njb8gSFkOEHiEJp9jDpqHl/1BLnWIFce9th9d9+jBjS
   Oj9+9jclVyCLPSCabJ3VGqpYK/a+GYIA4odIQMOm17iibYs+/Ukuhkdjw
   RdI3KPporfJ8GwVk1o5ekeERhlKJi2RlSqDJbHsuK0US303PsDkRYCjbW
   kkgxJKdswsjjhkMdyUZII/Ko17L9IrljIKSFHba3b2nF8bf1wKFC4Dlr7
   0Ghl82op9M/kyNIqQgg7Qv49SftIIY5M2pFSpgjhmgGgY/MtNy2p+YHeg
   Q==;
X-CSE-ConnectionGUID: eittDR1XTzS4g4o2E6Cy1A==
X-CSE-MsgGUID: I26Y8WSTRZ6VKcdOtra8SA==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865345"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:36:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:47 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:40 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 3/4] dt-bindings: mtd: atmel-nand: add legacy nand controllers
Date: Mon, 2 Jun 2025 11:05:06 +0530
Message-ID: <20250602053507.25864-4-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223619_005986_70C1EBAB 
X-CRM114-Status: GOOD (  25.51  )
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

Add support for atmel legacy nand controllers. These bindings should not be
used with the new device trees.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt    | 116 ------------
 .../devicetree/bindings/mtd/atmel-nand.yaml   | 167 ++++++++++++++++++
 2 files changed, 167 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
deleted file mode 100644
index 1934614a9298..000000000000
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ /dev/null
@@ -1,116 +0,0 @@
-Deprecated bindings (should not be used in new device trees):
-
-Required properties:
-- compatible: The possible values are:
-	"atmel,at91rm9200-nand"
-	"atmel,sama5d2-nand"
-	"atmel,sama5d4-nand"
-- reg : should specify localbus address and size used for the chip,
-	and hardware ECC controller if available.
-	If the hardware ECC is PMECC, it should contain address and size for
-	PMECC and PMECC Error Location controller.
-	The PMECC lookup table address and size in ROM is optional. If not
-	specified, driver will build it in runtime.
-- atmel,nand-addr-offset : offset for the address latch.
-- atmel,nand-cmd-offset : offset for the command latch.
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-
-- gpios : specifies the gpio pins to control the NAND device. detect is an
-  optional gpio and may be set to 0 if not present.
-
-Optional properties:
-- atmel,nand-has-dma : boolean to support dma transfer for nand read/write.
-- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
-  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
-  "soft_bch".
-- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
-  capable of BCH encoding and decoding, on devices where it is present.
-- atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
-  Controller. Supported values are: 2, 4, 8, 12, 24. If the compatible string
-  is "atmel,sama5d2-nand", 32 is also valid.
-- atmel,pmecc-sector-size : sector size for ECC computation. Supported values
-  are: 512, 1024.
-- atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
-  for different sector size. First one is for sector size 512, the next is for
-  sector size 1024. If not specified, driver will build the table in runtime.
-- nand-bus-width : 8 or 16 bus width if not present 8
-- nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-
-Nand Flash Controller(NFC) is an optional sub-node
-Required properties:
-- compatible : "atmel,sama5d3-nfc".
-- reg : should specify the address and size used for NFC command registers,
-        NFC registers and NFC SRAM. NFC SRAM address and size can be absent
-        if don't want to use it.
-- clocks: phandle to the peripheral clock
-Optional properties:
-- atmel,write-by-sram: boolean to enable NFC write by SRAM.
-
-Examples:
-nand0: nand@40000000,0 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	reg = <0x40000000 0x10000000
-	       0xffffe800 0x200
-	      >;
-	atmel,nand-addr-offset = <21>;	/* ale */
-	atmel,nand-cmd-offset = <22>;	/* cle */
-	nand-on-flash-bbt;
-	nand-ecc-mode = "soft";
-	gpios = <&pioC 13 0	/* rdy */
-		 &pioC 14 0 	/* nce */
-		 0		/* cd */
-		>;
-	partition@0 {
-		...
-	};
-};
-
-/* for PMECC supported chips */
-nand0: nand@40000000 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	reg = < 0x40000000 0x10000000	/* bus addr & size */
-		0xffffe000 0x00000600	/* PMECC addr & size */
-		0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
-		0x00100000 0x00100000	/* ROM addr & size */
-		>;
-	atmel,nand-addr-offset = <21>;	/* ale */
-	atmel,nand-cmd-offset = <22>;	/* cle */
-	nand-on-flash-bbt;
-	nand-ecc-mode = "hw";
-	atmel,has-pmecc;	/* enable PMECC */
-	atmel,pmecc-cap = <2>;
-	atmel,pmecc-sector-size = <512>;
-	atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
-	gpios = <&pioD 5 0	/* rdy */
-		 &pioD 4 0	/* nce */
-		 0		/* cd */
-		>;
-	partition@0 {
-		...
-	};
-};
-
-/* for NFC supported chips */
-nand0: nand@40000000 {
-	compatible = "atmel,at91rm9200-nand";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-        ...
-        nfc@70000000 {
-		compatible = "atmel,sama5d3-nfc";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		clocks = <&hsmc_clk>
-		reg = <
-			0x70000000 0x10000000	/* NFC Command Registers */
-			0xffffc000 0x00000070	/* NFC HSMC regs */
-			0x00200000 0x00100000	/* NFC SRAM banks */
-		>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.yaml b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
new file mode 100644
index 000000000000..a437d40a523f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml
@@ -0,0 +1,167 @@
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
+description:
+  Atmel nand flash controller. These are legacy bindings and
+  deprecated. Find the latest in microchip,nand-controller.yaml
+
+properties:
+  $nodename:
+    pattern: "^nand(@.*)?"
+
+  compatible:
+    enum:
+      - atmel,at91rm9200-nand
+      - atmel,sama5d2-nand
+      - atmel,sama5d4-nand
+
+  reg:
+    description:
+      The localbus address and size used for the chip, and hardware ECC
+      controller if available. If the hardware ECC is PMECC, it should
+      contain address and size for PMECC and PMECC Error Location
+      controller. The PMECC lookup table address and size in ROM is
+      optional. If not specified, driver will build it in runtime.
+
+  nand-on-flash-bbt:
+    description:
+      enable on flash bbt option if not present false
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-ecc-mode:
+    description:
+      operation mode of the NAND ecc
+    enum:
+      [none, soft, hw, hw_syndrome, hw_oob_first, soft_bch]
+    default: soft
+    $ref: /schemas/types.yaml#/definitions/string
+
+  nand-bus-width:
+    description:
+      nand bus width
+    enum:
+      [8, 16]
+    default: 8
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  gpios:
+    minItems: 2
+    items:
+      - description: Ready/Busy
+      - description: Chip Enable
+      - description: Optional Card detect GPIO; can be 0 if unused
+
+  atmel,nand-addr-offset:
+    description:
+      offset for the address latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  atmel,nand-cmd-offset:
+    description:
+      offset for the command latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  atmel,nand-has-dma:
+    description:
+      support dma transfer for nand read/write.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  atmel,has-pmecc:
+    description:
+      enable Programmable Multibit ECC hardware, capable of BCH encoding
+      and decoding, on devices where it is present.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  atmel,pmecc-cap:
+    description:
+      error correct capability for Programmable Multibit ECC Controller.
+    enum:
+      [2, 4, 8, 12, 24, 32]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  atmel,pmecc-sector-size:
+    description:
+      sector size for ECC computation.
+    enum:
+      [512, 1024]
+    default: 512
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+
+  atmel,pmecc-lookup-table-offset:
+    description:
+      Two offsets of lookup table in ROM for different sector size. First
+      one is for sector size 512, the next is for sector size 1024. If not
+      specified, driver will build the table in runtime.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    default: 512
+
+required:
+  - compatible
+  - reg
+  - atmel,nand-addr-offset
+  - atmel,nand-cmd-offset
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand@40000000 {
+        compatible = "atmel,at91rm9200-nand";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x40000000 0x10000000
+               0xffffe800 0x200>;
+        atmel,nand-addr-offset = <21>;	/* ale */
+        atmel,nand-cmd-offset = <22>;	/* cle */
+        nand-on-flash-bbt;
+        nand-ecc-mode = "soft";
+        gpios = <&pioC 13 0	/* rdy */
+                 &pioC 14 0     /* nce */
+                 0		/* cd */
+                >;
+    };
+  - |
+    /* for PMECC supported chips */
+    nand@40000000 {
+        compatible = "atmel,at91rm9200-nand";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0x40000000 0x10000000	/* bus addr & size */
+               0xffffe000 0x00000600	/* PMECC addr & size */
+               0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
+               0x00100000 0x00100000>;	/* ROM addr & size */
+
+        atmel,nand-addr-offset = <21>;	/* ale */
+        atmel,nand-cmd-offset = <22>;	/* cle */
+        nand-on-flash-bbt;
+        nand-ecc-mode = "hw";
+        atmel,has-pmecc;	/* enable PMECC */
+        atmel,pmecc-cap = <2>;
+        atmel,pmecc-sector-size = <512>;
+        atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
+        gpios = <&pioD 5 0	/* rdy */
+                 &pioD 4 0	/* nce */
+                 0		/* cd */
+                >;
+    };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
