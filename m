Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJc8-0007mI-4u
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:10:19 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Sricharan R <sricharan@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5 13/16] dt-bindings: qcom_nandc: IPQ4019 QPIC NAND
 documentation
Date: Thu, 17 Aug 2017 17:37:51 +0530
Message-Id: <1502971674-13810-14-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1. Qualcom IPQ4019 SoC uses QPIC NAND controller version 1.4.0
   which uses BAM DMA Engine while IPQ806x uses EBI2 NAND
   which uses ADM DMA Engine.
2. QPIC NAND will 3 BAM channels: command, data tx and data rx
   while EBI2 NAND uses only single ADM channel.
3. CRCI is only required for ADM DMA and its not required for
   BAM DMA.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

 .../devicetree/bindings/mtd/qcom_nandc.txt         | 55 +++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index f475b65..d93b952 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -1,11 +1,18 @@
 * Qualcomm NAND controller
 
 Required properties:
-- compatible:		should be "qcom,ipq806x-nand"
+- compatible:		must be one of the following:
+    * "qcom,ipq806x-nand" - for EBI2 NAND controller being used in IPQ806x
+			    SoC and it uses ADM DMA
+    * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
+                            IPQ4019 SoC and it uses BAM DMA
+
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
 - clock-names:		must contain "core" for the core clock and "aon" for the
 			always on clock
+
+EBI2 specific properties:
 - dmas:			DMA specifier, consisting of a phandle to the ADM DMA
 			controller node and the channel number to be used for
 			NAND. Refer to dma.txt and qcom_adm.txt for more details
@@ -16,6 +23,12 @@ Required properties:
 - qcom,data-crci:	must contain the ADM data type CRCI block instance
 			number specified for the NAND controller on the given
 			platform
+
+QPIC specific properties:
+- dmas:			DMA specifier, consisting of a phandle to the BAM DMA
+			and the channel number to be used for NAND. Refer to
+			dma.txt, qcom_bam_dma.txt for more details
+- dma-names:		must contain all 3 channel names : "tx", "rx", "cmd"
 - #address-cells:	<1> - subnodes give the chip-select number
 - #size-cells:		<0>
 
@@ -82,3 +95,43 @@ nand-controller@1ac00000 {
 		};
 	};
 };
+
+nand-controller@79b0000 {
+	compatible = "qcom,ipq4019-nand";
+	reg = <0x79b0000 0x1000>;
+
+	clocks = <&gcc GCC_QPIC_CLK>,
+		<&gcc GCC_QPIC_AHB_CLK>;
+	clock-names = "core", "aon";
+
+	dmas = <&qpicbam 0>,
+		<&qpicbam 1>,
+		<&qpicbam 2>;
+	dma-names = "tx", "rx", "cmd";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand@0 {
+		reg = <0>;
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
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
