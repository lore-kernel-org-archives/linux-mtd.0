Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfHB-0001f9-DI
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:08:46 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v3 0/8] MTD: xway: fix driver
Date: Sun, 19 Jun 2016 18:08:09 +0200
Message-Id: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
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
v2:
 - reorder patches
 - use of_property_read_u32()
 - rework error handling in xway_nand_probe()
 - simplyfy latched command handling
 - remove xway_reset_chip()
 - remove cast of nandaddr
 - add nandaddr to xway_nand_data
 - add csflags to xway_nand_data

v1:
 - convert to normal platform driver
 - do not use global variable xway_latchcmd
 - use mtd_to_nand()


Hauke Mehrtens (6):
  MTD: xway: add some more documentation
  MTD: xway: convert to normal platform driver
  MTD: xway: use generic reset function
  MTD: xway: extract read and write function
  MTD: xway: add nandaddr to own struct
  MTD: xway: add missing write_buf and read_buf to nand driver

John Crispin (2):
  MTD: xway: the latched command should be persistent
  MTD: xway: fix nand locking

 drivers/mtd/nand/Kconfig     |   1 -
 drivers/mtd/nand/xway_nand.c | 224 +++++++++++++++++++++++++++----------------
 2 files changed, 140 insertions(+), 85 deletions(-)

-- 
2.8.1
