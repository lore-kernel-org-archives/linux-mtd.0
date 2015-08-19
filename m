Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRvJy-0000lc-Kl
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 04:49:55 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com,
 computersforpeace@gmail.com, sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org,
 linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>,
 devicetree@vger.kernel.org
Subject: [PATCH v4 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
Date: Wed, 19 Aug 2015 10:19:06 +0530
Message-Id: <1439959746-25498-6-git-send-email-architt@codeaurora.org>
In-Reply-To: <1439959746-25498-1-git-send-email-architt@codeaurora.org>
References: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
 <1439959746-25498-1-git-send-email-architt@codeaurora.org>
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

v4:
- Move bias-disable out of mux and create a separate group for it.
- Place the dma node inside soc node and give the full path with address.

v3, v2, v1:
- No changes

Cc: devicetree@vger.kernel.org

Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index 7f9ea50..648994c 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -30,6 +30,32 @@
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
+				};
+				disable {
+					pins = "gpio34", "gpio35", "gpio36",
+					       "gpio37", "gpio38";
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
@@ -93,5 +119,19 @@
 		sata@29000000 {
 			status = "ok";
 		};
+
+		dma@18300000 {
+			status = "ok";
+		};
+
+		nand@1ac00000 {
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
