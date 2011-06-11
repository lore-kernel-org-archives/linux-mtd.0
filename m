Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXLY-00010P-Sa
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:06 +0000
Received: by ewy3 with SMTP id 3so1527784ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:02 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/18] mtd: abstract last MTD partition parser argument
Date: Sun, 12 Jun 2011 03:11:45 +0400
Message-Id: <1307833922-21602-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Encapsulate last MTD partition parser argument into a separate
structure. Currently it holds only 'origin' field for RedBoot parser,
but will be extended in future to contain at least device_node for OF
devices.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/cmdlinepart.c      |    2 +-
 drivers/mtd/mtdcore.c          |    6 +++---
 drivers/mtd/mtdpart.c          |    7 ++++---
 drivers/mtd/redboot.c          |    6 +++---
 include/linux/mtd/mtd.h        |    3 ++-
 include/linux/mtd/partitions.h |   14 ++++++++++++--
 6 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index be0c121..80851c6 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -314,7 +314,7 @@ static int mtdpart_setup_real(char *s)
  */
 static int parse_cmdline_partitions(struct mtd_info *master,
                              struct mtd_partition **pparts,
-                             unsigned long origin)
+                             struct mtd_part_parser_data *data)
 {
 	unsigned long offset;
 	int i;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1326747..a4067e7 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -457,7 +457,7 @@ EXPORT_SYMBOL_GPL(mtd_device_register);
  * @mtd: the MTD device to register
  * @types: the list of MTD partition probes to try, see
  *         'parse_mtd_partitions()' for more information
- * @origin: start address of MTD device, %0 unless you are sure you need this.
+ * @parser_data: data passed to mtd parsers
  * @parts: fallback partition information to register, if parsing fails;
  *         only valid if %nr_parts > %0
  * @nr_parts: the number of partitions in parts, if zero then the full
@@ -480,14 +480,14 @@ EXPORT_SYMBOL_GPL(mtd_device_register);
  * Returns zero in case of success and a negative error code in case of failure.
  */
 int mtd_device_parse_register(struct mtd_info *mtd, const char **types,
-			      unsigned long origin,
+			      struct mtd_part_parser_data *parser_data,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
 	int err;
 	struct mtd_partition *real_parts;
 
-	err = parse_mtd_partitions(mtd, types, &real_parts, origin);
+	err = parse_mtd_partitions(mtd, types, &real_parts, parser_data);
 	if (err <= 0 && nr_parts) {
 		real_parts = kmemdup(parts, sizeof(*parts) * nr_parts,
 				     GFP_KERNEL);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2b71ccb..09ebe69 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -736,7 +736,7 @@ static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
  * @master: the master partition (describes whole MTD device)
  * @types: names of partition parsers to try or %NULL
  * @pparts: array of partitions found is returned here
- * @origin: MTD device start address (use %0 if unsure)
+ * @data: data passed to MTD partition parsers
  *
  * This function tries to find partition on MTD device @master. It uses MTD
  * partition parsers, specified in @types. However, if @types is %NULL, then
@@ -750,7 +750,8 @@ static const char *default_mtd_part_types[] = {"cmdlinepart", NULL};
  *   point to an array containing this number of &struct mtd_info objects.
  */
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
-			 struct mtd_partition **pparts, unsigned long origin)
+			 struct mtd_partition **pparts,
+			 struct mtd_part_parser_data *data)
 {
 	struct mtd_part_parser *parser;
 	int ret = 0;
@@ -764,7 +765,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 				parser = get_partition_parser(*types);
 		if (!parser)
 			continue;
-		ret = (*parser->parse_fn)(master, pparts, origin);
+		ret = (*parser->parse_fn)(master, pparts, data);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
index 7a87d07..2b65558 100644
--- a/drivers/mtd/redboot.c
+++ b/drivers/mtd/redboot.c
@@ -57,7 +57,7 @@ static inline int redboot_checksum(struct fis_image_desc *img)
 
 static int parse_redboot_partitions(struct mtd_info *master,
                              struct mtd_partition **pparts,
-                             unsigned long fis_origin)
+                             struct mtd_part_parser_data *data)
 {
 	int nrparts = 0;
 	struct fis_image_desc *buf;
@@ -197,8 +197,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 			goto out;
 		}
 		new_fl->img = &buf[i];
-                if (fis_origin) {
-                        buf[i].flash_base -= fis_origin;
+                if (data && data->origin) {
+                        buf[i].flash_base -= data->origin;
                 } else {
                         buf[i].flash_base &= master->size-1;
                 }
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d28a241..b2b454b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -323,13 +323,14 @@ static inline uint32_t mtd_mod_by_ws(uint64_t sz, struct mtd_info *mtd)
 	/* Kernel-side ioctl definitions */
 
 struct mtd_partition;
+struct mtd_part_parser_data;
 
 extern int mtd_device_register(struct mtd_info *master,
 			       const struct mtd_partition *parts,
 			       int nr_parts);
 extern int mtd_device_parse_register(struct mtd_info *mtd,
 			      const char **part_probe_types,
-			      unsigned long origin,
+			      struct mtd_part_parser_data *parser_data,
 			      const struct mtd_partition *defparts,
 			      int defnr_parts);
 extern int mtd_device_unregister(struct mtd_info *master);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 1431cf2..4e91abf 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -52,6 +52,15 @@ struct mtd_partition {
 
 struct mtd_info;
 
+/**
+ * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
+ * @origin: for RedBoot, start address of MTD device, %0 unless you are sure you need this.
+ */
+struct mtd_part_parser_data {
+	unsigned long origin;
+};
+
+
 /*
  * Functions dealing with the various ways of partitioning the space
  */
@@ -60,13 +69,14 @@ struct mtd_part_parser {
 	struct list_head list;
 	struct module *owner;
 	const char *name;
-	int (*parse_fn)(struct mtd_info *, struct mtd_partition **, unsigned long);
+	int (*parse_fn)(struct mtd_info *, struct mtd_partition **, struct mtd_part_parser_data *);
 };
 
 extern int register_mtd_parser(struct mtd_part_parser *parser);
 extern int deregister_mtd_parser(struct mtd_part_parser *parser);
 extern int parse_mtd_partitions(struct mtd_info *master, const char **types,
-				struct mtd_partition **pparts, unsigned long origin);
+				struct mtd_partition **pparts,
+				struct mtd_part_parser_data *data);
 
 #define put_partition_parser(p) do { module_put((p)->owner); } while(0)
 
-- 
1.7.5.3
