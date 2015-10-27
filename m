Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqu4A-0004Vg-1C
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:32:51 +0000
Received: by pasz6 with SMTP id z6so206144266pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:32:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH 1/5] mtd: ofpart: grab device tree node directly from master
 device node
Date: Mon, 26 Oct 2015 19:31:06 -0700
Message-Id: <1445913070-17950-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems more logical to use a device node directly associated with the
MTD master device (i.e., mtd->dev.of_node field) rather than requiring
auxiliary partition parser information to be passed in by the driver in
a separate struct.

This patch supports the mtd->dev.of_node field, deprecates the parser
data 'of_node' field, and begins using the new convention for nand_base.
Other NAND driver conversions may now follow.

Additional side benefit to assigning mtd->dev.of_node rather than using
parser data: the driver core will automatically create a device -> node
symlink for us.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c   |  3 +++
 drivers/mtd/ofpart.c           | 18 ++++++++++--------
 drivers/mtd/spi-nor/spi-nor.c  |  1 +
 include/linux/mtd/partitions.h |  4 +++-
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index cc74142938b0..d2e7fee2ac37 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3990,6 +3990,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int ret;
 
 	if (chip->flash_node) {
+		/* MTD can automatically handle DT partitions, etc. */
+		mtd->dev.of_node = chip->flash_node;
+
 		ret = nand_dt_init(mtd, chip, chip->flash_node);
 		if (ret)
 			return ret;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32e1bc2..a5dfd73cfc7d 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -35,10 +35,11 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	int nr_parts, i;
 
 
-	if (!data)
-		return 0;
-
-	node = data->of_node;
+	/*
+	 * of_node can be provided through auxiliary parser data or (preferred)
+	 * by assigning the master device
+	 */
+	node = data && data->of_node ? data->of_node : master->dev.of_node;
 	if (!node)
 		return 0;
 
@@ -120,10 +121,11 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 	} *part;
 	const char *names;
 
-	if (!data)
-		return 0;
-
-	dp = data->of_node;
+	/*
+	 * of_node can be provided through auxiliary parser data or (preferred)
+	 * by assigning the master device
+	 */
+	dp = data && data->of_node ? data->of_node : master->dev.of_node;
 	if (!dp)
 		return 0;
 
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..8f9080c6db63 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1258,6 +1258,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
+	mtd->dev.of_node = np;
 	nor->page_size = info->page_size;
 	mtd->writebufsize = nor->page_size;
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 6a35e6de5da1..e742f34b67eb 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -56,7 +56,9 @@ struct device_node;
 /**
  * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
  * @origin: for RedBoot, start address of MTD device
- * @of_node: for OF parsers, device node containing partitioning information
+ * @of_node: for OF parsers, device node containing partitioning information.
+ *           This field is deprecated, as the device node should simply be
+ *           assigned to the master struct device.
  */
 struct mtd_part_parser_data {
 	unsigned long origin;
-- 
2.6.0.rc2.230.g3dd15c0
