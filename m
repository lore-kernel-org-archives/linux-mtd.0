Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPk4x-0005xO-PY
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2018 08:11:17 +0000
Date: Thu, 22 Nov 2018 09:10:51 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marex@denx.de>
Subject: [GIT PULL] mtd: Fixes for 4.20-rc4
Message-ID: <20181122091051.70407bcd@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus,

Here is the MTD fixes PR for 4.20-rc4.

Regards,

Boris

The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.20-rc4

for you to fetch changes up to e8828ec1c003727fc001eab06aa19bd2ca9b677e:

  mtd: spi-nor: fix selection of uniform erase type in flexible conf (2018-11-20 14:26:59 +0100)

----------------------------------------------------------------
SPI NOR fixes:
- Various fixes related to the SFDP parsing code merged in 4.20
- Fix for a page fault in the cadence-qspi

NAND fixes:
- Fix a macro name conflict between the QCOM NAND controller driver
  and the RISC-V asm headers
- Fix of-node handling in the atmel driver

----------------------------------------------------------------
Johan Hovold (1):
      mtd: rawnand: atmel: fix OF child-node lookup

Olof Johansson (1):
      mtd: rawnand: qcom: Namespace prefix some commands

Thor Thayer (1):
      mtd: spi-nor: Fix Cadence QSPI page fault kernel panic

Tudor.Ambarus@microchip.com (5):
      mtd: spi-nor: don't drop sfdp data if optional parsers fail
      mtd: spi-nor: fix iteration over smpt array
      mtd: spi-nor: don't overwrite errno in spi_nor_get_map_in_use()
      mtd: spi_nor: pass DMA-able buffer to spi_nor_read_raw()
      mtd: spi-nor: fix selection of uniform erase type in flexible conf

 drivers/mtd/nand/raw/atmel/nand-controller.c |  11 +++--
 drivers/mtd/nand/raw/qcom_nandc.c            |  32 ++++++-------
 drivers/mtd/spi-nor/cadence-quadspi.c        |  19 ++++++--
 drivers/mtd/spi-nor/spi-nor.c                | 130 +++++++++++++++++++++++++++++++++++++++-------------
 4 files changed, 137 insertions(+), 55 deletions(-)
