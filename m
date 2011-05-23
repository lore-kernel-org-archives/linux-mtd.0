Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNI-0002Tm-Ra
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:34 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:32 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/62] mtd/dataflash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:58 +0100
Message-Id: <1306142623-24952-18-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/devices/mtd_dataflash.c |   45 ++++++++++++++---------------------
 1 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index c5015cc..13749d4 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -637,6 +637,8 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 	struct flash_platform_data	*pdata = spi->dev.platform_data;
 	char				*otp_tag = "";
 	int				err = 0;
+	struct mtd_partition		*parts;
+	int				nr_parts = 0;
 
 	priv = kzalloc(sizeof *priv, GFP_KERNEL);
 	if (!priv)
@@ -675,33 +677,25 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
-	if (mtd_has_partitions()) {
-		struct mtd_partition	*parts;
-		int			nr_parts = 0;
+	if (mtd_has_cmdlinepart()) {
+		static const char *part_probes[] = { "cmdlinepart", NULL, };
 
-		if (mtd_has_cmdlinepart()) {
-			static const char *part_probes[]
-					= { "cmdlinepart", NULL, };
-
-			nr_parts = parse_mtd_partitions(device,
-					part_probes, &parts, 0);
-		}
+		nr_parts = parse_mtd_partitions(device, part_probes, &parts,
+						0);
+	}
 
-		if (nr_parts <= 0 && pdata && pdata->parts) {
-			parts = pdata->parts;
-			nr_parts = pdata->nr_parts;
-		}
+	if (nr_parts <= 0 && pdata && pdata->parts) {
+		parts = pdata->parts;
+		nr_parts = pdata->nr_parts;
+	}
 
-		if (nr_parts > 0) {
-			priv->partitioned = 1;
-			err = add_mtd_partitions(device, parts, nr_parts);
-			goto out;
-		}
-	} else if (pdata && pdata->nr_parts)
-		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
-				pdata->nr_parts, device->name);
+	if (nr_parts > 0) {
+		priv->partitioned = 1;
+		err = mtd_device_register(device, parts, nr_parts);
+		goto out;
+	}
 
-	if (add_mtd_device(device) == 1)
+	if (mtd_device_register(device, NULL, 0) == 1)
 		err = -ENODEV;
 
 out:
@@ -939,10 +933,7 @@ static int __devexit dataflash_remove(struct spi_device *spi)
 
 	DEBUG(MTD_DEBUG_LEVEL1, "%s: remove\n", dev_name(&spi->dev));
 
-	if (mtd_has_partitions() && flash->partitioned)
-		status = del_mtd_partitions(&flash->mtd);
-	else
-		status = del_mtd_device(&flash->mtd);
+	status = mtd_device_unregister(&flash->mtd);
 	if (status == 0) {
 		dev_set_drvdata(&spi->dev, NULL);
 		kfree(flash);
-- 
1.7.4.4
