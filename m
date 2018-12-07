Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPT-0000wj-8l
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:02 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 00/34] mtd: spi-nor: Move manufacturer/SFDP code out of
 the core
Date: Fri,  7 Dec 2018 10:26:03 +0100
Message-Id: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This patch series is an attempt at getting all manufacturer specific
quirks/code out of the core to make the core logic more readable and
thus ease maintainance.

This is just a preliminary version, and I'm pretty sure a lot of things
can be improved (Tudor already pointed some of them which I'll try to
address).

This series is split in 2:
- preparation patches (patches 1 to 11)
- the actual migration to one file per manufacturer + one file for the
  SFDP parsing logic

Feel free to comment on the approach.

Regards,

Boris

Boris Brezillon (34):
  mtd: spi-nor: Add a new hook to let part specific code tweak the
    config
  mtd: spi-nor: Add a post SFDP fixup hook for gd25q256
  mtd: spi-nor: Create a ->set_4byte() method
  mtd: spi-nor: Add spansion_fixups()
  mtd: spi-nor: Rework the SPI NOR lock/unlock logic
  mtd: spi-nor: Rework the ->quad_enable() selection logic
  mtd: spi-nor: Add a new flag to clear SW protection bits during init
  mtd: spi-nor: Add a ->convert_addr() method
  mtd: spi-nor: Add a flag to skip spi_nor_setup()
  mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
  mtd: spi-nor: Move S3AN fixups to the manufacturer fixups path
  mtd: spi-nor: Prepare things for core / manufacturer code split
  mtd: spi-nor: Add the concept of SPI NOR manufacturer driver
  mtd: spi-nor: Stop prefixing generic functions with a manufacturer
    name
  mtd: spi-nor: Expose some functions to manufacturer drivers
  mtd: spi-nor: Move Atmel bits out of core.c
  mtd: spi-nor: Move Eon bits out of core.c
  mtd: spi-nor: Move ESMT bits out of core.c
  mtd: spi-nor: Move Everspin bits out of core.c
  mtd: spi-nor: Move Fujitsu bits out of spi-nor-core.c
  mtd: spi-nor: Move GigaDevice bits out of core.c
  mtd: spi-nor: Move Intel bits out of core.c
  mtd: spi-nor: Move ISSI bits out of core.c
  mtd: spi-nor: Move Macronix bits out of core.c
  mtd: spi-nor: Move Micron/ST bits out of core.c
  mtd: spi-nor: Move Spansion bits out of core.c
  mtd: spi-nor: Move SST bits out of core.c
  mtd: spi-nor: Move Winbond bits out of core.c
  mtd: spi-nor: Move Catalyst bits out of core.c
  mtd: spi-nor: Move Xilinx bits out of core.c
  mtd: spi-nor: Move XMC bits out of core.c
  mtd: spi-nor: Get rid of the now empty spi_nor_ids[] table
  mtd: spi-nor: Move SFDP parsing code out of core.c
  mtd: spi-nor: Add sfdp fixups hooks

 drivers/mtd/spi-nor/Kconfig                   |  108 +-
 drivers/mtd/spi-nor/Makefile                  |   30 +-
 drivers/mtd/spi-nor/atmel.c                   |   47 +
 drivers/mtd/spi-nor/catalyst.c                |   39 +
 drivers/mtd/spi-nor/controllers/Kconfig       |  107 +
 drivers/mtd/spi-nor/controllers/Makefile      |   12 +
 .../spi-nor/{ => controllers}/aspeed-smc.c    |    0
 .../spi-nor/{ => controllers}/atmel-quadspi.c |    0
 .../{ => controllers}/cadence-quadspi.c       |    0
 .../spi-nor/{ => controllers}/fsl-quadspi.c   |    0
 .../mtd/spi-nor/{ => controllers}/hisi-sfc.c  |    0
 .../spi-nor/{ => controllers}/intel-spi-pci.c |    0
 .../{ => controllers}/intel-spi-platform.c    |    0
 .../mtd/spi-nor/{ => controllers}/intel-spi.c |    0
 .../mtd/spi-nor/{ => controllers}/intel-spi.h |    0
 .../spi-nor/{ => controllers}/mtk-quadspi.c   |    0
 .../mtd/spi-nor/{ => controllers}/nxp-spifi.c |    0
 .../spi-nor/{ => controllers}/stm32-quadspi.c |    0
 drivers/mtd/spi-nor/core.c                    | 2290 ++++++++++
 drivers/mtd/spi-nor/eon.c                     |   28 +
 drivers/mtd/spi-nor/esmt.c                    |   31 +
 drivers/mtd/spi-nor/everspin.c                |   39 +
 drivers/mtd/spi-nor/fujitsu.c                 |   20 +
 drivers/mtd/spi-nor/gigadevice.c              |   74 +
 drivers/mtd/spi-nor/intel.c                   |   35 +
 drivers/mtd/spi-nor/internals.h               |  382 ++
 drivers/mtd/spi-nor/issi.c                    |   67 +
 drivers/mtd/spi-nor/macronix.c                |  105 +
 drivers/mtd/spi-nor/micron-st.c               |  121 +
 drivers/mtd/spi-nor/sfdp.c                    |  912 ++++
 drivers/mtd/spi-nor/spansion.c                |  137 +
 drivers/mtd/spi-nor/spi-nor.c                 | 3880 -----------------
 drivers/mtd/spi-nor/sst.c                     |  132 +
 drivers/mtd/spi-nor/winbond.c                 |  116 +
 drivers/mtd/spi-nor/xilinx.c                  |   97 +
 drivers/mtd/spi-nor/xmc.c                     |   29 +
 include/linux/mtd/spi-nor.h                   |   50 +-
 37 files changed, 4878 insertions(+), 4010 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/atmel.c
 create mode 100644 drivers/mtd/spi-nor/catalyst.c
 create mode 100644 drivers/mtd/spi-nor/controllers/Kconfig
 create mode 100644 drivers/mtd/spi-nor/controllers/Makefile
 rename drivers/mtd/spi-nor/{ => controllers}/aspeed-smc.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/atmel-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/cadence-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/fsl-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/hisi-sfc.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi-pci.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi-platform.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/intel-spi.h (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/mtk-quadspi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/nxp-spifi.c (100%)
 rename drivers/mtd/spi-nor/{ => controllers}/stm32-quadspi.c (100%)
 create mode 100644 drivers/mtd/spi-nor/core.c
 create mode 100644 drivers/mtd/spi-nor/eon.c
 create mode 100644 drivers/mtd/spi-nor/esmt.c
 create mode 100644 drivers/mtd/spi-nor/everspin.c
 create mode 100644 drivers/mtd/spi-nor/fujitsu.c
 create mode 100644 drivers/mtd/spi-nor/gigadevice.c
 create mode 100644 drivers/mtd/spi-nor/intel.c
 create mode 100644 drivers/mtd/spi-nor/internals.h
 create mode 100644 drivers/mtd/spi-nor/issi.c
 create mode 100644 drivers/mtd/spi-nor/macronix.c
 create mode 100644 drivers/mtd/spi-nor/micron-st.c
 create mode 100644 drivers/mtd/spi-nor/sfdp.c
 create mode 100644 drivers/mtd/spi-nor/spansion.c
 delete mode 100644 drivers/mtd/spi-nor/spi-nor.c
 create mode 100644 drivers/mtd/spi-nor/sst.c
 create mode 100644 drivers/mtd/spi-nor/winbond.c
 create mode 100644 drivers/mtd/spi-nor/xilinx.c
 create mode 100644 drivers/mtd/spi-nor/xmc.c

-- 
2.17.1
