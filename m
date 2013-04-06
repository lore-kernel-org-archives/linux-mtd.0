Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UOMnl-0006ge-7J
 for linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 06:40:39 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKT002J3MJI5550@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 15:40:30 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtd: sst25l: use spi_get_drvdata() and spi_set_drvdata()
Date: Sat, 06 Apr 2013 15:40:30 +0900
Message-id: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper functions for getting and setting the driver data using
spi_device instead of using dev_{get|set}_drvdata with &spi->dev, so we
can directly pass a struct spi_device.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/sst25l.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 8091b01..38b5979 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -370,7 +370,7 @@ static int sst25l_probe(struct spi_device *spi)
 
 	flash->spi = spi;
 	mutex_init(&flash->lock);
-	dev_set_drvdata(&spi->dev, flash);
+	spi_set_drvdata(spi, flash);
 
 	data = spi->dev.platform_data;
 	if (data && data->name)
@@ -404,7 +404,7 @@ static int sst25l_probe(struct spi_device *spi)
 					data ? data->nr_parts : 0);
 	if (ret) {
 		kfree(flash);
-		dev_set_drvdata(&spi->dev, NULL);
+		spi_set_drvdata(spi, NULL);
 		return -ENODEV;
 	}
 
@@ -413,7 +413,7 @@ static int sst25l_probe(struct spi_device *spi)
 
 static int sst25l_remove(struct spi_device *spi)
 {
-	struct sst25l_flash *flash = dev_get_drvdata(&spi->dev);
+	struct sst25l_flash *flash = spi_get_drvdata(spi);
 	int ret;
 
 	ret = mtd_device_unregister(&flash->mtd);
-- 
1.7.2.5
