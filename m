Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dViaB-0002g6-IZ
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 18:11:27 +0000
Received: by mail-pg0-x231.google.com with SMTP id j186so33291628pge.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2017 11:11:02 -0700 (PDT)
Date: Thu, 13 Jul 2017 11:10:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [GIT PULL] MTD updates for 4.13-rc1
Message-ID: <20170713181059.GA124323@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

This is a bit on the late side of the merge window, but here goes
anyway.

The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:

  Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170713

for you to fetch changes up to 7d84120b5ba61912a5333f5fe2c4e8f35ef9514f:

  Documentation: ABI: mtd: describe "offset" more precisely (2017-07-13 10:54:45 -0700)

----------------------------------------------------------------
MTD updates for v4.13-rc1:

General updates

 * Cleanups and additional flash support for "dataflash" driver
 * new driver for mchp23k256 SPI SRAM device
 * improve handling of MTDs without eraseblocks (i.e., MTD_NO_ERASE)
 * refactor and improve "sub-partition" handling with TRX partition
   parser; partitions can now be created as sub-partitions of another
   partition

SPI NOR updates, from Cyrille Pitchen and Marek Vasut:
 * introduce support to the SPI 1-2-2 and 1-4-4 protocols.
 * introduce support to the Double Data Rate (DDR) mode.
 * introduce support to the Octo SPI protocols.
 * add support to new memory parts for Spansion, Macronix and Winbond.
 * add fixes for the Aspeed, STM32 and Cadence QSPI controler drivers.
 * clean up the st_spi_fsm driver.

