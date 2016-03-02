Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abA8s-0003IN-9l
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 17:00:55 +0000
Received: by mail-io0-x236.google.com with SMTP id m184so24755395iof.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2016 09:00:33 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, matthias.bgg@gmail.com, robh@kernel.org
Cc: daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
Subject: [PATCH 1/3] mtd: mediatek: device tree docs for MTK Smart Device Gen1
 NAND
Date: Wed,  2 Mar 2016 12:00:11 -0500
Message-Id: <1456938013-8819-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
In-Reply-To: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds documentation support for Smart Device Gen1 type of
NAND controllers.

Mediatek's SoC 2701 is one of the SoCs that implements this controller.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 .../devicetree/bindings/mtd/mtksdg1-nand.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
new file mode 100644
index 0000000..129d17b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtksdg1-nand.txt
@@ -0,0 +1,38 @@
+MTK Smart Device SoCs NAND controller DT binding
+
+Required properties:
+- compatible:          Should be "mediatek,mt2701-nfc".
+- reg:                 The first contains base physical address and size of
+                       NAND controller's registers. The second contains base
+                       physical address and size of NAND ECC engine.
+- interrupts:          the NFC NFI interrupt, and the NFC ECC interrupt
+- clocks:              NAND controller clocks.
+- clock-names:         NAND controller clocks internal name.
+- vmch-supply:         NAND power supply.
+- #address-cells:      Partition address, should be set 1.
+- #size-cells:         Partition size, should be set 1.
+
+Optional properties:
+
+nand-on-flash-bbt:  Use a flash based bad block table.
+
+Optional subnodes:
+- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+
+	nand: nand@1100d000 {
+		compatible = "mediatek,mt2701-nfc";
+		reg = <0 0x1100d000 0 0x1000>, <0 0x1100e000 0 0x1000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_SPI 55 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI>, <&pericfg CLK_PERI_NFI_ECC>,
+			<&pericfg CLK_PERI_NFI_PAD>;
+		clock-names = "nfi_ck", "nfi_ecc_ck", "nfi_pad_ck";
+		vmch-supply = <&mt6323_vmch_reg>;
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		...
+	};
-- 
2.1.4
