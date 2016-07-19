Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPbzO-0004oS-Cz
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 20:51:39 +0000
Received: by mail-lf0-x242.google.com with SMTP id l89so2212522lfi.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 13:51:17 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] mtd: add support for partition parsers
Date: Tue, 19 Jul 2016 22:51:01 +0200
Message-Id: <1468961462-18082-1-git-send-email-zajec5@gmail.com>
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

This extends MTD subsystem by adding a support for partition parsers
that should be used for creating subpartitions. There are some types of
partitions that require splitting, like firmware containers.
It's common some home routers that a single firmware image gets flashed
to predefined partition and then we need to parse it dynamically.

The reason for having such parsers is to share code. Right now we have
e.g. TRX parsing implemented in bcm47xxpart but this could be used in
more cases (e.g. on ramips which doesn't use bcm47xxpart or with DT).

This implementation requires marking partition as requiring parsing with
a specific parser. This can be used right away with some parsers like
bcm47xxpart, in future we will hopefully also find a solution for doing
it with ofpart ("fixed-partitions").

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
One thing I'm not proud of in this patch is struct mtd_partition casting
in order to be able to modify partition offset. It's marked as const so
it was the only way I could think of. Any better ideas? Currently parser
gets a single MTD and it doesn't have to deal with its offset, which I
kind of like as it simplifies things.
---
 drivers/mtd/mtdpart.c          | 34 +++++++++++++++++++++++++++++++++-
 include/linux/mtd/partitions.h |  5 +++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1f13e32..0203e21 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -663,6 +663,34 @@ int mtd_del_partition(struct mtd_info *master, int partno)
 }
 EXPORT_SYMBOL_GPL(mtd_del_partition);
 
+static int mtd_parse_part(struct mtd_part *slave, const char *parser)
+{
+	static const char *probes[2] = { NULL, NULL };
+	struct mtd_partitions parsed = { 0 };
+	int i;
+	int err;
+
+	probes[0] = parser;
+	err = parse_mtd_partitions(&slave->mtd, probes, &parsed, NULL);
+
+	if (err)
+		return err;
+	else if (!parsed.nr_parts)
+		return -ENOENT;
+
+	for (i = 0; i < parsed.nr_parts; i++) {
+		struct mtd_partition *part;
+
+		part = (struct mtd_partition *)&parsed.parts[i];
+		part->offset += slave->offset;
+	}
+	err = add_mtd_partitions(slave->master, parsed.parts, parsed.nr_parts);
+
+	if (parsed.parser)
+		kfree(parsed.parts);
+	return err;
+}
+
 /*
  * This function, given a master MTD object and a partition table, creates
  * and registers slave MTD objects which are bound to the master according to
@@ -683,7 +711,9 @@ int add_mtd_partitions(struct mtd_info *master,
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
-		slave = allocate_partition(master, parts + i, i, cur_offset);
+		const struct mtd_partition *part = parts + i;
+
+		slave = allocate_partition(master, part, i, cur_offset);
 		if (IS_ERR(slave)) {
 			del_mtd_partitions(master);
 			return PTR_ERR(slave);
@@ -695,6 +725,8 @@ int add_mtd_partitions(struct mtd_info *master,
 
 		add_mtd_device(&slave->mtd);
 		mtd_add_partition_attrs(slave);
+		if (part->parser)
+			mtd_parse_part(slave, part->parser);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 70736e1..c6da77f9 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -20,6 +20,10 @@
  *
  * For each partition, these fields are available:
  * name: string that will be used to label the partition's MTD device.
+ * parser: some partitions may require specific handling like splitting them
+ *	into subpartitions (e.g. firmware partition may contain partitions
+ *	table, kernel image and rootfs). This field may contain a name of parser
+ *	than can handle specific type.
  * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
  * 	will extend to the end of the master MTD device.
  * offset: absolute starting position within the master MTD device; if
@@ -38,6 +42,7 @@
 
 struct mtd_partition {
 	const char *name;		/* identifier string */
+	const char *parser;		/* parser name */
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
-- 
1.8.4.5
