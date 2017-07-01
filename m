Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dRJ6G-0002GI-9m
 for linux-mtd@lists.infradead.org; Sat, 01 Jul 2017 14:10:18 +0000
Received: from player750.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 4D7336790D
 for <linux-mtd@lists.infradead.org>; Sat,  1 Jul 2017 16:09:42 +0200 (CEST)
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PULL] mtd: spi-nor: Changes for 4.13
Message-ID: <a003346e-ae4f-3ca6-58e2-ce78cab6cf11@wedev4u.fr>
Date: Sat, 1 Jul 2017 16:09:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

this is the PR for 4.13.

Please note that I did not include the patch for the SFDP support since it
has spent less than a week in linux-next.

Best regards,

Cyrille

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/spi-nor/for-4.13

for you to fetch changes up to 9447332ffacceeb49467ae5314887a30f6c0aaa9:

  mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use SPINOR_OP_RDCR instead (2017-06-27 21:50:17 +0200)

----------------------------------------------------------------
This pull request contains the following notable changes:
- introduce support to the SPI 1-2-2 and 1-4-4 protocols.
- introduce support to the Double Data Rate (DDR) mode.
- introduce support to the Octo SPI protocols.
- add support to new memory parts for Spansion, Macronix and Winbond.
- add fixes for the Aspeed, STM32 and Cadence QSPI controler drivers.
- clean up the st_spi_fsm driver.

----------------------------------------------------------------
Alexander Sverdlin (1):
      mtd: spi-nor: Add support for mx66u51235f

Arnd Bergmann (1):
      mtd: spi-nor: cqspi: remove duplicate const

Arvind Yadav (1):
      mtd: spi-nor: cqspi: make of_device_ids const

Benjamin Herrenschmidt (1):
      spi-nor: Add Winbond w25m512jv

Brian Norris (1):
      mtd: spi-nor: stm32-quadspi: allow building with COMPILE_TEST

Cyrille Pitchen (6):
      mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4 protocols
      mtd: m25p80: add support of SPI 1-2-2 and 1-4-4 protocols
      mtd: spi-nor: introduce Double Transfer Rate (DTR) SPI protocols
      mtd: spi-nor: introduce Octo SPI protocols
      mtd: spi-nor: stm32-quadspi: fix compiler errors with COMPILE_TEST
      mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use SPINOR_OP_RDCR instead

Cédric Le Goater (4):
      mtd: spi-nor: Add support for Macronix mx66l1g45g spi flash
      mtd: spi-nor: add Dual and Quad read mode support to some flash devices
      mtd: spi-nor: aspeed: remove dummies from keep mask
      mtd: spi-nor: aspeed: configure chip window on AHB bus

Dan Carpenter (1):
      mtd: spi-nor: Potential oops on error path in quad_enable()

Harry Chou (1):
      mtd: spi-nor: Add support for Spansion S25FL064L

 drivers/mtd/devices/m25p80.c            | 121 +++++++++++++++++++++++++++++------------
 drivers/mtd/devices/serial_flash_cmds.h |   1 -
 drivers/mtd/devices/st_spi_fsm.c        |   4 +-
 drivers/mtd/spi-nor/Kconfig             |   2 +-
 drivers/mtd/spi-nor/aspeed-smc.c        | 183 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/atmel-quadspi.c     |  83 +++++++++++++++++++---------
 drivers/mtd/spi-nor/cadence-quadspi.c   |  20 ++++---
 drivers/mtd/spi-nor/fsl-quadspi.c       |   6 +-
 drivers/mtd/spi-nor/hisi-sfc.c          |  31 ++++++++---
 drivers/mtd/spi-nor/intel-spi.c         |   7 ++-
 drivers/mtd/spi-nor/mtk-quadspi.c       |  15 +++--
 drivers/mtd/spi-nor/nxp-spifi.c         |  22 ++++----
 drivers/mtd/spi-nor/spi-nor.c           | 488 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------
 drivers/mtd/spi-nor/stm32-quadspi.c     |  32 ++++++-----
 include/linux/mtd/spi-nor.h             | 161 +++++++++++++++++++++++++++++++++++++++++++++++++++---
 15 files changed, 937 insertions(+), 239 deletions(-)
