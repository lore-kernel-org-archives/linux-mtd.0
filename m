Received: from [163.172.101.56] (helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dqbtT-000799-IX
 for linux-mtd@lists.infradead.org; Sat, 09 Sep 2017 09:17:42 +0000
Date: Sat, 9 Sep 2017 08:13:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marex@denx.de>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD updates for 4.14
Message-ID: <20170909081316.5fec6fc1@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

As Brian mentioned in his last fixes PR, I'll be handling the MTD
subsystem for this release. Here are the MTD changes queued for 4.14.

Regards,

Boris

The following changes since commit cc4a41fe5541a73019a864883297bd5043aa6d98:

  Linux 4.13-rc7 (2017-08-27 17:20:40 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170904

for you to fetch changes up to d1f936d73683a540227cca3aaecdb68b6c3d53c5:

  Merge tag 'nand/for-4.14' of git://git.infradead.org/l2-mtd into mtd/next=
 (2017-09-01 15:34:30 +0200)

----------------------------------------------------------------
MTD changes for 4.14:

General updates:
 * Constify pci_device_id in various drivers
 * Constify device_type
 * Remove pad control code from the Gemini driver
 * Use %pOF to print OF node full_name
 * Various fixes in the physmap_of driver
 * Remove unused vars in mtdswap
 * Check devm_kzalloc() return value in the spear_smi driver
 * Check clk_prepare_enable() return code in the st_spi_fsm driver
 * Create per MTD device debugfs enties

NAND updates, from Boris Brezillon:
 * Fix memory leaks in the core
 * Remove unused NAND locking support
 * Rename nand.h into rawnand.h (preparing support for spi NANDs)
 * Use NAND_MAX_ID_LEN where appropriate
 * Fix support for 20nm Hynix chips
 * Fix support for Samsung and Hynix SLC NANDs
 * Various cleanup, improvements and fixes in the qcom driver
 * Fixes for bugs detected by various static code analysis tools
 * Fix mxc ooblayout definition
 * Add a new part_parsers to tmio and sharpsl platform data in order to
   define a custom list of partition parsers
 * Request the reset line in exclusive mode in the sunxi driver
 * Fix a build error in the orion-nand driver when compiled for ARMv4
 * Allow 64-bit mvebu platforms to select the PXA3XX driver

SPI NOR updates, from Cyrille Pitchen and Marek Vasut:
 * add support to the JEDEC JESD216B specification (SFDP tables).
 * add support to the Intel Denverton SPI flash controller.
 * fix error recovery for Spansion/Cypress SPI NOR memories.
 * fix 4-byte address management for the Aspeed SPI controller.
 * add support to some Microchip SST26 memory parts
 * remove unneeded pinctrl header Write a message for tag:

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

Alexander Sverdlin (1):
      mtd: spi-nor: Recover from Spansion/Cypress errors

Andrea Adami (4):
      mtd: nand: sharpsl: Add partition parsers platform data
      mtd: nand: sharpsl: Register partitions using the parsers
      mfd: tmio: Add partition parsers platform data
      mtd: nand: tmio: Register partitions using the parsers

Arnd Bergmann (2):
      mtd: only use __xipram annotation when XIP_KERNEL is set
      mtd: orion-nand: fix build error with ARMv4

Arvind Yadav (11):
      mtd: ichxrom: constify pci_device_id.
      mtd: amd76xrom: constify pci_device_id.
      mtd: esb2rom: constify pci_device_id.
      mtd: ck804xrom: constify pci_device_id.
      mtd: intel_vr_nor: constify pci_device_id.
      mtd: pci: constify pci_device_id.
      mtd: nand: denali: Handle return value of clk_prepare_enable.
      mtd: oxnas_nand: Handle clk_prepare_enable/clk_disable_unprepare.
      mtd: nand: lpc32xx_slc: Handle return value of clk_prepare_enable.
      mtd: nand: lpc32xx_mlc: Handle return value of clk_prepare_enable.
      mtd: st_spi_fsm: Handle clk_prepare_enable/clk_disable_unprepare.

Bhumika Goyal (1):
      mtd: make device_type const

Boris Brezillon (8):
      mtd: nand: Remove support for block locking/unlocking
      mtd: nand: Rename nand.h into rawnand.h
      mtd: nand: Fix various memory leaks in core
      mtd: nand: mxc: Fix mxc_v1 ooblayout
      Merge branch 'nand/rename-header-file' of git://git.infradead.org/l2-=
mtd into nand/next
      Merge tag 'v4.13-rc7' into mtd/next
      Merge tag 'spi-nor/for-4.14' of git://git.infradead.org/l2-mtd into m=
td/next
      Merge tag 'nand/for-4.14' of git://git.infradead.org/l2-mtd into mtd/=
next

Brian Norris (1):
      mtd: mtdswap: remove unused variables 'dev' and 'gd'

Christophe Jaillet (1):
      mtd: physmap_of: Fix resources leak in 'of_flash_probe()'

Claudiu Beznea (1):
      mtd: spi-nor: add support for Microchip sst26vf064b QSPI memory

Cyrille Pitchen (1):
      mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables

C=C3=A9dric Le Goater (1):
      mtd: spi-nor: aspeed: set 4B setting for all chips

Fabio Estevam (4):
      mtd: atmel-quadspi: Remove unneeded pinctrl header
      mtd: mtk-quadspi: Remove unneeded pinctrl header
      mtd: nand: vf610: Check the return value from clk_prepare_enable()
      mtd: nand: vf610: Remove unneeded pinctrl_pm_select_default_state()

Gregory CLEMENT (1):
      mtd: nand: pxa3xx_nand: enable building on mvebu 64-bit platforms

Gustavo A. R. Silva (3):
      mtd: spear_smi: add NULL check on devm_kzalloc() return value
      mtd: nand: sh_flctl: fix error return code in flctl_probe()
      mtd: nand: mtk: fix error return code in mtk_ecc_probe()

Jean-Louis Thekekara (1):
      mtd: nand: remove hard-coded NAND ids length

Julia Lawall (1):
      mtd: physmap_of: Drop unnecessary static

Linus Walleij (1):
      mtd: physmap_of: Retire Gemini pad control

Lothar Wa=C3=9Fmann (2):
      mtd: nand: make Samsung SLC NAND usable again
      mtd: nand: complain loudly when chip->bits_per_cell is not correctly =
initialized

Mario Rugiero (1):
      mtd: create per-device and module-scope debugfs entries

Martin Blumenstingl (1):
      mtd: nand: hynix: add support for 20nm NAND chips

Matthew Gerlach (1):
      mtd: spi-nor: fix "No newline at end of file"

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Denverton SPI serial f=
lash controller

Pan Bian (1):
      mtd: nand: sh_flctl: use dma_mapping_error to check map errors

Philipp Zabel (1):
      mtd: nand: sunxi: explicitly request exclusive reset control

Rob Herring (1):
      mtd: Convert to using %pOF instead of full_name

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
 drivers/mtd/devices/docg3.c                          |  49 +--
 drivers/mtd/devices/docg3.h                          |   2 -
 drivers/mtd/devices/spear_smi.c                      |   2 +
 drivers/mtd/devices/st_spi_fsm.c                     |  20 +-
 drivers/mtd/inftlcore.c                              |   2 +-
 drivers/mtd/maps/amd76xrom.c                         |   4 +-
 drivers/mtd/maps/ck804xrom.c                         |   4 +-
 drivers/mtd/maps/esb2rom.c                           |   4 +-
 drivers/mtd/maps/ichxrom.c                           |   4 +-
 drivers/mtd/maps/intel_vr_nor.c                      |   2 +-
 drivers/mtd/maps/pci.c                               |   2 +-
 drivers/mtd/maps/physmap_of_core.c                   |   8 +-
 drivers/mtd/maps/physmap_of_gemini.c                 |  16 -
 drivers/mtd/maps/physmap_of_versatile.c              |   2 +-
 drivers/mtd/maps/sun_uflash.c                        |   4 +-
 drivers/mtd/mtdcore.c                                |  18 +-
 drivers/mtd/mtdswap.c                                |  21 +-
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
 drivers/mtd/nand/nand_base.c                         | 304 +++------------
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
 drivers/mtd/nand/nandsim.c                           |  51 +--
 drivers/mtd/nand/ndfc.c                              |   2 +-
 drivers/mtd/nand/nuc900_nand.c                       |   2 +-
 drivers/mtd/nand/omap2.c                             |   2 +-
 drivers/mtd/nand/orion_nand.c                        |   9 +-
 drivers/mtd/nand/oxnas_nand.c                        |  27 +-
 drivers/mtd/nand/pasemi_nand.c                       |   2 +-
 drivers/mtd/nand/plat_nand.c                         |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                       |   2 +-
 drivers/mtd/nand/qcom_nandc.c                        | 919 +++++++++++++++=
+++++++++++++++++++++--------
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
 drivers/mtd/ofpart.c                                 |  23 +-
 drivers/mtd/spi-nor/Kconfig                          |  16 +
 drivers/mtd/spi-nor/Makefile                         |   3 +-
 drivers/mtd/spi-nor/aspeed-smc.c                     |  13 +-
 drivers/mtd/spi-nor/atmel-quadspi.c                  |   1 -
 drivers/mtd/spi-nor/hisi-sfc.c                       |   8 +-
 drivers/mtd/spi-nor/intel-spi-pci.c                  |  82 ++++
 drivers/mtd/spi-nor/mtk-quadspi.c                    |   1 -
 drivers/mtd/spi-nor/spi-nor.c                        | 805 +++++++++++++++=
++++++++++++++++++++++-
 drivers/mtd/ssfdc.c                                  |   2 +-
 drivers/mtd/tests/nandbiterrs.c                      |   2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c        |   2 +-
 fs/jffs2/wbuf.c                                      |   2 +-
 include/asm-generic/vmlinux.lds.h                    |   1 +
 include/linux/mfd/tmio.h                             |   1 +
 include/linux/mtd/mtd.h                              |  10 +
 include/linux/mtd/nand-gpio.h                        |   2 +-
 include/linux/mtd/{nand.h =3D> rawnand.h}              |  30 +-
 include/linux/mtd/sh_flctl.h                         |   2 +-
 include/linux/mtd/sharpsl.h                          |   3 +-
 include/linux/mtd/spi-nor.h                          |  11 +
 include/linux/mtd/xip.h                              |  10 +-
 include/linux/platform_data/mtd-davinci.h            |   2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h       |   2 +-
 162 files changed, 2113 insertions(+), 765 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/intel-spi-pci.c
 rename include/linux/mtd/{nand.h =3D> rawnand.h} (98%)
