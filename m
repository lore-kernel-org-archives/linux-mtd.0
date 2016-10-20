From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mylene Josserand <mylene.josserand@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 0/8] ARM: gr8: Add support for the CHIP Pro
Date: Thu, 20 Oct 2016 10:12:41 +0200
Message-Id: <cover.bb1e4a568bc16ada5254cad063f4afbaa1ca5906.1476951078.git-series.maxime.ripard@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is a serie introducing the CHIP Pro support.

The most exciting thing about this is that it's the first board we'll be
able to enable the NAND on, benefiting from the awesome work Boris did over
the last couple of years.

This is possible because the NAND chip is an SLC one, for which we don't
have to wait for the current UBI / UBIFS work.

Let me know what you think,
Maxime

Boris Brezillon (2):
  mtd: nand: sunxi: fix support for 512bytes ECC chunks
  mtd: nand: add support for the TC58NVG2S0H chip

Maxime Ripard (6):
  ARM: gr8: Add the UART3
  ARM: gr8: Fix typo in the i2s mclk pin group
  ARM: gr8: Add missing pwm channel 1 pin
  ARM: gr8: Add UART2 pins
  ARM: gr8: Add UART3 pins
  ARM: gr8: Add CHIP Pro support

 arch/arm/boot/dts/Makefile             |   1 +-
 arch/arm/boot/dts/ntc-gr8-chip-pro.dts | 266 ++++++++++++++++++++++++++-
 arch/arm/boot/dts/ntc-gr8.dtsi         |  47 ++++-
 drivers/mtd/nand/nand_ids.c            |   3 +-
 drivers/mtd/nand/sunxi_nand.c          |   4 +-
 5 files changed, 320 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ntc-gr8-chip-pro.dts

-- 
git-series 0.8.10
