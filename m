Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkmn7-0003dK-B1
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 03:24:55 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWS006FNUSNLV70@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 12:24:23 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH] mtd: dataflash: remove unnecessary spi_set_drvdata()
Date: Mon, 25 Nov 2013 12:24:22 +0900
Message-id: <002401cee98d$d603d900$820b8b00$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/devices/mtd_dataflash.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 4a47b02..624069d 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -669,7 +669,6 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 	if (!err)
 		return 0;
 
-	spi_set_drvdata(spi, NULL);
 	kfree(priv);
 	return err;
 }
@@ -899,10 +898,8 @@ static int dataflash_remove(struct spi_device *spi)
 	pr_debug("%s: remove\n", dev_name(&spi->dev));
 
 	status = mtd_device_unregister(&flash->mtd);
-	if (status == 0) {
-		spi_set_drvdata(spi, NULL);
+	if (status == 0)
 		kfree(flash);
-	}
 	return status;
 }
 
-- 
1.7.10.4
