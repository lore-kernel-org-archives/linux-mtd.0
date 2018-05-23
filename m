Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLXNP-0001Yz-9E
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 17:16:50 +0000
Received: by mail-wm0-x244.google.com with SMTP id t11-v6so11085903wmt.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 May 2018 10:16:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] mtd: partitions: use DT info for parsing partitions with
 specified type
Date: Wed, 23 May 2018 19:14:48 +0200
Message-Id: <20180523171448.26234-2-zajec5@gmail.com>
In-Reply-To: <20180523171448.26234-1-zajec5@gmail.com>
References: <20180523171448.26234-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

This supports nested partitions in a DT. If selected partition has a
"compatible" property specified it will be parsed looking for
subpartitions.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdpart.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f8d3a015cdad..52e2cb35fc79 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -322,22 +322,6 @@ static inline void free_partition(struct mtd_part *p)
 	kfree(p);
 }
 
-/**
- * mtd_parse_part - parse MTD partition looking for subpartitions
- *
- * @slave: part that is supposed to be a container and should be parsed
- * @types: NULL-terminated array with names of partition parsers to try
- *
- * Some partitions are kind of containers with extra subpartitions (volumes).
- * There can be various formats of such containers. This function tries to use
- * specified parsers to analyze given partition and registers found
- * subpartitions on success.
- */
-static int mtd_parse_part(struct mtd_part *slave, const char *const *types)
-{
-	return parse_mtd_partitions(&slave->mtd, types, NULL);
-}
-
 static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
@@ -735,8 +719,8 @@ int add_mtd_partitions(struct mtd_info *master,
 
 		add_mtd_device(&slave->mtd);
 		mtd_add_partition_attrs(slave);
-		if (parts[i].types)
-			mtd_parse_part(slave, parts[i].types);
+		/* Look for subpartitions */
+		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
@@ -812,6 +796,12 @@ static const char * const default_mtd_part_types[] = {
 	NULL
 };
 
+/* Check DT only when looking for subpartitions. */
+static const char * const default_subpartition_types[] = {
+	"ofpart",
+	NULL
+};
+
 static int mtd_part_do_parse(struct mtd_part_parser *parser,
 			     struct mtd_info *master,
 			     struct mtd_partitions *pparts,
@@ -882,7 +872,9 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	const char *fixed = "fixed-partitions";
 	int ret, err = 0;
 
-	np = of_get_child_by_name(mtd_get_of_node(master), "partitions");
+	np = mtd_get_of_node(master);
+	if (!mtd_is_partition(master))
+		np = of_get_child_by_name(np, "partitions");
 	of_property_for_each_string(np, "compatible", prop, compat) {
 		parser = mtd_part_get_compatible_parser(compat);
 		if (!parser)
@@ -945,7 +937,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 	int ret, err = 0;
 
 	if (!types)
-		types = default_mtd_part_types;
+		types = mtd_is_partition(master) ? default_subpartition_types :
+			default_mtd_part_types;
 
 	for ( ; *types; types++) {
 		/*
-- 
2.13.6
