Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqOVj-0000wl-29
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 17:23:28 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH RFC 0/8] mtd: spi-nor: fix support of Quad SPI memories
Date: Wed, 13 Apr 2016 19:23:32 +0200
Message-ID: <cover.1460567255.git.cyrille.pitchen@atmel.com>
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

this series is RFC but has already been tested on a sama5d2x xplained
board with the Atmel QSPI controller + Micron n25q128a13:
compatible = "micron,n25q128a13", "jedec,spi-nor";

This first 3 patches of the series are stable and have already been
submitted to linux-mtd. They are required as a base for the later
patches.

Support of Micron memories has been implemented as an example, other
memory entries should be updated as needed in the spi_nor_ids[] table.

This new way to support Quad SPI memories is inspired by the JEDEC
SFDP standard. However SFDP tables are not provided by all memories and
some of them badly implement the standard. Also the standard itself
can tell whether the memory supports the 2-2-2 mode but doesn't provide
the procedure to enter/leave this mode as provided for the 4-4-4 mode.


Please note that some commit messages are missing but a review might be
really helpfull! :)

Almost all the actual rework is done in patch 4.

Best regards,

Cyrille

Cyrille Pitchen (8):
  mtd: spi-nor: add an alternative method to support memory >16MiB
  mtd: spi-nor: allow different flash_info entries to share the same
    JEDEC ID
  mtd: spi-nor: add entry for Macronix mx25l25673g
  mtd: spi-nor: fix support of Dual (x-y-2) and Quad (x-y-4) SPI
    protocols
  mtd: m25p80: add support of dual and quad spi protocols to all
    commands
  mtd: spi-nor: add support for Micron Dual and Quad SPI memories
  Documentation: atmel-quadspi: add binding file for Atmel QSPI driver
  mtd: atmel-quadspi: add driver for Atmel QSPI controller

 .../devicetree/bindings/mtd/atmel-quadspi.txt      |  32 +
 drivers/mtd/devices/m25p80.c                       | 212 ++++--
 drivers/mtd/devices/serial_flash_cmds.h            |   7 -
 drivers/mtd/devices/st_spi_fsm.c                   |  28 +-
 drivers/mtd/spi-nor/Kconfig                        |   9 +
 drivers/mtd/spi-nor/Makefile                       |   1 +
 drivers/mtd/spi-nor/atmel-quadspi.c                | 812 +++++++++++++++++++++
 drivers/mtd/spi-nor/fsl-quadspi.c                  |   9 +-
 drivers/mtd/spi-nor/mtk-quadspi.c                  |  17 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |  22 +-
 drivers/mtd/spi-nor/spi-nor.c                      | 635 +++++++++++++---
 include/linux/mtd/spi-nor.h                        | 160 +++-
 12 files changed, 1750 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
 create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c

-- 
1.8.2.2
