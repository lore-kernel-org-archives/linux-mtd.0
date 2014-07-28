Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBh3V-0004UQ-IC
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 09:17:18 +0000
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: nand: support ONFI timings mode retrieval for
 non-ONFI NANDs
Date: Mon, 28 Jul 2014 11:16:50 +0200
Message-Id: <1406539012-16320-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Following the series adding ONFI timings mode support, here is a series
adding support for timings mode retrieval on non-ONFI NANDs.

It just adds a new field to the nand_chip and nand_flash_dev struct so
that anyone can define its chip requirements in the nand_ids table.

The 2nd patch serves as an example and adds an entry for the Hynix
H27UCG8T2ATR-BC NAND chip used on the Cubietruck board.

Best Regards,

Boris

Boris BREZILLON (2):
  mtd: nand: support ONFI timing mode retrieval for non-ONFI NANDs
  mtd: nand: add Hynix's H27UCG8T2ATR-BC to nand_ids table

 drivers/mtd/nand/nand_base.c | 1 +
 drivers/mtd/nand/nand_ids.c  | 4 ++++
 include/linux/mtd/nand.h     | 7 +++++++
 3 files changed, 12 insertions(+)

-- 
1.8.3.2
