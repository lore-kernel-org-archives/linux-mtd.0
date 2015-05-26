Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yx7GT-0005M8-9U
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 05:18:59 +0000
Received: by lami4 with SMTP id i4so59816756lam.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 May 2015 22:18:34 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH V2 1/1] mtd: add support for typed parsers splitting partitions
Date: Tue, 26 May 2015 07:18:24 +0200
Message-Id: <1432617504-17649-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
References: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Gabor Juhos <juhosg@openwrt.org>, Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This extends MTD architecture by introducing partition types which allow
handling selected (marked) partitions in a specific way. There are some
types of partitions that require splitting, e.g. firmware containers.
On some devices we want to have "firmware" container partition (for easy
firmware upgrade) as well as subpartitions (e.g. to use rootfs).

Thanks to this change we will also avoid code duplication across various
drivers/architectures. It will allow multiple drivers to use the same
parser just by setting a proper type.

An example use case for this can be TRX firmware format parser. This
format contains 2-4 partitions including kernel and rootfs. It is used
by many Broadcom devices on various platforms (bcm47xx, bcm53xx, ath79).

When partition with a specified type is created we loop over registered
parsers running ones with a matching type. When one returns list of new
partitions we create them.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
---
V2: Add missing "static" for mtd_parse_typed_partitions
---
 drivers/mtd/mtdpart.c          | 74 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/partitions.h |  7 ++++
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..020c6b7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -52,6 +52,8 @@ struct mtd_part {
  */
 #define PART(x)  ((struct mtd_part *)(x))
 
+static int mtd_parse_typed_part(struct mtd_part *slave,
+				enum mtd_partition_type type);
 
 /*
  * MTD methods which simply translate the effective address and pass through
@@ -663,7 +665,9 @@ int add_mtd_partitions(struct mtd_info *master,
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
-		slave = allocate_partition(master, parts + i, i, cur_offset);
+		const struct mtd_partition *part = parts + i;
+
+		slave = allocate_partition(master, part, i, cur_offset);
 		if (IS_ERR(slave))
 			return PTR_ERR(slave);
 
@@ -673,6 +677,8 @@ int add_mtd_partitions(struct mtd_info *master,
 
 		add_mtd_device(&slave->mtd);
 		mtd_add_partition_attrs(slave);
+		if (part->type)
+			mtd_parse_typed_part(slave, part->type);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
@@ -775,6 +781,72 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 	return ret;
 }
 
+static int mtd_parse_typed_partitions(struct mtd_info *slave,
+				      enum mtd_partition_type type,
+				      struct mtd_partition **pparts,
+				      struct mtd_part_parser_data *data)
+{
+	struct mtd_part_parser *p = NULL;
+	bool found;
+	int ret = 0;
+
+	while (1) {
+		found = false;
+
+		spin_lock(&part_parser_lock);
+		p = list_prepare_entry(p, &part_parsers, list);
+		list_for_each_entry_continue(p, &part_parsers, list) {
+			if (p->type == type && try_module_get(p->owner)) {
+				found = true;
+				break;
+			}
+		}
+		spin_unlock(&part_parser_lock);
+
+		if (!found)
+			break;
+
+		ret = (*p->parse_fn)(slave, pparts, data);
+		if (ret > 0) {
+			put_partition_parser(p);
+			pr_notice("%d %s partitions found on MTD device %s\n",
+				  ret, p->name, slave->name);
+			break;
+		}
+
+		put_partition_parser(p);
+	}
+
+	return ret;
+}
+
+static int mtd_parse_typed_part(struct mtd_part *slave,
+				enum mtd_partition_type type)
+{
+	struct mtd_partition *parts;
+	int nr_parts;
+	int i;
+
+	nr_parts = mtd_parse_typed_partitions(&slave->mtd, type, &parts, NULL);
+	if (nr_parts <= 0)
+		return nr_parts;
+
+	if (WARN_ON(!parts))
+		return 0;
+
+	for (i = 0; i < nr_parts; i++) {
+		/* adjust partition offsets */
+		parts[i].offset += slave->offset;
+
+		mtd_add_partition(slave->master, parts[i].name, parts[i].offset,
+				  parts[i].size);
+	}
+
+	kfree(parts);
+
+	return nr_parts;
+}
+
 int mtd_is_partition(const struct mtd_info *mtd)
 {
 	struct mtd_part *part;
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 6a35e6d..4d2432a 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -11,6 +11,9 @@
 
 #include <linux/types.h>
 
+enum mtd_partition_type {
+	MTD_PARTITION_TYPE_GENERIC = 0,
+};
 
 /*
  * Partition definition structure:
@@ -20,6 +23,8 @@
  *
  * For each partition, these fields are available:
  * name: string that will be used to label the partition's MTD device.
+ * type: some partitions may require specific handling like splitting them into
+ *	into subpartitions (e.g. firmware which may contain kernel and rootfs)
  * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
  * 	will extend to the end of the master MTD device.
  * offset: absolute starting position within the master MTD device; if
@@ -38,6 +43,7 @@
 
 struct mtd_partition {
 	const char *name;		/* identifier string */
+	enum mtd_partition_type type;	/* partition type */
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
@@ -72,6 +78,7 @@ struct mtd_part_parser {
 	struct list_head list;
 	struct module *owner;
 	const char *name;
+	enum mtd_partition_type type;
 	int (*parse_fn)(struct mtd_info *, struct mtd_partition **,
 			struct mtd_part_parser_data *);
 };
-- 
1.8.4.5
