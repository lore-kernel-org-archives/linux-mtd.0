Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWtZd-00056k-Gj
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 21:58:38 +0000
Received: by paap5 with SMTP id p5so1132891paa.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 14:58:16 -0700 (PDT)
Date: Tue, 1 Sep 2015 14:58:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MTD updates for 4.3-rc1
Message-ID: <20150901215814.GA74141@google.com>
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

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150901

for you to fetch changes up to 718e38b4d96085b4dab08d3d32e5e033aa1ba6e9:

  mtd: mtd_oobtest: Fix the address offset with vary_offset case (2015-08-27 16:30:01 -0700)

----------------------------------------------------------------
MTD updates for 4.3-rc1:

 SPI NOR
  * reduce virtual address space requirements for fsl-quadspi memory map
  * new fsl-quadspi IP support: imx6ul-qspi and imx7d-qspi
  * add new NOR flash device support
  * add new driver for NXP SPI Flash Interface (SPIFI)
  * stop abusing SPI API structs for non-SPI framework
  * fixup DT table matching for new "jedec,spi-nor" string

 NAND
  * brcmnand: fix big endian MIPS macro usage
  * denali: refactor to use devres, dev_*() printing, etc.
  * OMAP ELM: change the module alias to actually be usable
  * pxa3xx_nand: fixup a few command sequencing issues -- both new and old
      - race conditions in the IRQ handler status clearing
      - problems when a bootloader left interrupts pending
      - config issues when overriding the bootloader configuration
  * new flash device support
  * sunxi_nand:
      - optimize timing configuration by calculation, rather than fixed
        fail-safe values
      - use EDO setting from ONFI
  * r852: fix compiler warnings
  * davinci: add 4KB page support

 Core
  * oobtest: correct debug print information

----------------------------------------------------------------
Alexander Stein (1):
      mtd: fsl-quadspi: Actually clear TX FIFO upon write

Alexey Firago (1):
      mtd: spi-nor: set SECT_4K for n25q064 SPI flash

Alexey Khoroshilov (1):
      mtd: nettel: do not ignore mtd_device_register() failure in nettel_init()

Allen Xu (1):
      mtd: spi-nor: fsl-quadspi: i.MX6SX: fixed the random QSPI access failed issue

Andy Shevchenko (4):
      mtd: denali: hide core part from user in Kconfig
      mtd: denali_pci: use module_pci_driver() macro
      mtd: denali_pci: refactor driver using devres API
      mtd: denali_pci: switch to dev_err()

Antoine Ténart (1):
      mtd: pxa3xx_nand: add a default chunk size

Antony Pavlov (1):
      mtd: spi-nor: add Spansion S25FL204K support

Axel Lin (2):
      mtd: brcmnand: Fix misuse of IS_ENABLED
      mtd: omap_elm: Fix module alias

Brian Norris (3):
      Merge 4.2-rc1 into MTD -next
      Merge MTD 4.2-rc fixes into MTD -next
      mtd: m25p80: allow arbitrary OF matching for "jedec,spi-nor"

Colin Ian King (1):
      mtd: physmap_of: fix null pointer deference when kzalloc returns null

Ezequiel Garcia (1):
      nand: pxa3xx: Increase initial buffer size

Ezequiel García (1):
      nand: pxa3xx: Increase READ_ID buffer and make the size static

Fabio Estevam (1):
      mtd: spi-nor: Improve Kconfig help text for SPI_FSL_QUADSPI

Frank Li (7):
      mtd: spi-nor: fsl-quadspi: add imx7d support
      Documentation: fsl-quadspi: Add fsl, imx7d-qspi compatible string
      mtd: spi-nor: fsl-quadspi: add i.mx6ul support
      Documentation: fsl-quadspi: Add fsl, imx6ul-qspi compatible string
      mtd: spi-nor: fsl-quadspi: workaround qspi can't wakeup from wait mode
      mtd: spi-nor: fsl-quadspi: reset the module in the probe
      mtd: spi-nor: fsl-quadspi: fix unsupported cmd when run flash_erase

Han Xu (3):
      mtd: fsl-quadspi: Access multiple chips simultaneously
      mtd: spi-nor: fsl-quadspi: dynamically map memory space for AHB read
      mtd: spi-nor: fsl-quadspi: use quirk to distinguish different qspi version

Javier Martinez Canillas (1):
      mtd: dataflash: Export OF module alias information

Joachim Eastwood (2):
      doc: dt: add documentation for nxp,lpc1773-spifi
      mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)

Nicolas Iooss (1):
      mtd: r852: make ecc_reg 32-bit in r852_ecc_correct

Oleksij Rempel (1):
      mtd: nand: add Toshiba TC58NVG0S3E to nand_ids table

Rafał Miłecki (1):
      mtd: spi-nor: stop (ab)using struct spi_device_id

Robert Jarzmik (3):
      MAINTAINERS: mtd: docg3: add docg3 maintainer
      mtd: nand: pxa3xx_nand: fix early spurious interrupt
      mtd: nand: pxa3xx-nand: fix random command timeouts

Roger Quadros (1):
      mtd: mtd_oobtest: Fix the address offset with vary_offset case

Roy Spliet (2):
      mtd: nand: sunxi: Replace failsafe timing cfg with calculated value
      mtd: nand: sunxi: Set serial access mode correctly

Sandeep Paulraj (1):
      nand: davinci: add support for 4K page size nand devices

Scott Wood (1):
      mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict

Tomer Barletz (1):
      mtd: blkdevs: fix switch-bool compilation warning

shengyong (2):
      mtd: nandsim: fix free of NULL pointer
      mtd: nandsim: fix double free

 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   3 +-
 .../devicetree/bindings/mtd/nxp-spifi.txt          |  58 +++
 MAINTAINERS                                        |   6 +
 drivers/mtd/devices/m25p80.c                       |  18 +-
 drivers/mtd/devices/mtd_dataflash.c                |   1 +
 drivers/mtd/maps/nettel.c                          |  13 +-
 drivers/mtd/maps/physmap_of.c                      |   6 +
 drivers/mtd/mtd_blkdevs.c                          |   8 +-
 drivers/mtd/nand/Kconfig                           |  13 +-
 drivers/mtd/nand/brcmnand/brcmnand.h               |   4 +-
 drivers/mtd/nand/davinci_nand.c                    |  42 +-
 drivers/mtd/nand/denali_pci.c                      |  43 +-
 drivers/mtd/nand/nand_ids.c                        |   4 +
 drivers/mtd/nand/nandsim.c                         |  28 +-
 drivers/mtd/nand/omap_elm.c                        |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |  61 ++-
 drivers/mtd/nand/r852.c                            |   2 +-
 drivers/mtd/nand/sunxi_nand.c                      |  88 +++-
 drivers/mtd/spi-nor/Kconfig                        |  14 +-
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/fsl-quadspi.c                  | 265 ++++++++---
 drivers/mtd/spi-nor/nxp-spifi.c                    | 482 +++++++++++++++++++++
 drivers/mtd/spi-nor/spi-nor.c                      |  69 ++-
 drivers/mtd/tests/oobtest.c                        |  18 +-
 include/linux/mtd/nand.h                           |  10 +-
 25 files changed, 1021 insertions(+), 238 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nxp-spifi.txt
 create mode 100644 drivers/mtd/spi-nor/nxp-spifi.c
