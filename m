Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zju-0003iU-ES
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:26:13 +0000
Received: by pabfh17 with SMTP id fh17so96225431pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:25:49 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v2 4/6] mtd: partitions: remove kmemdup()
Date: Fri,  4 Dec 2015 15:25:16 -0800
Message-Id: <1449271518-118900-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The use of kmemdup() complicates the error handling a bit. We don't
actually need to allocate new memory, since this reference is treated as
const, and it is copied into new memory by the partition registration
code anyway. So remove it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v2

 drivers/mtd/mtdcore.c | 16 +++++++---------
 drivers/mtd/mtdcore.h |  2 +-
 drivers/mtd/mtdpart.c |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 62f83b050978..868ee52d5063 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -532,7 +532,7 @@ out_error:
 }
 
 static int mtd_add_device_partitions(struct mtd_info *mtd,
-				     struct mtd_partition *real_parts,
+				     const struct mtd_partition *real_parts,
 				     int nbparts)
 {
 	int ret;
@@ -589,16 +589,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      int nr_parts)
 {
 	int ret;
-	struct mtd_partition *real_parts = NULL;
+	const struct mtd_partition *real_parts = NULL;
 
 	ret = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
 	if (ret <= 0 && nr_parts && parts) {
-		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
-				     GFP_KERNEL);
-		if (!real_parts)
-			ret = -ENOMEM;
-		else
-			ret = nr_parts;
+		real_parts = parts;
+		ret = nr_parts;
 	}
 	/* Didn't come up with either parsed OR fallback partitions */
 	if (ret < 0) {
@@ -628,7 +624,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	kfree(real_parts);
+	/* Cleanup any parsed partitions */
+	if (real_parts != parts)
+		kfree(real_parts);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index 7b0353399a10..537ec66f9cfd 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -11,7 +11,7 @@ int del_mtd_device(struct mtd_info *mtd);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 int parse_mtd_partitions(struct mtd_info *master, const char * const *types,
-			 struct mtd_partition **pparts,
+			 const struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data);
 
 int __init init_mtdchar(void);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c6fd4b24c822..86691a5c68b9 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -757,7 +757,7 @@ static const char * const default_mtd_part_types[] = {
  *   point to an array containing this number of &struct mtd_info objects.
  */
 int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
-			 struct mtd_partition **pparts,
+			 const struct mtd_partition **pparts,
 			 struct mtd_part_parser_data *data)
 {
 	struct mtd_part_parser *parser;
-- 
2.6.0.rc2.230.g3dd15c0
