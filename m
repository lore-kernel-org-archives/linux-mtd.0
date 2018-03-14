Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew5FL-0001JH-5l
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 12:11:12 +0000
Received: by mail-lf0-x243.google.com with SMTP id v9-v6so4396824lfa.11
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 05:10:58 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Peter Rosin <peda@axentia.se>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V10 1/3] mtd: partitions: add of_match_table parser matching
 for the "ofpart" type
Date: Wed, 14 Mar 2018 13:10:42 +0100
Message-Id: <20180314121044.12033-2-zajec5@gmail.com>
In-Reply-To: <20180314121044.12033-1-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
 <20180314121044.12033-1-zajec5@gmail.com>
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

In order to properly support compatibility strings as described in the
bindings/mtd/partition.txt "ofpart" type should be treated as an
indication for looking into OF. MTD should check "compatible" property
and search for a matching parser rather than blindly trying the one
supporting "fixed-partitions".

It also means that existing "fixed-partitions" parser should get renamed
to use a more meaningful name.

This commit achievies that aim by introducing a new mtd_part_of_parse().
It works by looking for a matching parser for every string in the
"compatibility" property (starting with the most specific one).

Please note that driver-specified parsers still take a precedence. It's
assumed that driver providing a parser type has a good reason for that
(e.g. having platform data with device-specific info). Also doing
otherwise could break existing setups. The same applies to using default
parsers (including "cmdlinepart") as some overwrite DT data with cmdline
argument.

Partition parsers can now provide an of_match_table to enable
flash<-->parser matching via device tree as documented in the
mtd/partition.txt.

This support is currently limited to built-in parsers as it uses
request_module() and friends. This should be sufficient for most cases
though as compiling parsers as modules isn't a common choice.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Tested-by: Peter Rosin <peda@axentia.se>
---
This is based on Brian's patches:
[RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
[RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching

V1: Put helpers in mtdpart.c instead of drivers/of/of_mtd.c
    Merge helpers into a single of_mtd_match_mtd_parser
V3: Add a simple comment to note we will need the best match in the future
V4: Rework new functions to pick parser with the best match
    Move new code in parse_mtd_partitions up so it has precedence over flash
    driver defaults and MTD defaults
V5: Rework matching code to start checking with the most specific string in the
    "compatibility" property.
V6: Initialize "ret" variable in mtd_part_get_parser_by_cp to NULL
V7: Rename function "mtd_part_get_parser_by_cp" to use "_compatible_"
    Rename "cp" variable to "compat"
    Drop unneeded if (np) check from the parse_mtd_partitions
V8: Move new OF code in parse_mtd_partitions() lower so driver-specified parsers
    take a precedence. Update commit message to make that clear.
V9: Update to modify mtd_part_of_parse() instead of parse_mtd_partitions()
V10: Commit adding support for "ofpart" got squashed into this one.
---
 drivers/mtd/mtdpart.c          | 116 +++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/partitions.h |   1 +
 2 files changed, 108 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 76cd21d1171b..105fe2c7729c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/err.h>
+#include <linux/of.h>
 
 #include "mtdcore.h"
 
@@ -861,6 +862,92 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
 }
 
 /**
+ * mtd_part_get_compatible_parser - find MTD parser by a compatible string
+ *
+ * @compat: compatible string describing partitions in a device tree
+ *
+ * MTD parsers can specify supported partitions by providing a table of
+ * compatibility strings. This function finds a parser that advertises support
+ * for a passed value of "compatible".
+ */
+static struct mtd_part_parser *mtd_part_get_compatible_parser(const char *compat)
+{
+	struct mtd_part_parser *p, *ret = NULL;
+
+	spin_lock(&part_parser_lock);
+
+	list_for_each_entry(p, &part_parsers, list) {
+		const struct of_device_id *matches;
+
+		matches = p->of_match_table;
+		if (!matches)
+			continue;
+
+		for (; matches->compatible[0]; matches++) {
+			if (!strcmp(matches->compatible, compat) &&
+			    try_module_get(p->owner)) {
+				ret = p;
+				break;
+			}
+		}
+
+		if (ret)
+			break;
+	}
+
+	spin_unlock(&part_parser_lock);
+
+	return ret;
+}
+
+static int mtd_part_of_parse(struct mtd_info *master,
+			     struct mtd_partitions *pparts)
+{
+	struct mtd_part_parser *parser;
+	struct device_node *np;
+	struct property *prop;
+	const char *compat;
+	const char *fixed = "ofpart";
+	int ret, err = 0;
+
+	np = of_get_child_by_name(mtd_get_of_node(master), "partitions");
+	of_property_for_each_string(np, "compatible", prop, compat) {
+		parser = mtd_part_get_compatible_parser(compat);
+		if (!parser)
+			continue;
+		ret = mtd_part_do_parse(parser, master, pparts, NULL);
+		if (ret > 0) {
+			of_node_put(np);
+			return ret;
+		}
+		mtd_part_parser_put(parser);
+		if (ret < 0 && !err)
+			err = ret;
+	}
+	of_node_put(np);
+
+	/*
+	 * For backward compatibility we have to try the "ofpart"
+	 * parser. It supports old DT format with partitions specified as a
+	 * direct subnodes of a flash device DT node without any compatibility
+	 * specified we could match.
+	 */
+	parser = mtd_part_parser_get(fixed);
+	if (!parser && !request_module("%s", fixed))
+		parser = mtd_part_parser_get(fixed);
+	if (parser) {
+		ret = mtd_part_do_parse(parser, master, pparts, NULL);
+		if (ret > 0)
+			return ret;
+		mtd_part_parser_put(parser);
+		if (ret < 0 && !err)
+			err = ret;
+	}
+
+	return err;
+}
+
+/**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
  * @types: names of partition parsers to try or %NULL
@@ -892,19 +979,30 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		types = default_mtd_part_types;
 
 	for ( ; *types; types++) {
-		pr_debug("%s: parsing partitions %s\n", master->name, *types);
-		parser = mtd_part_parser_get(*types);
-		if (!parser && !request_module("%s", *types))
+		/*
+		 * ofpart is a special type that means OF partitioning info
+		 * should be used. It requires a bit different logic so it is
+		 * handled in a separated function.
+		 */
+		if (!strcmp(*types, "ofpart")) {
+			ret = mtd_part_of_parse(master, pparts);
+		} else {
+			pr_debug("%s: parsing partitions %s\n", master->name,
+				 *types);
 			parser = mtd_part_parser_get(*types);
-		pr_debug("%s: got parser %s\n", master->name,
-			 parser ? parser->name : NULL);
-		if (!parser)
-			continue;
-		ret = mtd_part_do_parse(parser, master, pparts, data);
+			if (!parser && !request_module("%s", *types))
+				parser = mtd_part_parser_get(*types);
+			pr_debug("%s: got parser %s\n", master->name,
+				parser ? parser->name : NULL);
+			if (!parser)
+				continue;
+			ret = mtd_part_do_parse(parser, master, pparts, data);
+			if (ret <= 0)
+				mtd_part_parser_put(parser);
+		}
 		/* Found partitions! */
 		if (ret > 0)
 			return 0;
-		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
 		 * succeeds
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index c4beb70dacbd..11cb0c50cd84 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -77,6 +77,7 @@ struct mtd_part_parser {
 	struct list_head list;
 	struct module *owner;
 	const char *name;
+	const struct of_device_id *of_match_table;
 	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
 			struct mtd_part_parser_data *);
 	void (*cleanup)(const struct mtd_partition *pparts, int nr_parts);
-- 
2.11.0
