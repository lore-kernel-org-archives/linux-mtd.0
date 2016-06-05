Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9fTm-000186-FE
 for linux-mtd@lists.infradead.org; Sun, 05 Jun 2016 21:21:06 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 0/6] MTD: xway: updates from OpenWrt/LEDE
Date: Sun,  5 Jun 2016 23:20:03 +0200
Message-Id: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches are in OpenWrt for years now and should go upstream. They 
are fixing some problems in the NAND driver.

Hauke Mehrtens (1):
  MTD: xway: add some more documentation

John Crispin (5):
  MTD: xway: fix invalid operator
  MTD: xway: the latched command should be persistent
  MTD: xway: remove endless loop
  MTD: xway: add missing write_buf and read_buf to nand driver
  MTD: xway: fix nand locking

 drivers/mtd/nand/xway_nand.c | 67 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 16 deletions(-)

-- 
2.8.1
