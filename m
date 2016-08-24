Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcgKH-0004pm-5g
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 22:07:15 +0000
Received: by mail-pf0-x242.google.com with SMTP id i6so1955095pfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 15:06:52 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6, 6/8] arm: dts: Add bcm-nsp and bcm958625k support
Date: Wed, 24 Aug 2016 18:04:27 -0400
Message-Id: <1472076269-4731-7-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding qspi node compatible with the new spi-bcm-qspi
driver for the broadcom's northstar SoC.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi   | 31 ++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/bcm958625k.dts | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index c3bf7d2..dd59019 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -160,7 +160,7 @@
 
 	axi {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011ba08>;
+		ranges = <0x00000000 0x18000000 0x0011c40a>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -228,6 +228,35 @@
 			reg = <0x33000 0x14>;
 		};
 
+		qspi: qspi@27200 {
+			compatible = "brcm,spi-bcm-qspi", "brcm,spi-nsp-qspi";
+			reg = <0x027200 0x184>,
+			      <0x027000 0x124>,
+			      <0x11c408 0x004>,
+			      <0x0273a0 0x01c>;
+			reg-names = "mspi", "bspi", "intr_regs",
+				    "intr_status_reg";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "spi_lr_fullness_reached",
+					  "spi_lr_session_aborted",
+					  "spi_lr_impatient",
+					  "spi_lr_session_done",
+					  "spi_lr_overhead",
+					  "mspi_done",
+					  "mspi_halted";
+			clocks = <&iprocmed>;
+			clock-names = "iprocmed";
+			num-cs = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		ccbtimer0: timer@34000 {
 			compatible = "arm,sp804";
 			reg = <0x34000 0x1000>;
diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
index 2d84226..1e04923 100644
--- a/arch/arm/boot/dts/bcm958625k.dts
+++ b/arch/arm/boot/dts/bcm958625k.dts
@@ -126,3 +126,37 @@
 		groups = "nand_grp";
 	};
 };
+
+&qspi {
+	bspi-sel = <0>;
+	flash: m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "m25p80";
+		reg = <0x0>;
+		spi-max-frequency = <12500000>;
+		m25p,fast-read;
+		spi-cpol;
+		spi-cpha;
+
+		partition@0 {
+			label = "boot";
+			reg = <0x00000000 0x000a0000>;
+		};
+
+		partition@a0000 {
+			label = "env";
+			reg = <0x000a0000 0x00060000>;
+		};
+
+		partition@100000 {
+			label = "system";
+			reg = <0x00100000 0x00600000>;
+		};
+
+		partition@700000 {
+			label = "rootfs";
+			reg = <0x00700000 0x01900000>;
+		};
+	};
+};
-- 
1.9.1
