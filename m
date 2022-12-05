Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B8C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGTd3aKGn7zF2vUeUR5TX6K6yLpcUQ0hYM0avXfHaAo=; b=af2IXzGbIWgTSk
	jtl6mRFMLKy9JhXP9u4U5yijvz71deEDR4wh0SPq0XQPEOiNZdhaRkWJf5tKZj4sntu6J5xHF0r2x
	56P1oWGgphgtqkdogwfUb2nRyFPsKYy4qXgImcREEcqZ/qhKhCYL0iR7RExhcSmh+gSailj5zu4cC
	iy5k4DRmF6MxxFa/h4Jkad6I8aBl6+4wG03gILHMzqpUwVZsNoCzv9a0mSY5X42PDqAHbW8ZkjeN5
	k1kiiZYisPwj6hg+ni9X8lEb2vAaZX63tCOEiRCAi3rVCiHYoxyTiKTD+ZMUSnajcwPZ+2ITkNtcz
	4clt4r6zM0zW6azZV1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25Ub-00FFpX-2s; Mon, 05 Dec 2022 07:02:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25Rk-00FE58-UD; Mon, 05 Dec 2022 06:59:28 +0000
X-UUID: 64a4828bb64f4cae94ec3f0491c37bf9-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s0ldFyfllwtQjC5cbsKPxF4rBQNdmUSYFbsQQRSbrtQ=;
	b=ELXNIeajuVFcFjWekJtDtE8CKsQ2RWSr5/q+rFSBu+5m8O5aXtN7Edq2iHGtWpDNRljHYocoW3CfE/EbE2v1TXX6vNbfRqHqA07ybQ6pRzVghWXMKOpGAMBmkDoiU6iQy+557XgD+aB4AHsWPTV3SJhVEE/5zfwZ1C5GCLN2ZrU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f103574f-270f-4c9c-b555-32abd7b60120,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:f103574f-270f-4c9c-b555-32abd7b60120,IP:0,URL
	:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:c7a9291f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:221205145841Z3FGN03V,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 64a4828bb64f4cae94ec3f0491c37bf9-20221204
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 590803592; Sun, 04 Dec 2022 23:59:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Dec 2022 14:58:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Dec 2022 14:58:16 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
	<gch981213@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH v2 8/9] dt-bindings: mtd: Split ECC engine with rawnand controller
Date: Mon, 5 Dec 2022 14:57:55 +0800
Message-ID: <20221205065756.26875-9-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_225925_104920_68045CC1 
X-CRM114-Status: GOOD (  22.47  )
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

1. Split MediaTek ECC engine with rawnand controller and convert to
YAML schema.
2. Change the existing node name in order to match NAND controller DT
bindings.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 .../bindings/mtd/mediatek,mtk-nfc.yaml        | 171 +++++++++++++++++
 .../mtd/mediatek,nand-ecc-engine.yaml         |  62 ++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
 6 files changed, 236 insertions(+), 179 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
