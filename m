From: Stefan Agner <stefan@agner.ch>
To: shawnguo@kernel.org,
	kernel@pengutronix.de
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, robh+dt@kernel.org, mark.rutland@arm.com,
 han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 0/2] ARM: dts: imx7: add NAND support
Date: Thu,  1 Jun 2017 19:11:08 -0700
Message-Id: <cover.9cbefd91387aefe2522dbb3e6338e4e4efdb5e41.1496369342.git-series.stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This are the missing device tree parts to add NAND support for i.MX 7.
See previous patchset:
https://lkml.org/lkml/2017/4/21/832

The previous version also included driver changes, which are already
merged.

--
Stefan

Changes since v3:
- Only specify IMX7D_NAND_USDHC_BUS_ROOT_CLK which seems to be sufficent

Changes since v2:
- Dropped driver changes, alreay merged

Changes since v1:
- Make clks_count const
- Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6

Stefan Agner (2):
  ARM: dts: imx7: add GPMI NAND
  ARM: dts: imx7-colibri: add NAND support

 arch/arm/boot/dts/imx7-colibri.dtsi |  9 +++++++++-
 arch/arm/boot/dts/imx7s.dtsi        | 30 ++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+)

base-commit: e2bb3be2c6c623ff0bad975dc9435531f450f0c5
-- 
git-series 0.9.1
