Received: from mail-pa0-f43.google.com ([209.85.220.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNY0E-0007Mh-Di
 for linux-mtd@lists.infradead.org; Tue, 17 Feb 2015 02:35:11 +0000
Received: by padet14 with SMTP id et14so2694861pad.11
 for <linux-mtd@lists.infradead.org>; Mon, 16 Feb 2015 18:34:48 -0800 (PST)
Date: Mon, 16 Feb 2015 18:34:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD updates for 3.20
Message-ID: <20150217023445.GB18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150216

for you to fetch changes up to eb928d40a93f73dd5bdad62c2d363df296ff94ea:

  Merge JFFS2 updates from David Woodhouse (2015-02-16 18:05:26 -0800)

----------------------------------------------------------------

MTD updates for 3.20-rc1

NAND:

 * Add new Hisilicon NAND driver for Hip04
 * Add default reboot handler, to ensure all outstanding erase transactions
   complete in time
 * jz4740: convert to use GPIO descriptor API
 * Atmel: add support for sama5d4
 * Change default bitflip threshold to 75% of correction strength
 * Miscellaneous cleanups and bugfixes

SPI NOR:

 * Freescale QuadSPI:
   - Fix a few probe() and remove() issues
   - Add a MAINTAINERS entry for this driver
   - Tweak transfer size to increase read performance
   - Add suspend/resume support
 * Add Micron quad I/O support
 * ST FSM SPI: miscellaneous fixes

JFFS2:

 * gracefully handle corrupted 'offset' field found on flash

Other:

 * bcm47xxpart: add tweaks for a few new devices
 * mtdconcat: set return lengths properly for mtd_write_oob()
 * map_ram: enable use with mtdoops
 * maps: support fallback to ROM/UBI for write-protected NOR flash

----------------------------------------------------------------
Aaron Sierra (2):
      mtd: map_rom: Support UBI on ROM
      mtd: nand: Request strength instead of bytes for soft BCH

Akinobu Mita (2):
      mtd: nand: ams-delta: fix overwritten mtd_info->owner in initialization
      nandsim: remove unused STATE_DATAOUT_STATUS_M and OPT_SMARTMEDIA

Alessio Igor Bogani (1):
      mtd: map_ram: Enable mtdoops

Allen Xu (2):
      mtd: spi-nor: fsl-qspi: support deep sleep mode for imx6 sx chip
      mtd: fsl-quadspi: improve read performance by increase AHB transfer size

Andy Shevchenko (1):
      mtd: nftl: reorganize operations in condition check

Baruch Siach (2):
      mtd: nand: remove duplicate comment line
      mtd: nand: remove redundant local variable

Bean Huo 霍斌斌 (beanhuo) (1):
      mtd: spi-nor: Add quad I/O support for Micron SPI NOR

Boris BREZILLON (1):
      mtd: nand: gpmi: remove deprecated comment

Brian Norris (3):
      mtd: implement common reboot notifier boilerplate
      mtd: nand: default bitflip-reporting threshold to 75% of correction strength
      Merge JFFS2 updates from David Woodhouse

Chen Jie (1):
      jffs2: fix handling of corrupted summary length

Dan Carpenter (1):
      mtd: hisilicon: && vs & typo

Fabio Estevam (6):
      mtd: gpmi: Remove noisy error message
      Documentation: fsl-quadspi: Add an entry for the imx6sx compatible string
      mtd: fsl-quadspi: Fix module unbound
      mtd: fsl-quadspi: Fix the error paths
      mtd: fsl-quadspi: Remove unneeded success/error messages
      mtd: fsl-quadspi: Remove unnecessary 'map_failed' label

Graham Moore (1):
      mtd: denali: fix incorrect bitmask error in denali_setup_dma

Gu Zheng (1):
      mtd: mtdblock: remove the needless mtdblks_lock

Han Xu (1):
      MAINTAINERS: add maintainer entry for FREESCALE QUAD SPI driver

Joe Schultz (1):
      mtd: physmap_of: Add read-only fallback

Kevin Hao (1):
      mtd: kconfig: replace PPC_OF with PPC

Lars-Peter Clausen (1):
      mtd: nand: jz4740: Convert to GPIO descriptor API

Lee Jones (3):
      mtd: st_spi_fsm: Extend fsm_clear_fifo to handle unwanted bytes
      mtd: st_spi_fsm: Obtain and use EMI clock
      mtd: st_spi_fsm: Fix [-Wsign-compare] build warning

Masahiro Yamada (1):
      mtd: denali: remove unnecessary stubs

Nicholas Mc Guire (1):
      mtd: nand: omap: drop condition with no effect

Niklas Cassel (2):
      mtd: concat: set the return lengths properly
      mtd: avoid registering reboot notifier twice

Rafał Miłecki (4):
      mtd: bcm47xxpart: support TRX data partition being UBI
      mtd: bcm47xxpart: lower minimal blocksize to 4Ki (from 64Ki)
      mtd: bcm47xxpart: support SquashFS with an original magic
      mtd: spi-nor: support for (GigaDevice) GD25Q128B

Rickard Strandqvist (1):
      jffs2: compr_rubin: Remove unused function

Scott Branden (1):
      mtd: nand: added nand_shutdown

Stefan Roese (1):
      mtd: gpmi: Remove "We support only one NAND chip" from bindings doc

Wu, Josh (2):
      mtd: atmel_nand: return max bitflips in all sectors in pmecc_correction()
      mtd: atmel_nand: introduce a new compatible string for sama5d4 chip

Zhou Wang (2):
      mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
      mtd: hisilicon: add device tree binding documentation

 .../devicetree/bindings/mtd/atmel-nand.txt         |   2 +-
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   2 +-
 .../devicetree/bindings/mtd/gpmi-nand.txt          |   2 +-
 .../devicetree/bindings/mtd/hisi504-nand.txt       |  47 ++
 .../devicetree/bindings/mtd/mtd-physmap.txt        |   5 +
 MAINTAINERS                                        |   6 +
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h    |   2 -
 arch/mips/jz4740/board-qi_lb60.c                   |  11 +-
 drivers/mtd/bcm47xxpart.c                          |  43 +-
 drivers/mtd/chips/map_ram.c                        |   1 +
 drivers/mtd/chips/map_rom.c                        |  13 +-
 drivers/mtd/devices/st_spi_fsm.c                   | 137 +++-
 drivers/mtd/maps/physmap_of.c                      |  10 +
 drivers/mtd/mtdblock.c                             |  10 -
 drivers/mtd/mtdconcat.c                            |   3 +-
 drivers/mtd/mtdcore.c                              |  28 +
 drivers/mtd/nand/Kconfig                           |   7 +-
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/ams-delta.c                       |   6 +-
 drivers/mtd/nand/atmel_nand.c                      |  31 +-
 drivers/mtd/nand/denali.c                          |  40 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |   9 -
 drivers/mtd/nand/hisi504_nand.c                    | 891 +++++++++++++++++++++
 drivers/mtd/nand/jz4740_nand.c                     |  29 +-
 drivers/mtd/nand/nand_base.c                       |  31 +-
 drivers/mtd/nand/nandsim.c                         |   7 +-
 drivers/mtd/nand/omap2.c                           |  31 +-
 drivers/mtd/nand/sunxi_nand.c                      |   2 -
 drivers/mtd/nftlmount.c                            |  18 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  93 ++-
 drivers/mtd/spi-nor/spi-nor.c                      |  63 +-
 fs/jffs2/compr_rubin.c                             |   5 -
 fs/jffs2/scan.c                                    |   5 +
 include/linux/mtd/mtd.h                            |   1 +
 include/linux/mtd/spi-nor.h                        |   7 +
 35 files changed, 1385 insertions(+), 214 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
 create mode 100644 drivers/mtd/nand/hisi504_nand.c
