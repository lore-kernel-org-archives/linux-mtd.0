Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC8Cy-0000db-R4
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 14:49:09 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] arm: qcom: dts: Add NAND controller node for ipq806x
Date: Fri, 16 Jan 2015 20:18:21 +0530
Message-Id: <1421419702-17812-5-git-send-email-architt@codeaurora.org>
In-Reply-To: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>,
 galak@codeaurora.org, linux-kernel@vger.kernel.org, agross@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand controller in IPQ806x is of the 'EBI2 type'. Use the corresponding
compatible string.

Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 733b0f3..6ed0150 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -281,7 +281,7 @@
 			#reset-cells = <1>;
 		};
 
-		dma@18300000 {
+		adm_dma: dma@18300000 {
 			compatible = "qcom,adm";
 			reg = <0x18300000 0x100000>;
 			interrupts = <0 170 0>;
@@ -300,5 +300,22 @@
 
 			status = "disabled";
 		};
+
+		nand@0x1ac00000 {
+			compatible = "qcom,ebi2-nandc";
+			reg = <0x1ac00000 0x800>;
+
+			clocks = <&gcc EBI2_CLK>,
+				 <&gcc EBI2_AON_CLK>;
+			clock-names = "core", "aon";
+
+			dmas = <&adm_dma 3>;
+			dma-names = "rxtx";
+			qcom,cmd-crci = <15>;
+			qcom,data-crci = <3>;
+
+			status = "disabled";
+		};
+
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
