Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW4pf-0007ru-4M
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 14:43:15 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v5 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Mon, 22 Sep 2014 16:42:51 +0200
Message-Id: <1411396971-30801-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1411396971-30801-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1411396971-30801-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 "Dmitriy B." <rzk333@gmail.com>, Jonas Meyer <quitte@gmail.com>,
 linux-kernel@vger.kernel.org, Yassin Jaffer <yassinjaffer@gmail.com>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Kumar Gala <galak@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the sunxi NAND Flash Controller dt bindings documentation.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/mtd/sunxi-nand.txt         | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
new file mode 100644
index 0000000..0273adb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -0,0 +1,45 @@
+Allwinner NAND Flash Controller (NFC)
+
+Required properties:
+- compatible : "allwinner,sun4i-a10-nand".
+- reg : shall contain registers location and length for data and reg.
+- interrupts : shall define the nand controller interrupt.
+- #address-cells: shall be set to 1. Encode the nand CS.
+- #size-cells : shall be set to 0.
+- clocks : shall reference nand controller clocks.
+- clock-names : nand controller internal clock names. Shall contain :
+    * "ahb" : AHB gating clock
+    * "mod" : nand controller clock
+
+Optional children nodes:
+Children nodes represent the available nand chips.
+
+Optional properties:
+- allwinner,rb : shall contain the native Ready/Busy ids.
+ or
+- rb-gpios : shall contain the gpios used as R/B pins.
+- nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
+  "soft_bch" or "none")
+
+see Documentation/devicetree/mtd/nand.txt for generic bindings.
+
+
+Examples:
+nfc: nand@01c03000 {
+	compatible = "allwinner,sun4i-a10-nand";
+	reg = <0x01c03000 0x1000>;
+	interrupts = <0 37 1>;
+	clocks = <&ahb_gates 13>, <&nand_clk>;
+	clock-names = "ahb", "mod";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		allwinner,rb = <0>;
+		nand-ecc-mode = "soft_bch";
+	};
+};
-- 
1.9.1
