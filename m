Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enu2e-0002WQ-Sb
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 22:36:14 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 <devicetree@vger.kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/6] Use the reworked Marvell NAND controller with all
 boards
Date: Mon, 19 Feb 2018 23:35:51 +0100
Message-Id: <20180219223557.2458-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Marvell NAND controller driver pxa3xx_nand has been replaced in 4.16 by
a new driver featuring the new ->exec_op() interface called
marvell_nand.

These patches were part of a greater series that has been partially
applied. Now that support for PXA boards looks stable, migrate all of
them to use the new driver.

To avoid risking compilation issues/broken bisection, I guess it would
probably be better to make all these patches go through the MTD tree?

Best regards,
Miquèl

Changes since v3:
  - Split the removal of pxa3xx_nand driver in two: one patch to migrate
    the defconfigs, another to remove the driver.
  - Acked-by/Tested-by from Robert Jarzmik.


Miquel Raynal (6):
  mtd: nand: use Marvell reworked NAND controller driver with all
    platforms
  mtd: nand: remove deprecated pxa3xx_nand driver
  mtd: nand: remove useless fields from pxa3xx NAND platform data
  dt-bindings: mtd: remove pxa3xx NAND controller documentation
  arm: dts: pxa: use reworked NAND controller driver
  MAINTAINERS: remove entry for deleted pxa3xx_nand driver

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   50 -
 MAINTAINERS                                        |    6 -
 arch/arm/boot/dts/pxa3xx.dtsi                      |    6 +-
 arch/arm/configs/cm_x300_defconfig                 |    2 +-
 arch/arm/configs/pxa3xx_defconfig                  |    3 +-
 arch/arm/configs/pxa_defconfig                     |    2 +-
 arch/arm/configs/raumfeld_defconfig                |    2 +-
 arch/arm/mach-mmp/ttc_dkb.c                        |    4 +-
 arch/arm/mach-pxa/cm-x300.c                        |    8 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c                 |    8 +-
 arch/arm/mach-pxa/colibri.h                        |    2 +-
 arch/arm/mach-pxa/littleton.c                      |   10 +-
 arch/arm/mach-pxa/mxm8x10.c                        |   10 +-
 arch/arm/mach-pxa/raumfeld.c                       |    6 +-
 arch/arm/mach-pxa/zylonite.c                       |   10 +-
 drivers/mtd/nand/raw/Kconfig                       |   11 -
 drivers/mtd/nand/raw/Makefile                      |    1 -
 drivers/mtd/nand/raw/marvell_nand.c                |    3 +-
 drivers/mtd/nand/raw/pxa3xx_nand.c                 | 2103 --------------------
 include/linux/platform_data/mtd-nand-pxa3xx.h      |   43 +-
 20 files changed, 43 insertions(+), 2247 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
 delete mode 100644 drivers/mtd/nand/raw/pxa3xx_nand.c

-- 
2.14.1
