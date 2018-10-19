Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDOrr-0003e5-O7
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:06:45 +0000
Received: by mail-lf1-x142.google.com with SMTP id l1-v6so4663952lfc.3
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 00:06:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] mtd: partitions: Add OF support to RedBoot partitions
Date: Fri, 19 Oct 2018 09:06:22 +0200
Message-Id: <20181019070622.26661-3-linus.walleij@linaro.org>
In-Reply-To: <20181019070622.26661-1-linus.walleij@linaro.org>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds device tree support for RedBoot partitioning. We
read out the FIS directory block information from the device
tree and then parse the partition table from there.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/redboot.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 7623ac5fc586..fb816825aa19 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -25,7 +25,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/vmalloc.h>
-
+#include <linux/of.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/module.h>
@@ -56,6 +56,31 @@ static inline int redboot_checksum(struct fis_image_desc *img)
 	return 1;
 }
 
+#ifdef CONFIG_OF
+static void parse_redboot_of(struct mtd_info *master)
+{
+	struct device_node *np;
+	u32 dirblock;
+	int ret;
+
+	np = mtd_get_of_node(master);
+	if (!np)
+		return;
+	ret = of_property_read_u32(np, "fis-index-block", &dirblock);
+	if (ret)
+		return;
+	/*
+	 * Assign the block found in the device tree to the local
+	 * directory block pointer.
+	 */
+	directory = dirblock;
+}
+#else
+static void parse_redboot_of(struct mtd_info *master)
+{
+}
+#endif
+
 static int parse_redboot_partitions(struct mtd_info *master,
 				    const struct mtd_partition **pparts,
 				    struct mtd_part_parser_data *data)
@@ -75,6 +100,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	static char nullstring[] = "unallocated";
 #endif
+	parse_redboot_of(master);
 
 	if ( directory < 0 ) {
 		offset = master->size + directory * master->erasesize;
@@ -289,9 +315,16 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	return ret;
 }
 
+static const struct of_device_id mtd_parser_redboot_of_match_table[] = {
+	{ .compatible = "redboot-fis" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtd_parser_trx_of_match_table);
+
 static struct mtd_part_parser redboot_parser = {
 	.parse_fn = parse_redboot_partitions,
 	.name = "RedBoot",
+	.of_match_table = mtd_parser_redboot_of_match_table,
 };
 module_mtd_part_parser(redboot_parser);
 
-- 
2.17.2
