Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8gCP-0005nr-Jp
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 04:59:39 +0000
Received: by mail-pg0-x242.google.com with SMTP id u187so2073618pgb.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 May 2017 21:59:15 -0700 (PDT)
Date: Wed, 10 May 2017 21:59:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [GIT PULL] MTD updates for 4.12-rc1
Message-ID: <20170511045912.GA3047@google.com>
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

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170510

for you to fetch changes up to a9402889f41cc2db7a9b162990bef271be098ff0:

  MAINTAINERS: Update NAND subsystem git repositories (2017-05-10 18:22:38 -0700)

----------------------------------------------------------------
MTD updates for 4.12-rc1:

NAND, from Boris:
"""
 - some minor fixes/improvements on existing drivers (fsmc, gpio, ifc,
   davinci, brcmnand, omap)
 - a huge cleanup/rework of the denali driver accompanied with core
   fixes/improvements to simplify the driver code
 - a complete rewrite of the atmel driver to support new DT bindings
   make future evolution easier
 - the addition of per-vendor detection/initialization steps to avoid
   extending the nand_ids table with more extended-id entries
"""

SPI NOR, from Cyrille:
"""
- fixes in the hisi SPI controller driver.
- fixes in the intel SPI controller driver.
- fixes in the Mediatek SPI controller driver.
- fixes to some SPI flash memories not supported the Chip Erase command.
- add support to some new memory parts (Winbond, Macronix, Micron, ESMT).
- add new driver for the STM32 QSPI controller.
"""

And a few fixes for Gemini and Versatile platforms on physmap-of

----------------------------------------------------------------
Alexander Couzens (1):
      mtd: nand: add ooblayout for old hamming layout

Alexander Kurz (2):
      drivers mtd: spi-nor: add Winbond W25Q20 variants
      drivers mtd: spi-nor: add Macronix MX25Ux033E and MX25Ux035 variants

Alexey Khoroshilov (1):
      mtd: spi-nor: hisi: do not ignore clk_prepare_enable() failure

Alison Wang (2):
      memory: ifc: Update dependency of IFC for LS1021A
      mtd: nand: Update dependency of IFC for LS1021A

Boris Brezillon (21):
      mtd: nand: Get rid of the mtd parameter in all auto-detection functions
      mtd: nand: Store nand ID in struct nand_chip
      mtd: nand: Get rid of busw parameter
      mtd: nand: Rename nand_get_flash_type() into nand_detect()
      mtd: nand: Rename the nand_manufacturers struct
      mtd: nand: Kill the MTD_NAND_IDS Kconfig option
      mtd: nand: Do not expose the NAND manufacturer table directly
      mtd: nand: Add manufacturer specific initialization/detection steps
      mtd: nand: Move Samsung specific init/detection logic in nand_samsung.c
      mtd: nand: Move Hynix specific init/detection logic in nand_hynix.c
      mtd: nand: Move Toshiba specific init/detection logic in nand_toshiba.c
      mtd: nand: Move Micron specific init logic in nand_micron.c
      mtd: nand: Move AMD/Spansion specific init/detection logic in nand_amd.c
      mtd: nand: Move Macronix specific initialization in nand_macronix.c
      mtd: nand: hynix: Rework NAND ID decoding to extract more information
      mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs
      mtd: nand: tango: Enforce DMA direction type
      mtd: nand: Cleanup/rework the atmel_nand driver
      mtd: nand: atmel: Document the new DT bindings
      mtd: nand: Remove unused chip->write_page() hook
      MAINTAINERS: Update NAND subsystem git repositories

Brian Norris (2):
      Merge tag 'nand/for-4.12' of github.com:linux-nand/linux into MTD
      Merge tag 'spi-nor/for-4.12-v2' of git://github.com/spi-nor/linux into MTD

Christophe Jaillet (1):
      mtd: nand: NULL terminate a of_device_id table

Christophe Leroy (2):
      mtd: nand: gpio: make nCE GPIO optional
      mtd: nand: gpio: update binding

Colin Ian King (2):
      mtd: nand: nandsim: fix spelling mistake: "weakpagess" -> "weakpages"
      jffs2: fix spelling mistake: "requestied" -> "requested"

Cyrille Pitchen (1):
      MAINTAINERS: change email address from atmel.com to wedev4u.fr

Dan Carpenter (3):
      mtd: nand: hynix: Fix an error code in init
      mtd: nand: Fix a couple error codes
      mtd: oxnas_nand: Allocating more than necessary in probe()

Geliang Tang (1):
      mtd: mtdswap: use MTDSWAP_ECNT_MIN/MAX

