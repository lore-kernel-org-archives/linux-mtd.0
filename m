Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
 helo=ch1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLvA-0004tw-DI
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 09:14:20 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd: spi-nor: fix the wrong dummy value
Date: Wed, 16 Apr 2014 16:18:19 +0800
Message-ID: <1397636299-2390-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Huang Shijie <b32955@freescale.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The dummy cycles is actually 8 for SPI fast/dual/quad read.

This patch fixes the wrong dummy value for both the spi-nor.c and m25p80.c.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/devices/m25p80.c  |    3 +++
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1557d8f..112ca8b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -131,6 +131,9 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	int dummy = nor->read_dummy;
 	int ret;
 
+	/* convert the dummy cycles to the number of byte */
+	dummy >>= 3;
+
 	/* Wait till previous write/erase is done. */
 	ret = nor->wait_till_ready(nor);
 	if (ret)
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cd4b277..b88cc7e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -77,7 +77,7 @@ static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 	case SPI_NOR_FAST:
 	case SPI_NOR_DUAL:
 	case SPI_NOR_QUAD:
-		return 1;
+		return 8;
 	case SPI_NOR_NORMAL:
 		return 0;
 	}
-- 
1.7.2.rc3
