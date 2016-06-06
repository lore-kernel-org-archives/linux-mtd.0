From: Aleksei Mamlin <mamlinav@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@googlegroups.com, Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH 0/7] dts: sunxi: Add sunxi NAND Flash Controller support
Date: Mon,  6 Jun 2016 13:24:17 +0300
Message-Id: <1465208664-9366-1-git-send-email-mamlinav@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series adds the sunxi NAND Flash Controller nodes to dts.

The first 4 patches is Boris Brezillon's patches with dtsi changes.
The second 1 patch adds Hynix H27UBG8T2BTR-BC NAND chip definition.
The last 2 patches enables NAND on Marsboard A10 board and Wexler TAB7200
tablet.

Aleksei Mamlin (3):
  mtd: nand: Add Hynix H27UBG8T2BTR-BC to nand_ids table
  ARM: dts: sun4i: Enable NAND on Marsboard A10
  ARM: dts: sun7i: Enable NAND on Wexler TAB7200

Boris Brezillon (4):
  ARM: dts: sun4i: Add A10 NAND controller pin definitions
  ARM: dts: sun4i: Add NFC node to Allwinner A10 SoC
  ARM: dts: sun7i: Add A20 NAND controller pin definitions
  ARM: dts: sun7i: Add NFC node to Allwinner A20 SoC

 arch/arm/boot/dts/sun4i-a10-marsboard.dts      | 41 ++++++++++++
 arch/arm/boot/dts/sun4i-a10.dtsi               | 91 ++++++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 41 ++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi               | 91 ++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c                    |  4 ++
 5 files changed, 268 insertions(+)

-- 
2.7.3
