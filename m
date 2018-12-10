From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] ARM: dts: Remove unused properties from FSL QSPI driver
 nodes
Date: Mon, 10 Dec 2018 16:28:48 +0000
Message-ID: <1544459182-23655-3-git-send-email-frieder.schrempf@kontron.de>
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

The properties 'bus-num', 'fsl,spi-num-chipselects' and
'fsl,spi-flash-chipselects' were never read by the driver
and can be removed.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dt=
s/ls1021a-moxa-uc-8410a.dts
index d01f64b..6bb7ce0 100644
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
--=20
2.7.4
