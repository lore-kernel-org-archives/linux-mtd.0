Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7hX-0003kO-EB
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:32:12 +0000
Received: by mail-ed1-x542.google.com with SMTP id p52-v6so1183757eda.12
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:31:56 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 0/8] gpio-addr-flash: Support for device-tree and cleanup
Date: Tue, 21 Aug 2018 16:31:44 +0200
Message-Id: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series does the following:

1) Fix bug regarding ioremap size
2) Cleanup code to use new APIs
3) Simplify numerical operations
4) Add support for device-tree devices

Thanks!

Ricardo Ribalda Delgado (8):
  mtd: maps: gpio-addr-flash: Replace custom printk
  mtd: maps: gpio-addr-flash: Fix ioremapped size
  mtd: maps: gpio-addr-flash: Use devm_* functions
  mtd: maps: gpio-addr-flash: Use order insted of size
  mtd: maps: gpio-addr-flash: Replace array with an integer
  mtd: maps: gpio-addr-flash: Split allocation in two
  mtd: maps: gpio-addr-flash: Add support for device-tree devices
  dt-binding: mtd: Document gpio-addr-flash

 .../bindings/mtd/gpio-addr-flash.txt          |  46 +++
 drivers/mtd/maps/gpio-addr-flash.c            | 277 ++++++++++++------
 2 files changed, 237 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt

-- 
2.18.0