new file mode 100644
index 000000000000..2b1c92edc9d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek(MTK) SoCs raw NAND FLASH controller (NFC)
+
+maintainers:
+  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-nfc
+      - mediatek,mt2712-nfc
+      - mediatek,mt7622-nfc
+
+  reg:
+    items:
+      - description: Base physical address and size of NFI.
+
+  interrupts:
+    items:
+      - description: NFI interrupt
+
+  clocks:
+    items:
+      - description: clock used for the controller
+      - description: clock used for the pad
+
+  clock-names:
+    items:
+      - const: nfi_clk
+      - const: pad_clk
+
+  ecc-engine: true
+
+  partitions:
+    $ref: mtd.yaml#
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt2701-nfc
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            reg:
+              minimum: 0
+              maximum: 1
+            nand-ecc-mode:
+              const: hw
+            nand-ecc-step-size:
+              enum: [ 512, 1024 ]
+            nand-ecc-strength:
+              enum: [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
+                     40, 44, 48, 52, 56, 60]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt2712-nfc
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            reg:
+              minimum: 0
+              maximum: 1
+            nand-ecc-mode:
+              const: hw
+            nand-ecc-step-size:
+              enum: [ 512, 1024 ]
+            nand-ecc-strength:
+              enum: [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
+                     40, 44, 48, 52, 56, 60, 68, 72, 80]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-nfc
+    then:
+      patternProperties:
+        "^nand@[a-f0-9]$":
+          type: object
+          properties:
+            reg:
+              minimum: 0
+              maximum: 1
+            nand-ecc-mode:
+              const: hw
+            nand-ecc-step-size:
+              const: 512
+            nand-ecc-strength:
+              enum: [4, 6, 8, 10, 12]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ecc-engine
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        nand-controller@1100d000 {
+            compatible = "mediatek,mt2701-nfc";
+            reg = <0 0x1100d000 0 0x1000>;
+            interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&pericfg CLK_PERI_NFI>,
+                     <&pericfg CLK_PERI_NFI_PAD>;
+            clock-names = "nfi_clk", "pad_clk";
+            ecc-engine = <&bch>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nand@0 {
+                reg = <0>;
+
+                nand-on-flash-bbt;
+                nand-ecc-mode = "hw";
+                nand-ecc-step-size = <1024>;
+                nand-ecc-strength = <24>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    preloader@0 {
+                        label = "pl";
+                        read-only;
+                        reg = <0x0 0x400000>;
+                    };
+                    android@400000 {
+                        label = "android";
+                        reg = <0x400000 0x12c00000>;
+                    };
+                };
+            };
+        };
+
+        bch: ecc@1100e000 {
+            compatible = "mediatek,mt2701-ecc";
+            reg = <0 0x1100e000 0 0x1000>;
+            interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&pericfg CLK_PERI_NFI_ECC>;
+            clock-names = "nfiecc_clk";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
new file mode 100644
index 000000000000..b13d801eda76
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mediatek,nand-ecc-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek(MTK) SoCs NAND ECC engine
+
+maintainers:
+  - Xiangsheng Hou <xiangsheng.hou@mediatek.com>
+
+description: |
+  MTK NAND ECC engine can cowork with MTK raw NAND and SPI NAND controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-ecc
+      - mediatek,mt2712-ecc
+      - mediatek,mt7622-ecc
+
+  reg:
+    items:
+      - description: Base physical address and size of ECC.
+
+  interrupts:
+    items:
+      - description: ECC interrupt
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: nfiecc_clk
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
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        bch: ecc@1100e000 {
+            compatible = "mediatek,mt2701-ecc";
+            reg = <0 0x1100e000 0 0x1000>;
+            interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&pericfg CLK_PERI_NFI_ECC>;
+            clock-names = "nfiecc_clk";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
deleted file mode 100644
index 839ea2f93d04..000000000000
--- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
+++ /dev/null
@@ -1,176 +0,0 @@
-MTK SoCs NAND FLASH controller (NFC) DT binding
-
-This file documents the device tree bindings for MTK SoCs NAND controllers.
-The functional split of the controller requires two drivers to operate:
-the nand controller interface driver and the ECC engine driver.
-
-The hardware description for both devices must be captured as device
-tree nodes.
-
-1) NFC NAND Controller Interface (NFI):
-=======================================
-
-The first part of NFC is NAND Controller Interface (NFI) HW.
-Required NFI properties:
-- compatible:			Should be one of
-				"mediatek,mt2701-nfc",
-				"mediatek,mt2712-nfc",
-				"mediatek,mt7622-nfc".
-- reg:				Base physical address and size of NFI.
-- interrupts:			Interrupts of NFI.
-- clocks:			NFI required clocks.
-- clock-names:			NFI clocks internal name.
-- ecc-engine:			Required ECC Engine node.
-- #address-cells:		NAND chip index, should be 1.
-- #size-cells:			Should be 0.
-
-Example:
-
-	nandc: nfi@1100d000 {
-		compatible = "mediatek,mt2701-nfc";
-		reg = <0 0x1100d000 0 0x1000>;
-		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&pericfg CLK_PERI_NFI>,
-			 <&pericfg CLK_PERI_NFI_PAD>;
-		clock-names = "nfi_clk", "pad_clk";
-		ecc-engine = <&bch>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-        };
-
-Platform related properties, should be set in {platform_name}.dts:
-- children nodes:	NAND chips.
-
-Children nodes properties:
-- reg:			Chip Select Signal, default 0.
-			Set as reg = <0>, <1> when need 2 CS.
-Optional:
-- nand-on-flash-bbt:	Store BBT on NAND Flash.
-- nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
-- nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
-			valid values:
-			512 and 1024 on mt2701 and mt2712.
-			512 only on mt7622.
-			1024 is recommended for large page NANDs.
-- nand-ecc-strength:	Number of bits to correct per ECC step.
-			The valid values that each controller supports:
-			mt2701: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
-				32, 36, 40, 44, 48, 52, 56, 60.
-			mt2712: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
-				32, 36, 40, 44, 48, 52, 56, 60, 68, 72, 80.
-			mt7622: 4, 6, 8, 10, 12, 14, 16.
-			The strength should be calculated as follows:
-			E = (S - F) * 8 / B
-			S = O / (P / Q)
-				E :	nand-ecc-strength.
-				S :	spare size per sector.
-				F :	FDM size, should be in the range [1,8].
-					It is used to store free oob data.
-				O :	oob size.
-				P :	page size.
-				Q :	nand-ecc-step-size.
-				B :	number of parity bits needed to correct
-					1 bitflip.
-					According to MTK NAND controller design,
-					this number depends on max ecc step size
-					that MTK NAND controller supports.
-					If max ecc step size supported is 1024,
-					then it should be always 14. And if max
-					ecc step size is 512, then it should be
-					always 13.
-			If the result does not match any one of the listed
-			choices above, please select the smaller valid value from
-			the list.
-			(otherwise the driver will do the adjustment at runtime)
-- pinctrl-names:	Default NAND pin GPIO setting name.
-- pinctrl-0:		GPIO setting node.
-
-Example:
-	&pio {
-		nand_pins_default: nanddefault {
-			pins_dat {
-				pinmux = <MT2701_PIN_111_MSDC0_DAT7__FUNC_NLD7>,
-					 <MT2701_PIN_112_MSDC0_DAT6__FUNC_NLD6>,
-					 <MT2701_PIN_114_MSDC0_DAT4__FUNC_NLD4>,
-					 <MT2701_PIN_118_MSDC0_DAT3__FUNC_NLD3>,
-					 <MT2701_PIN_121_MSDC0_DAT0__FUNC_NLD0>,
-					 <MT2701_PIN_120_MSDC0_DAT1__FUNC_NLD1>,
-					 <MT2701_PIN_113_MSDC0_DAT5__FUNC_NLD5>,
-					 <MT2701_PIN_115_MSDC0_RSTB__FUNC_NLD8>,
-					 <MT2701_PIN_119_MSDC0_DAT2__FUNC_NLD2>;
-				input-enable;
-				drive-strength = <MTK_DRIVE_8mA>;
-				bias-pull-up;
-			};
-
-			pins_we {
-				pinmux = <MT2701_PIN_117_MSDC0_CLK__FUNC_NWEB>;
-				drive-strength = <MTK_DRIVE_8mA>;
-				bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
-			};
-
-			pins_ale {
-				pinmux = <MT2701_PIN_116_MSDC0_CMD__FUNC_NALE>;
-				drive-strength = <MTK_DRIVE_8mA>;
-				bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
-			};
-		};
-	};
-
-	&nandc {
-		status = "okay";
-		pinctrl-names = "default";
-		pinctrl-0 = <&nand_pins_default>;
-		nand@0 {
-			reg = <0>;
-			nand-on-flash-bbt;
-			nand-ecc-mode = "hw";
-			nand-ecc-strength = <24>;
-			nand-ecc-step-size = <1024>;
-		};
-	};
-
-NAND chip optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
-
-Example:
-	nand@0 {
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			preloader@0 {
-				label = "pl";
-				read-only;
-				reg = <0x00000000 0x00400000>;
-			};
-			android@00400000 {
-				label = "android";
-				reg = <0x00400000 0x12c00000>;
-			};
-		};
-	};
-
-2) ECC Engine:
-==============
-
-Required BCH properties:
-- compatible:	Should be one of
-		"mediatek,mt2701-ecc",
-		"mediatek,mt2712-ecc",
-		"mediatek,mt7622-ecc".
-- reg:		Base physical address and size of ECC.
-- interrupts:	Interrupts of ECC.
-- clocks:	ECC required clocks.
-- clock-names:	ECC clocks internal name.
-
-Example:
-
-	bch: ecc@1100e000 {
-		compatible = "mediatek,mt2701-ecc";
-		reg = <0 0x1100e000 0 0x1000>;
-		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&pericfg CLK_PERI_NFI_ECC>;
-		clock-names = "nfiecc_clk";
-	};
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index b8eba3ba153c..049ed797766b 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -360,7 +360,7 @@ thermal: thermal@1100b000 {
 		mediatek,apmixedsys = <&apmixedsys>;
 	};
 
-	nandc: nfi@1100d000 {
+	nandc: nand-controller@1100d000 {
 		compatible = "mediatek,mt2701-nfc";
 		reg = <0 0x1100d000 0 0x1000>;
 		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 92212cddd37e..cfbec2a2ed9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -560,7 +560,7 @@ spi0: spi@1100a000 {
 		status = "disabled";
 	};
 
-	nandc: nfi@1100e000 {
+	nandc: nand-controller@1100e000 {
 		compatible = "mediatek,mt2712-nfc";
 		reg = <0 0x1100e000 0 0x1000>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 146e18b5b1f4..d98aa4936092 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -539,7 +539,7 @@ bluetooth {
 		};
 	};
 
-	nandc: nfi@1100d000 {
+	nandc: nand-controller@1100d000 {
 		compatible = "mediatek,mt7622-nfc";
 		reg = <0 0x1100D000 0 0x1000>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