NAND updates, from Boris Brezillon:

 * addition of on-die ECC support to Micron driver
 * addition of helpers to help drivers choose most appropriate ECC
   settings
 * deletion of dead-code (cached programming and ->errstat() hook)
 * make sure drivers that do not support the SET/GET FEATURES command
   return ENOTSUPP use a dummy ->set/get_features implementation
   returning -ENOTSUPP (required for Micron on-die ECC)
 * change the semantic of ecc->write_page() for drivers setting the
   NAND_ECC_CUSTOM_PAGE_ACCESS flag
 * support exiting 'GET STATUS' command in default ->cmdfunc()
   implementations
 * change the prototype of ->setup_data_interface()

 A bunch of driver related changes:

 * various cleanup, fixes and improvements of the MTK driver
 * OMAP DT bindings fixes
 * support for ->setup_data_interface() in the fsmc driver
 * support for imx7 in the gpmi driver
 * finalization of the denali driver rework (thanks to Masahiro for the
   work he's done on this driver)
 * fix "bitflips in erased pages" handling in the ifc driver
 * addition of PM ops and dynamic timing configuration to the atmel
   driver

----------------------------------------------------------------
Alexander Couzens (1):
      mtd: nand: davinci: set ECC algorithm explicitly for HW based ECC

Alexander Sverdlin (1):
      mtd: spi-nor: Add support for mx66u51235f

Alexandre Belloni (1):
      mtd: nand: atmel: drop unused include

Andres Galacho (1):
      mtd: nand: tango: Export OF device ID table as module aliases

Andrew Lunn (1):
      mtd: mchp23k256: Add driver for this SPI SRAM device

Andrey Smirnov (6):
      mtd: dataflash: Replace C99 types with their kernel counterparts
      mtd: dataflash: Improve coding style in jedec_probe()
      mtd: dataflash: Replace pr_debug, printk with dev_* functions
      mtd: dataflash: Get rid of loop counter in jedec_probe()
      mtd: dataflash: Make use of "extened device information"
      mtd: dataflash: Add flash_info for AT45DB641E

Arnd Bergmann (2):
      mtd: nand: atmel: mark resume function __maybe_unused
      mtd: spi-nor: cqspi: remove duplicate const

Arvind Yadav (2):
      mtd: nand: orion: Handle return value of clk_prepare_enable
      mtd: spi-nor: cqspi: make of_device_ids const

Benjamin Herrenschmidt (1):
      spi-nor: Add Winbond w25m512jv

Boris Brezillon (16):
      mtd: nand: jz4780: Use mtd_set_ooblayout() to set the ooblayout
      mtd: nand: Make sure drivers not supporting SET/GET_FEATURES return -ENOTSUPP
      mtd: nand: gpmi: Fix gpmi_nand_init() error path
      mtd: nand: gpmi: Kill gpmi_nand_exit()
      mtd: nand: Pass the CS line to ->setup_data_interface()
      mtd: nand: atmel: Add ->setup_data_interface() hooks
      mtd: nand: atmel: Add PM ops
      mtd: nand: Drop unused cached programming support
      mtd: nand: Drop the ->errstat() hook
      mtd: nand: sunxi: Actually use DMA for subpage reads
      mtd: nand: sunxi: Remove unneeded ->cmdfunc(NAND_CMD_READ0, 0, page)
      mtd: nand: tango: Fix incorrect use of SEQIN command
      mtd: nand: Wait for PAGEPROG to finish in drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS
      mtd: nand: Support 'EXIT GET STATUS' command in nand_command[_lp]()
      mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
      mtd: Fix check in mtd_unpoint()

Brian Norris (13):
      Merge 'v4.12-rc1' into MTD
      mtd: spi-nor: stm32-quadspi: allow building with COMPILE_TEST
      mtd: nand: don't leak buffers when ->scan_bbt() fails
      mtd: nand: drop unneeded module.h include
      mtd: nand: free vendor-specific resources in init failure paths
      mtd: nand: samsung: warn about un-parseable ECC info
      Merge tag 'nand/fixes-for-4.12-rc3' of git://git.infradead.org/linux-mtd into MTD
      Merge MTD fixes into -next
      dt-bindings: mtd: make partitions doc a bit more generic
      mtd: partitions: factor out code calling parser
      mtd: partitions: fixup some allocate_partition() whitespace
      Merge tag 'spi-nor/for-4.13' into MTD
      Merge tag 'nand/for-4.13' into MTD

Chris Packham (5):
      mtd: mchp23k256: Add OF device ID table
      mtd: mchp23k256: switch to mtd_device_register()
      mtd: mchp23k256: add partitioning support
      mtd: mchp23k256: Add support for mchp23lcv1024
      mtd: handle partitioning on devices with 0 erasesize

Colin Ian King (1):
      mtd: nand: make nand_ooblayout_lp_hamming_ops static

Cyrille Pitchen (7):
      mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4 protocols
      mtd: m25p80: add support of SPI 1-2-2 and 1-4-4 protocols
      mtd: spi-nor: introduce Double Transfer Rate (DTR) SPI protocols
      mtd: spi-nor: introduce Octo SPI protocols
      mtd: spi-nor: stm32-quadspi: fix compiler errors with COMPILE_TEST
      MAINTAINERS: Update SPI NOR subsystem git repositories
      mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use SPINOR_OP_RDCR instead

Cédric Le Goater (4):
      mtd: spi-nor: Add support for Macronix mx66l1g45g spi flash
      mtd: spi-nor: add Dual and Quad read mode support to some flash devices
      mtd: spi-nor: aspeed: remove dummies from keep mask
      mtd: spi-nor: aspeed: configure chip window on AHB bus

Dan Carpenter (2):
      mtd: spi-nor: Potential oops on error path in quad_enable()
      mtd: nand: mtk: release lock on error path

Ezequiel Garcia (2):
      mtd: nand: Add Hisilicon machine dependency
      mtd: nand: Add Mediatek machine dependency

Harry Chou (1):
      mtd: spi-nor: Add support for Spansion S25FL064L

Julia Lawall (2):
      mtd: cfi_cmdset_0020: Drop unnecessary static
      mtd: physmap_of: Drop unnecessary static

Marc Gonzalez (1):
      mtd: nand: tango: Update ecc_stats.corrected

Masahiro Yamada (25):
      mtd: nand: check ecc->total sanity in nand_scan_tail
      mtd: nand: denali_dt: clean up resource ioremap
      mtd: nand: denali: use BIT() and GENMASK() for register macros
      mtd: nand: add generic helpers to check, match, maximize ECC settings
      mtd: nand: add a shorthand to generate nand_ecc_caps structure
      mtd: nand: denali: avoid hard-coding ECC step, strength, bytes
      mtd: nand: denali: remove Toshiba and Hynix specific fixup code
      mtd: nand: denali_dt: add compatible strings for UniPhier SoC variants
      mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
      mtd: nand: denali: remove unneeded find_valid_banks()
      mtd: nand: denali: handle timing parameters by setup_data_interface()
      mtd: nand: denali: rework interrupt handling
      mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
      mtd: nand: denali: fix bank reset function to detect the number of chips
      mtd: nand: denali: use interrupt instead of polling for bank reset
      mtd: nand: denali: propagate page to helpers via function argument
      mtd: nand: denali: merge struct nand_buf into struct denali_nand_info
      mtd: nand: denali: use flag instead of register macro for direction
      mtd: nand: denali: fix raw and oob accessors for syndrome page layout
      mtd: nand: denali: support hardware-assisted erased page detection
      mtd: nand: denali: skip driver internal bounce buffer when possible
      mtd: nand: denali: use non-managed kmalloc() for DMA buffer
      mtd: nand: denali: enable bad block table scan
      mtd: nand: denali: avoid magic numbers and rename for clarification
      MAINTAINERS: add entry for Denali NAND controller driver

Matthias Lange (2):
      mtd: nand: gpmi: Fix typo in data structure name
      mtd: nand: gpmi: fix typo in comment

Pavel Machek (1):
      mtd: nand: Optimize checking of erased buffers

Prabhakar Kushwaha (1):
      mtd: nand: ifc: Initialize SRAM for all version >= 1.0

Rafał Miłecki (8):
      mtd: partitions: add helper for deleting partition
      mtd: partitions: remove sysfs files when deleting all master's partitions
      mtd: partitions: rename "master" to the "parent" where appropriate
      mtd: partitions: add support for subpartitions
      mtd: partitions: add support for partition parsers
      mtd: extract TRX parser out of bcm47xxpart into a separated module
      mtd: parsers: trx: fix pr_err format for printing offset
      Documentation: ABI: mtd: describe "offset" more precisely

Stefan Agner (3):
      mtd: nand: gpmi: unify clock handling
      mtd: nand: gpmi: add i.MX 7 SoC support
      mtd: gpmi: document current clock requirements

Thomas Petazzoni (8):
      mtd: nand: fsmc: reduce number of arguments of fsmc_nand_setup()
      mtd: nand: fsmc: add support for SDR timings
      mtd: nand: fsmc: remove default timings
      dt-bindings: mtd: document new "on-die" nand-ecc-mode
      mtd: nand: add core support for on-die ECC
      mtd: nand: export nand_{read,write}_page_raw()
      mtd: nand: add support for Micron on-die ECC
      mtd: nand: fsmc_nand: handle on-die ECC case

Tom Rini (2):
      dt-bindings: mtd: elm: Correct compatible string requirement
      dt-bindings: gpmc: Correct location of generic gpmc binding

Xiaolei Li (10):
      mtd: nand: mediatek: update DT bindings
      mtd: nand: mediatek: refine register NFI_PAGEFMT setting
      mtd: nand: mediatek: add support for different MTK NAND FLASH Controller IP
      mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller
      mtd: subpagetest: fix wrong written check in function write_eraseblock2
      mtd: nand: mtk: fix incorrect register setting order about ecc irq
      mtd: nand: mtk: disable ecc irq when writing page with hwecc
      mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from mtk_nfc_resume
      mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from mtk_ecc_resume
      mtd: nand: mtk: add ->setup_data_interface() hook

 Documentation/ABI/testing/sysfs-class-mtd          |    6 +-
 .../devicetree/bindings/mtd/denali-nand.txt        |   13 +
 Documentation/devicetree/bindings/mtd/elm.txt      |    2 +-
 .../devicetree/bindings/mtd/gpmc-nand.txt          |    2 +-
 Documentation/devicetree/bindings/mtd/gpmc-nor.txt |    4 +-
 .../devicetree/bindings/mtd/gpmc-onenand.txt       |    2 +-
 .../devicetree/bindings/mtd/gpmi-nand.txt          |   14 +-
 .../bindings/mtd/microchip,mchp23k256.txt          |   18 +
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |    5 +-
 Documentation/devicetree/bindings/mtd/nand.txt     |    2 +-
 .../devicetree/bindings/mtd/partition.txt          |   32 +-
 Documentation/devicetree/bindings/net/gpmc-eth.txt |    4 +-
 MAINTAINERS                                        |    9 +-
 drivers/mtd/Kconfig                                |    4 +
 drivers/mtd/Makefile                               |    1 +
 drivers/mtd/bcm47xxpart.c                          |   99 +-
 drivers/mtd/chips/cfi_cmdset_0020.c                |    2 +-
 drivers/mtd/devices/Kconfig                        |   10 +
 drivers/mtd/devices/Makefile                       |    1 +
 drivers/mtd/devices/m25p80.c                       |  121 +-
 drivers/mtd/devices/mchp23k256.c                   |  236 +++
 drivers/mtd/devices/mtd_dataflash.c                |  200 ++-
 drivers/mtd/devices/serial_flash_cmds.h            |    1 -
 drivers/mtd/devices/st_spi_fsm.c                   |    4 +-
 drivers/mtd/maps/physmap_of_gemini.c               |    2 +-
 drivers/mtd/mtdcore.c                              |    2 +-
 drivers/mtd/mtdpart.c                              |  370 ++--
 drivers/mtd/nand/Kconfig                           |    3 +
 drivers/mtd/nand/atmel/nand-controller.c           |  354 +++-
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c       |    2 +
 drivers/mtd/nand/cafe_nand.c                       |    2 +
 drivers/mtd/nand/davinci_nand.c                    |    3 +
 drivers/mtd/nand/denali.c                          | 1831 +++++++++-----------
 drivers/mtd/nand/denali.h                          |  315 ++--
 drivers/mtd/nand/denali_dt.c                       |   53 +-
 drivers/mtd/nand/denali_pci.c                      |   26 +-
 drivers/mtd/nand/docg4.c                           |    2 +
 drivers/mtd/nand/fsl_elbc_nand.c                   |    2 +
 drivers/mtd/nand/fsl_ifc_nand.c                    |   81 +-
 drivers/mtd/nand/fsmc_nand.c                       |  122 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |    6 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |   75 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |   13 +-
 drivers/mtd/nand/hisi504_nand.c                    |    2 +
 drivers/mtd/nand/jz4780_nand.c                     |    2 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |    2 +
 drivers/mtd/nand/mtk_ecc.c                         |  228 +--
 drivers/mtd/nand/mtk_ecc.h                         |    2 +-
 drivers/mtd/nand/mtk_nand.c                        |  279 +--
 drivers/mtd/nand/mxc_nand.c                        |   12 +-
 drivers/mtd/nand/nand_base.c                       |  395 ++++-
 drivers/mtd/nand/nand_ids.c                        |    1 -
 drivers/mtd/nand/nand_micron.c                     |  222 +++
 drivers/mtd/nand/nand_samsung.c                    |    3 +
 drivers/mtd/nand/orion_nand.c                      |    6 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |    2 +
 drivers/mtd/nand/qcom_nandc.c                      |    2 +
 drivers/mtd/nand/s3c2410.c                         |    5 +-
 drivers/mtd/nand/sh_flctl.c                        |    2 +
 drivers/mtd/nand/sunxi_nand.c                      |    9 +-
 drivers/mtd/nand/tango_nand.c                      |   45 +-
 drivers/mtd/nand/vf610_nfc.c                       |    2 +
 drivers/mtd/parsers/Kconfig                        |    8 +
 drivers/mtd/parsers/Makefile                       |    1 +
 drivers/mtd/parsers/parser_trx.c                   |  126 ++
 drivers/mtd/spi-nor/Kconfig                        |    2 +-
 drivers/mtd/spi-nor/aspeed-smc.c                   |  183 +-
 drivers/mtd/spi-nor/atmel-quadspi.c                |   83 +-
 drivers/mtd/spi-nor/cadence-quadspi.c              |   20 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |    6 +-
 drivers/mtd/spi-nor/hisi-sfc.c                     |   31 +-
 drivers/mtd/spi-nor/intel-spi.c                    |    7 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  |   15 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |   22 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  488 ++++--
 drivers/mtd/spi-nor/stm32-quadspi.c                |   32 +-
 drivers/mtd/tests/subpagetest.c                    |    2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    2 +
 include/linux/mtd/nand.h                           |   80 +-
 include/linux/mtd/partitions.h                     |    7 +
 include/linux/mtd/spi-nor.h                        |  161 +-
 81 files changed, 4326 insertions(+), 2227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
 create mode 100644 drivers/mtd/devices/mchp23k256.c
 create mode 100644 drivers/mtd/parsers/Kconfig
 create mode 100644 drivers/mtd/parsers/Makefile
 create mode 100644 drivers/mtd/parsers/parser_trx.c
