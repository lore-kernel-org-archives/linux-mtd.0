Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549A2C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPFa93im62CXc12VNG2iV7xWrkQ066t37ezRdhkuCX4=; b=N27Th5g58zQAo9
	+gBA9om9lv8G7j9p7CMDMo+ElZYKtG2wdo6lQEpeHHONisesXTKpA7Eowi+rlalUs/Qz5B+IlW7fU
	L4YKtK+J/lw+PGo8mLnQwmExWAvL5PV2zRVXrGWblolnM6CG8+a/U0krDHJ78cn6dxeFCNjSFeHiK
	OqnnSrE9Xw7oOWGYR4jumNnk8MLZ05hhZeU8Aj67RxOHKm9VX/KHgcVbiDTA5WXrV/rbPndnfUygx
	c0juVZFISykGSklNMeguVz9QFYAMUWg8yVd4SxxrvAY+6Diae6ipMvKnil7/zlXyEoSlC7UsIRfsp
	qlJLTIMlP6DUbQk02SlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmotH-0000000FZDa-3Nq6;
	Wed, 20 Mar 2024 05:53:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmot6-0000000FZ3q-0paZ;
	Wed, 20 Mar 2024 05:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710914000; x=1742450000;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=s8Lr1M8RUL7PqBz81PGymM1Ltwj2a+he6G8+75T/hPo=;
  b=sWy/ZTtbRT/7LwB7lUe3Wuigpx4+1Abj4YljB5kd2RtQZ9rAdpF9mpTf
   mzwPjBjugUY1UvhpmWHpKsW4G4sSLYzydvNFubPtENx3DudK3ir+NcejT
   vsm2bjZVBFC4pZquvA3rNUYIC0tXYbj5p48B5rUxriQgStiEf6e2f8aMt
   f73l6aPZUXOMvpshWOtZ53/vGkSdOjo26B4IxAWZqzVsajuztHJ+IL5oJ
   Ezvsu7RvCfN21CT8XTErejTPKNiWfthwYosn+1o/mcFiXnQXtfNmCawIa
   DOCsx1rBk89s//+8IXSmeb88PrkADL3RP/8bWPMBvg0fPGk4Tda+QRndh
   Q==;
X-CSE-ConnectionGUID: pwKNWpSMQSid8NZ/wklJJA==
X-CSE-MsgGUID: cccJKGy2TKiNMJWaOEdObQ==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="scan'208";a="17887329"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 22:53:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 22:53:11 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 22:53:05 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Date: Wed, 20 Mar 2024 11:22:09 +0530
Subject: [PATCH 3/3] dt-bindings: mtd: atmel-nand: add deprecated bindings
MIME-Version: 1.0
Message-ID: <20240320-linux-next-nand-yaml-v1-3-2d2495363e88@microchip.com>
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
X-CRM114-CacheID: sfid-20240319_225320_569320_7156EECF 
X-CRM114-Status: GOOD (  24.46  )
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

Add nand bindings for legacy nand controllers. These bindings are not used
with the new device trees. This is still maintained to support legacy dt
bindings.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../bindings/mtd/atmel-nand-deprecated.yaml        | 156 +++++++++++++++++++++
 .../devicetree/bindings/mtd/atmel-nand.txt         | 116 ---------------
 2 files changed, 156 insertions(+), 116 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.yaml b/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.yaml
new file mode 100644
index 000000000000..c8922ab0f1d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/atmel-nand-deprecated.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel NAND flash controller deprecated bindings
+
+maintainers:
+  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
+
+description: |
+  This should not be used in the new device trees.
+
+properties:
+  compatible:
+    enum:
+      - atmel,at91rm9200-nand
+      - atmel,sama5d2-nand
+      - atmel,sama5d4-nand
+
+  reg:
+    description:
+      should specify localbus address and size used for the chip, and
+      hardware ECC controller if available. If the hardware ECC is PMECC,
+      it should contain address and size for PMECC and PMECC Error Location
+      controller.  The PMECC lookup table address and size in ROM is
+      optional. If not specified, driver will build it in runtime.
+
+  atmel,nand-addr-offset:
+    description:
+      offset for the address latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  atmel,nand-cmd-offset:
+    description:
+      offset for the command latch.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  "#address-cells":
+    description:
+      Must be present if the device has sub-nodes representing partitions
+
+  "#size-cells":
+    description:
+      Must be present if the device has sub-nodes representing partitions.
+
+  gpios:
+    description:
+      specifies the gpio pins to control the NAND device. detect is an
+      optional gpio and may be set to 0 if not present.
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
+  nand-on-flash-bbt:
+    description:
+      enable on flash bbt option if not present false
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nand-ecc-mode:
+    description:
+      operation mode of the NAND ecc mode, soft by default.  Supported
+    enum:
+      [none, soft, hw, hw_syndrome, hw_oob_first, soft_bch]
+    $ref: /schemas/types.yaml#/definitions/string
+
+  atmel,pmecc-cap:
+    description:
+      error correct capability for Programmable Multibit ECC Controller. If
+      the compatible string is "atmel,sama5d2-nand", 32 is also valid.
+    enum:
+      [2, 4, 8, 12, 24]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  atmel,pmecc-sector-size:
+    description:
+      sector size for ECC computation.
+    enum:
+      [512, 1024]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  atmel,pmecc-lookup-table-offset:
+    description:
+      includes two offsets of lookup table in ROM for different sector
+      size. First one is for sector size 512, the next is for sector size
+      1024. If not specified, driver will build the table in runtime.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  nand-bus-width:
+    description:
+      nand bus width
+    enum:
+      [8, 16]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - atmel,nand-addr-offset
+  - atmel,nand-cmd-offset
+  - "#address-cells"
+  - "#size-cells"
+  - gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand0: nand@40000000,0 {
+            compatible = "atmel,at91rm9200-nand";
+            #address-cells = <1>;
+            #size-cells = <1>;
+            reg = <0x40000000 0x10000000
+                   0xffffe800 0x200>;
+            atmel,nand-addr-offset = <21>;	/* ale */
+            atmel,nand-cmd-offset = <22>;	/* cle */
+            nand-on-flash-bbt;
+            nand-ecc-mode = "soft";
+            gpios = <&pioC 13 0	/* rdy */
+                     &pioC 14 0 /* nce */
+                     0		/* cd */
+                    >;
+    };
+  - |
+    /* for PMECC supported chips */
+    nand1@40000000 {
+            compatible = "atmel,at91rm9200-nand";
+            #address-cells = <1>;
+            #size-cells = <1>;
+            reg = <0x40000000 0x10000000	/* bus addr & size */
+                   0xffffe000 0x00000600	/* PMECC addr & size */
+                   0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
+                   0x00100000 0x00100000>;	/* ROM addr & size */
+
+            atmel,nand-addr-offset = <21>;	/* ale */
+            atmel,nand-cmd-offset = <22>;	/* cle */
+            nand-on-flash-bbt;
+            nand-ecc-mode = "hw";
+            atmel,has-pmecc;	/* enable PMECC */
+            atmel,pmecc-cap = <2>;
+            atmel,pmecc-sector-size = <512>;
+            atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
+            gpios = <&pioD 5 0	/* rdy */
+                     &pioD 4 0	/* nce */
+                     0		/* cd */
+                    >;
+    };
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

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
