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
Subject: [RFC 11/12] ARM: dts: pxa: use reworked NAND controller driver
Date: Wed, 18 Oct 2017 16:36:28 +0200
Message-Id: <20171018143629.29302-12-miquel.raynal@free-electrons.com>
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

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 7a0cc4ea819a..e7cde732bf88 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -116,15 +116,15 @@
 			status = "disabled";
 		};
 
-		nand0: nand@43100000 {
-			compatible = "marvell,pxa3xx-nand";
+		nand_controller: nand-controller@43100000 {
+			compatible = "marvell,pxa3xx-nand-controller";
 			reg = <0x43100000 90>;
 			interrupts = <45>;
 			clocks = <&clks CLK_NAND>;
 			dmas = <&pdma 97 3>;
 			dma-names = "data";
 			#address-cells = <1>;
-			#size-cells = <1>;	
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.11.0
