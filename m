From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Andrew Lunn <andrew@lunn.ch>, bcm-kernel-feedback-list@broadcom.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Daniel Mack <daniel@zonque.org>, David Woodhouse <dwmw2@infradead.org>,
 devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Han Xu <han.xu@nxp.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, Josh Wu <rainyfeeling@outlook.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>,
 Will Deacon <will.deacon@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Igor Grinberg <grinberg@compulab.co.il>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: [RFC 08/12] ARM: dts: armada-375: use reworked NAND controller driver
Date: Wed, 18 Oct 2017 16:36:25 +0200
Message-Id: <20171018143629.29302-9-miquel.raynal@free-electrons.com>
In-Reply-To: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the bindings to use the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Remove the 'marvell,nand-enable-arbiter' property, inefective with
Armada boards.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 arch/arm/boot/dts/armada-375-db.dts | 49 ++++++++++++++++++++++---------------
 arch/arm/boot/dts/armada-375.dtsi   |  6 ++---
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375-db.dts b/arch/arm/boot/dts/armada-375-db.dts
index bcdbb8ba1d65..42277a554063 100644
--- a/arch/arm/boot/dts/armada-375-db.dts
+++ b/arch/arm/boot/dts/armada-375-db.dts
@@ -140,28 +140,37 @@
 	nr-ports = <2>;
 };
 
-&nand {
+&nand_controller {
+	status = "okay";
 	pinctrl-0 = <&nand_pins>;
 	pinctrl-names = "default";
-	status = "okay";
-	num-cs = <1>;
-	marvell,nand-keep-config;
-	marvell,nand-enable-arbiter;
-	nand-on-flash-bbt;
-	nand-ecc-strength = <4>;
-	nand-ecc-step-size = <512>;
-
-	partition@0 {
-		label = "U-Boot";
-		reg = <0 0x800000>;
-	};
-	partition@800000 {
-		label = "Linux";
-		reg = <0x800000 0x800000>;
-	};
-	partition@1000000 {
-		label = "Filesystem";
-		reg = <0x1000000 0x3f000000>;
+
+	nand@0 {
+		reg = <0>;
+		marvell,rb = <0>;
+		marvell,nand-keep-config;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x800000>;
+			};
+			partition@800000 {
+				label = "Linux";
+				reg = <0x800000 0x800000>;
+			};
+			partition@1000000 {
+				label = "Filesystem";
+				reg = <0x1000000 0x3f000000>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index 7225c7ce9a8d..db66b5f29834 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -539,11 +539,11 @@
 				status = "disabled";
 			};
 
-			nand: nand@d0000 {
-				compatible = "marvell,armada370-nand";
+			nand_controller: nand-controller@d0000 {
+				compatible = "marvell,armada370-nand-controller";
 				reg = <0xd0000 0x54>;
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 11>;
 				status = "disabled";
-- 
2.11.0
