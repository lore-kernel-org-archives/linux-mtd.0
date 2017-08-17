Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJc8-0006W0-8V
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:09:28 +0000
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
Subject: [PATCH v5 12/16] dt-bindings: qcom_nandc: fix the ipq806x device tree
 example
Date: Thu, 17 Aug 2017 17:37:50 +0530
Message-Id: <1502971674-13810-13-git-send-email-absahu@codeaurora.org>
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

1. Correct the compatible string for IPQ806x
2. Change the NAND controller and NAND chip nodes name
   for more clarity.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

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
