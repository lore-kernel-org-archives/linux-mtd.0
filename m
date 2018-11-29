Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSN1l-0003sh-Vk
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:10:51 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/6] mtd: spi-nor: Random cleanups
Date: Thu, 29 Nov 2018 15:10:20 +0100
Message-Id: <20181129141026.24892-1-boris.brezillon@bootlin.com>
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

I'd really like to have those patches reviewed and merged quickly
because the 'soon to be posted' "SPI NOR SFDP fixups" patchset depends
on it.

Regards,

Boris

Changes in v2:
- Drop
  "mtd: spi-nor: Set SPI_NOR_4B_OPCODES on all >16MB Spansion NORs",
  "mtd: spi-nor: Create a ->set_4byte() method",
  "mtd: spi-nor: Explicitly flag all Micron NORs as supporting locking"
  "mtd: spi-nor: Move Spansion erase related fixup to a dedicated function"
- Add a patch adding the SPDX tag
- Add a patch moving nor->info assignment earlier in the spi_nor_scan()
  function

Boris Brezillon (6):
  mtd: spi-nor: Drop inline on all internal helpers
  mtd: spi-nor: Avoid forward declaration of internal functions
  mtd: spi-nor: Stop passing info to set_4byte()
  mtd: spi-nor: Make the enable argument passed to set_byte() a bool
  mtd: spi-nor: Add an SPDX tag to spi-nor.c
  mtd: spi-nor: Move the nor->info assignment earlier in the scan func

 drivers/mtd/spi-nor/spi-nor.c | 264 +++++++++++++++++-----------------
 1 file changed, 129 insertions(+), 135 deletions(-)

-- 
2.17.1
