Received: from mail-dm3nam03on0626.outbound.protection.outlook.com
 ([2a01:111:f400:fe49::626]
 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecBBo-0006HE-5R
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 14:29:13 +0000
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, <han.xu@nxp.com>, <david.wolfe@nxp.com>,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v6 2/2] dt-bindings: fsl-quadspi: Add the example of two SPI
 NOR
Date: Thu, 18 Jan 2018 12:28:41 -0200
Message-ID: <1516285721-32294-2-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
References: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
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

Improve the bindings example by adding an example of how to represent
two SPI NOR devices.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v5:
- None

 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 63d4d626..483e9cf 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -39,3 +39,27 @@ qspi0: quadspi@40044000 {
 		....
 	};
 };
+
+Example showing the usage of two SPI NOR devices:
+
+&qspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi2>;
+	status = "okay";
+
+	flash0: n25q256a@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,n25q256a", "jedec,spi-nor";
+		spi-max-frequency = <29000000>;
+		reg = <0>;
+	};
+
+	flash1: n25q256a@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,n25q256a", "jedec,spi-nor";
+		spi-max-frequency = <29000000>;
+		reg = <1>;
+	};
+};
-- 
2.7.4
