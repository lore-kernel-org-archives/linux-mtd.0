Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF2OY-0002NH-NB
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 16:49:56 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 0/9] mtd: spi-nor: parse SFDP tables as defined by JESD216B
Date: Mon, 20 Jun 2016 18:49:59 +0200
Message-ID: <cover.1466440540.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This series of patches adds support SPI x-y-z protocols other than
SPI 1-1-1, 1-1-2 and 1-1-4. When available, the Serial Flash Discoverable
Parameter (SFDP) tables are parsed to dynamically configure the SPI
protocols, op codes, number of dummy cycles or erase block size used
during Fast Read, Page Program and Sector Erase operation.
Otherwise, when SFDP tables are not available, the legacy settings are
used: we only use SPI 1-1-1, 1-1-2 or 1-1-4 protocols.

Also the 3rd parameter of spi_nor_scan() is changed so the caller can
provide the spi-nor framework with a more accurate list of SPI protocols
supported by the SPI controller. Using both this list and the SFDP
settings, the spi-nor framework can now select the best match for SPI
protocols supported by both the memory and the controller.


This series of patches is based onto next-20160620.
It was tested on a sama5d2 xplained board + Macronix mx25l25673g.

Best regards,

Cyrille

Cyrille Pitchen (9):
  mtd: spi-nor: improve macronix_quad_enable()
  mtd: spi-nor: add an alternative method to support memory >16MiB
  Documentation: atmel-quadspi: add binding file for Atmel QSPI driver
  mtd: atmel-quadspi: add driver for Atmel QSPI controller
  mtd: spi-nor: add support of SPI protocols like SPI 1-2-2 and SPI
    1-4-4
  mtd: spi-nor: remove unused set_quad_mode() function
  mtd: m25p80: add support of dual and quad spi protocols to all
    commands
  mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables
  mtd: spi-nor: parse SFDP 4-byte Address Instruction Table

 .../devicetree/bindings/mtd/atmel-quadspi.txt      |  32 +
 drivers/mtd/devices/m25p80.c                       | 204 ++++-
 drivers/mtd/devices/serial_flash_cmds.h            |   7 -
 drivers/mtd/devices/st_spi_fsm.c                   |  28 +-
 drivers/mtd/spi-nor/Kconfig                        |   9 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/atmel-quadspi.c                | 770 +++++++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  |   8 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  |  16 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |  21 +-
 drivers/mtd/spi-nor/spi-nor.c                      | 962 +++++++++++++++++++--
 include/linux/mtd/spi-nor.h                        | 159 +++-
 12 files changed, 2021 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c

-- 
1.8.2.2
