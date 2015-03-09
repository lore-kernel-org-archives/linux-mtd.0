From: Stefan Agner <stefan@agner.ch>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH v2 3/6] mtd: nand: vf610_nfc: add device tree bindings
Date: Mon,  9 Mar 2015 17:38:49 +0100
Message-Id: <1425919132-13827-4-git-send-email-stefan@agner.ch>
In-Reply-To: <1425919132-13827-1-git-send-email-stefan@agner.ch>
References: <1425919132-13827-1-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org,
 bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../devicetree/bindings/mtd/vf610-nfc.txt          | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
new file mode 100644
index 0000000..312c872
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
@@ -0,0 +1,39 @@
+Freescale's NAND flash controller (NFC)
+
+This variant of the Freescale NAND flash controller (NFC) is on Vybrid (vf610),
+MPC5125, MCF54418 and Kinetis K70.
+
+Required properties:
+- compatible: "fsl,vf610-nfc"
+- reg: Address range of the mtd chip
+- interrupts: Should contain the STMMAC interrupts
+- nand-bus-width: see nand.txt
+- nand-ecc-mode: see nand.txt
+- nand-on-flash-bbt: see nand.txt
+- clock-frequency : Optional clock rate to NFC in Hz
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+
+Required properties for hardware ECC:
+- nand-ecc-strength: supported strengths are 24 and 32 (see nand.txt)
+- nand-ecc-step-size: step size equals page size, currently only 2k pages are
+  supported
+
+Example:
+
+	nfc: nand@400e0000 {
+		compatible = "fsl,vf610-nfc";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x400e0000 0x4000>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks VF610_CLK_NFC>;
+		clock-names = "nfc";
+		assigned-clocks = <&clks VF610_CLK_NFC>;
+		assigned-clock-rates = <33000000>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+		nand-ecc-strength = <32>;
+		nand-ecc-step-size = <2048>;
+	};
-- 
2.3.1
