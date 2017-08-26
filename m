Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dlW7W-0001Km-1L
 for linux-mtd@lists.infradead.org; Sat, 26 Aug 2017 08:07:08 +0000
Date: Sat, 26 Aug 2017 10:06:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: Changes for 4.14
Message-ID: <20170826100631.4f73579a@bbrezillon>
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

Hello Brian,

Here is my PR for 4.14. Can you please have a look and let me know if
notice something wrong.

Thanks,

Boris

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/nand/for-4.14

for you to fetch changes up to a75d6a4cebcc58c4fb139385fc996a62b6f18f68:

  Merge branch 'nand/rename-header-file' of git://git.infradead.org/l2-mtd into nand/next (2017-08-23 17:00:12 +0200)

----------------------------------------------------------------
This pull request contains the following core changes:

* Fix memory leaks in the core
* Remove unused NAND locking support
* Rename nand.h into rawnand.h (preparing support for spi NANDs)
* Use NAND_MAX_ID_LEN where appropriate
* Fix support for 20nm Hynix chips

and the following driver changes:

* Various cleanup, improvements and fixes in the qcom driver
* Fixes for bugs detected by various static code analysis tools
* Fix mxc ooblayout definition
* Add a new part_parsers to tmio and sharpsl platform data in order to
  define a custom list of partition parsers
* Request the reset line in exclusive mode in the sunxi driver
* Fix a build error in the orion-nand driver when compiled for ARMv4
* Allow 64-bit mvebu platforms to select the PXA3XX driver

----------------------------------------------------------------
Abhishek Sahu (25):
      mtd: nand: qcom: fix config error for BCH
      mtd: nand: qcom: remove redundant chip select compatible string
      dt-bindings: qcom_nandc: remove chip select compatible string
      mtd: nand: qcom: reorganize nand page read
      mtd: nand: qcom: reorganize nand page write
      mtd: nand: qcom: remove memset for clearing read register buffer
      mtd: nand: qcom: reorganize nand devices probing
      mtd: nand: qcom: fix read failure without complete bootchain
      mtd: nand: qcom: support for NAND controller properties
      mtd: nand: qcom: add bam property for QPIC NAND controller
      mtd: nand: qcom: add and initialize QPIC DMA resources
      mtd: nand: qcom: DMA mapping support for register read buffer
      mtd: nand: qcom: allocate BAM transaction
      mtd: nand: qcom: add BAM DMA descriptor handling
      mtd: nand: qcom: support for passing flags in DMA helper functions
      mtd: nand: qcom: support for read location registers
      mtd: nand: qcom: erased codeword detection configuration
      mtd: nand: qcom: enable BAM or ADM mode
      mtd: nand: qcom: QPIC data descriptors handling
      mtd: nand: qcom: support for different DEV_CMD register offsets
      dt-bindings: qcom_nandc: fix the ipq806x device tree example
      dt-bindings: qcom_nandc: IPQ4019 QPIC NAND documentation
      dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
      mtd: nand: qcom: support for IPQ4019 QPIC NAND controller
      mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller

Andrea Adami (4):
      mtd: nand: sharpsl: Add partition parsers platform data
      mtd: nand: sharpsl: Register partitions using the parsers
      mfd: tmio: Add partition parsers platform data
      mtd: nand: tmio: Register partitions using the parsers

Arnd Bergmann (1):
      mtd: orion-nand: fix build error with ARMv4

Arvind Yadav (5):
      mtd: nand: denali: Handle return value of clk_prepare_enable.
      mtd: oxnas_nand: Handle clk_prepare_enable/clk_disable_unprepare.
      mtd: nand: lpc32xx_slc: Handle return value of clk_prepare_enable.
      mtd: nand: lpc32xx_mlc: Handle return value of clk_prepare_enable.
      mtd: st_spi_fsm: Handle clk_prepare_enable/clk_disable_unprepare.

Boris Brezillon (5):
      mtd: nand: Remove support for block locking/unlocking
      mtd: nand: Rename nand.h into rawnand.h
      mtd: nand: Fix various memory leaks in core
      mtd: nand: mxc: Fix mxc_v1 ooblayout
      Merge branch 'nand/rename-header-file' of git://git.infradead.org/l2-mtd into nand/next

Fabio Estevam (2):
      mtd: nand: vf610: Check the return value from clk_prepare_enable()
      mtd: nand: vf610: Remove unneeded pinctrl_pm_select_default_state()

Gregory CLEMENT (1):
      mtd: nand: pxa3xx_nand: enable building on mvebu 64-bit platforms

Gustavo A. R. Silva (2):
      mtd: nand: sh_flctl: fix error return code in flctl_probe()
      mtd: nand: mtk: fix error return code in mtk_ecc_probe()

