From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, han.xu@nxp.com,
 festevam@gmail.com, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH 2/2] dt-bindings: fsl-quadspi: spi-rx/tx-bus-width usage
 example
Date: Tue, 30 Jan 2018 23:01:08 +0530
Message-Id: <1517333468-17153-3-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1517333468-17153-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517333468-17153-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Added usage example by adding support for spi-rx-bus-width
and spi-tx-bus-width binding.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 63d4d626..811da0e 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -39,3 +39,33 @@ qspi0: quadspi@40044000 {
 		....
 	};
 };
+
+qspi1: quadspi@20c0000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x0 0x20c0000 0x0 0x10000>,
+		<0x0 0x20000000 0x0 0x10000000>;
+	reg-names = "QuadSPI", "QuadSPI-memory";
+	interrupts = <0 25 0x4>; /* Level high type */
+	clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+	clock-names = "qspi_en", "qspi";
+	status = "okay";
+
+	qflash0: s25fs512s@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+
+	qflash1: s25fs512s@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <1>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
-- 
1.9.1
