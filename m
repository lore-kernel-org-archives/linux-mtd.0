Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq3dY-0003xY-Gb
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 18:01:37 +0000
Received: by pdbqd1 with SMTP id qd1so16540907pdb.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 11:01:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 10/10] ARM: dts: cygnus: Enable NAND support for Cygnus
Date: Wed,  6 May 2015 10:59:54 -0700
Message-Id: <1430935194-7579-11-git-send-email-computersforpeace@gmail.com>
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

From: Ray Jui <rjui@broadcom.com>

Enable NAND support for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 20 ++++++++++++++++++++
 arch/arm/boot/dts/bcm958300k.dts  | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7b52c33ea69a..8aabebc67632 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -212,6 +212,26 @@
 		status = "disabled";
 	};
 
+	nand_soc: nand_soc@f8105408 {
+		compatible = "brcm,nand-soc-iproc";
+		reg = <0xf8105408 0x600>,
+		      <0x18046f00 0x20>;
+		reg-names = "idm", "ext";
+	};
+
+	nand: nand@18046000 {
+		compatible = "brcm,brcmnand-v6.1", "brcm,brcmnand";
+		reg = <0x18046000 0x600>;
+		reg-names = "nand";
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		brcm,nand-has-wp;
+		brcm,nand-soc = <&nand_soc>;
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
