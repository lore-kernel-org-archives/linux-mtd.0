Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zjs-0003iE-Sf
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:26:10 +0000
Received: by pfdd184 with SMTP id d184so33020061pfd.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:25:47 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v2 1/6] mtd: ofpart: assign return argument exactly once
Date: Fri,  4 Dec 2015 15:25:13 -0800
Message-Id: <1449271518-118900-2-git-send-email-computersforpeace@gmail.com>
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

It's easier to refactor these parsers if the return value gets assigned
only once, just like every other MTD partition parser.

This prepares for making the second arg to the parse_fn() const. This is
OK if we construct the partitions completely first, and assign them to
the return pointer only after we're done modifying them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v2

 drivers/mtd/ofpart.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 478538100ddd..4800fecaf8cf 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -29,6 +29,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 				   struct mtd_partition **pparts,
 				   struct mtd_part_parser_data *data)
 {
+	struct mtd_partition *parts;
 	struct device_node *mtd_node;
 	struct device_node *ofpart_node;
 	const char *partname;
@@ -62,8 +63,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	if (nr_parts == 0)
 		return 0;
 
-	*pparts = kzalloc(nr_parts * sizeof(**pparts), GFP_KERNEL);
-	if (!*pparts)
+	parts = kzalloc(nr_parts * sizeof(*parts), GFP_KERNEL);
+	if (!parts)
 		return -ENOMEM;
 
 	i = 0;
@@ -97,19 +98,19 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 			goto ofpart_fail;
 		}
 
-		(*pparts)[i].offset = of_read_number(reg, a_cells);
-		(*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
+		parts[i].offset = of_read_number(reg, a_cells);
+		parts[i].size = of_read_number(reg + a_cells, s_cells);
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
 			partname = of_get_property(pp, "name", &len);
-		(*pparts)[i].name = partname;
+		parts[i].name = partname;
 
 		if (of_get_property(pp, "read-only", &len))
-			(*pparts)[i].mask_flags |= MTD_WRITEABLE;
+			parts[i].mask_flags |= MTD_WRITEABLE;
 
 		if (of_get_property(pp, "lock", &len))
-			(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
+			parts[i].mask_flags |= MTD_POWERUP_LOCK;
 
 		i++;
 	}
@@ -117,6 +118,7 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	if (!nr_parts)
 		goto ofpart_none;
 
+	*pparts = parts;
 	return nr_parts;
 
 ofpart_fail:
@@ -125,8 +127,7 @@ ofpart_fail:
 	ret = -EINVAL;
 ofpart_none:
 	of_node_put(pp);
-	kfree(*pparts);
-	*pparts = NULL;
+	kfree(parts);
 	return ret;
 }
 
@@ -139,6 +140,7 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 				      struct mtd_partition **pparts,
 				      struct mtd_part_parser_data *data)
 {
+	struct mtd_partition *parts;
 	struct device_node *dp;
 	int i, plen, nr_parts;
 	const struct {
@@ -160,32 +162,33 @@ static int parse_ofoldpart_partitions(struct mtd_info *master,
 
 	nr_parts = plen / sizeof(part[0]);
 
-	*pparts = kzalloc(nr_parts * sizeof(*(*pparts)), GFP_KERNEL);
-	if (!*pparts)
+	parts = kzalloc(nr_parts * sizeof(*parts), GFP_KERNEL);
+	if (!parts)
 		return -ENOMEM;
 
 	names = of_get_property(dp, "partition-names", &plen);
 
 	for (i = 0; i < nr_parts; i++) {
-		(*pparts)[i].offset = be32_to_cpu(part->offset);
-		(*pparts)[i].size   = be32_to_cpu(part->len) & ~1;
+		parts[i].offset = be32_to_cpu(part->offset);
+		parts[i].size   = be32_to_cpu(part->len) & ~1;
 		/* bit 0 set signifies read only partition */
 		if (be32_to_cpu(part->len) & 1)
-			(*pparts)[i].mask_flags = MTD_WRITEABLE;
+			parts[i].mask_flags = MTD_WRITEABLE;
 
 		if (names && (plen > 0)) {
 			int len = strlen(names) + 1;
 
-			(*pparts)[i].name = names;
+			parts[i].name = names;
 			plen -= len;
 			names += len;
 		} else {
-			(*pparts)[i].name = "unnamed";
+			parts[i].name = "unnamed";
 		}
 
 		part++;
 	}
 
+	*pparts = parts;
 	return nr_parts;
 }
 
-- 
2.6.0.rc2.230.g3dd15c0
