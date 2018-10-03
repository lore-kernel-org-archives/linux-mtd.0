Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKi-0002SI-HU
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:41:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 0/8] mtd: spi-nor: Random cleanups
Date: Wed,  3 Oct 2018 16:40:35 +0200
Message-Id: <20181003144043.21529-1-boris.brezillon@bootlin.com>
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
while working on adding octo mode support.

Please let me know if you think some of them are
unneeded/inappropriate.

For those who are more interested in the next step (addition of octo
mode support), you can have a look at this branch [1] which is
containing the work we (Zhengxun, Mason and I) have done so far.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/tree/spi-nor/octo

Boris Brezillon (8):
  mtd: spi-nor: Set SPI_NOR_4B_OPCODES on all >16MB Spansion NORs
  mtd: spi-nor: Drop inline on all internal helpers
  mtd: spi-nor: Avoid forward declaration of internal functions
  mtd: spi-nor: Stop passing info to set_4byte()
  mtd: spi-nor: Make the enable argument passed to set_byte() a bool
  mtd: spi-nor: Create a ->set_4byte() method
  mtd: spi-nor: Explicitly flag all Micron NORs as supporting locking
  mtd: spi-nor: Move Spansion erase related fixup to a dedicated
    function

 drivers/mtd/spi-nor/spi-nor.c | 426 +++++++++++++++++++++++-------------------
 include/linux/mtd/spi-nor.h   |   1 +
 2 files changed, 232 insertions(+), 195 deletions(-)

-- 
2.14.1
