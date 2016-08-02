Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUOip-0006th-Dl
 for linux-mtd@lists.infradead.org; Tue, 02 Aug 2016 01:42:20 +0000
Received: by mail-pf0-x241.google.com with SMTP id h186so11333377pfg.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Aug 2016 18:41:58 -0700 (PDT)
Date: Mon, 1 Aug 2016 18:41:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] MTD updates for v4.8-rc1
Message-ID: <20160802014154.GA80262@google.com>
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

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20160801

for you to fetch changes up to 1dcff2e4ae728a36876bdb108173f4cbcae128bf:

  mtd: spi-nor: don't build Cadence QuadSPI on non-ARM (2016-07-19 19:48:48 -0700)

Please note that there is a small conflict with the net-wireless tree,
because a small BCMA Kconfig change that was taken there (to fix up some
build issues) conflics with another small description change in this
pull request. The resolution should be trivial, but I can provide a
resolution if you'd like.

----------------------------------------------------------------
MTD updates for v4.8:

NAND:

  Updates from Boris:

    """
    This pull request contains only one notable change:
    * Addition of the MTK NAND controller driver

    And a bunch of specific NAND driver improvements/fixes. Here are the
    changes that are worth mentioning:
    * A few fixes/improvements for the xway NAND controller driver
    * A few fixes for the sunxi NAND controller driver
    * Support for DMA in the sunxi NAND driver
    * Support for the sunxi NAND controller IP embedded in A23/A33 SoCs
    * Addition for bitflips detection in erased pages to the brcmnand driver
    * Support for new brcmnand IPs
    * Update of the OMAP-GPMC binding to support DMA channel description
    """

  In addition, some small fixes around error handling, etc., as well as one
  long-standing corner case issue (2.6.20, I think?) with writing 1 byte less
  than a page.

NOR:

 * Rework some error handling on reads and writes, so we can better handle (for
   instance) SPI controllers which have limitations on their maximum transfer size

 * Add new Cadence Quad SPI flash controller driver

 * Add new Atmel QSPI flash controller driver

 * Add new Hisilicon SPI flash controller driver

 * Support a few new flash, and update supported features on others

 * Fix the logic used for detecting a fully-unlocked flash

And other miscellaneous small fixes.

----------------------------------------------------------------
Amitoj Kaur Chawla (1):
      mtd: Replace if and BUG with BUG_ON

Ben Hutchings (1):
      mtd: Remove unused symbol CONFIG_MTDRAM_ABS_POS

Boris Brezillon (6):
      mtd: nand: sunxi: add support for DMA assisted operations
      mtd: nand: sunxi: update DT bindings
      mtd: nand: sunxi: Fix OOB bytes retrieval in read_chunks_dma()
      mtd: nand: sunxi: prefer 1k ECC blocks when applicable
      mtd: nand: sunxi: check ecc->size values
      mtd: nand: sunxi: fix subpage write

Brian Norris (7):
      mtd: mtk-quadspi: return amount of data transferred or error in read/write
      mtd: nxp-spifi: return amount of data transferred or error in read/write
      mtd: physmap_of: fix set but unused warning
      mtd: spi-nor: fix wrong "fully unlocked" test
      mtd: spi-nor: support dual, quad, and WP for Gigadevice
      Merge tag 'nand/for-4.8' of github.com:linux-nand/linux into mtd
      mtd: spi-nor: don't build Cadence QuadSPI on non-ARM

Cooper Jr., Franklin (2):
      mtd: nand: omap2: Support parsing dma channel information from DT
      ARM: OMAP2+: Update GPMC and NAND DT binding documentation

Cyrille Pitchen (2):
      Documentation: atmel-quadspi: add binding file for Atmel QSPI driver
      mtd: atmel-quadspi: add driver for Atmel QSPI controller

Dan Carpenter (4):
      mtd: silence some uninitialized variable warnings
      mtd: nand: sunxi: prevent a small memory leak
      mtd: maps: sa1100-flash: potential NULL dereference
      mtd: pmcmsp-flash: Allocating too much in init_msp_flash()

Denys Vlasenko (1):
      mtd: cfi_cmdset_0020: Deinline do_write_buffer, save 5316 bytes

Florian Fainelli (2):
      mtd: brcmnand: Add v7.2 controller support
      mtd: nand: brcmnand: Change BUG_ON in brcmnand_send_cmd

Geert Uytterhoeven (1):
      MAINTAINERS: Add file patterns for mtd device tree bindings

Graham Moore (2):
      mtd: spi-nor: Bindings for Cadence Quad SPI Flash Controller driver
      mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller

Harvey Hunt (1):
      mtd: nand: jz4780: Update MODULE_AUTHOR email address

Hauke Mehrtens (6):
      mtd: nand: xway: add some more documentation
      mtd: nand: xway: convert to normal platform driver
      mtd: nand: xway: remove manual reset
      mtd: nand: xway: extract read and write function
      mtd: nand: xway: add missing write_buf and read_buf to nand driver
      mtd: nand: xway: add nandaddr to own struct

Hector Palacios (1):
      mtd: nand: fix bug writing 1 byte less than page size

