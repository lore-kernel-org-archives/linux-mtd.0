Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew5FP-00072k-Fa
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2018 12:11:13 +0000
Received: by mail-lf0-x241.google.com with SMTP id w16-v6so4380225lfc.13
 for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2018 05:11:01 -0700 (PDT)
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
Subject: [PATCH V10 2/3] mtd: rename "ofpart" parser to "fixed-partitions" as
 it fits it better
Date: Wed, 14 Mar 2018 13:10:43 +0100
Message-Id: <20180314121044.12033-3-zajec5@gmail.com>
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

Type "ofpart" means that OF should be used to get partitioning info and
this driver supports "fixed-partitions" binding only. Renaming it should
lead to less confusion especially when parsers for new compatibility
strings start to appear.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/mtdpart.c |  4 ++--
 drivers/mtd/ofpart.c  | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 105fe2c7729c..cdb1f496ab95 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -907,7 +907,7 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	struct device_node *np;
 	struct property *prop;
 	const char *compat;
-	const char *fixed = "ofpart";
+	const char *fixed = "fixed-partitions";
 	int ret, err = 0;
 
 	np = of_get_child_by_name(mtd_get_of_node(master), "partitions");
@@ -927,7 +927,7 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	of_node_put(np);
 
 	/*
-	 * For backward compatibility we have to try the "ofpart"
+	 * For backward compatibility we have to try the "fixed-partitions"
 	 * parser. It supports old DT format with partitions specified as a
 	 * direct subnodes of a flash device DT node without any compatibility
 	 * specified we could match.
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 6bdf4e525677..9f497315e65d 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -25,9 +25,9 @@ static bool node_has_compatible(struct device_node *pp)
 	return of_get_property(pp, "compatible", NULL);
 }
 
-static int parse_ofpart_partitions(struct mtd_info *master,
-				   const struct mtd_partition **pparts,
-				   struct mtd_part_parser_data *data)
+static int parse_fixed_partitions(struct mtd_info *master,
+				  const struct mtd_partition **pparts,
+				  struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
 	struct device_node *mtd_node;
@@ -141,8 +141,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 }
 
 static struct mtd_part_parser ofpart_parser = {
-	.parse_fn = parse_ofpart_partitions,
-	.name = "ofpart",
+	.parse_fn = parse_fixed_partitions,
+	.name = "fixed-partitions",
 };
 
 static int parse_ofoldpart_partitions(struct mtd_info *master,
@@ -229,4 +229,5 @@ MODULE_AUTHOR("Vitaly Wool, David Gibson");
  * with the same name. Since we provide the ofoldpart parser, we should have
  * the corresponding alias.
  */
+MODULE_ALIAS("fixed-partitions");
 MODULE_ALIAS("ofoldpart");
-- 
2.11.0
