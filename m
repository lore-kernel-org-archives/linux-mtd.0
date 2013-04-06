Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UOMoF-0006hT-Ql
 for linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 06:41:09 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKT006QFMKG0CD0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Sat, 06 Apr 2013 15:41:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
References: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
In-reply-to: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
Subject: [PATCH 2/3] mtd: dataflash: use spi_get_drvdata() and
 spi_set_drvdata()
Date: Sat, 06 Apr 2013 15:41:03 +0900
Message-id: <001501ce3291$b59fab70$20df0250$%han@samsung.com>
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
 drivers/mtd/devices/mtd_dataflash.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 28779b6..4a43664 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -661,7 +661,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s\n",
 			name, (long long)((device->size + 1023) >> 10),
 			pagesize, otp_tag);
-	dev_set_drvdata(&spi->dev, priv);
+	spi_set_drvdata(spi, priv);
 
 	ppdata.of_node = spi->dev.of_node;
 	err = mtd_device_parse_register(device, NULL, &ppdata,
@@ -671,7 +671,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	if (!err)
 		return 0;
 
-	dev_set_drvdata(&spi->dev, NULL);
+	spi_set_drvdata(spi, NULL);
 	kfree(priv);
 	return err;
 }
@@ -895,14 +895,14 @@ static int dataflash_probe(struct spi_device *spi)
 
 static int dataflash_remove(struct spi_device *spi)
 {
-	struct dataflash	*flash = dev_get_drvdata(&spi->dev);
+	struct dataflash	*flash = spi_get_drvdata(spi);
 	int			status;
 
 	pr_debug("%s: remove\n", dev_name(&spi->dev));
 
 	status = mtd_device_unregister(&flash->mtd);
 	if (status == 0) {
-		dev_set_drvdata(&spi->dev, NULL);
+		spi_set_drvdata(spi, NULL);
 		kfree(flash);
 	}
 	return status;
-- 
1.7.2.5
