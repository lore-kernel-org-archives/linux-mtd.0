Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr6F-0000WW-C0
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:41:44 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/5] mtd: spi-nor: Random cleanups
Date: Thu,  6 Dec 2018 11:41:15 +0100
Message-Id: <20181206104120.6280-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The patch series is a collection of minor cleanups I have accumulated
while working on the "SPI NOR SFDP fixups" infrastructure.

Regards,

Boris

Changes in v3:
- Merged patch 6 into patch 3
- Add an SPDX tag to spi-nor.h

Changes in v2:
- Drop
  "mtd: spi-nor: Set SPI_NOR_4B_OPCODES on all >16MB Spansion NORs",
  "mtd: spi-nor: Create a ->set_4byte() method",
  "mtd: spi-nor: Explicitly flag all Micron NORs as supporting locking"
  "mtd: spi-nor: Move Spansion erase related fixup to a dedicated function"
- Add a patch adding the SPDX tag
- Add a patch moving nor->info assignment earlier in the spi_nor_scan()
  function


*** BLURB HERE ***

Boris Brezillon (5):
  mtd: spi-nor: Drop inline on all internal helpers
  mtd: spi-nor: Avoid forward declaration of internal functions
  mtd: spi-nor: Stop passing flash_info around
  mtd: spi-nor: Make the enable argument passed to set_byte() a bool
  mtd: spi-nor: Add an SPDX tag to spi-nor.{c,h}

 drivers/mtd/spi-nor/spi-nor.c | 679 +++++++++++++++++-----------------
 include/linux/mtd/spi-nor.h   |   6 +-
 2 files changed, 336 insertions(+), 349 deletions(-)

-- 
2.17.1
