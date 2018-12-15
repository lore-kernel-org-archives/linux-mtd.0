Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY5Fk-0006rQ-GO
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:24:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 0/7] mtd: rawnand: sunxi: Random cleanups + exec_op
Date: Sat, 15 Dec 2018 09:24:30 +0100
Message-Id: <20181215082437.9175-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series converts the sunxi NAND controller driver to exec_op and
cleans a few things up.

Regards,

Boris

Changes in v2:
- Add patch 6 and 7 which were missing in v1

Boris Brezillon (7):
  mtd: rawnand: sunxi: Use a consistent name for sunxi_nand_chip objects
  mtd: rawnand: sunxi: Use struct_size()
  mtd: rawnand: sunxi: Name nand_chip objects consistently
  mtd: rawnand: sunxi: Stop passing mtd_info objects around
  mtd: rawnand: sunxi: Add an SPDX tag
  mtd: rawnand: sunxi: Migrate to ->exec_op()
  mtd: rawnand: sunxi: Fix kernel doc headers

 drivers/mtd/nand/raw/sunxi_nand.c | 714 ++++++++++++++++--------------
 1 file changed, 371 insertions(+), 343 deletions(-)

-- 
2.17.1
