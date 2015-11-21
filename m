Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a07wq-00040V-Q4
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 13:11:26 +0000
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 1/2] mtd: brcmnand: Add brcm, nand-bcm63268 device tree binding
Message-ID: <56506D55.3000907@simon.arlott.org.uk>
Date: Sat, 21 Nov 2015 13:10:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add device tree binding for NAND on the BCM63268.

The BCM63268 has a NAND interrupt register with combined status and enable
registers.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 4ff7128..45c6e0c 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -72,6 +72,13 @@ we define additional 'compatible' properties and associated register resources w
        and enable registers
      - reg-names: (required) "nand-int-base"
 
+   * "brcm,nand-bcm63268"
+     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
+     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
+       and enable registers, and boot address registers
+     - reg-names: (required) "nand-intr-base"
+     - clock: (required) reference to the clock for NAND controller
+
    * "brcm,nand-iproc"
      - reg: (required) the "IDM" register range, for interrupt enable and APB
        bus access endianness configuration, and the "EXT" register range,
@@ -148,3 +155,29 @@ nand@f0442800 {
 		};
 	};
 };
+
+nand@0x10000200 {
+	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm63268",
+		"brcm,brcmnand-v4.0", "brcm,brcmnand";
+	reg = <0x10000200 0x180>,
+	      <0x10000600 0x200>,
+	      <0x100000b0 0x10>;
+	reg-names = "nand", "nand-cache", "nand-intr-base";
+	interrupt-parent = <&periph_intc>;
+	interrupts = <50>;
+	clocks = <&periph_clk 20>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand0: nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <1>;
+		nand-ecc-step-size = <512>;
+
+		#address-cells = <0>;
+		#size-cells = <0>;
+	};
+};
-- 
2.1.4

-- 
Simon Arlott
