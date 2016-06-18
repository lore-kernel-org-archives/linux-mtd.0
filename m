Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bELhd-0004Yn-3T
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 19:14:46 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 0/8] MTD: xway: fix driver
Date: Sat, 18 Jun 2016 21:14:04 +0200
Message-Id: <1466277252-13867-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without these patches the driver does not work for me.
Some of these patches are in OpenWrt for years now and should go 
upstream. In addition this converts it from some hack with the 
plat_nand driver to a normal platform driver.

changes since:
v1:
 - convert to normal platform driver
 - do not use global variable xway_latchcmd
 - use mtd_to_nand()

Hauke Mehrtens (4):
  MTD: xway: convert to normal platform driver
  MTD: xway: add some more documentation
  MTD: xway: extract read and write function
  MTD: xway: use global NAND_CMD_RESET define

John Crispin (4):
  MTD: xway: the latched command should be persistent
  MTD: xway: remove endless loop
  MTD: xway: add missing write_buf and read_buf to nand driver
  MTD: xway: fix nand locking

 drivers/mtd/nand/Kconfig     |   1 -
 drivers/mtd/nand/xway_nand.c | 206 ++++++++++++++++++++++++++++++-------------
 2 files changed, 147 insertions(+), 60 deletions(-)

-- 
2.8.1
