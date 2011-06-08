From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Wed, 8 Jun 2011 11:42:27 +0300
Subject: [PATCH] mtd: document parse_mtd_partitions
Message-ID: <mailman.8.1307522517.24103.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Add a kerneldoc comment for the 'parse_mtd_partitions()' function - its
behavior has changed recently so it is good idea to have it documented.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdpart.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b7372050..2b71ccb 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -725,8 +725,30 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
 }
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
+/*
+ * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
+ * are changing this array!
+ */
 static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
 
+/**
+ * parse_mtd_partitions - parse MTD partitions
+ * @master: the master partition (describes whole MTD device)
+ * @types: names of partition parsers to try or %NULL
+ * @pparts: array of partitions found is returned here
+ * @origin: MTD device start address (use %0 if unsure)
+ *
+ * This function tries to find partition on MTD device @master. It uses MTD
+ * partition parsers, specified in @types. However, if @types is %NULL, then
+ * the default list of parsers is used. The default list contains only the
+ * "cmdlinepart" parser ATM.
+ *
+ * This function may return:
+ * o a negative error code in case of failure
+ * o zero if no partitions were found
+ * o a positive number of found partitions, in which case on exit @pparts will
+ *   point to an array containing this number of &struct mtd_info objects.
+ */
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
 			 struct mtd_partition **pparts, unsigned long origin)
 {
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
