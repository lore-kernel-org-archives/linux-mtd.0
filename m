Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9Fb-00074e-PX
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:57 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758005wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:55 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 049/104] mtd: drop of_mtd_parse_partitions()
Date: Thu,  2 Jun 2011 18:51:27 +0400
Message-Id: <1307026293-8535-15-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All users have been converted to call of_mtd_parse_partitions through
parse_mtd_partitions() multiplexer. Drop obsolete API.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/ofpart.c           |   16 ++++------------
 include/linux/mtd/partitions.h |   16 ----------------
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index ff11b85..89a91ae 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -25,22 +25,15 @@ static int parse_ofpart_partitions(struct mtd_info *master,
                              unsigned long origin)
 {
 	struct device_node *node;
+	const char *partname;
+	struct device_node *pp;
+	int nr_parts, i;
+
 
 	node = master->node;
 	if (!node)
 		return 0;
 
-	return of_mtd_parse_partitions(NULL, node, pparts);
-}
-
-int of_mtd_parse_partitions(struct device *dev,
-                                      struct device_node *node,
-                                      struct mtd_partition **pparts)
-{
-	const char *partname;
-	struct device_node *pp;
-	int nr_parts, i;
-
 	/* First count the subnodes */
 	pp = NULL;
 	nr_parts = 0;
@@ -90,7 +83,6 @@ int of_mtd_parse_partitions(struct device *dev,
 
 	return nr_parts;
 }
-EXPORT_SYMBOL(of_mtd_parse_partitions);
 
 static struct mtd_part_parser ofpart_parser = {
 	.owner = THIS_MODULE,
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 5fde0d8..746fc97 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -67,22 +67,6 @@ extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
 
 #define put_partition_parser(p) do { module_put((p)->owner); } while(0)
 
-struct device;
-struct device_node;
-
-#ifdef CONFIG_MTD_OF_PARTS
-int of_mtd_parse_partitions(struct device *dev,
-                                      struct device_node *node,
-                                      struct mtd_partition **pparts);
-#else
-static inline int of_mtd_parse_partitions(struct device *dev,
-					  struct device_node *node,
-					  struct mtd_partition **pparts)
-{
-	return 0;
-}
-#endif
-
 int mtd_is_partition(struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, char *name,
 		      long long offset, long long length);
-- 
1.7.4.4
