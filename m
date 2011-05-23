Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNG-0002TB-QX
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:32 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:30 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 16/62] mtd/m25p80: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:57 +0100
Message-Id: <1306142623-24952-17-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/devices/m25p80.c |   68 ++++++++++++++++++-----------------------
 1 files changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3fb981d..428b761 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -804,6 +804,8 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	struct m25p			*flash;
 	struct flash_info		*info;
 	unsigned			i;
+	struct mtd_partition		*parts = NULL;
+	int				nr_parts = 0;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -945,48 +947,41 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
-	if (mtd_has_partitions()) {
-		struct mtd_partition	*parts = NULL;
-		int			nr_parts = 0;
+	if (mtd_has_cmdlinepart()) {
+		static const char *part_probes[]
+			= { "cmdlinepart", NULL, };
 
-		if (mtd_has_cmdlinepart()) {
-			static const char *part_probes[]
-					= { "cmdlinepart", NULL, };
-
-			nr_parts = parse_mtd_partitions(&flash->mtd,
-					part_probes, &parts, 0);
-		}
+		nr_parts = parse_mtd_partitions(&flash->mtd,
+						part_probes, &parts, 0);
+	}
 
-		if (nr_parts <= 0 && data && data->parts) {
-			parts = data->parts;
-			nr_parts = data->nr_parts;
-		}
+	if (nr_parts <= 0 && data && data->parts) {
+		parts = data->parts;
+		nr_parts = data->nr_parts;
+	}
 
 #ifdef CONFIG_MTD_OF_PARTS
-		if (nr_parts <= 0 && spi->dev.of_node) {
-			nr_parts = of_mtd_parse_partitions(&spi->dev,
-					spi->dev.of_node, &parts);
-		}
+	if (nr_parts <= 0 && spi->dev.of_node) {
+		nr_parts = of_mtd_parse_partitions(&spi->dev,
+						   spi->dev.of_node, &parts);
+	}
 #endif
 
-		if (nr_parts > 0) {
-			for (i = 0; i < nr_parts; i++) {
-				DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-					"{.name = %s, .offset = 0x%llx, "
-						".size = 0x%llx (%lldKiB) }\n",
-					i, parts[i].name,
-					(long long)parts[i].offset,
-					(long long)parts[i].size,
-					(long long)(parts[i].size >> 10));
-			}
-			flash->partitioned = 1;
-			return add_mtd_partitions(&flash->mtd, parts, nr_parts);
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
-	} else if (data && data->nr_parts)
-		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
-				data->nr_parts, data->name);
+		flash->partitioned = 1;
+	}
 
-	return add_mtd_device(&flash->mtd) == 1 ? -ENODEV : 0;
+	return mtd_device_register(&flash->mtd, parts, nr_parts) == 1 ?
+		-ENODEV : 0;
 }
 
 
@@ -996,10 +991,7 @@ static int __devexit m25p_remove(struct spi_device *spi)
 	int		status;
 
 	/* Clean up MTD stuff. */
-	if (mtd_has_partitions() && flash->partitioned)
-		status = del_mtd_partitions(&flash->mtd);
-	else
-		status = del_mtd_device(&flash->mtd);
+	status = mtd_device_unregister(&flash->mtd);
 	if (status == 0) {
 		kfree(flash->command);
 		kfree(flash);
-- 
1.7.4.4
