Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqu4D-0004WL-O8
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:32:55 +0000
Received: by pabla5 with SMTP id la5so13232067pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:32:33 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH 5/5] mtd: drop 'of_node' partition parser data
Date: Mon, 26 Oct 2015 19:31:10 -0700
Message-Id: <1445913070-17950-6-git-send-email-computersforpeace@gmail.com>
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

This field is no longer used anywhere, as it is superseded by
mtd->dev.of_node.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/ofpart.c           | 14 ++++----------
 include/linux/mtd/partitions.h |  4 ----
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index a5dfd73cfc7d..4368badfc653 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -35,11 +35,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	int nr_parts, i;
 
 
-	/*
-	 * of_node can be provided through auxiliary parser data or (preferred)
-	 * by assigning the master device
-	 */
-	node = data && data->of_node ? data->of_node : master->dev.of_node;
+	/* Pull of_node from the master device */
+	node = master->dev.of_node;
 	if (!node)
 		return 0;
 
@@ -121,11 +118,8 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 	} *part;
 	const char *names;
 
-	/*
-	 * of_node can be provided through auxiliary parser data or (preferred)
-	 * by assigning the master device
-	 */
-	dp = data && data->of_node ? data->of_node : master->dev.of_node;
+	/* Pull of_node from the master device */
+	dp = master->dev.of_node;
 	if (!dp)
 		return 0;
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index e742f34b67eb..773975a3c9e6 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -56,13 +56,9 @@ struct device_node;
 /**
  * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
  * @origin: for RedBoot, start address of MTD device
- * @of_node: for OF parsers, device node containing partitioning information.
- *           This field is deprecated, as the device node should simply be
- *           assigned to the master struct device.
  */
 struct mtd_part_parser_data {
 	unsigned long origin;
-	struct device_node *of_node;
 };
 
 
-- 
2.6.0.rc2.230.g3dd15c0
