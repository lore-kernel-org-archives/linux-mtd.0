Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsKwT-00050b-Ic
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 00:54:35 +0000
Received: by pabsx10 with SMTP id sx10so31940341pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 17:54:12 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 09/11] ARM: bcm63138: add NAND DT support
Date: Tue, 12 May 2015 17:53:42 -0700
Message-Id: <1431478424-29230-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4: account for reworked DT binding

 arch/arm/boot/dts/bcm63138.dtsi    | 11 +++++++++++
 arch/arm/boot/dts/bcm963138dvt.dts | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index f46329c8ad75..6c14b4c93b2d 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -131,5 +131,16 @@
 			clock-names = "periph";
 			status = "disabled";
 		};
+
+		nand: nand@2000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.0", "brcm,brcmnand";
+			reg = <0x2000 0x600>, <0xf0 0x10>;
+			reg-names = "nand", "nand-int-base";
+			status = "disabled";
+			interrupts = <GIC_SPI 38 0>;
+			interrupt-names = "nand";
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
