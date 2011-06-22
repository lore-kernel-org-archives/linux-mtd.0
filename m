Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJtP-00040t-S9
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:41 +0000
Received: by mail-wy0-f177.google.com with SMTP id 23so536878wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:39 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/18] mtd: m25p80.c: use mtd_device_parse_register
Date: Wed, 22 Jun 2011 13:37:47 +0400
Message-Id: <1308735472-32640-14-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
index 399c234..66a3555 100644
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
 	struct mtd_part_parser_data	ppdata;
 
 	/* Platform data helps sort out which chip type we have, as
@@ -970,28 +967,9 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
-	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, &ppdata);
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
+	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
+			data ? data->parts : NULL,
+			data ? data->nr_parts : 0);
 }
 
 
-- 
1.7.5.3
