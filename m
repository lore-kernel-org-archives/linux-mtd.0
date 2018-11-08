Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKhVI-00005w-3X
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 10:25:36 +0000
Date: Thu, 8 Nov 2018 11:25:13 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut
 <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>
Subject: [GIT PULL] mtd: Fixes for 4.20-rc2
Message-ID: <20181108112513.3daf0053@bbrezillon>
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

Here is the MTD fixes PR for 4.20-rc2.

Regards,

Boris

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.20-rc2

for you to fetch changes up to 98ee3fc7ef8395f8b7a379e6608aee91efc66d48:

  mtd: nand: Fix nanddev_pos_next_page() kernel-doc header (2018-11-06 17:40:31 +0100)

----------------------------------------------------------------
MTD changes:
* Kill a VLA in sa1100

SPI NOR changes:
* Make sure ->addr_width is restored when SFDP parsing fails
* Propate errors happening in cqspi_direct_read_execute()

NAND changes:
* Fix kernel-doc mismatch
* Fix nanddev_neraseblocks() to return the correct value
* Avoid selection of BCH_CONST_PARAMS when some users require
  dynamic BCH settings

----------------------------------------------------------------
Arnd Bergmann (1):
      mtd: docg3: don't set conflicting BCH_CONST_PARAMS option

Boris Brezillon (4):
      mtd: nand: Fix nanddev_neraseblocks()
      mtd: spi-nor: Reset nor->addr_width when SFDP parsing failed
      mtd: sa1100: avoid VLA in sa1100_setup_mtd
      mtd: nand: Fix nanddev_pos_next_page() kernel-doc header

Christophe JAILLET (1):
      mtd: spi-nor: cadence-quadspi: Return error code in cqspi_direct_read_execute()

Randy Dunlap (1):
      mtd: nand: drop kernel-doc notation for a deleted function parameter

 drivers/mtd/devices/Kconfig           |  2 +-
 drivers/mtd/maps/sa1100-flash.c       | 10 +++++++++-
 drivers/mtd/nand/raw/nand_base.c      |  1 -
 drivers/mtd/spi-nor/cadence-quadspi.c |  2 +-
 drivers/mtd/spi-nor/spi-nor.c         |  6 ++++--
 include/linux/mtd/nand.h              |  7 +++----
 6 files changed, 18 insertions(+), 10 deletions(-)
