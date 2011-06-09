Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8w-0007V4-C5
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:31 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1305393wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:30 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/17] mtd: m25p80.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:02 +0400
Message-Id: <1307629388-24769-14-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/devices/m25p80.c |   28 +++-------------------------
 1 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index a1cdb52..f76db1d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -88,7 +88,6 @@ struct m25p {
 	struct spi_device	*spi;
 	struct mutex		lock;
 	struct mtd_info		mtd;
-	unsigned		partitioned:1;
 	u16			page_size;
 	u16			addr_width;
 	u8			erase_opcode;
@@ -825,8 +824,6 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	struct m25p			*flash;
 	struct flash_info		*info;
 	unsigned			i;
-	struct mtd_partition		*parts = NULL;
-	int				nr_parts = 0;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -969,28 +966,9 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
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
-		flash->partitioned = 1;
-	}
-
-	return mtd_device_register(&flash->mtd, parts, nr_parts) == 1 ?
-		-ENODEV : 0;
+	return mtd_device_parse_register(&flash->mtd, NULL, 0,
+			data ? data->parts : NULL,
+			data ? data->nr_parts : 0);
 }
 
 
-- 
1.7.5.3
