From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 Neta Zur Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Subject: [PATCH v2 4/5] dt-bindings: mtd: remove pxa3xx NAND controller
 documentation
Date: Tue, 19 Dec 2017 14:29:41 +0100
Message-Id: <20171219132942.27433-5-miquel.raynal@free-electrons.com>
In-Reply-To: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The deprecated pxa3xx_nand.c driver does not exist anymore, it has been
replaced by marvell_nand.c which has its own up-to-date documentation.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 .../devicetree/bindings/mtd/pxa3xx-nand.txt        | 50 ----------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
deleted file mode 100644
index d4ee4da58463..000000000000
--- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-PXA3xx NAND DT bindings
-
-Required properties:
-
- - compatible:		Should be set to one of the following:
-			marvell,pxa3xx-nand
-			marvell,armada370-nand
-			marvell,armada-8k-nand
- - reg: 		The register base for the controller
- - interrupts:		The interrupt to map
- - #address-cells:	Set to <1> if the node includes partitions
- - marvell,system-controller: Set to retrieve the syscon node that handles
-			NAND controller related registers (only required
-			with marvell,armada-8k-nand compatible).
-
-Optional properties:
-
- - dmas:			dma data channel, see dma.txt binding doc
- - marvell,nand-enable-arbiter:	Set to enable the bus arbiter
- - marvell,nand-keep-config:	Set to keep the NAND controller config as set
-				by the bootloader
- - num-cs:			Number of chipselect lines to use
- - nand-on-flash-bbt: 		boolean to enable on flash bbt option if
-				not present false
- - nand-ecc-strength:           number of bits to correct per ECC step
- - nand-ecc-step-size:          number of data bytes covered by a single ECC step
-
-The following ECC strength and step size are currently supported:
-
- - nand-ecc-strength = <1>, nand-ecc-step-size = <512>
- - nand-ecc-strength = <4>, nand-ecc-step-size = <512>
- - nand-ecc-strength = <8>, nand-ecc-step-size = <512>
-
-Example:
-
-	nand0: nand@43100000 {
-		compatible = "marvell,pxa3xx-nand";
-		reg = <0x43100000 90>;
-		interrupts = <45>;
-		dmas = <&pdma 97 0>;
-		dma-names = "data";
-		#address-cells = <1>;
-
-		marvell,nand-enable-arbiter;
-		marvell,nand-keep-config;
-		num-cs = <1>;
-
-		/* partitions (optional) */
-	};
-
-- 
2.11.0
