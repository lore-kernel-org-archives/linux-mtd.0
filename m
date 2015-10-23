Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpa8y-0004Oq-Lu
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 11:04:21 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/2] mtd: nand: automate NAND timings selection
Date: Fri, 23 Oct 2015 13:03:54 +0200
Message-Id: <1445598236-14036-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This series aims at automating the NAND timings selection which is
currently supposed to be done in each NAND controller driver, thus
simplifying drivers implementation.

Patch 1 also opens the door to DDR NAND support, though setting DDR
timings is currently not supported.

Note that patch 2 is given here as an example of how patch 1 simplifies
things, but won't apply cleanly on mtd-next (it's based on top of other
changes I haven't submitted yet).

Best Regards,

Boris

Boris Brezillon (2):
  mtd: nand: automate NAND timings selection
  mtd: nand: sunxi: switch from manual to automated timing config

 drivers/mtd/nand/nand_base.c  | 189 +++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/nand/sunxi_nand.c |  72 ++++------------
 include/linux/mtd/nand.h      | 115 ++++++++++++++-----------
 3 files changed, 270 insertions(+), 106 deletions(-)

-- 
2.1.4
