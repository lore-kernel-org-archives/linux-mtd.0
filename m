Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhQjR-0007bP-KK
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 23:24:18 +0000
From: Vladimir Zapolskiy <vz@mleia.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/3] mtd: nand: lpc32xx_slc: fix calculation of timing arcs
 from given values
Date: Thu,  1 Oct 2015 02:23:34 +0300
Message-Id: <1443655417-14689-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The changeset is intended to accelerata read/write speed of LPC32xx SLC
controller improving configuration of controller timing arcs.

Patch 2/3 is a defensive check against an unlikely case, when controller's
clock rate is too high.

Thanks to Brian Norris for review and the idea of v2 3/3 improvement.

Vladimir Zapolskiy (3):
  mtd: nand: lpc32xx_slc: improve SLCTAC_*() macro definitions
  mtd: nand: lpc32xx_slc: fix potential overflow over 4 bits
  mtd: nand: lpc32xx_slc: fix calculation of timing arcs from given values

 drivers/mtd/nand/lpc32xx_slc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

-- 
2.1.4
