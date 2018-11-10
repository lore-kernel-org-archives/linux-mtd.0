Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLaaT-000791-Ue
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2018 21:14:39 +0000
Received: by mail-lf1-x143.google.com with SMTP id e26so1905030lfc.2
 for <linux-mtd@lists.infradead.org>; Sat, 10 Nov 2018 13:14:23 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v3] mtd: partitions: Add OF support to RedBoot partitions
Date: Sat, 10 Nov 2018 22:14:13 +0100
Message-Id: <20181110211413.15707-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
ChangeLog v2->v3:
- Fix copy/paste bug identified by the build robot.
ChangeLog v1->v2:
- Rebased on linux-mtd-next for v4.21
---
 drivers/mtd/parsers/redboot.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 7623ac5fc586..cc04a36c8251 100644
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
+MODULE_DEVICE_TABLE(of, mtd_parser_redboot_of_match_table);
+
 static struct mtd_part_parser redboot_parser = {
 	.parse_fn = parse_redboot_partitions,
 	.name = "RedBoot",
+	.of_match_table = mtd_parser_redboot_of_match_table,
 };
 module_mtd_part_parser(redboot_parser);
 
-- 
2.19.1
