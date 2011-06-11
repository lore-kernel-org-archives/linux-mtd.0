Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLe-00011e-Gf
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:11 +0000
Received: by eyh6 with SMTP id 6so1530638eyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/18] mtd: m25p80: use ofpart through generic parsing
Date: Sun, 12 Jun 2011 03:11:48 +0400
Message-Id: <1307833922-21602-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/devices/m25p80.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 70d5fca..399c234 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -827,6 +827,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	unsigned			i;
 	struct mtd_partition		*parts = NULL;
 	int				nr_parts = 0;
+	struct mtd_part_parser_data	ppdata;
 
 	/* Platform data helps sort out which chip type we have, as
 	 * well as how this board partitions it.  If we don't have
@@ -928,6 +929,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	if (info->flags & M25P_NO_ERASE)
 		flash->mtd.flags |= MTD_NO_ERASE;
 
+	ppdata.of_node = spi->dev.of_node;
 	flash->mtd.dev.parent = &spi->dev;
 	flash->page_size = info->page_size;
 
@@ -968,20 +970,13 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
-	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, 0);
+	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, &ppdata);
 
 	if (nr_parts <= 0 && data && data->parts) {
 		parts = data->parts;
 		nr_parts = data->nr_parts;
 	}
 
-#ifdef CONFIG_MTD_OF_PARTS
-	if (nr_parts <= 0 && spi->dev.of_node) {
-		nr_parts = of_mtd_parse_partitions(&spi->dev,
-						   spi->dev.of_node, &parts);
-	}
-#endif
-
 	if (nr_parts > 0) {
 		for (i = 0; i < nr_parts; i++) {
 			DEBUG(MTD_DEBUG_LEVEL2, "partitions[%d] = "
-- 
1.7.5.3
