Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zjt-0003iJ-1b
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:26:11 +0000
Received: by pfu207 with SMTP id 207so33008934pfu.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:25:47 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>, Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH v2 2/6] mtd: partitions: make parsers return 'const' partition
 arrays
Date: Fri,  4 Dec 2015 15:25:14 -0800
Message-Id: <1449271518-118900-3-git-send-email-computersforpeace@gmail.com>
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

We only want to modify these arrays inside the parser "drivers", so the
drivers should construct them however they like, then return them as
immutable arrays.

This will make other refactorings easier.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
New in v2

 drivers/mtd/afs.c              | 2 +-
 drivers/mtd/ar7part.c          | 2 +-
 drivers/mtd/bcm47xxpart.c      | 2 +-
 drivers/mtd/bcm63xxpart.c      | 2 +-
 drivers/mtd/cmdlinepart.c      | 2 +-
 drivers/mtd/ofpart.c           | 4 ++--
 drivers/mtd/redboot.c          | 2 +-
 include/linux/mtd/partitions.h | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index e02dae3b739b..d61b7edfc938 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -162,7 +162,7 @@ afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
 }
 
 static int parse_afs_partitions(struct mtd_info *mtd,
-				struct mtd_partition **pparts,
+				const struct mtd_partition **pparts,
 				struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 9203b96fd789..90575deff0ae 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -43,7 +43,7 @@ struct ar7_bin_rec {
 };
 
 static int create_mtd_partitions(struct mtd_info *master,
-				 struct mtd_partition **pparts,
+				 const struct mtd_partition **pparts,
 				 struct mtd_part_parser_data *data)
 {
 	struct ar7_bin_rec header;
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 92a6dd18198b..8282f47bcf5d 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -82,7 +82,7 @@ out_default:
 }
 
 static int bcm47xxpart_parse(struct mtd_info *master,
-			     struct mtd_partition **pparts,
+			     const struct mtd_partition **pparts,
 			     struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index cf02135320bc..440936998593 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -68,7 +68,7 @@ static int bcm63xx_detect_cfe(struct mtd_info *master)
 }
 
 static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
-					struct mtd_partition **pparts,
+					const struct mtd_partition **pparts,
 					struct mtd_part_parser_data *data)
 {
 	/* CFE, NVRAM and global Linux are always present */
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 420489864bc2..fbd5affc0acf 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -304,7 +304,7 @@ static int mtdpart_setup_real(char *s)
  * the first one in the chain if a NULL mtd_id is passed in.
  */
 static int parse_cmdline_partitions(struct mtd_info *master,
-				    struct mtd_partition **pparts,
+				    const struct mtd_partition **pparts,
 				    struct mtd_part_parser_data *data)
 {
 	unsigned long long offset;
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 4800fecaf8cf..8a027a71e662 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -26,7 +26,7 @@ static bool node_has_compatible(struct device_node *pp)
 }
 
 static int parse_ofpart_partitions(struct mtd_info *master,
-				   struct mtd_partition **pparts,
+				   const struct mtd_partition **pparts,
 				   struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
@@ -137,7 +137,7 @@ static struct mtd_part_parser ofpart_parser = {
 };
 
 static int parse_ofoldpart_partitions(struct mtd_info *master,
-				      struct mtd_partition **pparts,
+				      const struct mtd_partition **pparts,
 				      struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 11c3447eb8ff..7623ac5fc586 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -57,7 +57,7 @@ static inline int redboot_checksum(struct fis_image_desc *img)
 }
 
 static int parse_redboot_partitions(struct mtd_info *master,
-				    struct mtd_partition **pparts,
+				    const struct mtd_partition **pparts,
 				    struct mtd_part_parser_data *data)
 {
 	int nrparts = 0;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index d002d9b5d797..6185536daacc 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -69,7 +69,7 @@ struct mtd_part_parser {
 	struct list_head list;
 	struct module *owner;
 	const char *name;
-	int (*parse_fn)(struct mtd_info *, struct mtd_partition **,
+	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
 			struct mtd_part_parser_data *);
 };
 
-- 
2.6.0.rc2.230.g3dd15c0
