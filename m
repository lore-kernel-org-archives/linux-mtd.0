Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMve-0005Dv-Iy
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:08 +0000
Received: by padhy1 with SMTP id hy1so85125536pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 02/11] mtd: ofpart: grab device tree node directly from
 master device node
Date: Fri, 30 Oct 2015 20:33:21 -0700
Message-Id: <1446262410-45754-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
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

This patch supports the mtd->dev.of_node field and deprecates the parser
data 'of_node' field

Driver conversions may now follow.

Additional side benefit to assigning mtd->dev.of_node rather than using
parser data: the driver core will automatically create a device -> node
symlink for us.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: rebase, use new helpers

 drivers/mtd/ofpart.c           | 18 ++++++++++--------
 include/linux/mtd/partitions.h |  4 +++-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 669c3452f278..7bf996a4cf5e 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -37,10 +37,11 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	bool dedicated = true;
 
 
-	if (!data)
-		return 0;
-
-	mtd_node = data->of_node;
+	/*
+	 * of_node can be provided through auxiliary parser data or (preferred)
+	 * by assigning the master device node
+	 */
+	mtd_node = data && data->of_node ? data->of_node : mtd_get_of_node(master);
 	if (!mtd_node)
 		return 0;
 
@@ -149,10 +150,11 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 	} *part;
 	const char *names;
 
-	if (!data)
-		return 0;
-
-	dp = data->of_node;
+	/*
+	 * of_node can be provided through auxiliary parser data or (preferred)
+	 * by assigning the master device node
+	 */
+	dp = data && data->of_node ? data->of_node : mtd_get_of_node(master);
 	if (!dp)
 		return 0;
 
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
