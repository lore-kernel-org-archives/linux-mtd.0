Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Css-0006HU-Km
 for linux-mtd@lists.infradead.org; Mon, 01 May 2017 15:05:08 +0000
Received: from player730.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 64C116F67B
 for <linux-mtd@lists.infradead.org>; Mon,  1 May 2017 17:04:31 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Ludovic Barre <ludovic.Barre@st.com>
Subject: [PULL v2] mtd: spi-nor: changes for 4.12
Message-ID: <071e87fd-f55c-b7ad-7554-cd6f426f07c8@wedev4u.fr>
Date: Mon, 1 May 2017 17:04:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

this is a new spi-nor PR for 4.12. Just few bug fixes in some (Q)SPI controller
drivers and support to new memory parts.
Only one new driver for the STM32 QSPI controller.

I didn't include any of my patches upgrading the spi-nor framework
since they didn't spend enough time in linux-next.

Best regards,

Cyrille


ChangeLog:

v1 -> v2
- squash Arnd's patch into Ludovic's original commit:
dc5e400611c5 ("mtd: spi-nor: add driver for STM32 quad spi flash controller")
to remove the MODULE_ALIAS() line.



The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://github.com/spi-nor/linux.git tags/spi-nor/for-4.12-v2

for you to fetch changes up to 8abe904dc82772bf1635fcc5765433c672f0a875:

  mtd: mtk-nor: set controller's address width according to nor flash (2017-05-01 16:45:40 +0200)

----------------------------------------------------------------
This pull request contains the following notable changes:
- fixes in the hisi SPI controller driver.
- fixes in the intel SPI controller driver.
- fixes in the Mediatek SPI controller driver.
- fixes to some SPI flash memories not supported the Chip Erase command.
- add support to some new memory parts (Winbond, Macronix, Micron, ESMT).
- add new driver for the STM32 QSPI controller.

----------------------------------------------------------------
Alexander Kurz (2):
      drivers mtd: spi-nor: add Winbond W25Q20 variants
      drivers mtd: spi-nor: add Macronix MX25Ux033E and MX25Ux035 variants

Alexey Khoroshilov (1):
      mtd: spi-nor: hisi: do not ignore clk_prepare_enable() failure

Guochun Mao (1):
      mtd: mtk-nor: set controller's address width according to nor flash

L. D. Pinney (1):
      mtd: spi-nor: Add support for ESMT F25L32QA and F25L64QA

Ludovic Barre (1):
      mtd: spi-nor: add driver for STM32 quad spi flash controller

Mathias Kresin (1):
      mtd: spi-nor: enable stateless 4b op codes for mx25u25635f

Nicholas Mc Guire (2):
      mtd: spi-nor: intel: use true/false for boolean
      mtd: spi-nor: intel: use ERR_CAST in return statement

Nobuhiro Iwamatsu (1):
      mtd: spi-nor: Add support for N25Q256A11

mar.krzeminski (2):
      mtd: spi-nor: Fix whole chip erasing for stacked chips.
      mtd: spi-nor: Disable chip erase for Micron n25q00.

 drivers/mtd/spi-nor/Kconfig         |   7 ++
 drivers/mtd/spi-nor/Makefile        |   1 +
 drivers/mtd/spi-nor/hisi-sfc.c      |   5 +-
 drivers/mtd/spi-nor/intel-spi.c     |   4 +-
 drivers/mtd/spi-nor/mtk-quadspi.c   |  27 +++++++
 drivers/mtd/spi-nor/spi-nor.c       |  18 ++++-
 drivers/mtd/spi-nor/stm32-quadspi.c | 693 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 749 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
