Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu0hX-00018B-QG
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 15:42:04 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH 7/7] ARM: BCM5301X: add NAND flash chip description
Date: Sun, 17 May 2015 17:41:06 +0200
Message-Id: <1431877266-28566-8-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds the NAND flash chip description for a standard chip found
connected to this SoC. The IRQ is fetched from the device tree
definition of the axi bus for this core and the memory ranges are
automatically probed.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts | 12 +++++-------
 arch/arm/boot/dts/bcm5301x.dtsi              | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
index 946c728..0529682 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -25,13 +25,11 @@
 
 	axi@18000000 {
 		nand@28000 {
-			reg = <0x00028000 0x1000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "ubi";
-				reg = <0x00000000 0x08000000>;
+			nandcs@0 {
+				partition@0 {
+					label = "ubi";
+					reg = <0x00000000 0x08000000>;
+				};
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 78aec62..1bccb59 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -142,5 +142,24 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		nand: nand@28000 {
+			reg = <0x00028000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			brcm,nand-has-wp;
+
+			nandcs@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				nand-ecc-strength = <8>;
+				nand-ecc-step-size = <512>;
+			};
+		};
 	};
 };
-- 
2.1.4
