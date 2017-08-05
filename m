Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de1qH-0006W8-JX
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 16:22:22 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 18/20] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
Date: Sat,  5 Aug 2017 21:49:56 +0530
Message-Id: <1501949998-29859-19-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
which uses BAM DMA Engine.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index d93b952..8dfa543 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -6,6 +6,8 @@ Required properties:
 			    SoC and it uses ADM DMA
     * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
                             IPQ4019 SoC and it uses BAM DMA
+    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
+                            IPQ8074 SoC and it uses BAM DMA
 
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
@@ -97,7 +99,7 @@ nand-controller@1ac00000 {
 };
 
 nand-controller@79b0000 {
-	compatible = "qcom,ipq4019-nand";
+	compatible = "qcom,ipq4019-nand", "qcom,ipq8074-nand";
 	reg = <0x79b0000 0x1000>;
 
 	clocks = <&gcc GCC_QPIC_CLK>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
