Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fixQd-0000bM-GV
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 07:44:49 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 0/2] mtd: rawnand: Make ->dev_ready() and ->chip_delay optional
Date: Fri, 27 Jul 2018 09:44:16 +0200
Message-Id: <20180727074418.32384-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

These 2 patches remove the last dependency we had on ->dev_ready() and
->chip_delay when ->exec_op() is defined. Will be needed to deprecate
both fields, which is about to happen (see this branch [1] if you want
to have the big picture).

Regards,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/nand/api-cleanup

Boris Brezillon (2):
  mtd: rawnand: Add the nand_wait_readrdy() helper and use it
  mtd: rawnand: Add the nand_wait_rdy_op() helper and use it

 drivers/mtd/nand/raw/nand_base.c | 49 ++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 14 deletions(-)

-- 
2.14.1
