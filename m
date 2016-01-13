Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ8xZ-0008AM-RM
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 00:06:48 +0000
Received: by mail-pa0-x244.google.com with SMTP id pv5so27370534pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2016 16:06:25 -0800 (PST)
Date: Tue, 12 Jan 2016 16:06:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD updates for v4.5
Message-ID: <20160113000621.GR109450@google.com>
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

The following changes since commit a32d5b726ff8cf32bf491522b0ac8ae2545a063e:

  mtd: spi-nor: fix stm_is_locked_sr() parameters (2016-01-05 16:00:41 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160112

for you to fetch changes up to 9146cbd52b11d4ade62dba8f238ec5e421c3fa2b:

  mtd: jz4780_nand: replace if/else blocks with switch/case (2016-01-08 09:49:03 -0800)

----------------------------------------------------------------
MTD updates for v4.5:

Generic MTD

 * populate the MTD device 'of_node' field (and get a proper 'of_node' symlink
   in sysfs)
   - This yielded some new helper functions, and changes across a variety of
     drivers

 * partitioning cleanups, to prepare for better device-tree based partitioning
   in the future
   - Eliminate a lot of boilerplate for drivers that want to use OF-based
     partition parsing
   - The DT bindings for this didn't settle yet, so most non-cleanup portions
     are deferred for a future release

NAND

 * embed a struct mtd_info inside struct nand_chip
   - This is really long overdue; too many drivers have to do the same silly
     boilerplate to allocate and link up two "independent" structs, when in
     fact, everyone is assuming there is an exact 1:1 relationship between a
     NAND chips struct and its underlying MTD. This aids improved helpers and
     should make certain abstractions easier in the future.
   - Also causes a lot of churn, helped along by some automated code
     transformations

 * add more core support for detecting (and "correcting") bitflips in erased
   pages; requires opt-in by drivers, but at least we kill a few bad
   implementations and hopefully stave off future ones

 * pxa3xx_nand: cleanups, a few fixes, and PM improvements

 * new JZ4780 NAND driver

SPI NOR

 * provide default erase function, for controllers that just want to send the
   SECTOR_ERASE command directly

 * fix some module auto-loading issues with device tree ("jedec,spi-nor")

 * error handling fixes

 * new Mediatek QSPI flash driver

Other

 * cfi: force valid geometry Kconfig (finally!)
   - this one used to trip up randconfigs occasionally, since bots aren't
     deterred by big scary "advanced configuration" menus

More? Probably. See the commit logs.

----------------------------------------------------------------
Alex Smith (2):
      doc: dt: mtd: new binding for jz4780-{nand,bch}
      mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs

Andreas Fenkart (1):
      mtd: spi-nor: mx25l3205d/mx25l6405d: append SECT_4K

Arnd Bergmann (4):
      mtd: cfi: enforce valid geometry configuration
      mtd: cfi: don't warn about broken geometry for !CONFIG_MTD
      mtd: omap_elm: print interrupt resource using %pr
      mtd: sh_flctl: pass FIFO as physical address

Bayi Cheng (3):
      doc: dt: mtd: add documentation for Mediatek spi-nor controller
      mtd: mtk-nor: new Mediatek serial flash controller driver
      mtd: mtk-nor: adjust sequence of trigger function and assignment function

Boris BREZILLON (79):
      mtd: nand: convert to nand_get_flash_node()
      mtd: nand: fix drivers abusing mtd->priv
      mtd: nand: add an mtd_to_nand() helper
      doc: mtd: nand: update examples to use mtd_to_nand()
      mtd: nand: fix ONFI parameter page layout
      ARM: nand: make use of mtd_to_nand() where appropriate
      sh: nand: make use of mtd_to_nand() where appropriate
      mtd: nand: make use of mtd_to_nand() in NAND core code
      staging: mt29f_spinand: make use of mtd_to_nand()
      mtd: nand: make use of mtd_to_nand() in NAND drivers
      mtd: nand: embed an mtd_info structure into nand_chip
      mtd: nand: add nand_to_mtd() helper
      cris: nand: make use of mtd_to_nand() where appropriate
      blackfin: nand: make use of mtd_to_nand() where appropriate
      mips: nand: make use of mtd_to_nand() where appropriate
      mtd: nand: denali: add missing nand_release() call in denali_remove()
      mtd: nand: fsmc: create and use mtd_to_fsmc()
      mtd: nand: nuc900: create and use mtd_to_nuc900()
      mtd: nand: omap2: create and use mtd_to_omap()
      mtd: nand: ams-delta: use the mtd instance embedded in struct nand_chip
      mtd: nand: atmel: use the mtd instance embedded in struct nand_chip
      mtd: nand: au1550nd: use the mtd instance embedded in struct nand_chip
      mtd: nand: bf5xx: use the mtd instance embedded in struct nand_chip
      mtd: nand: brcm: use the mtd instance embedded in struct nand_chip
      mtd: nand: cafe: use the mtd instance embedded in struct nand_chip
      mtd: nand: cs553x: use the mtd instance embedded in struct nand_chip
      mtd: nand: cmx270: use the mtd instance embedded in struct nand_chip
      mtd: nand: davinci: use the mtd instance embedded in struct nand_chip
      mtd: nand: diskonchip: use the mtd instance embedded in struct nand_chip
      mtd: nand: docg4: use the mtd instance embedded in struct nand_chip
      mtd: nand: fsl_elbc: use the mtd instance embedded in struct nand_chip
      mtd: nand: fsl_ifc: use the mtd instance embedded in struct nand_chip
      mtd: nand: fsl_upm: use the mtd instance embedded in struct nand_chip
      mtd: nand: fsmc: use the mtd instance embedded in struct nand_chip
      mtd: nand: gpio: use the mtd instance embedded in struct nand_chip
      mtd: nand: gpmi: use the mtd instance embedded in struct nand_chip
      mtd: nand: hisi504: use the mtd instance embedded in struct nand_chip
      mtd: nand: jz4740: use the mtd instance embedded in struct nand_chip
      mtd: nand: lpc32xx: use the mtd instance embedded in struct nand_chip
      mtd: nand: mpc5121: use the mtd instance embedded in struct nand_chip
      mtd: nand: mxc: use the mtd instance embedded in struct nand_chip
      mtd: nand: nandsim: use the mtd instance embedded in struct nand_chip
      mtd: nand: ndfc: use the mtd instance embedded in struct nand_chip
      mtd: nand: nuc900: use the mtd instance embedded in struct nand_chip
      mtd: nand: omap2: use the mtd instance embedded in struct nand_chip
      mtd: nand: orion: use the mtd instance embedded in struct nand_chip
      mtd: nand: pasemi: use the mtd instance embedded in struct nand_chip
      mtd: nand: plat: use the mtd instance embedded in struct nand_chip
      mtd: nand: pxa3xx: use the mtd instance embedded in struct nand_chip
      mtd: nand: r852: use the mtd instance embedded in struct nand_chip
      mtd: nand: sh_flctl: use the mtd instance embedded in struct nand_chip
      mtd: nand: sharpsl: use the mtd instance embedded in struct nand_chip
      mtd: nand: sunxi: use the mtd instance embedded in struct nand_chip
      mtd: nand: tmio: use the mtd instance embedded in struct nand_chip
      mtd: nand: txx9ndfmc: use the mtd instance embedded in struct nand_chip
      mtd: nand: vf610: use the mtd instance embedded in struct nand_chip
      mtd: nand: update the documentation to reflect framework changes
      mtd: nand: s3c2410: use the mtd instance embedded in struct nand_chip
      staging: mt29f_spinand: use the mtd instance embedded in struct nand_chip
      cris: nand: use the mtd instance embedded in struct nand_chip
      mtd: nand: bcm47xx: use the mtd instance embedded in struct nand_chip
      mtd: nand: socrates: use the mtd instance embedded in struct nand_chip
      mtd: nand: denali: use the mtd instance embedded in struct nand_chip
      mtd: nand: update mtd_to_nand()
      mtd: nand: remove useless mtd->priv = chip assignments
      cris: nand: remove useless mtd->priv = chip assignments
      staging: mt29f_spinand: remove useless mtd->priv = chip assignment
      mtd: nand: simplify nand_dt_init() usage
      mtd: nand: kill the chip->flash_node field
      mtd: nand: remove unused and buggy get_platform_nandchip() helper function
      mtd: nand: return consistent error codes in ecc.correct() implementations
      mtd: nand: use nand_check_erased_ecc_chunk in default ECC read functions
      mtd: nand: davinci: remove custom 'erased check' implementation
      mtd: nand: diskonchip: remove custom 'erased check' implementation
      mtd: nand: jz4740: remove custom 'erased check' implementation
      mtd: nand: add helpers to access ->priv
      ARM: make use of nand_set/get_controller_data() helpers
      mtd: nand: make use of nand_set/get_controller_data() helpers
      staging: mt29f_spinand: make use of nand_set/get_controller_data() helpers

Brian Norris (48):
      mtd: add get/set of_node/flash_node helpers
      mtd: ofpart: grab device tree node directly from master device node
      mtd: {nand,spi-nor}: assign MTD of_node
      mtd: nand: convert to nand_set_flash_node()
      mtd: spi-nor: convert to spi_nor_{get, set}_flash_node()
      mtd: nand: drop unnecessary partition parser data
      mtd: spi-nor: drop unnecessary partition parser data
      mtd: spi-nor: drop flash_node field
      mtd: drop unnecessary partition parser data
      mtd: ofpart: drop 'of_node' partition parser data
      mtd: physmap_of: assign parent for the concatenated MTD
      mtd: grab a reference to the MTD of_node before registering it
      mtd: zero out mtd_partition struct before using it
      mtd: partitions: kill unused ecclayout struct
      Merge v4.4-rc1 into MTD development
      Merge MTD 4.4 development into MTD -next
      mtd: spi-nor: remove unnecessary leading space from dbg print
      mtd: fsl-quadspi: possible NULL dereference
      mtd: brcmnand: clean up flash cache for parameter pages
      mtd: brcmnand: drop unused subpage_read() support
      mtd: merge in mtd_to_nand() branch
      mtd: spi-nor: provide default erase_sector implementation
      mtd: m25p80: drop erase() callback
      mtd: m25p80: fix module autoloading for "jedec, spi-nor" and "spi-nor"
      mtd: m25p80: replace leftover "nor-jedec" with "spi-nor" in comments
      doc: dt: mtd: stop referring to driver code for spi-nor IDs
      mtd: partitions: add module_mtd_part_parser() helper
      mtd: kill off MTD partition parser boilerplate
      mtd: nand: fix typo (t_ald -> t_adl)
      mtd: brcmnand: drop brcmnand_host::of_node field
      mtd: partitions: turn PART() macro into inline function
      mtd: mtk-quadspi: drop unnecessary .owner assignment
      Merge arch/{arm,blackfin,cris,mips}/ refactoring patches into MTD dev
      mtd: merge for-4.4 development into -next development
      mtd: ofpart: assign return argument exactly once
      mtd: partitions: make parsers return 'const' partition arrays
      mtd: partitions: rename MTD parser get/put
      mtd: partitions: remove kmemdup()
      mtd: partitions: pass around 'mtd_partitions' wrapper struct
      mtd: partitions: support a cleanup callback for parsers
      mtd: brcmnand: defer to devm_ioremap_resource() for error checking
      mtd: bcm47xxnflash: really unregister NAND on device removal
      mtd: nand: docg4: simplify error case
      mtd: merge MTD development from v4.4 into for-v4.5 development
      mtd: nand: assign reasonable default name for NAND drivers
      mtd: jz4780_nand: remove useless mtd->priv = chip assignment
      mtd: nandsim: use nand_get_controller_data()
      mtd: jz4780_nand: replace if/else blocks with switch/case

Ezequiel García (7):
      mtd: pxa3xx_nand: Increase the initial chunk size
      mtd: pxa3xx_nand: Fix initial controller configuration
      mtd: pxa3xx_nand: Simplify pxa3xx_nand_scan
      mtd: pxa3xx_nand: Remove redundant NAND sensing
      mtd: pxa3xx_nand: Remove dead code
      mtd: pxa3xx_nand: Gate/ungate the NAND clock in suspend/resume paths
      mtd: spi-nor: wait until lock/unlock operations are ready

Fabian Frederick (2):
      mtd: cfi_cmdset_0002: use swap() in cfi_cmdset_0002()
      mtd: ftl: use swap() in copy_erase_unit()

Fabio Estevam (2):
      mtd: mxc_nand: Remove bit-or operation with zero
      mtd: spi-nor: Check the return value from read_sr()

Geert Uytterhoeven (1):
      mtd: nand: Confine MTD_NAND_SH_FLCTL to SUPERH

Geliang Tang (1):
      jffs2: use to_delayed_work

Harvey Hunt (1):
      mtd: nand: jz4780: Update ecc correction error codes

Heiner Kallweit (1):
      mtd: spi-nor: fix error handling in spi_nor_erase

Helmut Schaa (1):
      mtd: nand: Disable subpage writes for drivers without ecc->hwctl

Insu Yun (1):
      mtd: cfi_cmdset_0001: fixing memory leak and handling failed kmalloc

Julia Lawall (2):
      mtd: brcmnand: improve memory management
      mtd: nand: sunxi: add missing of_node_put

LABBE Corentin (1):
      mtd: nand: atmel_nand: constify atmel_nand_caps structures

Lars-Peter Clausen (1):
      mtd: nand: r852: Remove unnecessary synchronize_irq() before free_irq()

Linus Walleij (4):
      mtd: afs: rename structs and functions for v1
      mtd: enable AFS selection for ARM64
      mtd: afs: break out v1 footer magic to a define
      mtd: afs: refactor v1 partition parsing

Masahiro Yamada (1):
      mtd: denali: make MTD_NAND_DENALI_DT dependent on OF

Michal Suchanek (1):
      mtd: ofpart: document the lock flag.

Nicholas Mc Guire (1):
      mtd: tests: consolidate kmalloc/memset 0 call to kzalloc

Nicolas Pitre (1):
      mtd: sm_ftl: fix wrong do_div() usage

Rafał Miłecki (1):
      mtd: spi-nor: include mtd.h header for struct mtd_info definition

Ricardo Ribalda Delgado (1):
      mtd: spi-nor: Fix error message with unrecognized JEDEC

Simon Arlott (4):
      brcmnand: Clear EXT_ADDR error registers in PIO mode
      doc: dt: mtd: brcmnand: Add brcm,bcm6368-nand device tree binding
      mtd: brcmnand: Request and enable the clock if present
      mtd: brcmnand: Add support for the BCM6368

Stephen Rothwell (1):
      mtd: nand: fix for drop unnecessary partition parser data

Wang YanQing (1):
      Documentation: mtd: improve nand_ecc.txt for readability and correctness

 Documentation/DocBook/mtdnand.tmpl                 |  35 +-
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  32 ++
 .../bindings/mtd/ingenic,jz4780-nand.txt           |  86 ++++
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  56 ++-
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |  41 ++
 .../devicetree/bindings/mtd/partition.txt          |   2 +
 Documentation/mtd/nand_ecc.txt                     |  58 +--
 arch/arm/mach-ep93xx/snappercl15.c                 |   4 +-
 arch/arm/mach-ep93xx/ts72xx.c                      |   4 +-
 arch/arm/mach-imx/mach-qong.c                      |   2 +-
 arch/arm/mach-ixp4xx/ixdp425-setup.c               |   6 +-
 arch/arm/mach-omap1/board-nand.c                   |   2 +-
 arch/arm/mach-orion5x/ts78xx-setup.c               |   6 +-
 arch/arm/mach-pxa/balloon3.c                       |   2 +-
 arch/arm/mach-pxa/em-x270.c                        |   2 +-
 arch/arm/mach-pxa/palmtx.c                         |   2 +-
 arch/blackfin/mach-bf537/boards/stamp.c            |   2 +-
 arch/blackfin/mach-bf561/boards/acvilon.c          |   2 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |   8 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |   8 +-
 arch/mips/alchemy/devboards/db1200.c               |   2 +-
 arch/mips/alchemy/devboards/db1300.c               |   2 +-
 arch/mips/alchemy/devboards/db1550.c               |   2 +-
 arch/mips/pnx833x/common/platform.c                |   2 +-
 arch/mips/rb532/devices.c                          |   2 +-
 arch/sh/boards/mach-migor/setup.c                  |   2 +-
 drivers/mtd/Kconfig                                |   2 +-
 drivers/mtd/afs.c                                  |  82 ++--
 drivers/mtd/ar7part.c                              |  18 +-
 drivers/mtd/bcm47xxpart.c                          |  18 +-
 drivers/mtd/bcm63xxpart.c                          |  18 +-
 drivers/mtd/chips/Kconfig                          |   4 +
 drivers/mtd/chips/cfi_cmdset_0001.c                |   8 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   6 +-
 drivers/mtd/cmdlinepart.c                          |   3 +-
 drivers/mtd/devices/m25p80.c                       |  44 +-
 drivers/mtd/devices/mtd_dataflash.c                |   5 +-
 drivers/mtd/devices/spear_smi.c                    |   6 +-
 drivers/mtd/devices/st_spi_fsm.c                   |   5 +-
 drivers/mtd/ftl.c                                  |   8 +-
 drivers/mtd/maps/lantiq-flash.c                    |   5 +-
 drivers/mtd/maps/physmap_of.c                      |   6 +-
 drivers/mtd/mtdcore.c                              |  40 +-
 drivers/mtd/mtdcore.h                              |   7 +-
 drivers/mtd/mtdpart.c                              | 133 ++++--
 drivers/mtd/nand/Kconfig                           |  11 +-
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/ams-delta.c                       |  26 +-
 drivers/mtd/nand/atmel_nand.c                      | 134 +++---
 drivers/mtd/nand/au1550nd.c                        |  40 +-
 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h     |   1 -
 drivers/mtd/nand/bcm47xxnflash/main.c              |  16 +-
 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c       |  34 +-
 drivers/mtd/nand/bf5xx_nand.c                      |  45 +-
 drivers/mtd/nand/brcmnand/Makefile                 |   1 +
 drivers/mtd/nand/brcmnand/bcm6368_nand.c           | 142 ++++++
 drivers/mtd/nand/brcmnand/brcmnand.c               | 166 ++++---
 drivers/mtd/nand/cafe_nand.c                       |  43 +-
 drivers/mtd/nand/cmx270_nand.c                     |  23 +-
 drivers/mtd/nand/cs553x_nand.c                     |  34 +-
 drivers/mtd/nand/davinci_nand.c                    |  60 ++-
 drivers/mtd/nand/denali.c                          |  75 ++--
 drivers/mtd/nand/denali.h                          |   1 -
 drivers/mtd/nand/diskonchip.c                      | 189 ++++----
 drivers/mtd/nand/docg4.c                           | 102 +++--
 drivers/mtd/nand/fsl_elbc_nand.c                   |  64 +--
 drivers/mtd/nand/fsl_ifc_nand.c                    |  74 ++--
 drivers/mtd/nand/fsl_upm.c                         |  35 +-
 drivers/mtd/nand/fsmc_nand.c                       |  69 ++-
 drivers/mtd/nand/gpio.c                            |  26 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |   2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  71 ++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |   1 -
 drivers/mtd/nand/hisi504_nand.c                    |  53 ++-
 drivers/mtd/nand/jz4740_nand.c                     |  37 +-
 drivers/mtd/nand/jz4780_bch.c                      | 381 ++++++++++++++++
 drivers/mtd/nand/jz4780_bch.h                      |  43 ++
 drivers/mtd/nand/jz4780_nand.c                     | 428 ++++++++++++++++++
 drivers/mtd/nand/lpc32xx_mlc.c                     |  40 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |  49 +--
 drivers/mtd/nand/mpc5121_nfc.c                     |  57 ++-
 drivers/mtd/nand/mxc_nand.c                        |  88 ++--
 drivers/mtd/nand/nand_base.c                       | 157 ++++---
 drivers/mtd/nand/nand_bbt.c                        |  32 +-
 drivers/mtd/nand/nand_bch.c                        |   6 +-
 drivers/mtd/nand/nand_ecc.c                        |   6 +-
 drivers/mtd/nand/nandsim.c                         |  41 +-
 drivers/mtd/nand/ndfc.c                            |  55 ++-
 drivers/mtd/nand/nuc900_nand.c                     |  40 +-
 drivers/mtd/nand/omap2.c                           |  92 ++--
 drivers/mtd/nand/omap_elm.c                        |   2 +-
 drivers/mtd/nand/orion_nand.c                      |  19 +-
 drivers/mtd/nand/pasemi_nand.c                     |  21 +-
 drivers/mtd/nand/plat_nand.c                       |  18 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 169 ++++---
 drivers/mtd/nand/r852.c                            |  46 +-
 drivers/mtd/nand/r852.h                            |   1 -
 drivers/mtd/nand/s3c2410.c                         |  31 +-
 drivers/mtd/nand/sh_flctl.c                        |  20 +-
 drivers/mtd/nand/sharpsl.c                         |  23 +-
 drivers/mtd/nand/sm_common.c                       |   2 +-
 drivers/mtd/nand/socrates_nand.c                   |  30 +-
 drivers/mtd/nand/sunxi_nand.c                      |  50 +--
 drivers/mtd/nand/tmio_nand.c                       |  13 +-
 drivers/mtd/nand/txx9ndfmc.c                       |  25 +-
 drivers/mtd/nand/vf610_nfc.c                       |  23 +-
 drivers/mtd/nand/xway_nand.c                       |   4 +-
 drivers/mtd/ofpart.c                               |  53 ++-
 drivers/mtd/onenand/omap2.c                        |   8 +-
 drivers/mtd/redboot.c                              |  19 +-
 drivers/mtd/sm_ftl.c                               |   3 +-
 drivers/mtd/spi-nor/Kconfig                        |   7 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  14 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  | 485 +++++++++++++++++++++
 drivers/mtd/spi-nor/nxp-spifi.c                    |   6 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  77 +++-
 drivers/mtd/tests/pagetest.c                       |   3 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |  24 +-
 fs/jffs2/wbuf.c                                    |   2 +-
 include/linux/bcma/bcma_driver_chipcommon.h        |   6 +-
 include/linux/mtd/map.h                            |   2 +
 include/linux/mtd/mtd.h                            |  11 +
 include/linux/mtd/nand.h                           |  71 ++-
 include/linux/mtd/nand_bch.h                       |   2 +-
 include/linux/mtd/partitions.h                     |  27 +-
 include/linux/mtd/sh_flctl.h                       |   4 +-
 include/linux/mtd/spi-nor.h                        |  19 +-
 128 files changed, 3469 insertions(+), 1753 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
 create mode 100644 drivers/mtd/nand/brcmnand/bcm6368_nand.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.c
 create mode 100644 drivers/mtd/nand/jz4780_bch.h
 create mode 100644 drivers/mtd/nand/jz4780_nand.c
 create mode 100644 drivers/mtd/spi-nor/mtk-quadspi.c
