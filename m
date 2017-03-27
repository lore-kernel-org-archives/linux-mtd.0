Received: from mail-wr0-f193.google.com ([209.85.128.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csX9g-0002w2-UX
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 16:06:42 +0000
Received: by mail-wr0-f193.google.com with SMTP id u1so14634641wra.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2017 09:05:44 -0700 (PDT)
From: Jan Glauber <jglauber@cavium.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Jan Glauber <jglauber@cavium.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
Subject: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
Date: Mon, 27 Mar 2017 18:05:23 +0200
Message-Id: <20170327160524.29019-2-jglauber@cavium.com>
In-Reply-To: <20170327160524.29019-1-jglauber@cavium.com>
References: <20170327160524.29019-1-jglauber@cavium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add device tree binding description for Cavium SOC nand flash controller.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org

Signed-off-by: Jan Glauber <jglauber@cavium.com>
---
 .../devicetree/bindings/mtd/cavium_nand.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/cavium_nand.txt b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
new file mode 100644
index 0000000..4698d1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
@@ -0,0 +1,32 @@
+* Cavium NAND controller
+
+Required properties:
+
+- compatible:		should be "cavium,cn8xxx-nand"
+- reg:			PCI devfn
+- clocks:		must contain system clock
+- #address-cells:	<1>
+- #size-cells:		<0>
+
+The nand flash controller may contain up to 8 subnodes representing
+NAND flash chips. Their properties are as follows.
+
+Required properties:
+- compatible:		should be "cavium,nandcs"
+- reg:			a single integer representing the chip-select number
+- nand-ecc-mode:	see nand.txt
+
+Example:
+
+nfc: nand@b,0 {
+	compatible = "cavium,cn8xxx-nand";
+	reg = <0x5800 0 0 0 0>;
+	clocks = <&sclk>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand@1 {
+		compatible = "cavium,nandcs";
+		reg = <1>;
+		nand-ecc-mode = "on-die";
+};
-- 
2.9.0.rc0.21.g7777322
