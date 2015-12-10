Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6qWU-0003it-Qs
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 01:59:59 +0000
Received: by pfdd184 with SMTP id d184so4103281pfd.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 17:59:37 -0800 (PST)
From: Karl Zhang <shuangshuo@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Cc: peterpandong@micron.com, beanhuo@micron.com, zszubbocsev@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: [PATCH 0/2] mtd: spi-nor: add new device MT35X
Date: Thu, 10 Dec 2015 01:58:58 +0000
Message-Id: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
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

 drivers/mtd/devices/m25p80.c  | 1 +
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 include/linux/mtd/cfi.h       | 1 +
 include/linux/mtd/spi-nor.h   | 2 ++
 4 files changed, 6 insertions(+)

-- 
1.9.1