Icenowy Zheng (2):
      mtd: nand: sunxi: update DT bindings
      mtd: nand: sunxi: add reset line support

Iwo Mergler (1):
      mtd: nandbiterrs: Support for NAND biterrors test on platforms without raw write

Jiancheng Xue (1):
      mtd: spi-nor: add hisilicon spi-nor flash controller driver

John Crispin (2):
      mtd: nand: xway: Avoid messing up with IO_ADDR_W in ->cmd_ctrl()
      mtd: nand: xway: fix nand locking

Jorge Ramirez-Ortiz (2):
      mtd: mediatek: device tree bindings for MTK
      mtd: mediatek: driver for MTK Smart Device

Kamal Dasu (2):
      mtd: brcmnand: Add check for erased page bitflips
      mtd: brcmnand: Detect sticky ucorr ecc error on dma reads

Michal Suchanek (8):
      mtd: spi-nor: change return value of read/write
      mtd: m25p80: return amount of data transferred or error in read/write
      mtd: fsl-quadspi: return amount of data read/written or error
      mtd: spi-nor: check return value from write
      mtd: spi-nor: stop passing around retlen
      mtd: spi-nor: simplify write loop
      mtd: spi-nor: add read loop
      mtd: m25p80: read in spi_max_transfer_size chunks

P L Sai Krishna (1):
      mtd: spi-nor: Added support for n25q00a.

Rafał Miłecki (2):
      mtd: nand: add ESMT manufacturer
      mtd: update description of MTD_BCM47XXSFLASH symbol

Raghav Dogra (1):
      memory: Update dependency of IFC for Layerscape

Wei Yongjun (3):
      mtd: nand: sunxi: fix return value check in sunxi_nfc_dma_op_prepare()
      mtd: nand: omap2: fix return value check in omap_nand_probe()
      mtd: mtk-nor: remove duplicated include from mtk-quadspi.c

 .../bindings/memory-controllers/omap-gpmc.txt      |    7 +-
 .../devicetree/bindings/mtd/atmel-quadspi.txt      |   32 +
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |    1 +
 .../devicetree/bindings/mtd/cadence-quadspi.txt    |   56 +
 .../devicetree/bindings/mtd/gpmc-nand.txt          |    2 +-
 .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |   24 +
 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  160 ++
 .../devicetree/bindings/mtd/sunxi-nand.txt         |    6 +
 MAINTAINERS                                        |    1 +
 arch/cris/arch-v10/drivers/axisflashmap.c          |    2 +-
 arch/cris/arch-v32/drivers/axisflashmap.c          |    2 +-
 drivers/memory/Kconfig                             |    2 +-
 drivers/memory/fsl_ifc.c                           |    4 +-
 drivers/mtd/chips/cfi_cmdset_0020.c                |    2 +-
 drivers/mtd/devices/Kconfig                        |   16 +-
 drivers/mtd/devices/m25p80.c                       |   37 +-
 drivers/mtd/maps/physmap_of.c                      |    2 +-
 drivers/mtd/maps/pmcmsp-flash.c                    |    6 +-
 drivers/mtd/maps/sa1100-flash.c                    |    4 +-
 drivers/mtd/nand/Kconfig                           |   10 +-
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmnand/brcmnand.c               |  173 ++-
 drivers/mtd/nand/jz4780_bch.c                      |    2 +-
 drivers/mtd/nand/jz4780_nand.c                     |    2 +-
 drivers/mtd/nand/mtk_ecc.c                         |  530 +++++++
 drivers/mtd/nand/mtk_ecc.h                         |   50 +
 drivers/mtd/nand/mtk_nand.c                        | 1526 ++++++++++++++++++++
 drivers/mtd/nand/nand_base.c                       |    2 +-
 drivers/mtd/nand/nand_ids.c                        |    1 +
 drivers/mtd/nand/omap2.c                           |   11 +-
 drivers/mtd/nand/sunxi_nand.c                      |  397 ++++-
 drivers/mtd/nand/xway_nand.c                       |  231 +--
 drivers/mtd/onenand/onenand_base.c                 |    4 +-
 drivers/mtd/spi-nor/Kconfig                        |   27 +
 drivers/mtd/spi-nor/Makefile                       |    3 +
 drivers/mtd/spi-nor/atmel-quadspi.c                |  732 ++++++++++
 drivers/mtd/spi-nor/cadence-quadspi.c              | 1299 +++++++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  |   29 +-
 drivers/mtd/spi-nor/hisi-sfc.c                     |  489 +++++++
 drivers/mtd/spi-nor/mtk-quadspi.c                  |   43 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |   25 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  127 +-
 drivers/mtd/ssfdc.c                                |    3 +-
 drivers/mtd/tests/nandbiterrs.c                    |    2 +-
 include/linux/mtd/nand.h                           |    1 +
 include/linux/mtd/spi-nor.h                        |    8 +-
 46 files changed, 5838 insertions(+), 256 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
 create mode 100644 drivers/mtd/nand/mtk_ecc.c
 create mode 100644 drivers/mtd/nand/mtk_ecc.h
 create mode 100644 drivers/mtd/nand/mtk_nand.c
 create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c
 create mode 100644 drivers/mtd/spi-nor/cadence-quadspi.c
 create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
