Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSf-0001Ql-8q
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:50 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:48 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/44] mtd: mtd_dataflash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:02 +0400
Message-Id: <1307453803-31950-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/devices/mtd_dataflash.c |   21 +++------------------
 1 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 4d4a9cd..8f6b02c 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -637,8 +637,6 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 	struct flash_platform_data	*pdata = spi->dev.platform_data;
 	char				*otp_tag = "";
 	int				err = 0;
-	struct mtd_partition		*parts;
-	int				nr_parts = 0;
 
 	priv = kzalloc(sizeof *priv, GFP_KERNEL);
 	if (!priv)
@@ -677,23 +675,10 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
-	nr_parts = parse_mtd_partitions(device, NULL, &parts, 0);
+	err = mtd_device_parse_register(device, NULL, 0,
+			pdata ? pdata->parts : NULL,
+			pdata ? pdata->nr_parts : 0);
 
-	if (nr_parts <= 0 && pdata && pdata->parts) {
-		parts = pdata->parts;
-		nr_parts = pdata->nr_parts;
-	}
-
-	if (nr_parts > 0) {
-		priv->partitioned = 1;
-		err = mtd_device_register(device, parts, nr_parts);
-		goto out;
-	}
-
-	if (mtd_device_register(device, NULL, 0) == 1)
-		err = -ENODEV;
-
-out:
 	if (!err)
 		return 0;
 
-- 
1.7.4.4
