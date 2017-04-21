From: Stefan Agner <stefan@agner.ch>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com,
 LW@KARO-electronics.de, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 0/5] mtd: nand: gpmi: add i.MX 7 support
Date: Thu, 20 Apr 2017 18:07:50 -0700
Message-Id: <20170421010755.18025-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
There have been similar patchsets already:
https://lkml.org/lkml/2016/2/23/912

However, this patchset does not make use of any of the new features.
The current feature set seems to work fine, I successfully run the MTD
tests on a Colibri iMX7.

--
Stefan

Stefan Agner (5):
  mtd: nand: gpmi: unify clock handling
  mtd: nand: gpmi: add i.MX 7 SoC support
  mtd: gpmi: document current clock requirements
  ARM: dts: imx7: add GPMI NAND
  ARM: dts: imx7-colibri: add NAND support

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 14 +++++-
 arch/arm/boot/dts/imx7-colibri.dtsi                |  9 ++++
 arch/arm/boot/dts/imx7s.dtsi                       | 31 ++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 56 +++++++++++++---------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  2 +
 5 files changed, 88 insertions(+), 24 deletions(-)

-- 
2.12.2
