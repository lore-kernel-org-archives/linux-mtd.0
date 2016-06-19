Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEg8F-0000CM-CN
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 17:03:36 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v4 0/8] MTD: xway: fix driver
Date: Sun, 19 Jun 2016 19:02:57 +0200
Message-Id: <1466355785-13689-1-git-send-email-hauke@hauke-m.de>
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

I will try to convert the spinlock to a mutex in a separate patch 
because this affects other parts of the kernel. 

changes since:
v3:
 - update some commit comments
 - reorder last 2 patches
 - do not set ->IO_ADDR_R/W any more

v2:
 - reorder patches
 - use of_property_read_u32()
 - rework error handling in xway_nand_probe()
 - simplify latched command handling
 - remove xway_reset_chip()
 - remove cast of nandaddr
 - add nandaddr to xway_nand_data
 - add csflags to xway_nand_data

v1:
 - convert to normal platform driver
 - do not use global variable xway_latchcmd
 - use mtd_to_nand()


Hauke Mehrtens (6):
  mtd: nand: xway: add some more documentation
  mtd: nand: xway: convert to normal platform driver
  mtd: nand: xway: use generic reset function
  mtd: nand: xway: extract read and write function
  mtd: nand: xway: add missing write_buf and read_buf to nand driver
  mtd: nand: xway: add nandaddr to own struct

John Crispin (2):
  mtd: nand: xway: Avoid messing up with IO_ADDR_W in ->cmd_ctrl()
  mtd: nand: xway: fix nand locking

 drivers/mtd/nand/Kconfig     |   1 -
 drivers/mtd/nand/xway_nand.c | 232 ++++++++++++++++++++++++++-----------------
 2 files changed, 143 insertions(+), 90 deletions(-)

-- 
2.8.1
