Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTG2r-0006g9-7F
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 22:14:19 +0000
Received: by mail-pf0-x244.google.com with SMTP id y134so6058934pfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2016 15:14:01 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: [PATCH v5 7/8] arm64: dts: Add ns2 SoC support
Date: Fri, 29 Jul 2016 18:13:12 -0400
Message-Id: <1469830393-13295-8-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding qspi node compatible with the new spi-bcm-qspi
driver for the broadcom's northstar2 SoC.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 34 ++++++++++++++++++++++++++++----
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 19 ++++++++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index ea5603f..a40d3f5 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -141,10 +141,36 @@
 	};
 };
 
-&mdio_mux_iproc {
-	mdio@10 {
-		gphy0: eth-phy@10 {
-			reg = <0x10>;
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
+		partition@1 {
+			label = "env";
+			reg = <0x000a0000 0x00060000>;
+		};
+
+		partition@2 {
+			label = "system";
+			reg = <0x00100000 0x00600000>;
+		};
+
+		partition@3 {
+			label = "rootfs";
+			reg = <0x00700000 0x01900000>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 46b78fa..efc5d50 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -438,5 +438,24 @@
 
 			brcm,nand-has-wp;
 		};
+
+		qspi: spi@66470200 {
+			compatible = "brcm,spi-bcm-qspi";
+			reg = <0x66470200 0x184>,
+				<0x66470000 0x124>,
+				<0x67017408 0x004>,
+				<0x664703a0 0x01c>;
+			reg-names = "mspi", "bspi", "intr_regs",
+				"intr_status_reg";
+			interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "spi_l1_intr";
+			clocks = <&iprocmed>;
+			clock-names = "iprocmed";
+			clock-frequency = <12500000>;
+			num-cs = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 	};
 };
-- 
1.9.1
