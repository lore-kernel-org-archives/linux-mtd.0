Received: from mail-pa0-f50.google.com ([209.85.220.50])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTTcO-0008G6-ER
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 09:30:17 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so8601092pad.9
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 02:29:53 -0700 (PDT)
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: sst25l: Use devm_kzalloc
Date: Tue,  8 Oct 2013 14:51:34 +0530
Message-Id: <1381224094-14098-2-git-send-email-sachin.kamat@linaro.org>
In-Reply-To: <1381224094-14098-1-git-send-email-sachin.kamat@linaro.org>
References: <1381224094-14098-1-git-send-email-sachin.kamat@linaro.org>
Cc: computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com,
 andre@bluewatersys.com, dwmw2@infradead.org, sachin.kamat@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_kzalloc is device managed and makes code simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/mtd/devices/sst25l.c |   12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 7cc70db..687bf27 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -364,7 +364,7 @@ static int sst25l_probe(struct spi_device *spi)
 	if (!flash_info)
 		return -ENODEV;
 
-	flash = kzalloc(sizeof(struct sst25l_flash), GFP_KERNEL);
+	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
 	if (!flash)
 		return -ENOMEM;
 
@@ -402,10 +402,8 @@ static int sst25l_probe(struct spi_device *spi)
 	ret = mtd_device_parse_register(&flash->mtd, NULL, NULL,
 					data ? data->parts : NULL,
 					data ? data->nr_parts : 0);
-	if (ret) {
-		kfree(flash);
+	if (ret)
 		return -ENODEV;
-	}
 
 	return 0;
 }
@@ -413,12 +411,8 @@ static int sst25l_probe(struct spi_device *spi)
 static int sst25l_remove(struct spi_device *spi)
 {
 	struct sst25l_flash *flash = spi_get_drvdata(spi);
-	int ret;
 
-	ret = mtd_device_unregister(&flash->mtd);
-	if (ret == 0)
-		kfree(flash);
-	return ret;
+	return mtd_device_unregister(&flash->mtd);
 }
 
 static struct spi_driver sst25l_driver = {
-- 
1.7.9.5
