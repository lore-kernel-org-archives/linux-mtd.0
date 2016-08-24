Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcgKM-0004r6-U3
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 22:07:20 +0000
Received: by mail-pf0-x241.google.com with SMTP id i6so1955202pfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 15:06:58 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6, 7/8] arm64: dts: Add ns2 SoC support
Date: Wed, 24 Aug 2016 18:04:28 -0400
Message-Id: <1472076269-4731-8-git-send-email-kdasu.kdev@gmail.com>
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
driver for the Broadcom's northstar2 SoC.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 34 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 18 +++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index 2d7872a..7308487 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -185,3 +185,37 @@
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
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index f53b095..53128ee 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -557,5 +557,23 @@
 
 			brcm,nand-has-wp;
 		};
+
+		qspi: spi@66470200 {
+			compatible = "brcm,spi-bcm-qspi", "brcm,spi-ns2-qspi";
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
+			num-cs = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 	};
 };
-- 
1.9.1
