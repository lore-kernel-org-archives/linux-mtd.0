Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eydY2-0000M9-4Y
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 13:13:01 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] Uniform way to pass a NAND ID table to the core
Date: Wed, 21 Mar 2018 14:12:33 +0100
Message-Id: <20180321131235.9822-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

As part of the work of migrating all the drivers to nand_scan(), and
because nand_scan() does not provide a way to pass any ID table, create
a field in NAND chip so a controller driver can expose its ID table to
the core through it and stop using the last parameter of
nand_scan_ident() for that.

Apply this to the sm_common driver which is the only one that actually
provides its own ID table, so there is no remaining driver using this
third parameter, so all can be moved easily to nand_scan() in a next
series.

Thanks,
Miquèl

Miquel Raynal (2):
  mtd: rawnand: add a field in nand_chip to fill an array of IDs
  mtd: rawnand: sm_common: make use of the new flash_ids table entry

 drivers/mtd/nand/raw/nand_base.c | 8 ++++++--
 drivers/mtd/nand/raw/sm_common.c | 5 +++--
 include/linux/mtd/rawnand.h      | 3 +++
 3 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.14.1
