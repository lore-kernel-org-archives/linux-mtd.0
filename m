Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cyLk8-0001at-Il
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 17:07:46 +0000
From: Ludovic Barre <ludovic.Barre@st.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut
 <marek.vasut@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Wed, 12 Apr 2017 19:06:24 +0200
Message-ID: <1492016785-24976-2-git-send-email-ludovic.Barre@st.com>
In-Reply-To: <1492016785-24976-1-git-send-email-ludovic.Barre@st.com>
References: <1492016785-24976-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds documentation of device tree bindings for the STM32
QSPI controller.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 .../devicetree/bindings/mtd/stm32-quadspi.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
new file mode 100644
index 0000000..ddd18c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
@@ -0,0 +1,43 @@
+* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
+
+Required properties:
+- compatible: should be "st,stm32f469-qspi"
+- reg: the first contains the register location and length.
+       the second contains the memory mapping address and length
+- reg-names: should contain the reg names "qspi" "qspi_mm"
+- interrupts: should contain the interrupt for the device
+- clocks: the phandle of the clock needed by the QSPI controller
+- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
+
+Optional properties:
+- resets: must contain the phandle to the reset controller.
+
+A spi flash must be a child of the nor_flash node and could have some
+properties. Also see jedec,spi-nor.txt.
+
+Required properties:
+- reg: chip-Select number (QSPI controller may connect 2 nor flashes)
+- spi-max-frequency: max frequency of spi bus
+
+Optional property:
+- spi-rx-bus-width: see ../spi/spi-bus.txt for the description
+
+Example:
+
+qspi: spi@a0001000 {
+	compatible = "st,stm32f469-qspi";
+	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
+	reg-names = "qspi", "qspi_mm";
+	interrupts = <91>;
+	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
+	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+
+	flash@0 {
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <108000000>;
+		...
+	};
+};
-- 
2.7.4
