Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHyL3-0002LF-QW
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 19:38:43 +0000
Received: by mail-pg0-x241.google.com with SMTP id a1so3548917pgf.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Dec 2016 11:38:20 -0800 (PST)
Date: Fri, 16 Dec 2016 11:38:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD updates for v4.10-rc1
Message-ID: <20161216193816.GB50438@google.com>
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

Nothing enormous here, though notably we have some of the first work of
a few new maintainers. I think for now I'll still be sending pull
requests, but that's open to change in the future.

The following changes since commit 0e2ce9d3fcba5f92dd6c2b27d82690e49d0c0854:

  Merge tag 'nand/fixes-for-4.9-rc3' of github.com:linux-nand/linux (2016-10-28 19:05:25 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20161216

for you to fetch changes up to 445caaa20c4d6da74f426464f90513b81157ad77:

  mtd: Allocate bdi objects dynamically (2016-12-01 10:03:17 -0800)

----------------------------------------------------------------
MTD updates for v4.10-rc1:

Core:

  * dynamic BDI object allocation (resolves some problems when built as a
    module)
  * cleanups in the ooblayout handling

NAND:

  * new tango NAND controller driver
  * new ox820 NAND controller driver
  * addition of a new full-ID entry in the nand_ids table
  * rework of the s3c240 driver to support DT
  * extension of the nand_sdr_timings to expose tCCS, tPROG and tR
  * addition of a new flag to ask the core to wait for tCCS when sending
    a RNDIN/RNDOUT command
  * addition of a new flag to ask the core to let the controller driver
    send the READ/PROGPAGE command

  Minor fixes/cleanup/cosmetic changes:
  * properly support 512 ECC step size in the sunxi driver
  * improve the error messages in the PXA probe path
  * fix module autoload in the omap2 driver
  * cleanup of several nand drivers to return nand_scan{_tail}() error
    code instead of returning -EIO
  * various cleanups in the denali driver
  * fix an error check in nandsim

SPI NOR:

  * new flash IDs
  * wait for Spansion flash to be ready after quad-enable
  * error handling fixes for Candence QSPI
  * constify some structures in Freescale QSPI driver

----------------------------------------------------------------
Ash Benz (1):
      mtd: spi-nor: add Macronix mx25u25635f to list of known devices.

Boris Brezillon (5):
      mtd: nand: sunxi: fix support for 512bytes ECC chunks
      mtd: nand: add support for the TC58NVG2S0H chip
      mtd: nand: Add a few more timings to nand_sdr_timings
      mtd: nand: Wait tCCS after a column change
      mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd

Brian Norris (2):
      Merge tag 'nand/for-4.10' of github.com:linux-nand/linux
      Merge tag 'spi-nor/for-4.10' of git://github.com/spi-nor/linux

Colin Ian King (1):
      mtd: mtdswap: fix spelling mistake "erassure" -> "erasure"

Dan Carpenter (2):
      mtd: spi-nor: Off by one in cqspi_setup_flash()
      mtd: spi-nor: Fix some error codes in cqspi_setup_flash()

Heiner Kallweit (1):
      mtd: spi-nor: fix flags for s25fl128s

IWAMOTO Masahiko (1):
      mtd: spi-nor: Add support for mr25h40

Jagan Teki (1):
      mtd: spi-nor: Add at25df321 spi-nor flash support

Javier Martinez Canillas (1):
      mtd: nand: omap2: Fix module autoload

Joël Esponde (1):
      mtd: spi-nor: fix spansion quad enable

LABBE Corentin (1):
      mtd: spi-nor: constify fsl_qspi_devtype_data

Luis Henriques (1):
      mtd: maps: add missing iounmap() in error path

Marc Gonzalez (6):
      mtd: nand: add tango NFC dt bindings doc
      mtd: nand: add tango NAND flash controller support
      mtd: nand: Support controllers with custom page
      mtd: nand: tango: Enable custom page accessors
      mtd: nand: tango: Cleanup raw_write and raw_read
      mtd: nand: tango: Add standard legalese header

Masahiro Yamada (38):
      mtd: nand: denali_dt: replace clk_disable() with clk_disable_unprepare()
      mtd: nand: change return type of nand_get_flash_type() to int
      mtd: nand: ams-delta: return error code of nand_scan() on error
      mtd: nand: cmx270: return error code of nand_scan() on error
      mtd: nand: cs553x: return error code of nand_scan() on error
      mtd: nand: gpio: return error code of nand_scan() on error
      mtd: nand: mpc5121: return error code of nand_scan() on error
      mtd: nand: tmio: return error code of nand_scan() on error
      mtd: nand: orion: return error code of nand_scan() on error
      mtd: nand: pasemi: return error code of nand_scan() on error
      mtd: nand: plat_nand: return error code of nand_scan() on error
      mtd: nand: atmel: return error code of nand_scan_ident/tail() on error
      mtd: nand: brcmnand: return error code of nand_scan_ident/tail() on error
      mtd: nand: fsmc: return error code of nand_scan_ident/tail() on error
      mtd: nand: lpc32xx: return error code of nand_scan_ident/tail() on error
      mtd: nand: mediatek: return error code of nand_scan_ident/tail() on error
      mtd: nand: mxc: return error code of nand_scan_ident/tail() on error
      mtd: nand: omap2: return error code of nand_scan_ident/tail() on error
      mtd: nand: vf610: return error code of nand_scan_ident/tail() on error
      mtd: nand: cafe: return error code of nand_scan_ident() on error
      mtd: nand: hisi504: return error code of nand_scan_ident() on error
      mtd: nand: pxa3xx: return error code of nand_scan_ident() on error
      mtd: nand: nandsim: remove unneeded checks for nand_scan_ident/tail()
      mtd: nand: socrates: use nand_scan() for nand_scan_ident/tail() combo
      mtd: nand: denali: remove unneeded <linux/slab.h> includes
      mtd: nand: denali: remove unused struct member denali_nand_info::idx
      mtd: nand: denali: remove bogus comment about interrupt handler setup
      mtd: nand: denali: remove detect_partition_feature()
      mtd: nand: denali: remove "Spectra:" prefix from printk strings
      mtd: nand: denali: remove unused struct member totalblks, blksperchip
      mtd: nand: denali: use managed devm_irq_request()
      mtd: nand: denali: return error code from devm_request_irq() on error
      mtd: nand: denali: return error code from nand_scan_ident/tail on error
      mtd: nand: denali: remove unneeded parentheses
      mtd: nand: denali: remove debug lines of __FILE__, __LINE__, __func__
      mtd: remove unneeded initializer in mtd_ooblayout_{get, set}_bytes()
      mtd: use min_t() to refactor mtd_ooblayout_{get, set}_bytes()
      mtd: remove unneeded initializer in mtd_ooblayout_count_bytes()

Moritz Fischer (1):
      mtd: spi-nor: Add support for N25Q016A

Neil Armstrong (1):
      mtd: nand: Add OX820 NAND Support

Rafał Miłecki (2):
      mtd: bcm47xxsflash: use uncached MMIO access for BCM53573
      mtd: bcm47xxpart: fix parsing first block after aligned TRX

Sean Nyekjaer (1):
      mtd: spi-nor: add support for s25fl208k

Sergio Prado (3):
      mtd: s3c2410: make ecc mode configurable via platform data
      dt-bindings: mtd: add DT binding for s3c2410 flash controller
      mtd: s3c2410: parse the device configuration from OF node

Steve Longerbeam (1):
      mtd: Allocate bdi objects dynamically

Sudip Mukherjee (1):
      mtd: nand: nandsim: fix error check

Uwe Kleine-König (1):
      mtd: nand: pxa3xx_nand: write exactly one message on probe failure

 .../devicetree/bindings/mtd/oxnas-nand.txt         |  41 ++
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |  56 ++
 .../devicetree/bindings/mtd/tango-nand.txt         |  38 ++
 arch/arm/mach-s3c24xx/common-smdk.c                |   1 +
 arch/arm/mach-s3c24xx/mach-anubis.c                |   1 +
 arch/arm/mach-s3c24xx/mach-at2440evb.c             |   1 +
 arch/arm/mach-s3c24xx/mach-bast.c                  |   1 +
 arch/arm/mach-s3c24xx/mach-gta02.c                 |   1 +
 arch/arm/mach-s3c24xx/mach-jive.c                  |   1 +
 arch/arm/mach-s3c24xx/mach-mini2440.c              |   1 +
 arch/arm/mach-s3c24xx/mach-osiris.c                |   1 +
 arch/arm/mach-s3c24xx/mach-qt2410.c                |   1 +
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   1 +
 arch/arm/mach-s3c24xx/mach-rx3715.c                |   1 +
 arch/arm/mach-s3c24xx/mach-vstms.c                 |   1 +
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   1 +
 arch/arm/mach-s3c64xx/mach-mini6410.c              |   1 +
 arch/arm/mach-s3c64xx/mach-real6410.c              |   1 +
 drivers/mtd/bcm47xxpart.c                          |  10 +-
 drivers/mtd/devices/bcm47xxsflash.c                |  24 +-
 drivers/mtd/maps/sc520cdp.c                        |   8 +-
 drivers/mtd/mtdcore.c                              |  44 +-
 drivers/mtd/mtdswap.c                              |   2 +-
 drivers/mtd/nand/Kconfig                           |  21 +-
 drivers/mtd/nand/Makefile                          |   2 +
 drivers/mtd/nand/ams-delta.c                       |   5 +-
 drivers/mtd/nand/atmel_nand.c                      |  10 +-
 drivers/mtd/nand/brcmnand/brcmnand.c               |  10 +-
 drivers/mtd/nand/cafe_nand.c                       |   5 +-
 drivers/mtd/nand/cmx270_nand.c                     |   4 +-
 drivers/mtd/nand/cs553x_nand.c                     |   5 +-
 drivers/mtd/nand/denali.c                          | 101 +--
 drivers/mtd/nand/denali.h                          |  12 -
 drivers/mtd/nand/denali_dt.c                       |   3 +-
 drivers/mtd/nand/denali_pci.c                      |   1 -
 drivers/mtd/nand/fsmc_nand.c                       |   9 +-
 drivers/mtd/nand/gpio.c                            |   5 +-
 drivers/mtd/nand/hisi504_nand.c                    |   4 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |  10 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |  10 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |   4 +-
 drivers/mtd/nand/mtk_nand.c                        |   4 +-
 drivers/mtd/nand/mxc_nand.c                        |  10 +-
 drivers/mtd/nand/nand_base.c                       |  84 ++-
 drivers/mtd/nand/nand_ids.c                        |   3 +
 drivers/mtd/nand/nand_timings.c                    |  26 +-
 drivers/mtd/nand/nandsim.c                         |  19 +-
 drivers/mtd/nand/omap2.c                           |  10 +-
 drivers/mtd/nand/orion_nand.c                      |   5 +-
 drivers/mtd/nand/oxnas_nand.c                      | 195 ++++++
 drivers/mtd/nand/pasemi_nand.c                     |   5 +-
 drivers/mtd/nand/plat_nand.c                       |   5 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |  22 +-
 drivers/mtd/nand/s3c2410.c                         | 286 ++++++---
 drivers/mtd/nand/socrates_nand.c                   |  12 +-
 drivers/mtd/nand/sunxi_nand.c                      |   4 +
 drivers/mtd/nand/tango_nand.c                      | 676 +++++++++++++++++++++
 drivers/mtd/nand/tmio_nand.c                       |   6 +-
 drivers/mtd/nand/vf610_nfc.c                       |  10 +-
 drivers/mtd/spi-nor/cadence-quadspi.c              |   6 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |   8 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  14 +-
 include/linux/mtd/nand.h                           |  30 +
 include/linux/platform_data/mtd-nand-s3c2410.h     |   7 +-
 64 files changed, 1555 insertions(+), 351 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/oxnas-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/tango-nand.txt
 create mode 100644 drivers/mtd/nand/oxnas_nand.c
 create mode 100644 drivers/mtd/nand/tango_nand.c
