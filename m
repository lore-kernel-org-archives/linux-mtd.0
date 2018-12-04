From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Li Yang <leoyang.li@nxp.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "yogeshnarayan.gaur@nxp.com" <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com"
 <han.xu@nxp.com>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/9] ARM: dts: Reflect change of FSL QSPI driver and remove
 unused properties
Date: Tue, 4 Dec 2018 14:15:12 +0000
Message-ID: <1543932685-15011-2-git-send-email-frieder.schrempf@kontron.de>
References: <1543932685-15011-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1543932685-15011-1-git-send-email-frieder.schrempf@kontron.de>
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The FSL QSPI driver will be moved to the SPI framework and it then
acts as a SPI controller. Therefore the subnodes need to set
spi-[rx/tx]-bus-width =3D <4>, so quad mode is used just as before.

Also the properties 'bus-num', 'fsl,spi-num-chipselects' and
'fsl,spi-flash-chipselects' were never read by the driver and
can be removed.

The 'reg' properties are adjusted to reflect what bus and
chipselect the flash is connected to, as the new driver needs
this information.

The property 'fsl,qspi-has-second-chip' is not needed anymore
and will be removed after the old driver was disabled to avoid
breaking ls1021a-moxa-uc-8410a.dts.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/imx6sx-sdb-reva.dts       | 8 ++++++--
 arch/arm/boot/dts/imx6sx-sdb.dts            | 8 ++++++--
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi     | 2 ++
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts | 5 ++---
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6=
sx-sdb-reva.dts
index 9cc6ff2..9997156 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -132,13 +132,17 @@
 		#size-cells =3D <1>;
 		compatible =3D "spansion,s25fl128s", "jedec,spi-nor";
 		spi-max-frequency =3D <66000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 	};
=20
-	flash1: s25fl128s@1 {
-		reg =3D <1>;
+	flash1: s25fl128s@2 {
+		reg =3D <2>;
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
 		compatible =3D "spansion,s25fl128s", "jedec,spi-nor";
 		spi-max-frequency =3D <66000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sd=
b.dts
index 6dd9beb..9acfda8 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -117,15 +117,19 @@
 		#size-cells =3D <1>;
 		compatible =3D "micron,n25q256a", "jedec,spi-nor";
 		spi-max-frequency =3D <29000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 		reg =3D <0>;
 	};
=20
-	flash1: n25q256a@1 {
+	flash1: n25q256a@2 {
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
 		compatible =3D "micron,n25q256a", "jedec,spi-nor";
 		spi-max-frequency =3D <29000000>;
-		reg =3D <1>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
+		reg =3D <2>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/im=
x6ul-14x14-evk.dtsi
index 32a0723..c2c9a2a 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -176,6 +176,8 @@
 		#size-cells =3D <1>;
 		compatible =3D "micron,n25q256a";
 		spi-max-frequency =3D <29000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 		reg =3D <0>;
 	};
 };
diff --git a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dt=
s/ls1021a-moxa-uc-8410a.dts
index d01f64b..6a83f30 100644
--- a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
@@ -203,9 +203,6 @@
 };
=20
 &qspi {
-	bus-num =3D <0>;
-	fsl,spi-num-chipselects =3D <2>;
-	fsl,spi-flash-chipselects =3D <0>;
 	fsl,qspi-has-second-chip;
 	status =3D "okay";
=20
@@ -214,6 +211,8 @@
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
 		spi-max-frequency =3D <20000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 		reg =3D <0>;
=20
 		partitions@0 {
--=20
2.7.4
