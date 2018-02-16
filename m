Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1emgv9-0001WF-IH
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 14:23:29 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] Convert FSMC NAND controller driver to ->exec_op()
Date: Fri, 16 Feb 2018 15:22:46 +0100
Message-Id: <20180216142248.32345-1-miquel.raynal@bootlin.com>
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

Now that the ->exec_op() interface has been merged in the NAND core,
convert the FSMC NAND controller driver to it.

A previous step involves getting rid of ->IO_ADDR_[R|W] across the
driver, which is almost entirely done in the first patch. Because the
driver still uses at that point the default implementations of
->read/write_byte/word(), some references are still present but are
removed as soon as the driver is moved to ->exec_op(), when this
dependency disappears.

Best regards,
Miquèl


Changes since v1:
=================

- Forgot about the NAND unique ID for now, this will need a deeper
  rework of the MTD stack and is very (ONFI-)NAND-specific.
- Split the migration of FSMC driver to ->exec_op() into two patches,
  one to get rid of ->IO_ADDR_[R|W], the other to implement ->exec_op()
  and ->select_chip() which is also needed.
- Got rid of the additional ->regs entry in the FSMC structure, using
  the existing entry ->regs_va instead.


Miquel Raynal (2):
  mtd: nand: fsmc: get rid of IO_ADDR_[R|W]
  mtd: nand: fsmc: use ->exec_op()

 drivers/mtd/nand/fsmc_nand.c | 242 ++++++++++++++++++++++++-------------------
 1 file changed, 137 insertions(+), 105 deletions(-)

-- 
2.14.1
