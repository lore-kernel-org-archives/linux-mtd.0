Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHTsB-0002jN-QG
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:48:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/7] mtd: mtdcore: cleanup mtdcore.h a little
Date: Mon, 18 Mar 2013 08:50:18 +0200
Message-Id: <1363589422-1378-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
References: <1363260463-10609-1-git-send-email-dedekind1@gmail.com>
 <1363589422-1378-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove useless export qualifiers. Not that this is a problem, but we more often
declare function prototypes without 'export', so this is just about being more
consistent. And I am going to add a couple more prototypes here.

Additionally, remove a useless comment.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.h |   28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 62bf5ac..9b10fed 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -1,24 +1,18 @@
-/* linux/drivers/mtd/mtdcore.h
- *
- * Header file for driver private mtdcore exports
- *
+/*
+ * These are exported solely for the purpose of mtd_blkdevs.c. You
+ * should not use them for _anything_ else.
  */
 
-/* These are exported solely for the purpose of mtd_blkdevs.c. You
-   should not use them for _anything_ else */
-
 extern struct mutex mtd_table_mutex;
-extern struct mtd_info *__mtd_next_device(int i);
 
-extern int add_mtd_device(struct mtd_info *mtd);
-extern int del_mtd_device(struct mtd_info *mtd);
-extern int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
-			      int);
-extern int del_mtd_partitions(struct mtd_info *);
-extern int parse_mtd_partitions(struct mtd_info *master,
-				const char * const *types,
-				struct mtd_partition **pparts,
-				struct mtd_part_parser_data *data);
+struct mtd_info *__mtd_next_device(int i);
+int add_mtd_device(struct mtd_info *mtd);
+int del_mtd_device(struct mtd_info *mtd);
+int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
+int del_mtd_partitions(struct mtd_info *);
+int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
+			 struct mtd_partition **pparts,
+			 struct mtd_part_parser_data *data);
 
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
-- 
1.7.10.4
