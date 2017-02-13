Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cd6aR-0002NJ-Os
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 02:41:58 +0000
Received: by mail-pg0-x243.google.com with SMTP id v184so8440252pgv.1
 for <linux-mtd@lists.infradead.org>; Sun, 12 Feb 2017 18:41:34 -0800 (PST)
Date: Sun, 12 Feb 2017 18:41:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] MTD updates for 4.11
Message-ID: <20170213024131.GB30118@brian-ubuntu>
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

I refuse to acknowledge the existence of 4.10-rc8 and am therefore
sending our MTD changes for 4.11 now.

One thing I didn't note in the tag summary: we've pulled in an MFD
subtree from Lee Jones as a dependency for a new Intel SPI NOR driver.
Shouldn't be a big deal.

The following changes since commit 566cf877a1fcb6d6dc0126b076aad062054c2637:

  Linux 4.10-rc6 (2017-01-29 14:25:17 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20170212

for you to fetch changes up to d91f6cee98b6e0ef5a05209ca9b741d23086cdb2:

  mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe() (2017-02-10 11:20:22 -0800)

----------------------------------------------------------------
MTD updates for 4.11:

General:
 - new kernel API for retrieving max bad blocks per die (not used yet)
 - track (and expose via sysfs) a partition's device tree node
 - support a "label" device tree property for naming an MTD

NAND:
 - sunxi: avoid busy-waiting for NAND events
 - ifc: fix ECC handling on IFC v1.0
 - OX820: add explicit dependency on ARCH_OXNAS in Kconfig
 - core: add a new manufacture ID and fix a kernel-doc warning
 - fsmc: kill pdata support
 - lpc32xx_slc: remove unneeded NULL check
 - support dynamic "max bad blocks" detection via ONFI

SPI NOR:
 - add support for the 4-byte address instruction set
 - add support for new memory parts
 - add support to S3AN memories
 - add support to the Intel SPI controller
 - add support to the Aspeed AST2400 and AST2550 controllers
 - support max SPI message sizes in m25p80_read()
 - fixes for the Candence and Freescale QSPI drivers

Other:
 - add support for Gemini flash probing
 - bcm47xxsflash: add support for reading outside memory-mapped window
 - bcm47xxparts: extend to support multiple TRX partitions
 - misc fixes and typos

----------------------------------------------------------------
Andrey Jr. Melnikov (1):
      mtd: nand: Add Winbond manufacturer id

Arnd Bergmann (2):
      mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
      mtd: ichxrom: maybe-uninitialized with gcc-4.9

Boris Brezillon (3):
      mtd: nand: sunxi: Fix the non-polling case in sunxi_nfc_wait_events()
      mtd: nand: sunxi: Stop using polling mode when waiting for long operations
      mtd: nand: sunxi: Improve sunxi_nfc_cmd_ctrl()

Brian Norris (3):
      Merge tag 'nand/for-4.11' of github.com:linux-nand/linux
      mtd: physmap_of: fixup gemini/versatile dependencies
      Merge tag 'spi-nor/for-4.11-v2' of git://github.com/spi-nor/linux

Colin Ian King (1):
      mtd: spi-nor: cqspi: remove redundant dead code on error return check

Cyrille Pitchen (5):
      mtd: spi-nor: improve macronix_quad_enable()
      mtd: spi-nor: remove WARN_ONCE() message in spi_nor_write()
      mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte address op codes
      mtd: spi-nor: add a stateless method to support memory size above 128Mib
      Merge tag 'ib-mfd-mtd-v4.11' of git://git.kernel.org/.../lee/mfd

Cédric Le Goater (6):
      mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
      mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
      mtd: spi-nor: bindings for the Aspeed memory controllers
      mtd: aspeed: fix compile warning in aspeed_smc_read_from_ahb()
      mtd: name the mtd device with an optional label property
      dt-bindings: mtd: add a common label property to all mtd devices

Fabio Estevam (1):
      mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'

Guochun Mao (1):
      Documentation: mtk-quadspi: update DT bindings

Heiner Kallweit (1):
      mtd: m25p80: consider max message size in m25p80_read

Jean Delvare (1):
      mtd: nand: Add OX820 NAND hardware dependency

Jeff Westfahl (1):
      mtd: introduce function max_bad_blocks

John Crispin (1):
      mtd: update my email address

Kamal Dasu (1):
      mtd: spi-nor: Add support for gd25q16

Linus Walleij (3):
      mtd: nand: fsmc: remove stale non-DT probe path
      mtd: add DT bindings for the Cortina Systems Gemini Flash
      mtd: physmap_of: add a hook for Gemini flash probing

Marek Vasut (1):
      mtd: spi-nor: cqspi: Fix build on arches missing readsl/writesl

Mark Marshall (1):
      mtd: nand: ifc: Fix location of eccstat registers for IFC V1.0

Masahiro Yamada (1):
      mtd: fix typos in ooblayout comment blocks

Mika Westerberg (3):
      spi-nor: Add support for Intel SPI serial flash controller
      mfd: lpc_ich: Add support for SPI serial flash host controller
      mfd: lpc_ich: Add support for Intel Apollo Lake SoC

Nobuhiro Iwamatsu (1):
      mtd: Fix typo: "occured" -> "occurred"

Rafał Miłecki (4):
      mtd: bcm47xxsflash: use platform_(set|get)_drvdata
      mtd: bcm47xxsflash: support reading flash out of mapping window
      mtd: bcm47xxpart: move TRX parsing code to separated function
      mtd: bcm47xxpart: support layouts with multiple TRX partitions

Randy Dunlap (1):
      mtd: nand: fix nand.h kernel-doc warnings

Ricardo Ribalda Delgado (2):
      mtd: spi-nor: Add support for S3AN spi-nor devices
      mtd: spi-nor: Fix S3AN addressing calculation

Sascha Hauer (1):
      mtd: Add partition device node to mtd partition devices

Uwe Kleine-König (1):
      mtd: spi-nor: add dt support for Everspin MRAMs

Victor Shyba (1):
      mtd: spi-nor: Add lock/unlock support for f25l32pa

Wei Yongjun (2):
      mtd: nand: mediatek: remove redundant dev_err call in mtk_nfc_probe()
      mtd: aspeed: remove redundant dev_err call in aspeed_smc_probe()

Yunhui Cui (2):
      mtd:fsl-quadspi:use the property fields of SPI-NOR
      mtd: fsl-quadspi: Rename SEQID_QUAD_READ to SEQID_READ

Zach Brown (3):
      mtd: nand: Add max_bb_per_die and blocks_per_die fields to nand_chip
      mtd: nand: implement 'max_bad_blocks' mtd function
      mtd: nand: set max_bb_per_die and blocks_per_die for ONFI compliant chips

 .../devicetree/bindings/mtd/aspeed-smc.txt         |  51 ++
 Documentation/devicetree/bindings/mtd/common.txt   |  15 +
 .../bindings/mtd/cortina,gemini-flash.txt          |  24 +
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |   2 +
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |   8 +-
 Documentation/mtd/intel-spi.txt                    |  88 +++
 drivers/mfd/lpc_ich.c                              | 131 ++++
 drivers/mtd/bcm47xxpart.c                          | 161 +++--
 drivers/mtd/devices/bcm47xxsflash.c                |  30 +-
 drivers/mtd/devices/bcm47xxsflash.h                |   3 +
 drivers/mtd/devices/m25p80.c                       |   9 +-
 drivers/mtd/devices/serial_flash_cmds.h            |   7 -
 drivers/mtd/devices/st_spi_fsm.c                   |  28 +-
 drivers/mtd/maps/Kconfig                           |  12 +-
 drivers/mtd/maps/Makefile                          |   7 +-
 drivers/mtd/maps/ichxrom.c                         |   6 +-
 drivers/mtd/maps/lantiq-flash.c                    |   4 +-
 drivers/mtd/maps/physmap_of.c                      |   9 +-
 drivers/mtd/maps/physmap_of_gemini.c               | 117 ++++
 drivers/mtd/maps/physmap_of_gemini.h               |  16 +
 drivers/mtd/maps/physmap_of_versatile.c            |   1 -
 drivers/mtd/maps/pmcmsp-flash.c                    |   4 +-
 drivers/mtd/mtdchar.c                              |   2 +-
 drivers/mtd/mtdcore.c                              |   6 +-
 drivers/mtd/mtdpart.c                              |  11 +
 drivers/mtd/nand/Kconfig                           |   2 +
 drivers/mtd/nand/fsl_ifc_nand.c                    |   8 +-
 drivers/mtd/nand/fsmc_nand.c                       | 153 +++-
 drivers/mtd/nand/lpc32xx_slc.c                     |   9 +-
 drivers/mtd/nand/mtk_nand.c                        |   1 -
 drivers/mtd/nand/nand_base.c                       |  40 ++
 drivers/mtd/nand/nand_ids.c                        |   1 +
 drivers/mtd/nand/sunxi_nand.c                      |  36 +-
 drivers/mtd/nand/xway_nand.c                       |   2 +-
 drivers/mtd/ofpart.c                               |   1 +
 drivers/mtd/spi-nor/Kconfig                        |  32 +-
 drivers/mtd/spi-nor/Makefile                       |   3 +
 drivers/mtd/spi-nor/aspeed-smc.c                   | 754 ++++++++++++++++++++
 drivers/mtd/spi-nor/cadence-quadspi.c              |  10 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  48 +-
 drivers/mtd/spi-nor/intel-spi-platform.c           |  57 ++
 drivers/mtd/spi-nor/intel-spi.c                    | 777 +++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.h                    |  24 +
 drivers/mtd/spi-nor/spi-nor.c                      | 275 +++++++-
 drivers/spi/spi-bcm-qspi.c                         |   6 +-
 include/linux/bcma/bcma_driver_chipcommon.h        |   3 -
 include/linux/fsl_ifc.h                            |   8 +-
 include/linux/mfd/lpc_ich.h                        |   3 +
 include/linux/mtd/fsmc.h                           | 156 -----
 include/linux/mtd/mtd.h                            |  16 +
 include/linux/mtd/nand.h                           |   9 +-
 include/linux/mtd/partitions.h                     |   1 +
 include/linux/mtd/spi-nor.h                        |  34 +-
 include/linux/platform_data/intel-spi.h            |  31 +
 54 files changed, 2874 insertions(+), 378 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/common.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
 create mode 100644 Documentation/mtd/intel-spi.txt
 create mode 100644 drivers/mtd/maps/physmap_of_gemini.c
 create mode 100644 drivers/mtd/maps/physmap_of_gemini.h
 create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.h
 delete mode 100644 include/linux/mtd/fsmc.h
 create mode 100644 include/linux/platform_data/intel-spi.h
