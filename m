Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLn-00010Q-97
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:20 +0000
Received: by mail-ew0-f49.google.com with SMTP id 3so1527787ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:18 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/18] mtd: drop of_mtd_parse_partitions()
Date: Sun, 12 Jun 2011 03:11:54 +0400
Message-Id: <1307833922-21602-11-git-send-email-dbaryshkov@gmail.com>
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

All users have been converted to call of_mtd_parse_partitions through
parse_mtd_partitions() multiplexer. Drop obsolete API.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/ofpart.c           |   20 +++++++++-----------
 include/linux/mtd/partitions.h |   16 ----------------
 2 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 7c2c926..24007f3 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -24,20 +24,19 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 				   struct mtd_partition **pparts,
 				   struct mtd_part_parser_data *data)
 {
-	if (!data || !data->of_node)
-		return 0;
-
-	return of_mtd_parse_partitions(NULL, data->of_node, pparts);
-}
-
-int of_mtd_parse_partitions(struct device *dev,
-                                      struct device_node *node,
-                                      struct mtd_partition **pparts)
-{
+	struct device_node *node;
 	const char *partname;
 	struct device_node *pp;
 	int nr_parts, i;
 
+
+	if (!data)
+		return 0;
+
+	node = data->of_node;
+	if (!node)
+		return 0;
+
 	/* First count the subnodes */
 	pp = NULL;
 	nr_parts = 0;
@@ -87,7 +86,6 @@ int of_mtd_parse_partitions(struct device *dev,
 
 	return nr_parts;
 }
-EXPORT_SYMBOL(of_mtd_parse_partitions);
 
 static struct mtd_part_parser ofpart_parser = {
 	.owner = THIS_MODULE,
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index dad4edf..3d330e0 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -82,22 +82,6 @@ extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
 
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
1.7.5.3
