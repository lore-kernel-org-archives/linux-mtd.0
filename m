Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC8D3-0000gP-Ql
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 14:49:14 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] arm: qcom: dts: Enale NAND node on IPQ8064 AP148 pplatform
Date: Fri, 16 Jan 2015 20:18:22 +0530
Message-Id: <1421419702-17812-6-git-send-email-architt@codeaurora.org>
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

Enable the NAND controller node on the AP148 platform. Provide pinmux
information.

Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 1e1d0d8..82878bb 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -30,6 +30,28 @@
 					bias-none;
 				};
 			};
+			nand_pins: nand_pins {
+				mux {
+					pins = "gpio34", "gpio35", "gpio36",
+					       "gpio37", "gpio38", "gpio39",
+					       "gpio40", "gpio41", "gpio42",
+					       "gpio43", "gpio44", "gpio45",
+					       "gpio46", "gpio47";
+					function = "nand";
+					drive-strength = <10>;
+					bias-disable;
+				};
+				pullups {
+					pins = "gpio39";
+					bias-pull-up;
+				};
+				hold {
+					pins = "gpio40", "gpio41", "gpio42",
+					       "gpio43", "gpio44", "gpio45",
+					       "gpio46", "gpio47";
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gsbi@16300000 {
@@ -93,5 +115,15 @@
 		dma@18300000 {
 			status = "ok";
 		};
+
+		nand@0x1ac00000 {
+			status = "ok";
+
+			pinctrl-0 = <&nand_pins>;
+			pinctrl-names = "default";
+
+			nand-ecc-strength = <4>;
+			nand-bus-width = <8>;
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
