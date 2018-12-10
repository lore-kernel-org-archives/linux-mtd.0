From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Li Yang
 <leoyang.li@nxp.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] ARM: dts: Add spi-[tx/rx]-bus-width for the FSL QSPI
 controller
Date: Mon, 10 Dec 2018 16:28:50 +0000
Message-ID: <1544459182-23655-6-git-send-email-frieder.schrempf@kontron.de>
References: <1544459182-23655-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1544459182-23655-1-git-send-email-frieder.schrempf@kontron.de>
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

We will move the FSL QSPI driver to the SPI framework soon. To
prepare and to make sure the full buswidth is used (as it is with
the current driver), let's add the right properties.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/imx6sx-sdb-reva.dts       | 4 ++++
 arch/arm/boot/dts/imx6sx-sdb.dts            | 4 ++++
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi     | 2 ++
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6=
sx-sdb-reva.dts
index 344abc2..9997156 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -132,6 +132,8 @@
 		#size-cells =3D <1>;
 		compatible =3D "spansion,s25fl128s", "jedec,spi-nor";
 		spi-max-frequency =3D <66000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 	};
=20
 	flash1: s25fl128s@2 {
@@ -140,5 +142,7 @@
 		#size-cells =3D <1>;
 		compatible =3D "spansion,s25fl128s", "jedec,spi-nor";
 		spi-max-frequency =3D <66000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 	};
 };
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sd=
b.dts
index 5a39703..9acfda8 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -117,6 +117,8 @@
 		#size-cells =3D <1>;
 		compatible =3D "micron,n25q256a", "jedec,spi-nor";
 		spi-max-frequency =3D <29000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 		reg =3D <0>;
 	};
=20
@@ -125,6 +127,8 @@
 		#size-cells =3D <1>;
 		compatible =3D "micron,n25q256a", "jedec,spi-nor";
 		spi-max-frequency =3D <29000000>;
+		spi-rx-bus-width =3D <4>;
+		spi-tx-bus-width =3D <4>;
 		reg =3D <2>;
 	};
 };
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
index 6bb7ce0..6a83f30 100644
--- a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
@@ -211,6 +211,8 @@
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
