From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] ARM: dts: imx6sx-sdb: Fix the reg properties for the FSL
 QSPI nodes
Date: Mon, 10 Dec 2018 16:28:49 +0000
Message-ID: <1544459182-23655-4-git-send-email-frieder.schrempf@kontron.de>
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

The current driver does not use the reg properties, but we will
add a new driver soon. To make sure we have a consistent scheme,
let's fix the reg properties here.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/imx6sx-sdb-reva.dts | 4 ++--
 arch/arm/boot/dts/imx6sx-sdb.dts      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6=
sx-sdb-reva.dts
index 9cc6ff2..344abc2 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -134,8 +134,8 @@
 		spi-max-frequency =3D <66000000>;
 	};
=20
-	flash1: s25fl128s@1 {
-		reg =3D <1>;
+	flash1: s25fl128s@2 {
+		reg =3D <2>;
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
 		compatible =3D "spansion,s25fl128s", "jedec,spi-nor";
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sd=
b.dts
index 6dd9beb..5a39703 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -120,12 +120,12 @@
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
+		reg =3D <2>;
 	};
 };
=20
--=20
2.7.4
