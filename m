Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3iy-0006ny-00
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 0/5] mtd: rawnand: Simplify the locking
Date: Tue, 20 Nov 2018 11:57:15 +0100
Message-Id: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

The nand_get_device()/nand_release_device() logic looks complex for no
obvious reasons. I might be wrong, but I think the spinlock+waitqueue
approach can be replaced by regular mutexes: one to serialize accesses
to the NAND chip (and protect the suspended field), another one to
serialize accesses to the controller.

We also get rid of the ->state field which was not really useful except
for detecting when the NAND chip is suspended (some drivers were using
it to determine the timeout value, but always taking the max timeout
sounds like a good solution too, since it's a timeout, not a delay).
This ->state field is replaced by a ->suspended field which is
protected by the chip lock. So no state machine anymore, just 3 states:

1/ NAND is idle
2/ NAND is being accessed (we don't care about the access type)
3/ NAND is suspended

Patches 1 to 4 are preparing things for the chip->state, controller->wq
and controller->lock removal by patching all drivers that were
accessing those fields directly.

Patch 5 is doing the actual locking changes.

Note that even if we don't rework the locking, I think patches 1 to 4
are worth applying.

Regards,

Boris

Boris Brezillon (5):
  mtd: rawnand: mtk: Use nand_controller_init() instead of open-coding
    it
  mtd: rawnand: tmio: Do not abuse nand_controller->wq
  mtd: rawnand: omap2: Use nand_controller_init()
  mtd: rawnand: Stop using chip->state in drivers
  mtd: rawnand: Simplify the locking

 drivers/mtd/nand/raw/mtk_nand.c  |   3 +-
 drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++------------------
 drivers/mtd/nand/raw/omap2.c     |  20 +++---
 drivers/mtd/nand/raw/r852.c      |   3 +-
 drivers/mtd/nand/raw/tmio_nand.c |  21 +++---
 include/linux/mtd/rawnand.h      |  24 +++----
 6 files changed, 76 insertions(+), 106 deletions(-)

-- 
2.17.1
