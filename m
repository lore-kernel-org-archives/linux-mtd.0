From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 6/7] Documentation: add the binding file for Freescale
 QuadSPI driver
Date: Wed, 25 Dec 2013 13:50:28 +0800
Message-ID: <1387950629-27448-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1387950629-27448-1-git-send-email-b32955@freescale.com>
References: <1387950629-27448-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: angus.clark@st.com, shawn.guo@linaro.org, b44548@freescale.com,
 broonie@linaro.org, linux-doc@vger.kernel.org, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 sourav.poddar@ti.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the binding file for Freescale QuadSPI driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
new file mode 100644
index 0000000..77ba6a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -0,0 +1,26 @@
+* Freescale Quad Serial Peripheral Interface(QuadSPI)
+
+Required properties:
+- compatible : Should be "fsl,vf610-qspi"
+- reg : the first contains the register location and length,
+        the second contains the memory mapping address and length
+- reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
+- interrupts : Should contain the interrupt for the device
+- clocks : The clocks needed by the QuadSPI controller
+- clock-names : the name of the clocks
+
+Example:
+
+qspi0: quadspi@40044000 {
+	compatible = "fsl,vf610-qspi";
+	reg = <0x40044000 0x1000>, <0x20000000 0x10000000>;
+	reg-names = "QuadSPI", "QuadSPI-memory";
+	interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clks VF610_CLK_QSPI0_EN>,
+		<&clks VF610_CLK_QSPI0>;
+	clock-names = "qspi_en", "qspi";
+
+	flash0: s25fl128s@0 {
+		....
+	};
+};
-- 
1.7.2.rc3
