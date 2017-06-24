Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOuCl-0003Fe-PB
 for linux-mtd@lists.infradead.org; Sat, 24 Jun 2017 23:11:06 +0000
Received: by mail-lf0-x241.google.com with SMTP id n136so9879033lfn.2
 for <linux-mtd@lists.infradead.org>; Sat, 24 Jun 2017 16:10:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4 1/2] mtd: partitions: add of_match_table parser matching
Date: Sun, 25 Jun 2017 01:10:24 +0200
Message-Id: <20170624231025.23292-1-zajec5@gmail.com>
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

From: Brian Norris <computersforpeace@gmail.com>

Partition parsers can now provide an of_match_table to enable
flash<-->parser matching via device tree.

This support is currently limited to built-in parsers as it uses
request_module() and friends. This should be sufficient for most cases
though as compiling parsers as modules isn't a common choice.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
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
---
 drivers/mtd/mtdpart.c          | 65 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2ad9493703f9..239d5e6e62ed 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/err.h>
+#include <linux/of.h>
 
 #include "mtdcore.h"
 
@@ -885,6 +886,60 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
 	return ret;
 }
 
+static int of_mtd_match_mtd_parser(struct mtd_info *mtd,
+				   struct mtd_part_parser *parser)
+{
+	const struct of_device_id *matches;
+	struct device_node *np;
+	int score = 0;
+
+	matches = parser->of_match_table;
+	if (!matches)
+		return false;
+
+	np = mtd_get_of_node(mtd);
+	np = of_get_child_by_name(np, "partitions");
+	if (!np)
+		return false;
+
+	for (; matches->name[0] || matches->type[0] || matches->compatible[0];
+	     matches++) {
+		if (!matches->compatible[0])
+			continue;
+		score = max(score,
+			    of_device_is_compatible(np, matches->compatible));
+	}
+
+	of_node_put(np);
+
+	return score;
+}
+
+static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
+{
+	struct mtd_part_parser *p, *ret = NULL;
+	struct mtd_part_parser *best_parser = NULL;
+	int best_score = 0;
+
+	spin_lock(&part_parser_lock);
+
+	list_for_each_entry(p, &part_parsers, list) {
+		int score = of_mtd_match_mtd_parser(mtd, p);
+
+		if (score > best_score) {
+			best_score = score;
+			best_parser = p;
+		}
+	}
+
+	if (best_parser && try_module_get(best_parser->owner))
+		ret = best_parser;
+
+	spin_unlock(&part_parser_lock);
+
+	return ret;
+}
+
 /**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
@@ -913,6 +968,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 	struct mtd_part_parser *parser;
 	int ret, err = 0;
 
+	parser = mtd_part_get_parser_by_of(master);
+	if (parser) {
+		ret = mtd_part_do_parse(parser, master, pparts, data);
+		if (ret > 0)
+			return 0;
+		mtd_part_parser_put(parser);
+		if (ret < 0)
+			err = ret;
+	}
+
 	if (!types)
 		types = default_mtd_part_types;
 
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
