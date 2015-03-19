Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYQX6-0000Tw-Qs
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 02:50:05 +0000
Received: by pdnc3 with SMTP id c3so61718099pdn.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2015 19:49:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 4/4] ARM: bcm7445: add NAND to DTS
Date: Wed, 18 Mar 2015 19:49:18 -0700
Message-Id: <1426733358-15596-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
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
Light dependency on:
  http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/331921.html
for the surrounding text.

 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/bcm7445.dtsi             | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
index 9eec2ac1112f..0bb8d17e4c2d 100644
--- a/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
+++ b/arch/arm/boot/dts/bcm7445-bcm97445svmb.dts
@@ -12,3 +12,26 @@
 		      <0x00 0x80000000 0x00 0x40000000>;
 	};
 };
+
+&nand {
+	status = "okay";
+
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>;
+		nand-ecc-step-size = <512>;
+		nand-ecc-strength = <8>;
+		nand-on-flash-bbt;
+
+		#size-cells = <2>;
+		#address-cells = <2>;
+
+		flash1.rootfs0@0 {
+			reg = <0x0 0x0 0x0 0x80000000>;
+		};
+
+		flash1.rootfs1@80000000 {
+			reg = <0x0 0x80000000 0x0 0x80000000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm7445.dtsi b/arch/arm/boot/dts/bcm7445.dtsi
index 9eaeac8dce1b..c148dcf8c69b 100644
--- a/arch/arm/boot/dts/bcm7445.dtsi
+++ b/arch/arm/boot/dts/bcm7445.dtsi
@@ -108,6 +108,28 @@
 			brcm,int-map-mask = <0x25c>, <0x7000000>;
 			brcm,int-fwd-mask = <0x70000>;
 		};
+
+		hif_intr2_intc: interrupt-controller@3e1000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x3e1000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupts = <0x0 0x20 0x0>;
+			interrupt-parent = <&gic>;
+			interrupt-names = "hif";
+		};
+
+		nand: nand@3e2800 {
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg-names = "nand", "flash-dma";
+			reg = <0x3e2800 0x600>, <0x3e3000 0x2c>;
+			interrupt-parent = <&hif_intr2_intc>;
+			interrupts = <24>, <4>;
+			interrupt-names = "nand_ctlrdy", "flash_dma_done";
+		};
 	};
 
 	smpboot {
-- 
1.9.1
