Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de1q2-0006Vj-Jj
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 16:22:07 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 16/20] dt-bindings: qcom_nandc: fix the ipq806x device tree
 example
Date: Sat,  5 Aug 2017 21:49:54 +0530
Message-Id: <1501949998-29859-17-git-send-email-absahu@codeaurora.org>
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

1. Correct the compatible string for IPQ806x
2. Change the NAND controller and NAND chip nodes name
   for more clarity.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 26360fe..f475b65 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -42,8 +42,8 @@ partition.txt for more detail.
 
 Example:
 
-nand@1ac00000 {
-	compatible = "qcom,ebi2-nandc";
+nand-controller@1ac00000 {
+	compatible = "qcom,ipq806x-nand";
 	reg = <0x1ac00000 0x800>;
 
 	clocks = <&gcc EBI2_CLK>,
@@ -58,7 +58,7 @@ nand@1ac00000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	nandcs@0 {
+	nand@0 {
 		reg = <0>;
 
 		nand-ecc-strength = <4>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
