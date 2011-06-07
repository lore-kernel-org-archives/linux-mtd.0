Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSg-0001Qj-Ja
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:52 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898888wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:50 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/44] mtd: sst25l.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:03 +0400
Message-Id: <1307453803-31950-5-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/devices/sst25l.c |   32 ++++----------------------------
 1 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index cd095af..faa9d3b 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -53,7 +53,6 @@ struct sst25l_flash {
 	struct mutex		lock;
 	struct mtd_info		mtd;
 
-	int 			partitioned;
 };
 
 struct flash_info {
@@ -381,8 +380,6 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	struct sst25l_flash *flash;
 	struct flash_platform_data *data;
 	int ret, i;
-	struct mtd_partition *parts = NULL;
-	int nr_parts = 0;
 
 	flash_info = sst25l_match_device(spi);
 	if (!flash_info)
@@ -423,31 +420,10 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	      flash->mtd.numeraseregions);
 
 
-	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, 0);
-
-	if (nr_parts <= 0 && data && data->parts) {
-		parts = data->parts;
-		nr_parts = data->nr_parts;
-	}
-
-	if (nr_parts > 0) {
-		for (i = 0; i < nr_parts; i++) {
-			DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-			      "{.name = %s, .offset = 0x%llx, "
-			      ".size = 0x%llx (%lldKiB) }\n",
-			      i, parts[i].name,
-			      (long long)parts[i].offset,
-			      (long long)parts[i].size,
-			      (long long)(parts[i].size >> 10));
-		}
-
-		flash->partitioned = 1;
-		return mtd_device_register(&flash->mtd, parts,
-					   nr_parts);
-	}
-
-	ret = mtd_device_register(&flash->mtd, NULL, 0);
-	if (ret == 1) {
+	ret = mtd_device_parse_register(&flash->mtd, NULL, 0,
+			data ? data->parts : NULL,
+			data ? data->nr_parts : 0);
+	if (ret) {
 		kfree(flash);
 		dev_set_drvdata(&spi->dev, NULL);
 		return -ENODEV;
-- 
1.7.4.4
