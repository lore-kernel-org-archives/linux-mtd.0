Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHXDW-00083j-Ku
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 11:27:31 +0000
Received: by mail-ea0-f174.google.com with SMTP id m10so2206634eaj.5
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 03:27:08 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC 0/3] mtd: bcm47xxnflash: adding support for new NANDs
Date: Sun, 23 Feb 2014 12:26:56 +0100
Message-Id: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New Broadcom SoCs have NAND flashes attached & programmed in a totally different
way. Instead of accessing them with help of ChipCommon core, they can be used
directly.

To support them we can extend bcm47xxnflash in the way this patches implements.
However almost nothing in the code will be shared between support for old and
new devices.

How should we proceed? Implement it that way anyway? Or maybe writing a
separated driver (bcm53xxnflash?) would be a better idea?

Rafał Miłecki (3):
  Revert "mtd: bcm47xxnflash: Use module_platform_driver"
  mtd: bcm47xxnflash: add separated config for platform driver
  mtd: bcm47xxnflash: prepare for adding BCMA driver

 drivers/mtd/nand/Kconfig                | 25 ++++++++---
 drivers/mtd/nand/bcm47xxnflash/Makefile |  2 +-
 drivers/mtd/nand/bcm47xxnflash/main.c   | 80 ++++++++++++++++++++++++++++++++-
 3 files changed, 100 insertions(+), 7 deletions(-)

-- 
1.8.4.5
