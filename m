Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFN34-0007Td-BM
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 11:07:16 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/9] mtd: add 'const' qualifier to a couple of register
 functions
Date: Tue, 12 Mar 2013 13:08:20 +0200
Message-Id: <1363086508-2405-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

'mtd_device_parse_register()' and 'parse_mtd_partitions()' functions accept a
an array of character pointers. These functions modify neither the pointers nor
the characters they point to. The characters are actually names of the MTD
parsers.

At the moment, the argument type is 'const char **', which means that only the
names of the parsers are constant. Let's turn the argument type into 'const
char * const *', which means that both names and the pointers which point to
them are constant.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |    2 +-
 drivers/mtd/mtdcore.h   |    3 ++-
 drivers/mtd/mtdpart.c   |    2 +-
 include/linux/mtd/mtd.h |    8 ++++----
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 61d5f56..681bb6d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -492,7 +492,7 @@ out_error:
  *
  * Returns zero in case of success and a negative error code in case of failure.
  */
-int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
+int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      struct mtd_part_parser_data *parser_data,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 961a384..62bf5ac 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -15,7 +15,8 @@ extern int del_mtd_device(struct mtd_info *mtd);
 extern int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
 			      int);
 extern int del_mtd_partitions(struct mtd_info *);
-extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
+extern int parse_mtd_partitions(struct mtd_info *master,
+				const char * const *types,
 				struct mtd_partition **pparts,
 				struct mtd_part_parser_data *data);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 70fa70a..9ee0911 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -720,7 +720,7 @@ static const char *default_mtd_part_types[] = {
  * o a positive number of found partitions, in which case on exit @pparts will
  *   point to an array containing this number of &struct mtd_info objects.
  */
-int parse_mtd_partitions(struct mtd_info *master, const char **types,
+int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data)
 {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f9ac289..a5cf4e8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -362,10 +362,10 @@ struct mtd_partition;
 struct mtd_part_parser_data;
 
 extern int mtd_device_parse_register(struct mtd_info *mtd,
-			      const char **part_probe_types,
-			      struct mtd_part_parser_data *parser_data,
-			      const struct mtd_partition *defparts,
-			      int defnr_parts);
+				     const char * const *part_probe_types,
+				     struct mtd_part_parser_data *parser_data,
+				     const struct mtd_partition *defparts,
+				     int defnr_parts);
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
-- 
1.7.10.4
