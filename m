From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
CC: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] Prepare devicetrees for the new FSL QSPI driver
Date: Mon, 10 Dec 2018 16:28:47 +0000
Message-ID: <1544459182-23655-1-git-send-email-frieder.schrempf@kontron.de>
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

We have prepared a new driver for the FSL QSPI controller that works under
the SPI framework. The current devicetrees are broken because they use an
inconsistent scheme for assigning the reg properties.

As, in contrast to the current driver, the new driver will use the reg
properties to select the correct chip, we need to fix them.

We also add spi-[tx/rx]-bus-width to make sure the full buswidth will be us=
ed
and while at it clean up and remove some unused properties.

Frieder Schrempf (5):
  arm64: dts: Remove unused properties from FSL QSPI driver nodes
  ARM: dts: Remove unused properties from FSL QSPI driver nodes
  ARM: dts: imx6sx-sdb: Fix the reg properties for the FSL QSPI nodes
  arm64: dts: Add spi-[tx/rx]-bus-width for the FSL QSPI controller
  ARM: dts: Add spi-[tx/rx]-bus-width for the FSL QSPI controller

 arch/arm/boot/dts/imx6sx-sdb-reva.dts              | 8 ++++++--
 arch/arm/boot/dts/imx6sx-sdb.dts                   | 8 ++++++--
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            | 2 ++
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts        | 5 ++---
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  | 3 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 6 ++++--
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi | 4 ++++
 8 files changed, 28 insertions(+), 12 deletions(-)

--=20
2.7.4
