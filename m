Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlecd-0005WM-NY
 for linux-mtd@lists.infradead.org; Sat, 26 Aug 2017 17:11:50 +0000
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PULL] mtd: spi-nor: Changes for 4.14
To: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>
Message-ID: <d209658a-f7bd-9723-f279-5978191a05f8@wedev4u.fr>
Date: Sat, 26 Aug 2017 19:11:15 +0200
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

Hi Brian and Boris,

This is the spi-nor PR for 4.14. Except for the SFDP patch,
which is quite a big update, other changes are quite small.

Best regards,

Cyrille

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.infradead.org/l2-mtd.git tags/spi-nor/for-4.14

for you to fetch changes up to 18f7ce2f449504c31a2f2caaeb65430812dc3c43:

  mtd: spi-nor: add support for Microchip sst26vf064b QSPI memory (2017-08-22 18:10:26 +0200)

----------------------------------------------------------------
This pull request contains the following notable changes:
- add support to the JEDEC JESD216B specification (SFDP tables).
- add support to the Intel Denverton SPI flash controller.
- fix error recovery for Spansion/Cypress SPI NOR memories.
- fix 4-byte address management for the Aspeed SPI controller.
- add support to some Microchip SST26 memory parts
- remove unneeded pinctrl header

----------------------------------------------------------------
Alexander Sverdlin (1):
      mtd: spi-nor: Recover from Spansion/Cypress errors

Claudiu Beznea (1):
      mtd: spi-nor: add support for Microchip sst26vf064b QSPI memory

Cyrille Pitchen (1):
      mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables

Cédric Le Goater (1):
      mtd: spi-nor: aspeed: set 4B setting for all chips

Fabio Estevam (2):
      mtd: atmel-quadspi: Remove unneeded pinctrl header
      mtd: mtk-quadspi: Remove unneeded pinctrl header

Matthew Gerlach (1):
      mtd: spi-nor: fix "No newline at end of file"

Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Denverton SPI serial flash controller

 drivers/mtd/spi-nor/Kconfig         |  16 ++++
 drivers/mtd/spi-nor/Makefile        |   3 +-
 drivers/mtd/spi-nor/aspeed-smc.c    |  13 ++-
 drivers/mtd/spi-nor/atmel-quadspi.c |   1 -
 drivers/mtd/spi-nor/intel-spi-pci.c |  82 +++++++++++++++++
 drivers/mtd/spi-nor/mtk-quadspi.c   |   1 -
 drivers/mtd/spi-nor/spi-nor.c       | 805 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h         |  11 +++
 8 files changed, 901 insertions(+), 31 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/intel-spi-pci.c
