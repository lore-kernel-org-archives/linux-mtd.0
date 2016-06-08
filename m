Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAewn-0008Oo-38
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 14:59:09 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] mtd: nand: standardize ECC maximization
Date: Wed,  8 Jun 2016 16:58:43 +0200
Message-Id: <1465397926-7904-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series aims at standardizing a feature already supported by
some NAND controller drivers: setting the maximum ECC strength
based on the OOB area size instead of using the ECC strength/step_size
information retrieved from the DT or NAND detection code.

This is particularly useful when the NAND device is used in by a
FS/wear-leveling layer that is not using the OOB area at all (this is
the case of UBI).

Note that drivers already implementing this kind of logic are not
converted to the new approach (because of backward compatibility
concern), but new drivers or drivers that do not already implement
this 'ECC maximization' logic are encouraged to do it.

Regards,

Boris

Boris Brezillon (3):
  mtd: nand: Add an option to maximize the ECC strength
  mtd: nand: Support maximizing ECC when using software BCH
  mtd: nand: sunxi: Support ECC maximization

 Documentation/devicetree/bindings/mtd/nand.txt |  9 ++++++++
 drivers/mtd/nand/nand_base.c                   | 23 ++++++++++++++++++++
 drivers/mtd/nand/sunxi_nand.c                  | 29 ++++++++++++++++++++++++++
 include/linux/mtd/nand.h                       |  1 +
 4 files changed, 62 insertions(+)

-- 
2.7.4
