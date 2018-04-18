Received: from smtpcmd0756.aruba.it ([62.149.156.56])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8jMw-0002xi-0F
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2018 09:27:20 +0000
From: Luca Ellero <luca.ellero@brickedbrain.com>
To: 
Cc: Luca Ellero <luca.ellero@brickedbrain.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: dataflash: replace msleep with usleep_range
Date: Wed, 18 Apr 2018 11:26:26 +0200
Message-Id: <1524043588-25816-1-git-send-email-luca.ellero@brickedbrain.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since msleep is based on jiffies, this 3 ms sleep becomes actually 20 ms.
Worst of all, since this sleep is used in a loop when writing, a single page
write (256 to 1024 bytes) causes 17 ms extra time.
When writing large files (for example u-boot is usually 512 KB) this delay
adds up to minutes.
See Documentation/timers/timers-howto.txt "Why not msleep for (1ms - 20ms)".

Signed-off-by: Luca Ellero <luca.ellero@brickedbrain.com>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index aaaeaae..3a6f450 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -140,7 +140,7 @@ static int dataflash_waitready(struct spi_device *spi)
 		if (status & (1 << 7))	/* RDY/nBSY */
 			return status;
 
-		msleep(3);
+		usleep_range(3000, 4000);
 	}
 }
 
-- 
2.7.4