Guochun Mao (1):
      mtd: mtk-nor: set controller's address width according to nor flash

Hans de Goede (1):
      mtd: nand: samsung: Retrieve ECC requirements from extended ID

Joe Perches (1):
      drivers/mtd: Convert remaining uses of pr_warning to pr_warn

Kamal Dasu (1):
      mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program

L. D. Pinney (1):
      mtd: spi-nor: Add support for ESMT F25L32QA and F25L64QA

Linus Walleij (1):
      mtd: physmap_of: really fix the physmap add-ons

Ludovic Barre (2):
      mtd: spi-nor: add driver for STM32 quad spi flash controller
      dt-bindings: mtd: Document the STM32 QSPI bindings

Masahiro Yamada (31):
      mtd: nand: allow to set only one of ECC size and ECC strength from DT
      mtd: nand: use read_oob() instead of cmdfunc() for bad block check
      mtd: nand: denali: remove unused CONFIG option and macros
      mtd: nand: denali: remove redundant define of BANK(x)
      mtd: nand: denali: remove more unused struct members
      mtd: nand: denali: fix comment of denali_nand_info::flash_mem
      mtd: nand: denali: consolidate INTR_STATUS__* and INTR_EN__* macros
      mtd: nand: denali: introduce capability flag
      mtd: nand: denali: use int where no reason to use fixed width variable
      mtd: nand: do not check R/B# for CMD_READID in nand_command(_lp)
      mtd: nand: do not check R/B# for CMD_SET_FEATURES in nand_command(_lp)
      mtd: nand: denali: use nand_chip to hold frequently accessed data
      mtd: nand: denali: call nand_set_flash_node() to set DT node
      mtd: nand: denali: move multi device fixup code to a helper function
      mtd: nand: denali: simplify multi device fixup code
      mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
      mtd: nand: denali: remove meaningless writes to read-only registers
      mtd: nand: denali: remove unnecessary writes to ECC_CORRECTION
      mtd: nand: relax ecc.read_page() return value for uncorrectable ECC
      mtd: nand: denali: allow to override mtd->name from label DT property
      mtd: nand: denali: remove meaningless pipeline read-ahead operation
      mtd: nand: denali: fix bitflips calculation in handle_ecc()
      mtd: nand: denali: fix erased page checking
      mtd: nand: denali: support HW_ECC_FIXUP capability
      mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
      mtd: nand: denali: support 64bit capable DMA engine
      mtd: nand: denali_dt: remove dma-mask DT property
      mtd: nand: denali_dt: use pdev instead of ofdev for platform_device
      mtd: nand: denali: allow to override revision number
      mtd: nand: allocate aligned buffers if NAND_OWN_BUFFERS is unset
      mtd: nand: allow drivers to request minimum alignment for passed buffer

Mathias Kresin (1):
      mtd: spi-nor: enable stateless 4b op codes for mx25u25635f

Nicholas Mc Guire (2):
      mtd: spi-nor: intel: use true/false for boolean
      mtd: spi-nor: intel: use ERR_CAST in return statement

Nobuhiro Iwamatsu (1):
      mtd: spi-nor: Add support for N25Q256A11

Philipp Zabel (1):
      mtd: nand: sunxi: simplify optional reset handling

Rafał Miłecki (2):
      mtd: use dev_of_node helper in mtd_get_of_node
      mtd: physmap_of: use OF helpers for reading strings

Roger Quadros (1):
      mtd: nand: omap2: Fix partition creation via cmdline mtdparts

Sekhar Nori (1):
      mtd: nand: davinci: add comment on NAND subpage write status on keystone

Simon Baatz (2):
      mtd: nand: orion: fix clk handling
      mtd: nand: orion: improve handling of optional clock

Thomas Petazzoni (11):
      mtd: nand: fsmc: fix NAND width handling
      mtd: nand: fsmc: move fsmc_nand_data definition
      mtd: nand: fsmc: remove ->select_bank() from fsmc_nand_platform_data
      mtd: nand: fsmc: remove fsmc_select_chip()
      mtd: nand: fmsc: kill {read, write}_dma_priv from fsmc_nand_platform_data
      mtd: nand: fsmc: kill {nr_, }partitions structure fields
      mtd: nand: fsmc: remove duplicate nand_set_flash_node()
      mtd: nand: fsmc: finally remove fsmc_nand_platform_data
      mtd: nand: fsmc: use devm_clk_get()
      mtd: nand: fsmc: remove unused definitions
      mtd: nand: fsmc: remove CONFIG_OF conditional

