Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cyvz7-0000pe-TE
 for linux-mtd@lists.infradead.org; Fri, 14 Apr 2017 07:49:40 +0000
Date: Fri, 14 Apr 2017 09:49:15 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: changes for 4.12
Message-ID: <20170414094915.17098db3@bbrezillon>
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

Hi Brian,

Here is my PR for 4.12. As you can see, it's a pretty big one compared
to 4.11, and it's mainly due to the Denali driver rework/cleanup (which
I'd like to thank Masahiro for), the addition of the per-vendor
initialization infrastructure and the complete rewrite of the Atmel
driver.

The rest of the commits are just simple fixes/improvements to existing
driver or to the core.

Let me know if you see any problem.

Thanks,

Boris

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/for-4.12

for you to fetch changes up to 2b12c057cc2837312001f4fc3a4d89498fb6f463:

  mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program (2017-04-11 13:46:55 +0200)

----------------------------------------------------------------
This pull request contains:

 - some minor fixes/improvements on existing drivers (fsmc, gpio, ifc,
   davinci, brcmnand, omap)
 - a huge cleanup/rework of the denali driver accompanied with core
   fixes/improvements to simplify the driver code
 - a complete rewrite of the atmel driver to support new DT bindings
   make future evolution easier
 - the addition of per-vendor detection/initialization steps to avoid
   extending the nand_ids table with more extended-id entries

----------------------------------------------------------------
Alison Wang (2):
      memory: ifc: Update dependency of IFC for LS1021A
      mtd: nand: Update dependency of IFC for LS1021A

Boris Brezillon (20):
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

Christophe Jaillet (1):
      mtd: nand: NULL terminate a of_device_id table

Christophe Leroy (1):
      mtd: nand: gpio: make nCE GPIO optional

Colin Ian King (1):
      mtd: nand: nandsim: fix spelling mistake: "weakpagess" -> "weakpages"

Dan Carpenter (2):
      mtd: nand: hynix: Fix an error code in init
      mtd: nand: Fix a couple error codes

Hans de Goede (1):
      mtd: nand: samsung: Retrieve ECC requirements from extended ID

Kamal Dasu (1):
      mtd: nand: brcmnand: Check flash #WP pin status before nand erase/program

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

Philipp Zabel (1):
      mtd: nand: sunxi: simplify optional reset handling

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

 Documentation/devicetree/bindings/mtd/atmel-nand.txt  |  107 ++-
 Documentation/devicetree/bindings/mtd/denali-nand.txt |    7 +-
 MAINTAINERS                                           |    2 +-
 arch/cris/arch-v32/drivers/Kconfig                    |    1 -
 drivers/memory/Kconfig                                |    2 +-
 drivers/mtd/nand/Kconfig                              |   23 +-
 drivers/mtd/nand/Makefile                             |   11 +-
 drivers/mtd/nand/atmel/Makefile                       |    4 +
 drivers/mtd/nand/atmel/nand-controller.c              | 2199 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/atmel/pmecc.c                        | 1020 ++++++++++++++++++++++
 drivers/mtd/nand/atmel/pmecc.h                        |   73 ++
 drivers/mtd/nand/atmel_nand.c                         | 2479 ------------------------------------------------------
 drivers/mtd/nand/atmel_nand_ecc.h                     |  163 ----
 drivers/mtd/nand/atmel_nand_nfc.h                     |  103 ---
 drivers/mtd/nand/brcmnand/brcmnand.c                  |   61 +-
 drivers/mtd/nand/davinci_nand.c                       |   11 +
 drivers/mtd/nand/denali.c                             |  567 +++++++------
 drivers/mtd/nand/denali.h                             |  192 +----
 drivers/mtd/nand/denali_dt.c                          |   74 +-
 drivers/mtd/nand/fsmc_nand.c                          |  236 ++----
 drivers/mtd/nand/gpio.c                               |   18 +-
 drivers/mtd/nand/nand_amd.c                           |   51 ++
 drivers/mtd/nand/nand_base.c                          |  518 +++++-------
 drivers/mtd/nand/nand_hynix.c                         |  631 ++++++++++++++
 drivers/mtd/nand/nand_ids.c                           |   39 +-
 drivers/mtd/nand/nand_macronix.c                      |   30 +
 drivers/mtd/nand/nand_micron.c                        |   86 ++
 drivers/mtd/nand/nand_samsung.c                       |  112 +++
 drivers/mtd/nand/nand_toshiba.c                       |   51 ++
 drivers/mtd/nand/nandsim.c                            |    2 +-
 drivers/mtd/nand/omap2.c                              |    9 +
 drivers/mtd/nand/orion_nand.c                         |   48 +-
 drivers/mtd/nand/sunxi_nand.c                         |   20 +-
 drivers/mtd/nand/tango_nand.c                         |    8 +-
 include/linux/mtd/nand.h                              |   96 ++-
 35 files changed, 5275 insertions(+), 3779 deletions(-)
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
