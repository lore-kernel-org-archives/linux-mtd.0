Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1eG-0003kO-Bl
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:30:14 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0084C9PO3X40@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:29:48 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 0/4] mtd: nan: use dev_err() instead of printk()
Date: Thu, 26 Dec 2013 12:29:48 +0900
Message-id: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Andrew Lunn' <andrew@lunn.ch>, 'Linus Walleij' <linus.walleij@linaro.org>,
 'Jingoo Han' <jg1.han@samsung.com>, 'Josh Wu' <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use dev_err()/dev_warn() instead of printk() to provide a better
message to userspace.

Change since v1
- Remove the site-specific OOM messages, per Ezequiel Garcia.

Jingoo Han (4)
    mtd: atmel_nand: use dev_err() instead of printk()
    mtd: fsmc_nand: use dev_warn() instead of printk()
    mtd: orion_nand: use dev_err() instead of printk()
    mtd: sharpsl: use dev_err() instead of printk()

---
 drivers/mtd/nand/atmel_nand.c |    4 ++--
 drivers/mtd/nand/fsmc_nand.c  |    8 ++++----
 drivers/mtd/nand/orion_nand.c |    2 +-
 drivers/mtd/nand/sharpsl.c    |    2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
