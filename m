Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fduNH-0007Qa-6B
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:28:28 +0000
Received: by mail-lj1-x232.google.com with SMTP id q5-v6so24052941ljh.12
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:28:16 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/4] mtd: use mtd_device_register() where applicable
Date: Fri, 13 Jul 2018 11:27:30 +0200
Message-Id: <20180713092734.16408-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

This is a tiny cleanup making code use mtd_device_register() helper
macro.

It makes checking which drivers (may) specify custom list of parsers
just a bit easier.

Rafał Miłecki (4):
  mtd: rawnand: use mtd_device_register() where applicable
  mtd: onenand: use mtd_device_register() where applicable
  mtd: maps: use mtd_device_register() where applicable
  mtd: sst25l: use mtd_device_register()

 drivers/mtd/devices/sst25l.c        | 5 ++---
 drivers/mtd/maps/impa7.c            | 5 ++---
 drivers/mtd/maps/intel_vr_nor.c     | 2 +-
 drivers/mtd/maps/latch-addr-flash.c | 5 ++---
 drivers/mtd/maps/rbtx4939-flash.c   | 3 +--
 drivers/mtd/nand/onenand/generic.c  | 5 ++---
 drivers/mtd/nand/onenand/samsung.c  | 5 ++---
 drivers/mtd/nand/raw/cmx270_nand.c  | 4 ++--
 drivers/mtd/nand/raw/cs553x_nand.c  | 3 +--
 drivers/mtd/nand/raw/davinci_nand.c | 3 +--
 drivers/mtd/nand/raw/jz4740_nand.c  | 5 ++---
 drivers/mtd/nand/raw/mtk_nand.c     | 2 +-
 drivers/mtd/nand/raw/s3c2410.c      | 4 ++--
 drivers/mtd/nand/raw/txx9ndfmc.c    | 2 +-
 14 files changed, 22 insertions(+), 31 deletions(-)

-- 
2.13.7