Jean-Louis Thekekara (1):
      mtd: nand: remove hard-coded NAND ids length

Martin Blumenstingl (1):
      mtd: nand: hynix: add support for 20nm NAND chips

Pan Bian (1):
      mtd: nand: sh_flctl: use dma_mapping_error to check map errors

Philipp Zabel (1):
      mtd: nand: sunxi: explicitly request exclusive reset control

Sergei Shtylyov (1):
      mtd: nand: atmel: fix of_irq_get() error check

 Documentation/devicetree/bindings/mtd/qcom_nandc.txt |  65 +++-
 Documentation/driver-api/mtdnand.rst                 |   8 +-
 MAINTAINERS                                          |   2 +-
 arch/arm/mach-davinci/board-da850-evm.c              |   2 +-
 arch/arm/mach-davinci/board-dm355-evm.c              |   2 +-
 arch/arm/mach-davinci/board-dm355-leopard.c          |   2 +-
 arch/arm/mach-davinci/board-dm365-evm.c              |   2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c             |   2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c             |   2 +-
 arch/arm/mach-davinci/board-sffsdr.c                 |   2 +-
 arch/arm/mach-dove/dove-db-setup.c                   |   2 +-
 arch/arm/mach-ep93xx/snappercl15.c                   |   2 +-
 arch/arm/mach-ep93xx/ts72xx.c                        |   2 +-
 arch/arm/mach-imx/mach-qong.c                        |   2 +-
 arch/arm/mach-ixp4xx/ixdp425-setup.c                 |   2 +-
 arch/arm/mach-mmp/aspenite.c                         |   2 +-
 arch/arm/mach-omap1/board-fsample.c                  |   2 +-
 arch/arm/mach-omap1/board-h2.c                       |   2 +-
 arch/arm/mach-omap1/board-h3.c                       |   2 +-
 arch/arm/mach-omap1/board-nand.c                     |   2 +-
 arch/arm/mach-omap1/board-perseus2.c                 |   2 +-
 arch/arm/mach-orion5x/db88f5281-setup.c              |   2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c            |   2 +-
 arch/arm/mach-orion5x/ts209-setup.c                  |   2 +-
 arch/arm/mach-orion5x/ts78xx-setup.c                 |   2 +-
 arch/arm/mach-pxa/balloon3.c                         |   2 +-
 arch/arm/mach-pxa/em-x270.c                          |   2 +-
 arch/arm/mach-pxa/eseries.c                          |   2 +-
 arch/arm/mach-pxa/palmtx.c                           |   2 +-
 arch/arm/mach-pxa/tosa.c                             |   2 +-
 arch/arm/mach-s3c24xx/common-smdk.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c               |   2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                    |   2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c                   |   2 +-
 arch/arm/mach-s3c24xx/mach-jive.c                    |   2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c                   |   2 +-
 arch/blackfin/mach-bf537/boards/dnp5370.c            |   2 +-
 arch/blackfin/mach-bf537/boards/stamp.c              |   2 +-
 arch/blackfin/mach-bf561/boards/acvilon.c            |   2 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c       |   2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c       |   2 +-
 arch/mips/alchemy/devboards/db1200.c                 |   2 +-
 arch/mips/alchemy/devboards/db1300.c                 |   2 +-
 arch/mips/alchemy/devboards/db1550.c                 |   2 +-
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h      |   2 +-
 arch/mips/netlogic/xlr/platform-flash.c              |   2 +-
 arch/mips/pnx833x/common/platform.c                  |   2 +-
 arch/mips/rb532/devices.c                            |   2 +-
 arch/sh/boards/mach-migor/setup.c                    |   2 +-
 drivers/mtd/devices/st_spi_fsm.c                     |  20 +-
 drivers/mtd/inftlcore.c                              |   2 +-
 drivers/mtd/nand/Kconfig                             |   2 +-
 drivers/mtd/nand/ams-delta.c                         |   2 +-
 drivers/mtd/nand/atmel/nand-controller.c             |  15 +-
 drivers/mtd/nand/atmel/pmecc.c                       |   2 +-
 drivers/mtd/nand/au1550nd.c                          |   2 +-
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h       |   2 +-
 drivers/mtd/nand/bf5xx_nand.c                        |   2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c                 |   2 +-
 drivers/mtd/nand/cafe_nand.c                         |   2 +-
 drivers/mtd/nand/cmx270_nand.c                       |   2 +-
 drivers/mtd/nand/cs553x_nand.c                       |   2 +-
 drivers/mtd/nand/davinci_nand.c                      |   2 +-
 drivers/mtd/nand/denali.h                            |   2 +-
 drivers/mtd/nand/denali_dt.c                         |   4 +-
 drivers/mtd/nand/diskonchip.c                        |   2 +-
 drivers/mtd/nand/docg4.c                             |   2 +-
 drivers/mtd/nand/fsl_elbc_nand.c                     |   2 +-
 drivers/mtd/nand/fsl_ifc_nand.c                      |   2 +-
 drivers/mtd/nand/fsl_upm.c                           |   2 +-
 drivers/mtd/nand/fsmc_nand.c                         |   2 +-
 drivers/mtd/nand/gpio.c                              |   2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h               |   2 +-
 drivers/mtd/nand/hisi504_nand.c                      |   2 +-
 drivers/mtd/nand/jz4740_nand.c                       |   2 +-
 drivers/mtd/nand/jz4780_nand.c                       |   2 +-
 drivers/mtd/nand/lpc32xx_mlc.c                       |  11 +-
 drivers/mtd/nand/lpc32xx_slc.c                       |  11 +-
 drivers/mtd/nand/mpc5121_nfc.c                       |   2 +-
 drivers/mtd/nand/mtk_ecc.c                           |   4 +-
 drivers/mtd/nand/mtk_nand.c                          |   2 +-
 drivers/mtd/nand/mxc_nand.c                          |   9 +-
 drivers/mtd/nand/nand_amd.c                          |   2 +-
 drivers/mtd/nand/nand_base.c                         | 297 +++-----------
 drivers/mtd/nand/nand_bbt.c                          |   2 +-
 drivers/mtd/nand/nand_bch.c                          |   2 +-
 drivers/mtd/nand/nand_ecc.c                          |   2 +-
 drivers/mtd/nand/nand_hynix.c                        |   6 +-
 drivers/mtd/nand/nand_ids.c                          |   2 +-
 drivers/mtd/nand/nand_macronix.c                     |   2 +-
 drivers/mtd/nand/nand_micron.c                       |   2 +-
 drivers/mtd/nand/nand_samsung.c                      |   2 +-
 drivers/mtd/nand/nand_timings.c                      |   2 +-
 drivers/mtd/nand/nand_toshiba.c                      |   2 +-
 drivers/mtd/nand/nandsim.c                           |   2 +-
 drivers/mtd/nand/ndfc.c                              |   2 +-
 drivers/mtd/nand/nuc900_nand.c                       |   2 +-
 drivers/mtd/nand/omap2.c                             |   2 +-
 drivers/mtd/nand/orion_nand.c                        |   9 +-
 drivers/mtd/nand/oxnas_nand.c                        |  27 +-
 drivers/mtd/nand/pasemi_nand.c                       |   2 +-
 drivers/mtd/nand/plat_nand.c                         |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                       |   2 +-
 drivers/mtd/nand/qcom_nandc.c                        | 919 ++++++++++++++++++++++++++++++++++++--------
 drivers/mtd/nand/r852.h                              |   2 +-
 drivers/mtd/nand/s3c2410.c                           |   2 +-
 drivers/mtd/nand/sh_flctl.c                          |   8 +-
 drivers/mtd/nand/sharpsl.c                           |   4 +-
 drivers/mtd/nand/sm_common.c                         |   2 +-
 drivers/mtd/nand/socrates_nand.c                     |   2 +-
 drivers/mtd/nand/sunxi_nand.c                        |   4 +-
 drivers/mtd/nand/tango_nand.c                        |   2 +-
 drivers/mtd/nand/tmio_nand.c                         |   6 +-
 drivers/mtd/nand/txx9ndfmc.c                         |   2 +-
 drivers/mtd/nand/vf610_nfc.c                         |  11 +-
 drivers/mtd/nand/xway_nand.c                         |   2 +-
 drivers/mtd/nftlcore.c                               |   2 +-
 drivers/mtd/nftlmount.c                              |   2 +-
 drivers/mtd/ssfdc.c                                  |   2 +-
 drivers/mtd/tests/nandbiterrs.c                      |   2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c        |   2 +-
 fs/jffs2/wbuf.c                                      |   2 +-
 include/linux/mfd/tmio.h                             |   1 +
 include/linux/mtd/nand-gpio.h                        |   2 +-
 include/linux/mtd/{nand.h => rawnand.h}              |  28 +-
 include/linux/mtd/sh_flctl.h                         |   2 +-
 include/linux/mtd/sharpsl.h                          |   3 +-
 include/linux/platform_data/mtd-davinci.h            |   2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h       |   2 +-
 134 files changed, 1104 insertions(+), 590 deletions(-)
 rename include/linux/mtd/{nand.h => rawnand.h} (98%)
