Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNL-0002TQ-4k
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:36 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:34 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/62] mtd/sst25l: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:59 +0100
Message-Id: <1306142623-24952-19-git-send-email-jamie@jamieiles.com>
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

Convert to mtd_device_register() and remove the check for
mtd_has_partitions() as we always have partitioning enabled now.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/devices/sst25l.c |   62 +++++++++++++++++------------------------
 1 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index c163e61..57c3750 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -381,6 +381,8 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	struct sst25l_flash *flash;
 	struct flash_platform_data *data;
 	int ret, i;
+	struct mtd_partition *parts = NULL;
+	int nr_parts = 0;
 
 	flash_info = sst25l_match_device(spi);
 	if (!flash_info)
@@ -420,46 +422,37 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	      flash->mtd.erasesize, flash->mtd.erasesize / 1024,
 	      flash->mtd.numeraseregions);
 
-	if (mtd_has_partitions()) {
-		struct mtd_partition *parts = NULL;
-		int nr_parts = 0;
 
-		if (mtd_has_cmdlinepart()) {
-			static const char *part_probes[] =
-				{"cmdlinepart", NULL};
+	if (mtd_has_cmdlinepart()) {
+		static const char *part_probes[] = {"cmdlinepart", NULL};
 
-			nr_parts = parse_mtd_partitions(&flash->mtd,
-							part_probes,
-							&parts, 0);
-		}
+		nr_parts = parse_mtd_partitions(&flash->mtd,
+						part_probes,
+						&parts, 0);
+	}
 
-		if (nr_parts <= 0 && data && data->parts) {
-			parts = data->parts;
-			nr_parts = data->nr_parts;
-		}
+	if (nr_parts <= 0 && data && data->parts) {
+		parts = data->parts;
+		nr_parts = data->nr_parts;
+	}
 
-		if (nr_parts > 0) {
-			for (i = 0; i < nr_parts; i++) {
-				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-				      "{.name = %s, .offset = 0x%llx, "
-				      ".size = 0x%llx (%lldKiB) }\n",
-				      i, parts[i].name,
-				      (long long)parts[i].offset,
-				      (long long)parts[i].size,
-				      (long long)(parts[i].size >> 10));
-			}
-
-			flash->partitioned = 1;
-			return add_mtd_partitions(&flash->mtd,
-						  parts, nr_parts);
+	if (nr_parts > 0) {
+		for (i = 0; i < nr_parts; i++) {
+			DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
+			      "{.name = %s, .offset = 0x%llx, "
+			      ".size = 0x%llx (%lldKiB) }\n",
+			      i, parts[i].name,
+			      (long long)parts[i].offset,
+			      (long long)parts[i].size,
+			      (long long)(parts[i].size >> 10));
 		}
 
-	} else if (data && data->nr_parts) {
-		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
-			 data->nr_parts, data->name);
+		flash->partitioned = 1;
+		return mtd_device_register(&flash->mtd, parts,
+					   nr_parts);
 	}
 
-	ret = add_mtd_device(&flash->mtd);
+	ret = mtd_device_register(&flash->mtd, NULL, 0);
 	if (ret == 1) {
 		kfree(flash);
 		dev_set_drvdata(&spi->dev, NULL);
@@ -474,10 +467,7 @@ static int __exit sst25l_remove(struct spi_device *spi)
 	struct sst25l_flash *flash = dev_get_drvdata(&spi->dev);
 	int ret;
 
-	if (mtd_has_partitions() && flash->partitioned)
-		ret = del_mtd_partitions(&flash->mtd);
-	else
-		ret = del_mtd_device(&flash->mtd);
+	ret = mtd_device_unregister(&flash->mtd);
 	if (ret == 0)
 		kfree(flash);
 	return ret;
-- 
1.7.4.4