mar.krzeminski (2):
      mtd: spi-nor: Fix whole chip erasing for stacked chips.
      mtd: spi-nor: Disable chip erase for Micron n25q00.

 .../devicetree/bindings/mtd/atmel-nand.txt         |  107 +-
 .../devicetree/bindings/mtd/denali-nand.txt        |    7 +-
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |    4 +-
 .../devicetree/bindings/mtd/stm32-quadspi.txt      |   43 +
 MAINTAINERS                                        |   13 +-
 arch/cris/arch-v32/drivers/Kconfig                 |    1 -
 drivers/memory/Kconfig                             |    2 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   12 +-
 drivers/mtd/maps/Makefile                          |   10 +-
 .../mtd/maps/{physmap_of.c => physmap_of_core.c}   |   30 +-
 drivers/mtd/mtdswap.c                              |    6 +-
 drivers/mtd/nand/Kconfig                           |   23 +-
 drivers/mtd/nand/Makefile                          |   11 +-
 drivers/mtd/nand/atmel/Makefile                    |    4 +
 drivers/mtd/nand/atmel/nand-controller.c           | 2197 +++++++++++++++++
 drivers/mtd/nand/atmel/pmecc.c                     | 1020 ++++++++
 drivers/mtd/nand/atmel/pmecc.h                     |   73 +
 drivers/mtd/nand/atmel_nand.c                      | 2479 --------------------
 drivers/mtd/nand/atmel_nand_ecc.h                  |  163 --
 drivers/mtd/nand/atmel_nand_nfc.h                  |  103 -
 drivers/mtd/nand/brcmnand/brcmnand.c               |   61 +-
 drivers/mtd/nand/cmx270_nand.c                     |    4 +-
 drivers/mtd/nand/davinci_nand.c                    |   11 +
 drivers/mtd/nand/denali.c                          |  567 +++--
 drivers/mtd/nand/denali.h                          |  192 +-
 drivers/mtd/nand/denali_dt.c                       |   74 +-
 drivers/mtd/nand/fsmc_nand.c                       |  236 +-
 drivers/mtd/nand/gpio.c                            |   18 +-
 drivers/mtd/nand/nand_amd.c                        |   51 +
 drivers/mtd/nand/nand_base.c                       |  588 +++--
 drivers/mtd/nand/nand_hynix.c                      |  631 +++++
 drivers/mtd/nand/nand_ids.c                        |   39 +-
 drivers/mtd/nand/nand_macronix.c                   |   30 +
 drivers/mtd/nand/nand_micron.c                     |   86 +
 drivers/mtd/nand/nand_samsung.c                    |  112 +
 drivers/mtd/nand/nand_toshiba.c                    |   51 +
 drivers/mtd/nand/nandsim.c                         |    2 +-
 drivers/mtd/nand/omap2.c                           |    9 +
 drivers/mtd/nand/orion_nand.c                      |   48 +-
 drivers/mtd/nand/oxnas_nand.c                      |    2 +-
 drivers/mtd/nand/sunxi_nand.c                      |   20 +-
 drivers/mtd/nand/tango_nand.c                      |    8 +-
 drivers/mtd/ofpart.c                               |    4 +-
 drivers/mtd/spi-nor/Kconfig                        |    7 +
 drivers/mtd/spi-nor/Makefile                       |    1 +
 drivers/mtd/spi-nor/hisi-sfc.c                     |    5 +-
 drivers/mtd/spi-nor/intel-spi.c                    |    4 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  |   27 +
 drivers/mtd/spi-nor/spi-nor.c                      |   18 +-
 drivers/mtd/spi-nor/stm32-quadspi.c                |  693 ++++++
 fs/jffs2/readinode.c                               |    2 +-
 include/linux/mtd/mtd.h                            |    2 +-
 include/linux/mtd/nand.h                           |   96 +-
 53 files changed, 6173 insertions(+), 3834 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
 rename drivers/mtd/maps/{physmap_of.c => physmap_of_core.c} (96%)
 create mode 100644 drivers/mtd/nand/atmel/Makefile
 create mode 100644 drivers/mtd/nand/atmel/nand-controller.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.c
 create mode 100644 drivers/mtd/nand/atmel/pmecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand.c
 delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
 delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h
 create mode 100644 drivers/mtd/nand/nand_amd.c
 create mode 100644 drivers/mtd/nand/nand_hynix.c
 create mode 100644 drivers/mtd/nand/nand_macronix.c
 create mode 100644 drivers/mtd/nand/nand_micron.c
 create mode 100644 drivers/mtd/nand/nand_samsung.c
 create mode 100644 drivers/mtd/nand/nand_toshiba.c
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
