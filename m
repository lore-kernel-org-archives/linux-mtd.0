Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1audKr-0004jK-2K
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 10:01:47 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] mtd: add support for pairing scheme description
Date: Mon, 25 Apr 2016 12:01:17 +0200
Message-Id: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series is the first step towards reliable MLC/TLC NAND support.
Those patches allows the NAND layer to expose page pairing information
to MTD users.
The plan is to teach UBI about those constraints and let UBI code take
the appropriate precautions when dealing with those multi-level cells
NANDs. The way we'll handle this "paired pages" constraint will be
described soon in a series adapting the UBI layer, so stay tune ;).

Note that this implementation only allows page pairing scheme description
when the NAND has a full-id entry in the nand_ids table.
This should be addressed in some way for ONFI and JEDEC NANDs, though
I'm not sure how to handle this yet.

Best Regards,

Boris

Boris Brezillon (4):
  mtd: introduce the mtd_pairing_scheme concept
  mtd: nand: implement two pairing scheme
  mtd: nand: add a pairing field to nand_flash_dev
  mtd: nand: H27UCG8T2ATR: point to the correct pairing scheme
    implementation

 drivers/mtd/mtdcore.c        | 62 ++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c        |  1 +
 drivers/mtd/nand/nand_base.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand_ids.c  |  2 +-
 include/linux/mtd/mtd.h      | 64 +++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  5 +++
 6 files changed, 230 insertions(+), 1 deletion(-)

-- 
2.7.4
