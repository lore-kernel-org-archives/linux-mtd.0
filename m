Received: from mail-eopbgr30051.outbound.protection.outlook.com ([40.107.3.51]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecDvT-0007Wh-4Z
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 17:24:37 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <fabio.estevam@nxp.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "David
 Wolfe" <david.wolfe@nxp.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: fsl-quadspi: Add the example of two
 SPI NOR
Date: Thu, 18 Jan 2018 17:24:17 +0000
Message-ID: <DB5PR0401MB221453634FBAA077E8CE759A97E80@DB5PR0401MB2214.eurprd04.prod.outlook.com>
References: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>,
 <1516285721-32294-2-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1516285721-32294-2-git-send-email-fabio.estevam@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


________________________________________
From: Fabio Estevam <fabio.estevam@nxp.com>
Sent: Thursday, January 18, 2018 8:28 AM
To: boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org; Han Xu; David Wolfe; Fabio Estevam
Subject: [PATCH v6 2/2] dt-bindings: fsl-quadspi: Add the example of two SP=
I NOR

Improve the bindings example by adding an example of how to represent
two SPI NOR devices.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v5:
- None

 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 24 ++++++++++++++++++=
++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Docume=
ntation/devicetree/bindings/mtd/fsl-quadspi.txt
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
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_qspi2>;
+       status =3D "okay";
+
+       flash0: n25q256a@0 {
+               #address-cells =3D <1>;
+               #size-cells =3D <1>;
+               compatible =3D "micron,n25q256a", "jedec,spi-nor";
+               spi-max-frequency =3D <29000000>;
+               reg =3D <0>;
+       };
+
+       flash1: n25q256a@1 {
+               #address-cells =3D <1>;
+               #size-cells =3D <1>;
+               compatible =3D "micron,n25q256a", "jedec,spi-nor";
+               spi-max-frequency =3D <29000000>;
+               reg =3D <1>;
+       };
+};
--
2.7.4

Acked-by: Han Xu <han.xu@nxp.com>
