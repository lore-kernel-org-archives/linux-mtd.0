Received: from c-67-176-60-102.hsd1.co.comcast.net ([67.176.60.102]
 helo=pearl.egauge.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUle8-0002J4-El
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 23:29:41 +0000
From: David Mosberger <davidm@egauge.net>
To: pekon@ti.com
Subject: [PATCH v4 0/5] mtd: nand: Add on-die ECC support
Date: Mon, 31 Mar 2014 17:28:52 -0600
Message-Id: <1396308537-16013-1-git-send-email-davidm@egauge.net>
Cc: David Mosberger <davidm@egauge.net>, gsi@denx.de,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-series is designed to go on top of Gerhard Sittig's
patch series "mtd: nand: introduce a READMODE command".

The patches add on-die ECC support as found on some Micron flash chips.

David Mosberger (5):
  mtd: nand: Detect Micron flash with on-die ECC (aka "internal ECC")
    enabled.
  mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
  mtd: nand: Enable subpage-reads on flashes with on-die ECC enabled.
  mtd: nand: Allocate extra buffers needed for on-die ECC controller.
  mtd: nand: Improve bitflip detection for on-die ECC scheme.

 drivers/mtd/nand/nand_base.c |  264 +++++++++++++++++++++++++++++++++++++++++-
 drivers/of/of_mtd.c          |    1 +
 include/linux/mtd/nand.h     |    8 ++
 3 files changed, 267 insertions(+), 6 deletions(-)

-- 
1.7.9.5
