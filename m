Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJsfk-0001vb-SS
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 00:55:25 +0000
Received: by mail-pa0-x244.google.com with SMTP id pv5so29921781pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jan 2016 16:55:04 -0800 (PST)
From: Karl Zhang <shuangshuo@gmail.com>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, paul.gortmaker@windriver.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 richard@sigma-star.at
Cc: peterpandong@micron.com, beanhuo@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: [RESEND PATCH v2 0/2]  mtd: spi-nor: add new device MT35X
Date: Fri, 15 Jan 2016 00:53:37 +0000
Message-Id: <1452819219-21002-1-git-send-email-karlzhang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron has announced a new SPI NOR device MT35X (XTRMFlash).
This device's manufacturer ID is using 2Ch which arranged by
JEDEC. The 20h is also Micron's ID due to the history.

This new device support high speed I/O interface. The clock
frequency could up to 200 MHz (MAX) in DDR (400 MB/s) with
DQS. The device bus width could be 1 or 8, and it's default
width is configurable.

Karl Zhang (2):
  mtd: spi-nor: add Manufacturer ID for Micron
  mtd: spi-nor: add new device MT35X

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 include/linux/mtd/cfi.h       | 1 +
 include/linux/mtd/spi-nor.h   | 2 ++
 3 files changed, 5 insertions(+)

-- 
1.9.1
