Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq3dY-0000BY-OC
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 18:01:37 +0000
Received: by pacyx8 with SMTP id yx8so15993549pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 11:01:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 09/10] ARM: bcm63138: add NAND DT support
Date: Wed,  6 May 2015 10:59:53 -0700
Message-Id: <1430935194-7579-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/arm/boot/dts/bcm63138.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm963138dvt.dts | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index f46329c8ad75..5fb6f6d750f1 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -131,5 +131,22 @@
 			clock-names = "periph";
 			status = "disabled";
 		};
+
+		nand: nand@2000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,brcmnand-v7.0", "brcm,brcmnand";
+			reg = <0x2000 0x600>;
+			reg-names = "nand";
+			status = "disabled";
+			interrupts = <GIC_SPI 38 0>;
+			interrupt-names = "nand";
+			brcm,nand-soc = <&nand_int_base>;
+		};
+
+		nand_int_base: nand-soc@f0 {
+			compatible = "brcm,nand-soc-bcm63138";
+			reg = <0xf0 0x10>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/bcm963138dvt.dts b/arch/arm/boot/dts/bcm963138dvt.dts
index 69c93395ecd2..370aa2cfddf2 100644
--- a/arch/arm/boot/dts/bcm963138dvt.dts
+++ b/arch/arm/boot/dts/bcm963138dvt.dts
@@ -28,3 +28,15 @@
 &serial1 {
 	status = "okay";
 };
+
+&nand {
+	status = "okay";
+
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		brcm,nand-oob-sectors-size = <16>;
+	};
+};
-- 
1.9.1
