Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0uSg-0007o1-9A
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 14:50:27 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id EA693FFB281
 for <linux-mtd@lists.infradead.org>; Wed,  8 Jan 2014 15:26:23 +0100 (CET)
From: Boris BREZILLON <b.brezillon@overkiz.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>
Subject: [RFC PATCH 6/9] mtd: nand: add sunxi NFC dt bindings doc
Date: Wed,  8 Jan 2014 15:22:01 +0100
Message-Id: <1389190924-26226-7-git-send-email-b.brezillon@overkiz.com>
In-Reply-To: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, dev@linux-sunxi.org,
 linux-kernel@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the sunxi NAND Flash Controller dt bindings documentation.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 .../devicetree/bindings/mtd/sunxi-nand.txt         |   71 ++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
new file mode 100644
index 0000000..c3206fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -0,0 +1,71 @@
+Allwinner NAND Flash Controller (NFC)
+
+Required properties:
+- compatible : "allwinner,sun4i-nfc".
+- reg : shall contain registers location and length for data and reg.
+- interrupts : shall define the NFC interrupt.
+- #address-cells: shall be set to 1. Encode the nand CS.
+- #size-cells : shall be set to 0.
+- clocks : shall reference NFC clocks.
+- clock-names : NFC internal clock names. Shall contain :
+    * "ahb_clk" : AHB gating clock
+    * "sclk" : NFC clock
+
+Optional children nodes:
+Children nodes represent the available nand chips.
+
+Required properties:
+- reg : shall contain the CS ids (a given chip might use several CS)
+- tCLS-min : see Documentation/devicetree/mtd/nand.txt
+- tCLH-min : Documentation/devicetree/mtd/nand.txt
+- tCS-min : see Documentation/devicetree/mtd/nand.txt
+- tCH-min : see Documentation/devicetree/mtd/nand.txt
+- tWP-min : see Documentation/devicetree/mtd/nand.txt
+- tWH-min : see Documentation/devicetree/mtd/nand.txt
+- tALS-min : see Documentation/devicetree/mtd/nand.txt
+- tDS-min : see Documentation/devicetree/mtd/nand.txt
+- tDH-min : see Documentation/devicetree/mtd/nand.txt
+- tRR-min : see Documentation/devicetree/mtd/nand.txt
+- tALH-min : see Documentation/devicetree/mtd/nand.txt
+- tRP-min : see Documentation/devicetree/mtd/nand.txt
+- tREH-min : see Documentation/devicetree/mtd/nand.txt
+- tRC-min : see Documentation/devicetree/mtd/nand.txt
+- tWC-min : see Documentation/devicetree/mtd/nand.txt
+
+Optional properties:
+- allwinner,rb : shall contain the native Ready/Busy ids.
+ or
+- rb-gpios : shall contain the gpios used as R/B pins.
+
+see Documentation/devicetree/mtd/nand.txt for generic bindings.
+
+
+Examples:
+nfc: nand@01c03000 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		allwinner,rb = <0>;
+		nand-ecc-mode = "soft_bch";
+
+		/* nand timings */
+		tCLS-min = <6>;
+		tCLH-min = <3>;
+		tCS-min = <20>;
+		tCH-min = <5>;
+		tWP-min = <8>;
+		tWH-min = <6>;
+		tALS-min = <6>;
+		tDS-min = <6>;
+		tDH-min = <2>;
+		tRR-min = <20>;
+		tALH-min = <3>;
+		tRP-min = <8>;
+		tREH-min = <6>;
+		tRC-min = <16>;
+		tWC-min = <16>;
+	};
+};
-- 
1.7.9.5
