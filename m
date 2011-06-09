Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8g-0007Vd-C6
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:15 +0000
Received: by wyb28 with SMTP id 28so1555625wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:13 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/17] mtd: m25p80: use ofpart through generic parsing
Date: Thu,  9 Jun 2011 18:22:52 +0400
Message-Id: <1307629388-24769-4-git-send-email-dbaryshkov@gmail.com>
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

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 70d5fca..a1cdb52 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -928,6 +928,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	if (info->flags & M25P_NO_ERASE)
 		flash->mtd.flags |= MTD_NO_ERASE;
 
+	flash->mtd.node = spi->dev.of_node;
 	flash->mtd.dev.parent = &spi->dev;
 	flash->page_size = info->page_size;
 
@@ -975,13 +976,6 @@ static int __devinit m25p_probe(struct spi_device *spi)
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
