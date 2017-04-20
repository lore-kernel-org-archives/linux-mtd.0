Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CYI-000557-3l
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:55:23 +0000
Received: by mail-lf0-x241.google.com with SMTP id x72so5902189lfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:54:59 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/4] mtd: partitions: add of_match_table parser matching
Date: Thu, 20 Apr 2017 15:54:30 +0200
Message-Id: <20170420135431.12585-4-zajec5@gmail.com>
In-Reply-To: <20170420135431.12585-1-zajec5@gmail.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
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
 drivers/mtd/mtdpart.c          | 47 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 73c52f1a2e4c..d0cb1a892ed2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -861,6 +861,41 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
 	return ret;
 }
 
+static bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
+				    struct mtd_part_parser *parser)
+{
+	struct device_node *np;
+	bool ret;
+
+	np = mtd_get_of_node(mtd);
+	np = of_get_child_by_name(np, "partitions");
+
+	ret = !!of_match_node(parser->of_match_table, np);
+
+	of_node_put(np);
+
+	return ret;
+}
+
+static struct mtd_part_parser *mtd_part_get_parser_by_of(struct mtd_info *mtd)
+{
+	struct mtd_part_parser *p, *ret = NULL;
+
+	spin_lock(&part_parser_lock);
+
+	list_for_each_entry(p, &part_parsers, list) {
+		if (of_mtd_match_mtd_parser(mtd, p) &&
+				try_module_get(p->owner)) {
+			ret = p;
+			break;
+		}
+	}
+
+	spin_unlock(&part_parser_lock);
+
+	return ret;
+}
+
 /**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
@@ -913,6 +948,18 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret < 0 && !err)
 			err = ret;
 	}
+
+	parser = mtd_part_get_parser_by_of(master);
+	if (!parser)
+		return err;
+
+	ret = mtd_part_do_parse(parser, master, pparts, data);
+	if (ret > 0)
+		return 0;
+	mtd_part_parser_put(parser);
+	if (ret < 0 && !err)
+		err = ret;
+
 	return err;
 }
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 2787e76c030f..073e1d8d5d17 100644
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
