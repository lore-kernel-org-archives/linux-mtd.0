Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eGshz-0006dA-L1
 for linux-mtd@lists.infradead.org; Mon, 20 Nov 2017 20:30:27 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] MTD changes for 4.15-rc1
Date: Mon, 20 Nov 2017 21:30:17 +0100
Message-ID: <1591924.PAdlRvT0tJ@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 0b07194bb55ed836c2cc7c22e866b87a14681984:

  Linux 4.14-rc7 (2017-10-29 13:58:38 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20171120

for you to fetch changes up to 1530578abdac4edce9244c7a1962ded3ffdb58ce:

  mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid (2017-11-13 
22:07:31 +0100)

----------------------------------------------------------------
This pull request contains the following core changes:

General changes:
   * Unconfuse get_unmapped_area and point/unpoint driver methods
   * New partition parser: sharpslpart
   * Kill GENERIC_IO
   * Various fixes

NAND changes:
   * Add a flag to mark NANDs that require 3 address cycles to encode a
     page address
   * Set a default ECC/free layout when NAND_ECC_NONE is requested
   * Fix a bug in panic_nand_write()
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

SPI-NOR changes:
   * Introduce system power management support
   * New mechanism to select the proper .quad_enable() hook by JEDEC ID,
     when needed, instead of only by manufacturer ID
   * Add support to new memory parts from Gigadevice, Winbond, Macronix and
     Everspin
   * Maintainance for Cadence, Intel, Mediatek and STM32 drivers

----------------------------------------------------------------
Abhishek Sahu (2):
      mtd: nand: qcom: add command elements in BAM transaction
      mtd: nand: qcom: support for command descriptor formation

Andrea Adami (1):
      mtd: sharpslpart: Add sharpslpart partition parser

Andy Yan (2):
      mtd: spi-nor: add a quad_enable callback in struct flash_info
      mtd: spi-nor: add support for GD25Q256

Anton Vasilyev (1):
      mtd: plat-ram: Replace manual resource management by devm

Arun Nagendran (1):
      staging: mt29f_spinand: Enable the read ECC before program the page

Arvind Yadav (2):
      mtd: constify mtd_partition
      mtd: mtdswap: fix spelling mistake: 'TRESHOLD' -> 'THRESHOLD'

Bin Meng (11):
      spi-nor: intel-spi: Fix number of protected range registers for BYT/LPT
      spi-nor: intel-spi: Remove useless 'buf' parameter in the HW/SW cycle
      spi-nor: intel-spi: Fix broken software sequencing codes
      spi-nor: intel-spi: Check transfer length in the HW/SW cycle
      spi-nor: intel-spi: Use SW sequencer for BYT/LPT
      spi-nor: intel-spi: Remove 'Atomic Cycle Sequence' in intel_spi_write()
      spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS
      spi-nor: intel-spi: Remove the unnecessary HSFSTS register RW
      spi-nor: intel-spi: Rename swseq to swseq_reg in 'struct intel_spi'
      spi-nor: intel-spi: Fall back to use SW sequencer to erase
      spi-nor: intel-spi: Remove EXPERT dependency

Boris Brezillon (4):
      mtd: nand: Export nand_reset() symbol
      mtd: nand: atmel: Actually use the PM ops
      mtd: Add sanity checks in mtd_write/read_oob()
      mtd: Avoid probe failures when mtd->dbg.dfs_dir is invalid

Brent Taylor (1):
      mtd: nand: Fix writing mtdoops to nand flash.

Geert Uytterhoeven (2):
      mtd: nand: sh_flctl: Use of_device_get_match_data() helper
      mtd: spi-nor: stm32-quadspi: Fix uninitialized error return code

Gregory CLEMENT (1):
      mtd: nand: pxa3xx_nand: Update Kconfig information

Guochun Mao (2):
      dt-bindings: mtd: add new compatible strings and improve description
      mtd: mtk-nor: add suspend/resume support

Kamal Dasu (2):
      mtd: spi-nor: add spi_nor_init() function
      mtd: spi-nor: Add spi-nor mtd resume handler

Klaus Goger (1):
      mtd: spi-nor: add support for Gigadevice GD25LQ32

Kuppuswamy Sathyanarayanan (1):
      mtd: intel-spi: Add Intel Lewisburg PCH SPI super SKU PCI ID

Ladislav Michl (2):
      mtd: nand: omap2: Remove omap_nand_platform_data
      mtd: nand: omap2: Do not assign omap_nand_info to platform drvdata

Linus Walleij (1):
      mtd: nand: gpio: Convert to use GPIO descriptors

Ludovic Barre (2):
      mtd: spi-nor: stm32-quadspi: change license text
      mtd: spi-nor: stm32-quadspi: fix prefetching outside fsize

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

Mika Westerberg (2):
      mtd: spi-nor: intel-spi: Add support for Intel Lewisburg SPI serial 
flash
      mtd: spi-nor: intel-spi: Add support for Intel Cedar Fork SPI serial 
flash

Miquel Raynal (3):
      mtd: nand: Use standard large page OOB layout when using NAND_ECC_NONE
      Documentation: devicetree: add pxa3xx compatible and syscon property
      mtd: nand: pxa3xx: enable NAND controller if the SoC needs it

Neil Armstrong (1):
      mtd: spi-nor: Add support for Winbond w25q16dw

Nicolas Pitre (5):
      mtd: mtdram: properly handle the phys argument in the point method
      mtd: chips/map_ram.c: implement point and unpoint methods
      mtd: chips/map_rom.c: implement point and unpoint methods
      mtd: implement mtd_get_unmapped_area() using the point method
      mtd: remove the get_unmapped_area method

Pavel Machek (1):
      mtd: Fix C++ comment in include/linux/mtd/mtd.h

Philipp Puschmann (1):
      mtd: spi-nor: Add support for mr25h128

Richard Weinberger (3):
      mtd: spi-nor: Kill check with no effect
      Merge tag 'spi-nor/for-4.15' of git://git.infradead.org/l2-mtd
      Merge tag 'nand/for-4.15' of git://git.infradead.org/l2-mtd

Rob Herring (1):
      kconfig: kill off GENERIC_IO option

Roger Quadros (1):
      mtd: nand: omap2: Fix subpage write

Romain Izard (1):
      mtd: nand: atmel: Avoid ECC errors when leaving backup mode

Roman Yeryomin (1):
      mtd: spi-nor: enable 4B opcodes for mx66l51235l

Roy Franz (1):
      mtd: slram: use memremap() instead of ioremap()

Sascha Hauer (2):
      mtd: nand: mxc: lower ECC failed message priority to debug level
      mtd: nand: mxc: use dev_dbg to print debug messages

Thor Thayer (1):
      mtd: spi-nor: Allow Cadence QSPI support for ARM64

Vignesh R (6):
      mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
      mtd: spi-nor: cadence-quadspi: add a delay in write sequence
      mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back 
circuit
      mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock 
circuit
      mtd: spi-nor: cadence-quadspi: Fix error path in probe
      mtd: spi-nor: cadence-quadspi: Add runtime PM support

Xiaolei Li (2):
      mtd: nand: mtk: change the compile sequence of mtk_nand.o and mtk_ecc.o
      mtd: nand: mtk: fix infinite ECC decode IRQ issue

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |   7 +-
 .../devicetree/bindings/mtd/denali-nand.txt        |   2 +-
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |   1 +
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |  15 +-
 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   4 +
 arch/arm/mach-pxa/cm-x255.c                        |  19 +-
 arch/um/Kconfig.common                             |   1 -
 drivers/mtd/Kconfig                                |   1 -
 drivers/mtd/chips/map_ram.c                        |  34 +-
 drivers/mtd/chips/map_rom.c                        |  34 +-
 drivers/mtd/devices/docg3.c                        |   7 +-
 drivers/mtd/devices/lart.c                         |   2 +-
 drivers/mtd/devices/m25p80.c                       |   1 +
 drivers/mtd/devices/mtdram.c                       |  36 +-
 drivers/mtd/devices/slram.c                        |   9 +-
 drivers/mtd/maps/cfi_flagadm.c                     |   2 +-
 drivers/mtd/maps/impa7.c                           |   2 +-
 drivers/mtd/maps/netsc520.c                        |   2 +-
 drivers/mtd/maps/nettel.c                          |   2 +-
 drivers/mtd/maps/plat-ram.c                        |  38 +-
 drivers/mtd/maps/sbc_gxx.c                         |   2 +-
 drivers/mtd/maps/ts5500_flash.c                    |   2 +-
 drivers/mtd/maps/uclinux.c                         |   2 +-
 drivers/mtd/mtdconcat.c                            |  27 --
 drivers/mtd/mtdcore.c                              |  61 +++-
 drivers/mtd/mtdpart.c                              |  14 -
 drivers/mtd/mtdswap.c                              |   4 +-
 drivers/mtd/nand/Kconfig                           |   5 +-
 drivers/mtd/nand/Makefile                          |   2 +-
 drivers/mtd/nand/ams-delta.c                       |   2 +-
 drivers/mtd/nand/atmel/nand-controller.c           |   7 +-
 drivers/mtd/nand/atmel/pmecc.c                     |  17 +-
 drivers/mtd/nand/atmel/pmecc.h                     |   1 +
 drivers/mtd/nand/au1550nd.c                        |   3 +-
 drivers/mtd/nand/cmx270_nand.c                     |   2 +-
 drivers/mtd/nand/denali.c                          | 291 +++++++--------
 drivers/mtd/nand/denali.h                          |  44 ++-
 drivers/mtd/nand/denali_dt.c                       |   4 +-
 drivers/mtd/nand/denali_pci.c                      |   5 +-
 drivers/mtd/nand/diskonchip.c                      |   3 +-
 drivers/mtd/nand/gpio.c                            | 112 +++---
 drivers/mtd/nand/hisi504_nand.c                    |   3 +-
 drivers/mtd/nand/mtk_ecc.c                         |  13 +-
 drivers/mtd/nand/mxc_nand.c                        |  19 +-
 drivers/mtd/nand/nand_base.c                       |  34 +-
 drivers/mtd/nand/nandsim.c                         |  13 +-
 drivers/mtd/nand/nuc900_nand.c                     |   2 +-
 drivers/mtd/nand/omap2.c                           | 377 +++++++++++--------
 drivers/mtd/nand/pxa3xx_nand.c                     |  41 ++-
 drivers/mtd/nand/qcom_nandc.c                      | 127 ++++++-
 drivers/mtd/nand/sh_flctl.c                        |   9 +-
 drivers/mtd/parsers/Kconfig                        |   8 +
 drivers/mtd/parsers/Makefile                       |   1 +
 drivers/mtd/parsers/sharpslpart.c                  | 398 ++++++++++++++++++++
+
 drivers/mtd/spi-nor/Kconfig                        |   6 +-
 drivers/mtd/spi-nor/cadence-quadspi.c              |  55 ++-
 drivers/mtd/spi-nor/intel-spi-pci.c                |   3 +
 drivers/mtd/spi-nor/intel-spi.c                    | 209 ++++++++---
 drivers/mtd/spi-nor/mtk-quadspi.c                  |  70 +++-
 drivers/mtd/spi-nor/spi-nor.c                      | 105 ++++--
 drivers/mtd/spi-nor/stm32-quadspi.c                |  35 +-
 include/linux/mtd/mtd.h                            |   6 +-
 include/linux/mtd/nand-gpio.h                      |   5 -
 include/linux/mtd/rawnand.h                        |   3 +
 include/linux/mtd/spi-nor.h                        |  10 +
 include/linux/platform_data/mtd-nand-omap2.h       |  17 -
 lib/Kconfig                                        |   4 -
 67 files changed, 1648 insertions(+), 754 deletions(-)
 create mode 100644 drivers/mtd/parsers/sharpslpart.c
