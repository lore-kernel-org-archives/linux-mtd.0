Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsKwW-00050w-Dd
 for linux-mtd@lists.infradead.org; Wed, 13 May 2015 00:54:37 +0000
Received: by pdbnk13 with SMTP id nk13so32808876pdb.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 17:54:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 10/11] ARM: dts: cygnus: Enable NAND support for Cygnus
Date: Tue, 12 May 2015 17:53:43 -0700
Message-Id: <1431478424-29230-11-git-send-email-computersforpeace@gmail.com>
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

From: Ray Jui <rjui@broadcom.com>

Enable NAND support for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v4: account for reworked DT binding

 arch/arm/boot/dts/bcm-cygnus.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/bcm958300k.dts  | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7b52c33ea69a..e1ac07a16f92 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -212,6 +212,18 @@
 		status = "disabled";
 	};
 
+	nand: nand@18046000 {
+		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
+		reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
+		reg-names = "nand", "iproc-idm", "iproc-ext";
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		brcm,nand-has-wp;
+	};
+
 	gic: interrupt-controller@19021000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/bcm958300k.dts b/arch/arm/boot/dts/bcm958300k.dts
index c9eb8565eac5..2f63052f9d48 100644
--- a/arch/arm/boot/dts/bcm958300k.dts
+++ b/arch/arm/boot/dts/bcm958300k.dts
@@ -58,4 +58,20 @@
 	uart3: serial@18023000 {
 		status = "okay";
 	};
+
+	nand: nand@18046000 {
+		nandcs@1 {
+			compatible = "brcm,nandcs";
+			reg = <0>;
+			nand-on-flash-bbt;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nand-ecc-strength = <24>;
+			nand-ecc-step-size = <1024>;
+
+			brcm,nand-oob-sector-size = <27>;
+		};
+	};
 };
-- 
1.9.1
