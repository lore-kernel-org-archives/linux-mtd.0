Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgSAd-00068o-Sc
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 09:57:59 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 0/4] mtd: Remove gpio.h inclusions where we can
Date: Fri, 20 Jul 2018 11:57:37 +0200
Message-Id: <20180720095741.6313-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The fix I sent here [1] lead me to look at other places including gpio.h
in the MTD subsystem. While some inclusions are valid, some of them can
be removed of replaced by gpio/consumer.h.

All these changes have been compile-tested.

Regards,

Boris

[1]http://patchwork.ozlabs.org/patch/946614/

Boris Brezillon (4):
  mtd: rawnand: sunxi: Remove gpio.h and of_gpio.h inclusions
  mtd: rawnand: atmel: Stop including gpio.h
  mtd: rawnand: au1550nd: Remove unneeded gpio.h inclusion
  mtd: spi-nor: atmel-qspi: Include gpio/consumer.h instead of gpio.h

 drivers/mtd/nand/raw/atmel/nand-controller.c | 1 -
 drivers/mtd/nand/raw/au1550nd.c              | 1 -
 drivers/mtd/nand/raw/sunxi_nand.c            | 2 --
 drivers/mtd/spi-nor/atmel-quadspi.c          | 2 +-
 4 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.14.1
