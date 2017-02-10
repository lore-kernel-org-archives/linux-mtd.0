Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccC1e-00009T-Tf
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 14:18:17 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [GIT PULL v2] mtd: spi-nor: Changes for 4.11
To: Brian Norris <computersforpeace@gmail.com>
CC: Boris BREZILLON <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, MTD Maling List
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <6cdd261f-ad1c-9875-6776-fd10d68ea4c3@atmel.com>
Date: Fri, 10 Feb 2017 15:17:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

I've rewritten the spi-nor history as asked so this is the new PR.

ChangeLog for the PR:

v1 -> v2
- create new tag: spi-nor/for-4.11-v2
- remove the stable tag from "mtd: m25p80: consider max message size in m25p80_read"
- fix * alignment in comment block in "mtd: spi-nor: Add support for S3AN spi-nor devices"

Best regards,

Cyrille


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://github.com/spi-nor/linux.git tags/spi-nor/for-4.11-v2

for you to fetch changes up to 7fa2c7038cc0ec16ae5d8eee347ea136de0f4b65:

  mtd: spi-nor: cqspi: remove redundant dead code on error return check (2017-02-10 14:22:00 +0100)

----------------------------------------------------------------
This pull request contains the following notable changes:
- add support to the 4-byte address instruction set.
- add support to new memory parts.
- add support to S3AN memories.
- add support to the Intel SPI controller.
- add support to the Aspeed AST2400 and AST2550 controllers.
- fix max SPI transfer and message sizes in m25p80_read().
- fix the Candence QSPI driver.
- fix the Freescale QSPI driver.

----------------------------------------------------------------
Colin Ian King (1):
      mtd: spi-nor: cqspi: remove redundant dead code on error return check

Cyrille Pitchen (5):
      mtd: spi-nor: improve macronix_quad_enable()
      mtd: spi-nor: remove WARN_ONCE() message in spi_nor_write()
      mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte address op codes
      mtd: spi-nor: add a stateless method to support memory size above 128Mib
      Merge tag 'ib-mfd-mtd-v4.11' of git://git.kernel.org/.../lee/mfd

Cédric Le Goater (4):
      mtd: spi-nor: add memory controllers for the Aspeed AST2500 SoC
      mtd: aspeed: add memory controllers for the Aspeed AST2400 SoC
      mtd: spi-nor: bindings for the Aspeed memory controllers
      mtd: aspeed: fix compile warning in aspeed_smc_read_from_ahb()

Guochun Mao (1):
      Documentation: mtk-quadspi: update DT bindings

Heiner Kallweit (1):
      mtd: m25p80: consider max message size in m25p80_read

Kamal Dasu (1):
      mtd: spi-nor: Add support for gd25q16

Marek Vasut (1):
      mtd: spi-nor: cqspi: Fix build on arches missing readsl/writesl

Mika Westerberg (3):
      spi-nor: Add support for Intel SPI serial flash controller
      mfd: lpc_ich: Add support for SPI serial flash host controller
      mfd: lpc_ich: Add support for Intel Apollo Lake SoC

Ricardo Ribalda Delgado (2):
      mtd: spi-nor: Add support for S3AN spi-nor devices
      mtd: spi-nor: Fix S3AN addressing calculation

Uwe Kleine-König (1):
      mtd: spi-nor: add dt support for Everspin MRAMs

Victor Shyba (1):
      mtd: spi-nor: Add lock/unlock support for f25l32pa

Yunhui Cui (2):
      mtd:fsl-quadspi:use the property fields of SPI-NOR
      mtd: fsl-quadspi: Rename SEQID_QUAD_READ to SEQID_READ

 Documentation/devicetree/bindings/mtd/aspeed-smc.txt    |  51 +++++
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt |   2 +
 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt   |   8 +-
 Documentation/mtd/intel-spi.txt                         |  88 +++++++++
 drivers/mfd/lpc_ich.c                                   | 131 +++++++++++++
 drivers/mtd/devices/m25p80.c                            |   9 +-
 drivers/mtd/devices/serial_flash_cmds.h                 |   7 -
 drivers/mtd/devices/st_spi_fsm.c                        |  28 +--
 drivers/mtd/spi-nor/Kconfig                             |  32 +++-
 drivers/mtd/spi-nor/Makefile                            |   3 +
 drivers/mtd/spi-nor/aspeed-smc.c                        | 758 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/cadence-quadspi.c                   |  10 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                       |  48 ++---
 drivers/mtd/spi-nor/intel-spi-platform.c                |  57 ++++++
 drivers/mtd/spi-nor/intel-spi.c                         | 777 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.h                         |  24 +++
 drivers/mtd/spi-nor/spi-nor.c                           | 271 ++++++++++++++++++++++++---
 drivers/spi/spi-bcm-qspi.c                              |   6 +-
 include/linux/mfd/lpc_ich.h                             |   3 +
 include/linux/mtd/spi-nor.h                             |  34 +++-
 include/linux/platform_data/intel-spi.h                 |  31 +++
 21 files changed, 2278 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 create mode 100644 Documentation/mtd/intel-spi.txt
 create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.c
 create mode 100644 drivers/mtd/spi-nor/intel-spi.h
 create mode 100644 include/linux/platform_data/intel-spi.h
