Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqW-0005pg-Cv
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:13 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 0/6] mtd: bcm47xx: some fixes for the flash drivers
Date: Thu, 24 Jan 2013 17:39:53 +0100
Message-Id: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These patches are fixing some problems which I saw in my tests with 
some devices and these flash drivers.

Hauke Mehrtens (6):
  mtd: bcm47xxsflash: write number of written bytes
  mtd: bcm47xxsflash: register this as normal driver
  mtd: bcm47xxnflash: fix message
  mtd: bcm47xxnflash: register this as normal driver
  mtd: bcm47xxpart: add support for other erase sizes
  mtd: bcm47xxpart: improve probing of nvram partition

 drivers/mtd/bcm47xxpart.c             |   27 +++++++++++++++++----------
 drivers/mtd/devices/bcm47xxsflash.c   |    4 +++-
 drivers/mtd/nand/bcm47xxnflash/main.c |    9 +++------
 3 files changed, 23 insertions(+), 17 deletions(-)

-- 
1.7.10.4
