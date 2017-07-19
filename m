Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXnXX-0002bc-0C
 for linux-mtd@lists.infradead.org; Wed, 19 Jul 2017 11:53:18 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 24/25] dt-bindings: qcom_nandc: compatible string for
 version 1.5.0
Date: Wed, 19 Jul 2017 17:18:12 +0530
Message-Id: <1500464893-11352-25-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new compatible string has been added for QPIC NAND version 1.5.0.
Since only register offsets are diffferent in version 1.5.0 so no
new dts property is required for QPIC NAND version 1.5.0.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 8efaeb0..23bbb79 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -4,6 +4,8 @@ Required properties:
 - compatible:		must be one of the following:
 	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
 	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA like IPQ4019.
+	* "qcom,qpic-nandc-v1.5.0" - QPIC NAND v1.5.0 which uses BAM DMA like IPQ8074.
+
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
 - clock-names:		must contain "core" for the core clock and "aon" for the
@@ -94,7 +96,7 @@ nand@1ac00000 {
 };
 
 nand@79b0000 {
-	compatible = "qcom,qpic-nandc-v1.4.0";
+	compatible = "qcom,qpic-nandc-v1.4.0", "qcom,qpic-nandc-v1.5.0";
 	reg = <0x79b0000 0x1000>;
 
 	clocks = <&gcc GCC_QPIC_CLK>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
