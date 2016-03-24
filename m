Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aj9j8-0005av-1o
 for linux-mtd@lists.infradead.org; Thu, 24 Mar 2016 18:11:23 +0000
Received: by mail-pf0-x22b.google.com with SMTP id x3so64087755pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2016 11:11:01 -0700 (PDT)
Date: Thu, 24 Mar 2016 11:10:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [GIT PULL] MTD updates for 4.6
Message-ID: <20160324181057.GI2545@google.com>
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

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160324

for you to fetch changes up to 6871c1b96de88d3576d935b528fd1b0ec70e81f5:

  mtd: nand: remove kerneldoc for removed function parameter (2016-03-11 09:41:19 -0800)

----------------------------------------------------------------
MTD updates for v4.6

NAND:
 * Add sunxi_nand randomizer support
 * begin refactoring NAND ecclayout structs
 * fix pxa3xx_nand dmaengine usage
 * brcmnand: fix support for v7.1 controller
 * add Qualcomm NAND controller driver

SPI NOR:
 * add new ls1021a, ls2080a support to Freescale QuadSPI
 * add new flash ID entries
 * support bottom-block protection for Winbond flash
 * support Status Register Write Protect
 * remove broken QPI support for Micron SPI flash

JFFS2:
 * improve post-mount CRC scan efficiency

General:
 * refactor bcm63xxpart parser, to later extend for NAND
 * add writebuf size parameter to mtdram

Other minor code quality improvements

----------------------------------------------------------------
Aaro Koskinen (1):
      mtd: onenand: fix deadlock in onenand_block_markbad

Alexander Stein (1):
      mtd: mtdram: Add parameter for setting writebuf size

Archit Taneja (3):
      mtd: nand: don't select chip in nand_chip's block_bad op
      dt/bindings: qcom_nandc: Add DT bindings
      mtd: nand: Qualcomm NAND controller driver

Arnd Bergmann (1):
      mtd: nuc900_nand: read correct SMISR register

Boris BREZILLON (16):
      mtd: nand: add NAND_NEED_SCRAMBLING option flag
      mtd: nand: add NAND_NEED_SCRAMBLING flag to the H27UCG8T2ATR-BC definition
      mtd: nand: sunxi: add randomizer support
      mtd: inftl: kill unused oobinfo field
      mtd: nftl: kill unused oobinfo field
      mtd: nand: s3c2410: kill the ->ecc_layout field
      mtd: nand: jz4740: kill the ->ecc_layout field
      mtd: nand: kill unused ->ecclayout field in platform_nand_chip struct
      staging: mt29f_spinand: kill unused ecclayout field
      mtd: nand: lpc32xx_mlc: fix ecc.size
      mtd: nand: vf610: remove useless mtd->ecclayout assignment
      mtd: nand: sunxi: remove direct mtd->priv accesses
      mtd: kill the ecclayout->oobavail field
      mtd: create an mtd_oobavail() helper and make use of it
      mtd: mtdswap: remove useless if (!mtd->ecclayout) test
      mtd: nand: simplify nand_bch_init() usage

Brian Norris (14):
      mtd: nand: sunxi: use mtd_div_by_ws() helper
      Merge v4.5-rc1 with MTD -next development
      mtd: nand: pxa3xx_nand: kill unused field 'drcmr_cmd'
      mtd: bcm63xxpart: give width specifier an 'int', not 'size_t'
      mtd: nand: check status before reporting timeout
      mtd: spi-nor: wait for SR_WIP to clear on initial unlock
      mtd: spi-nor: silently drop lock/unlock for already locked/unlocked region
      mtd: spi-nor: make lock/unlock bounds checks more obvious and robust
      mtd: spi-nor: disallow further writes to SR if WP# is low
      mtd: spi-nor: use BIT() for flash_info flags
      mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
      mtd: spi-nor: add TB (Top/Bottom) protect support
      mtd: spi-nor: support lock/unlock for a few Winbond chips
      mtd: nand: remove kerneldoc for removed function parameter

Christophe Jaillet (1):
      mtd: nand: mpc5121: use 'of_machine_is_compatible' to simplify code

Cyrille Pitchen (1):
      mtd: spi-nor: remove micron_quad_enable()

David Woodhouse (1):
      jffs2: Improve post-mount CRC scan efficiency

Ezequiel García (1):
      mtd: spi-nor: add subsector flag to n25q128a

Florian Fainelli (1):
      mtd: brcmnand: Fix v7.1 register offsets

Geert Uytterhoeven (1):
      mtd: mtk-nor: Drop bogus __init from mtk_nor_init()

Han Xu (1):
      mtd: nand: gpmi: may use minimum required ecc for 744 oobsize NAND

Huang Shijie (1):
      mtd: nand: gpmi: add gpmi dsm supend/resume support

Linus Walleij (1):
      mtd: map: fix .set_vpp() documentation

Rafał Miłecki (2):
      mtd: bcm47xxpart: limit scanned flash area on BCM47XX (MIPS) only
      mtd: bcm47xxpart: don't fail because of bit-flips

Raghav Dogra (1):
      driver/memory: Removal of deprecated NO_IRQ

Richard Weinberger (2):
      mtd: Fix dependencies for !HAS_IOMEM archs
      mtd: cs553x: Fix dependencies for !HAS_IOMEM archs

Robert Jarzmik (2):
      mtd: nand: pxa3xx_nand: add register access debug
      mtd: nand: pxa3xx_nand: fix dmaengine initialization

