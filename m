Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQtIf-0000Ee-8Z
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2016 09:00:34 +0000
From: Archit Taneja <architt@codeaurora.org>
To: computersforpeace@gmail.com,
	boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, cernekee@gmail.com, sboyd@codeaurora.org,
 andy.gross@linaro.org, dehrenberg@google.com,
 linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v8 3/3] dt/bindings: qcom_nandc: Add DT bindings
Date: Wed,  3 Feb 2016 14:29:51 +0530
Message-Id: <1454489991-14717-4-git-send-email-architt@codeaurora.org>
In-Reply-To: <1454489991-14717-1-git-send-email-architt@codeaurora.org>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add DT bindings document for the Qualcomm NAND controller driver.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
v6:
  - Update compatible tring to something more specific
  - Refer to nand.txt for standard properties
  - In the example, use 'partitions' node to hold the partition subnodes

v5:
- Make changes to incorporate chip select sub nodes (brcmnand taken as
  reference)

v3:
- Don't use '0x' when specifying nand controller address space
- Add optional property for on-flash bbt usage

 .../devicetree/bindings/mtd/qcom_nandc.txt         | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
new file mode 100644
index 0000000..70dd511
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -0,0 +1,86 @@
+* Qualcomm NAND controller
+
+Required properties:
+- compatible:		should be "qcom,ipq806x-nand"
+- reg:			MMIO address range
+- clocks:		must contain core clock and always on clock
+- clock-names:		must contain "core" for the core clock and "aon" for the
+			always on clock
+- dmas:			DMA specifier, consisting of a phandle to the ADM DMA
+			controller node and the channel number to be used for
+			NAND. Refer to dma.txt and qcom_adm.txt for more details
+- dma-names:		must be "rxtx"
+- qcom,cmd-crci:	must contain the ADM command type CRCI block instance
+			number specified for the NAND controller on the given
+			platform
+- qcom,data-crci:	must contain the ADM data type CRCI block instance
+			number specified for the NAND controller on the given
+			platform
+- #address-cells:	<1> - subnodes give the chip-select number
+- #size-cells:		<0>
+
+* NAND chip-select
+
+Each controller may contain one or more subnodes to represent enabled
+chip-selects which (may) contain NAND flash chips. Their properties are as
+follows.
+
+Required properties:
+- compatible:		should contain "qcom,nandcs"
+- reg:			a single integer representing the chip-select
+			number (e.g., 0, 1, 2, etc.)
+- #address-cells:	see partition.txt
+- #size-cells:		see partition.txt
+- nand-ecc-strength:	see nand.txt
+- nand-ecc-step-size:	must be 512. see nand.txt for more details.
+
+Optional properties:
+- nand-bus-width:	see nand.txt
+
+Each nandcs device node may optionally contain a 'partitions' sub-node, which
+further contains sub-nodes describing the flash partition mapping. See
+partition.txt for more detail.
+
+Example:
+
+nand@1ac00000 {
+	compatible = "qcom,ebi2-nandc";
+	reg = <0x1ac00000 0x800>;
+
+	clocks = <&gcc EBI2_CLK>,
+		 <&gcc EBI2_AON_CLK>;
+	clock-names = "core", "aon";
+
+	dmas = <&adm_dma 3>;
+	dma-names = "rxtx";
+	qcom,cmd-crci = <15>;
+	qcom,data-crci = <3>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nandcs@0 {
+		compatible = "qcom,nandcs";
+		reg = <0>;
+
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "boot-nand";
+				reg = <0 0x58a0000>;
+			};
+
+			partition@58a0000 {
+				label = "fs-nand";
+				reg = <0x58a0000 0x4000000>;
+			};
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
