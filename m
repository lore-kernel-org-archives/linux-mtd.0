Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D27C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35YtTlaXn4Vi+yRS79mZq7UhvJ5BrfxH3mS8kltE6sc=; b=xNZZwdS3I9whg1
	U1uOnp9gHF+p7DKeB5r9Sp/US5L7sAP9r6/1BpYkwmK8ChdnxYnUAcvcCiOoxHdeJwFrC3kSj7Wiv
	y5xGCbHeUVkE1jdXNbr86tRS8JrDOICbtLs3jDwXWbN+TG81PXMDz+tEWmpfuUlYhJYoD6aHRsaw9
	jgnuSKt0F4e7FZAXa57isKSgw4r/gAosEUp+8tBBMeivTqBK6VDTfeNI2YgLO1O3LIM7IYtkNT/eM
	eYozE7XFFfPdU5FlfFaYLAQ6MSkH0nJXwy7PNtL7teapAruNiLukUwH/GgGl5Sjx0vculISBx54sB
	6pNLFWg7aZK1NFTT7n8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDPVv-001i8p-JW; Fri, 28 Jan 2022 11:33:59 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDPVT-001hv5-5D; Fri, 28 Jan 2022 11:33:32 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Fri, 28 Jan 2022
 19:33:29 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: nand: meson: refine Amlogic NAND
 controller driver
Date: Fri, 28 Jan 2022 19:32:37 +0800
Message-ID: <20220128113237.39996-3-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128113237.39996-1-liang.yang@amlogic.com>
References: <20220128113237.39996-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_033331_233050_54AD46AA 
X-CRM114-Status: GOOD (  13.67  )
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

convert txt to yaml and refine the meson NFC clock document.

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 .../bindings/mtd/amlogic,meson-nand.txt       | 60 ----------------
 .../bindings/mtd/amlogic,meson-nand.yaml      | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
deleted file mode 100644
index 5794ab1147c1..000000000000
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
-
-This file documents the properties in addition to those available in
-the MTD NAND bindings.
-
-Required properties:
-- compatible : contains one of:
-  - "amlogic,meson-gxl-nfc"
-  - "amlogic,meson-axg-nfc"
-- clocks     :
-	A list of phandle + clock-specifier pairs for the clocks listed
-	in clock-names.
-
-- clock-names: Should contain the following:
-	"core" - NFC module gate clock
-	"device" - device clock from eMMC sub clock controller
-	"rx" - rx clock phase
-	"tx" - tx clock phase
-
-- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
-				controller port C
-
-Optional children nodes:
-Children nodes represent the available nand chips.
-
-Other properties:
-see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
-
-Example demonstrate on AXG SoC:
-
-	sd_emmc_c_clkc: mmc@7000 {
-		compatible = "amlogic,meson-axg-mmc-clkc", "syscon";
-		reg = <0x0 0x7000 0x0 0x800>;
-	};
-
-	nand-controller@7800 {
-		compatible = "amlogic,meson-axg-nfc";
-		reg = <0x0 0x7800 0x0 0x100>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
-
-		clocks = <&clkc CLKID_SD_EMMC_C>,
-			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
-			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
-			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
-		clock-names = "core", "device", "rx", "tx";
-		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&nand_pins>;
-
-		nand@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			nand-on-flash-bbt;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
new file mode 100644
index 000000000000..671f0a8fdc7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic NAND Flash Controller (NFC) for GXBB/GXL/AXG family SoCs
+
+maintainers:
+  - liang.yang@amlogic.com
+
+properties:
+  compatible:
+    enum:
+      - "amlogic,meson-gxl-nfc"
+      - "amlogic,meson-axg-nfc"
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: "core", "device"
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    nand-controller@7800 {
+	compatible = "amlogic,meson-axg-nfc";
+	reg = <0x0 0x7800 0x0 0x100>,
+	      <0x0 0x7000 0x0 0x1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
+
+	clocks = <&clkc CLKID_SD_EMMC_C>,
+		<&clkc CLKID_FCLK_DIV2>;
+	clock-names = "core", "device";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins>;
+
+	nand@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-on-flash-bbt;
+	};
+     };
+
+...
\ No newline at end of file
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
