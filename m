Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efBTP-0007e6-UI
 for linux-mtd@lists.infradead.org; Fri, 26 Jan 2018 21:23:49 +0000
Received: by mail-qt0-x241.google.com with SMTP id d8so4788679qtm.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2018 13:23:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: cyrille.pitchen@wedev4u.fr
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 han.xu@nxp.com, david.wolfe@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH RESEND v6 2/2] dt-bindings: fsl-quadspi: Add the example of
 two SPI NOR
Date: Fri, 26 Jan 2018 19:23:25 -0200
Message-Id: <1517001805-7646-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1517001805-7646-1-git-send-email-festevam@gmail.com>
References: <1517001805-7646-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

Improve the bindings example by adding an example of how to represent
two SPI NOR devices.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Acked-by: Han Xu <han.xu@nxp.com>
---
Resending it as I missed to send it to Cyrille

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
