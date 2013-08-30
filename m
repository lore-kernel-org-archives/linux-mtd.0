From: Huang Shijie <b32955@freescale.com>
To: <broonie@kernel.org>
Subject: [PATCH v3 6/8] Documentation: add the binding file for Quadspi driver
Date: Fri, 30 Aug 2013 10:07:27 +0800
Message-ID: <1377828449-18912-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1377828449-18912-1-git-send-email-b32955@freescale.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org,
 b18965@freescale.com, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, lznuaa@gmail.com, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the binding file for Freescale Quadspi driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 .../devicetree/bindings/spi/fsl-quadspi.txt        |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/fsl-quadspi.txt

diff --git a/Documentation/devicetree/bindings/spi/fsl-quadspi.txt b/Documentation/devicetree/bindings/spi/fsl-quadspi.txt
new file mode 100644
index 0000000..d86ee84
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/fsl-quadspi.txt
@@ -0,0 +1,32 @@
+* Freescale Quad Serial Peripheral Interface(QuadSPI)
+
+Required properties:
+- compatible : Should be "fsl,vf610-qspi"
+- reg : Offset and length of the register set for the device
+- interrupts : Should contain the interrupt for the device
+- clocks : The clocks needed by the QuadSPI controller
+- clock-names : the name of the clocks
+- num-cs : Contains the number of the chip selects
+
+Optional properties:
+- fsl,nor-size : If You set this property, it means that you connect the NOR
+                 flash to QuadSPI. This property is mainly used by the QuadSPI
+                 to map an AHB bus accessible address.
+
+Example:
+
+qspi0: quadspi@40044000 {
+	compatible = "fsl,vf610-qspi";
+	reg = <0x40044000 0x1000>;
+	interrupts = <0 24 0x04>;
+	clocks = <&clks VF610_CLK_QSPI0_EN>,
+		<&clks VF610_CLK_QSPI0>;
+	clock-names = "qspi_en", "qspi";
+	fsl,nor-size = <0x1000000>;
+	num-cs = <1>;
+	status = "disabled";
+
+	flash0: s25fl128s@0 {
+		....
+	};
+};
-- 
1.7.1
