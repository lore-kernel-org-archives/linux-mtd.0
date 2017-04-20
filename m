Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CYI-00054j-3k
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:55:21 +0000
Received: by mail-lf0-x241.google.com with SMTP id i3so5906538lfh.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 06:54:57 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/4] mtd: partitions: factor out code calling parser
Date: Thu, 20 Apr 2017 15:54:29 +0200
Message-Id: <20170420135431.12585-3-zajec5@gmail.com>
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

This code is going to be reused for parsers matched using OF so let's
factor it out to make this easier.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdpart.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 81e0b80237df..73c52f1a2e4c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -840,6 +840,27 @@ static const char * const default_mtd_part_types[] = {
 	NULL
 };
 
+static int mtd_part_do_parse(struct mtd_part_parser *parser,
+			     struct mtd_info *master,
+			     struct mtd_partitions *pparts,
+			     struct mtd_part_parser_data *data)
+{
+	int ret;
+
+	ret = (*parser->parse_fn)(master, &pparts->parts, data);
+	pr_debug("%s: parser %s: %i\n", master->name, parser->name, ret);
+	if (ret <= 0)
+		return ret;
+
+	pr_notice("%d %s partitions found on MTD device %s\n", ret,
+		  parser->name, master->name);
+
+	pparts->nr_parts = ret;
+	pparts->parser = parser;
+
+	return ret;
+}
+
 /**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
@@ -880,16 +901,10 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
-		ret = (*parser->parse_fn)(master, &pparts->parts, data);
-		pr_debug("%s: parser %s: %i\n",
-			 master->name, parser->name, ret);
-		if (ret > 0) {
-			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-			       ret, parser->name, master->name);
-			pparts->nr_parts = ret;
-			pparts->parser = parser;
+		ret = mtd_part_do_parse(parser, master, pparts, data);
+		/* Found partitions! */
+		if (ret > 0)
 			return 0;
-		}
 		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
-- 
2.11.0
