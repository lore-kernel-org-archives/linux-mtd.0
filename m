Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZifW-0004Qz-Hi
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:05:59 +0000
Received: by wwf22 with SMTP id 22so1295734wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:05:57 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd: hide parse_mtd_partitions
Date: Thu, 23 Jun 2011 16:05:29 +0400
Message-Id: <1308830731-5698-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
References: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to export parse_mtd_partitions() now , as it's fully handled
by registration functions. So move the definition to private header and
remove respective EXPORT_SYMBOL_GPL.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdcore.h          |    4 ++++
 drivers/mtd/mtdpart.c          |    1 -
 include/linux/mtd/partitions.h |    3 ---
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 0ed6126..7e7d1a3b 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -15,8 +15,12 @@ extern int del_mtd_device(struct mtd_info *mtd);
 extern int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *,
 			      int);
 extern int del_mtd_partitions(struct mtd_info *);
+extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
+				struct mtd_partition **pparts,
+				struct mtd_part_parser_data *data);
 
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
 	     (mtd) != NULL;				\
 	     (mtd) = __mtd_next_device(mtd->index + 1))
+
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9e8ee05..6997c6c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -778,7 +778,6 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	}
 	return ret;
 }
-EXPORT_SYMBOL_GPL(parse_mtd_partitions);
 
 int mtd_is_partition(struct mtd_info *mtd)
 {
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index a8a961a..c98d6b8 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -78,9 +78,6 @@ struct mtd_part_parser {
 
 extern int register_mtd_parser(struct mtd_part_parser *parser);
 extern int deregister_mtd_parser(struct mtd_part_parser *parser);
-extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
-				struct mtd_partition **pparts,
-				struct mtd_part_parser_data *data);
 
 #define put_partition_parser(p) do { module_put((p)->owner); } while(0)
 
-- 
1.7.5.3