Romain Izard (7):
      mtd: atmel_nand: Do not warn on bitflips
      mtd: atmel_nand: Simplify error messages
      mtd: atmel_nand: Use of_device_get_match_data
      mtd: atmel_nand: Support variable RB_EDGE interrupts
      doc: dt: atmel_nand: Reword the documentation
      mtd: atmel_nand: Support PMECC on SAMA5D2
      mtd: atmel_nand: Support 32-bit ECC strength

Sascha Hauer (1):
      mtd: spi-nor: Add support for s25fl116k

Simon Arlott (4):
      mtd: bcm63xxpart: Remove dependency on mach-bcm63xx
      mtd: bcm63xxpart: Extract read of image tag to separate function
      mtd: bcm63xxpart: Null terminate and validate conversion of flash strings
      mtd: bcm63xxpart: Move NOR flash layout to a separate function

Thomas Petazzoni (4):
      mtd: nand: remove EXPORT_SYMBOL of nand_scan_bbt()
      mtd: onenand: make onenand_scan_bbt() static
      mtd: onenand: unexport onenand_default_bbt()
      mtd: nand: pxa3xx_nand: add support for partial chunks

Yao Yuan (5):
      mtd: spi-nor: fsl-quadspi: add big-endian support
      mtd: spi-nor: fsl-quadspi: add support for ls1021a
      mtd: spi-nor: fsl-quadspi: add support for layerscape
      Documentation: fsl-quadspi: Add fsl, ls2080a-qspi compatible string
      Documentation: fsl-quadspi: Add optional properties

 .../devicetree/bindings/mtd/atmel-nand.txt         |   31 +-
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |    5 +-
 .../devicetree/bindings/mtd/qcom_nandc.txt         |   86 +
 arch/arm/plat-samsung/devs.c                       |    9 -
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h    |    2 -
 drivers/memory/fsl_ifc.c                           |    2 +-
 drivers/mtd/Kconfig                                |    2 +-
 drivers/mtd/bcm47xxpart.c                          |   42 +-
 drivers/mtd/bcm63xxpart.c                          |  182 +-
 drivers/mtd/devices/docg3.c                        |    5 +-
 drivers/mtd/devices/mtdram.c                       |    5 +-
 drivers/mtd/mtdpart.c                              |    5 +-
 drivers/mtd/mtdswap.c                              |   24 +-
 drivers/mtd/nand/Kconfig                           |   10 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/atmel_nand.c                      |   89 +-
 drivers/mtd/nand/atmel_nand_ecc.h                  |    9 +-
 drivers/mtd/nand/atmel_nand_nfc.h                  |    3 +-
 drivers/mtd/nand/brcmnand/brcmnand.c               |   42 +-
 drivers/mtd/nand/cafe_nand.c                       |    2 +-
 drivers/mtd/nand/diskonchip.c                      |    2 +-
 drivers/mtd/nand/docg4.c                           |    3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |   73 +-
 drivers/mtd/nand/hisi504_nand.c                    |    1 -
 drivers/mtd/nand/jz4740_nand.c                     |    3 -
 drivers/mtd/nand/lpc32xx_mlc.c                     |    2 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |    7 +-
 drivers/mtd/nand/nand_base.c                       |   78 +-
 drivers/mtd/nand/nand_bbt.c                        |    2 -
 drivers/mtd/nand/nand_bch.c                        |   27 +-
 drivers/mtd/nand/nand_ids.c                        |    4 +-
 drivers/mtd/nand/nuc900_nand.c                     |    2 +-
 drivers/mtd/nand/omap2.c                           |   28 +-
 drivers/mtd/nand/plat_nand.c                       |    1 -
 drivers/mtd/nand/pxa3xx_nand.c                     |  191 +-
 drivers/mtd/nand/qcom_nandc.c                      | 2223 ++++++++++++++++++++
 drivers/mtd/nand/s3c2410.c                         |    3 -
 drivers/mtd/nand/sunxi_nand.c                      |  287 ++-
 drivers/mtd/nand/vf610_nfc.c                       |    2 -
 drivers/mtd/onenand/onenand_base.c                 |   32 +-
 drivers/mtd/onenand/onenand_bbt.c                  |    5 +-
 drivers/mtd/spi-nor/Kconfig                        |    3 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  167 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  |    4 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  246 ++-
 drivers/mtd/tests/oobtest.c                        |   49 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    1 -
 drivers/staging/mt29f_spinand/mt29f_spinand.h      |    1 -
 fs/jffs2/gc.c                                      |   64 +-
 fs/jffs2/jffs2_fs_sb.h                             |    2 +-
 fs/jffs2/nodemgmt.c                                |    4 +-
 fs/jffs2/wbuf.c                                    |    6 +-
 include/linux/mtd/bbm.h                            |    1 -
 include/linux/mtd/inftl.h                          |    1 -
 include/linux/mtd/map.h                            |    7 +-
 include/linux/mtd/mtd.h                            |    6 +-
 include/linux/mtd/nand.h                           |   10 +-
 include/linux/mtd/nand_bch.h                       |    8 +-
 include/linux/mtd/nftl.h                           |    1 -
 include/linux/mtd/spi-nor.h                        |    2 +
 include/linux/platform_data/mtd-nand-s3c2410.h     |    1 -
 61 files changed, 3524 insertions(+), 592 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
 create mode 100644 drivers/mtd/nand/qcom_nandc.c
