Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e9ypJ-0007kJ-Sz
 for linux-mtd@lists.infradead.org; Wed, 01 Nov 2017 19:37:28 +0000
Date: Wed, 1 Nov 2017 20:37:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marex@denx.de>, David Woodhouse
 <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [GIT PULL v2] mtd: nand: Changes for 4.15
Message-ID: <20171101203700.625fac7a@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Here is a v2 of my NAND PR for 4.15 (just added one patch fixing a bug in
nand_panic_write()). As usual, let me know if you spot anything weird in
there.

Thanks,

Boris

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/nand/for-4.15

for you to fetch changes up to 30863e38ebeb500a31cecee8096fb5002677dd9b:

  mtd: nand: Fix writing mtdoops to nand flash. (2017-10-31 16:25:43 +0100)

----------------------------------------------------------------
Core changes:
* Add a flag to mark NANDs that require 3 address cycles to encode a
  page address
* Set a default ECC/free layout when NAND_ECC_NONE is requested
* Fix a bug in panic_nand_write()

Driver changes:
* Another batch of cleanups for the denali driver
* Fix PM support in the atmel driver
* Remove support for platform data in the omap driver
* Fix subpage write in the omap driver
* Fix irq handling in the mtk driver
* Change link order of mtk_ecc and mtk_nand drivers to speed up boot
  time
* Change log level of ECC error messages in the mxc driver
* Patch the pxa3xx driver to support Armada 8k platforms
* Add BAM DMA support to the qcom driver
* Convert gpio-nand to the GPIO desc API
* Fix ECC handling in the mt29f driver

----------------------------------------------------------------
Abhishek Sahu (2):
      mtd: nand: qcom: add command elements in BAM transaction
      mtd: nand: qcom: support for command descriptor formation

Arun Nagendran (1):
      staging: mt29f_spinand: Enable the read ECC before program the page

Boris Brezillon (2):
      mtd: nand: Export nand_reset() symbol
      mtd: nand: atmel: Actually use the PM ops

Brent Taylor (1):
      mtd: nand: Fix writing mtdoops to nand flash.

Geert Uytterhoeven (1):
      mtd: nand: sh_flctl: Use of_device_get_match_data() helper

Gregory CLEMENT (1):
      mtd: nand: pxa3xx_nand: Update Kconfig information

Ladislav Michl (2):
      mtd: nand: omap2: Remove omap_nand_platform_data
      mtd: nand: omap2: Do not assign omap_nand_info to platform drvdata

Linus Walleij (1):
      mtd: nand: gpio: Convert to use GPIO descriptors

Masahiro Yamada (16):
      mtd: nand: introduce NAND_ROW_ADDR_3 flag
      mtd: nand: denali: support two row address cycle devices
      mtd: nand: denali: squash setup_ecc_for_xfer() helper into caller
      mtd: nand: denali: prefix detect_max_banks() with denali_
      mtd: nand: denali: consolidate include directives
      mtd: nand: denali: squash denali_enable_dma() helper into caller
      mtd: nand: denali: slight clean up of denali_wait_for_irq()
      mtd: nand: denali: clean up macros with <linux/bitfield.h>
      mtd: nand: denali: use more FIELD_PREP / FIELD_GET where appropriate
      mtd: nand: denali: clean up comments
      mtd: nand: denali: use upper/lower_32_bits() macro for clean-up
      mtd: nand: denali: remove unneeded init of ECC_ENABLE register
      mtd: nand: denali: support direct addressing mode
      mtd: nand: denali: change the setup_dma choice into hook
      dt-bindings: nand: denali: reduce the register space in the example
      mtd: nand: denali: fix setup_data_interface to meet tCCS delay

Miquel Raynal (3):
      mtd: nand: Use standard large page OOB layout when using NAND_ECC_NONE
      Documentation: devicetree: add pxa3xx compatible and syscon property
      mtd: nand: pxa3xx: enable NAND controller if the SoC needs it

Roger Quadros (1):
      mtd: nand: omap2: Fix subpage write

Romain Izard (1):
      mtd: nand: atmel: Avoid ECC errors when leaving backup mode

Sascha Hauer (2):
      mtd: nand: mxc: lower ECC failed message priority to debug level
      mtd: nand: mxc: use dev_dbg to print debug messages

Xiaolei Li (2):
      mtd: nand: mtk: change the compile sequence of mtk_nand.o and mtk_ecc.o
      mtd: nand: mtk: fix infinite ECC decode IRQ issue

 Documentation/devicetree/bindings/mtd/denali-nand.txt |   2 +-
 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt |   4 +
 arch/arm/mach-pxa/cm-x255.c                           |  19 ++-
 drivers/mtd/nand/Kconfig                              |   5 +-
 drivers/mtd/nand/Makefile                             |   2 +-
 drivers/mtd/nand/atmel/nand-controller.c              |   7 +-
 drivers/mtd/nand/atmel/pmecc.c                        |  17 +-
 drivers/mtd/nand/atmel/pmecc.h                        |   1 +
 drivers/mtd/nand/au1550nd.c                           |   3 +-
 drivers/mtd/nand/denali.c                             | 291 +++++++++++++++------------------
 drivers/mtd/nand/denali.h                             |  44 +++--
 drivers/mtd/nand/denali_dt.c                          |   4 +-
 drivers/mtd/nand/denali_pci.c                         |   5 +-
 drivers/mtd/nand/diskonchip.c                         |   3 +-
 drivers/mtd/nand/gpio.c                               | 112 ++++++-------
 drivers/mtd/nand/hisi504_nand.c                       |   3 +-
 drivers/mtd/nand/mtk_ecc.c                            |  13 +-
 drivers/mtd/nand/mxc_nand.c                           |  19 ++-
 drivers/mtd/nand/nand_base.c                          |  34 +++-
 drivers/mtd/nand/nuc900_nand.c                        |   2 +-
 drivers/mtd/nand/omap2.c                              | 377 ++++++++++++++++++++++++++-----------------
 drivers/mtd/nand/pxa3xx_nand.c                        |  41 ++++-
 drivers/mtd/nand/qcom_nandc.c                         | 127 +++++++++++++--
 drivers/mtd/nand/sh_flctl.c                           |   9 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c         |   8 +-
 include/linux/mtd/nand-gpio.h                         |   5 -
 include/linux/mtd/rawnand.h                           |   3 +
 include/linux/platform_data/mtd-nand-omap2.h          |  17 --
 28 files changed, 687 insertions(+), 490 deletions(-)
