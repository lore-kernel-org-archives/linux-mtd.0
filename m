Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg9kE-0004hm-QO
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 12:40:40 +0000
Received: by mail-lf0-x241.google.com with SMTP id z127so9022804lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 04:40:17 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] mtd: add support for partition parsers
Date: Tue, 21 Feb 2017 13:40:01 +0100
Message-Id: <20170221124002.585-1-zajec5@gmail.com>
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

Some devices have partitions that are kind of containers with extra
subpartitions / volumes instead of e.g. simple filesystem data. To
support such cases we need to first create normal flash partitions and
then take care of these special ones.

It's very common case for home routers. Depending on the vendor there
are formats like TRX, Seama, uImage, WRGG and more. All of them are used
to embed few partitions into a single one / single firmware file.

Ideally all vendors would use some well documented / standardized format
like UBI (and some probably start doing so), but there are still
countless devices on the market using these poor vendor specific
formats.

This patch extends MTD subsystem by allowing to specify partition format
and trying to use a proper parser when needed. Supporting such poor
formats is highly unlikely to be the top priority so these changes try
to minimize maintenance cost to the minimum. It reuses existing code for
these new parsers and just adds a one property and one new function.

This implementation requires setting partition format in a flash parser.
A proper change of bcm47xxpart will follow and in the future we will
hopefully also find a solution for doing it with ofpart
("fixed-partitions").

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: A totally rebased & refreshed version.
---
 drivers/mtd/mtdpart.c          | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |  7 +++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ea5e5307f667..9a40c3ea384b 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -363,6 +363,42 @@ static inline void free_partition(struct mtd_part *p)
 	kfree(p);
 }
 
+/**
+ * mtd_parse_part - parse MTD partition with a matching parser
+ *
+ * Some partitions use a specific format to describe contained subpartitions
+ * (volumes). This function tries to use a proper parser for a given format and
+ * registers found (sub)partitions.
+ */
+static int mtd_parse_part(struct mtd_part *slave, const char *format)
+{
+	struct mtd_partitions parsed;
+	const char *probes[2];
+	int i;
+	int err;
+
+	probes[0] = format; /* Use parser with name matching the format */
+	probes[1] = NULL; /* End of parsers */
+	err = parse_mtd_partitions(&slave->mtd, probes, &parsed, NULL);
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
+
+	err = add_mtd_partitions(slave->master, parsed.parts, parsed.nr_parts);
+
+	mtd_part_parser_cleanup(&parsed);
+
+	return err;
+}
+
 /*
  * This function unregisters and destroy all slave MTD objects which are
  * attached to the given master MTD object.
@@ -724,6 +760,8 @@ int add_mtd_partitions(struct mtd_info *master,
 
 		add_mtd_device(&slave->mtd);
 		mtd_add_partition_attrs(slave);
+		if (parts[i].format)
+			mtd_parse_part(slave, parts[i].format);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 06df1e06b6e0..2787e76c030f 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -20,6 +20,12 @@
  *
  * For each partition, these fields are available:
  * name: string that will be used to label the partition's MTD device.
+ * format: some partitions can be containers using specific format to describe
+ *	embedded subpartitions / volumes. E.g. many home routers use "firmware"
+ *	partition that contains at least kernel and rootfs. In such case an
+ *	extra parser is needed that will detect these dynamic partitions and
+ *	report them to the MTD subsystem. This property describes partition
+ *	format and allows MTD core to call a proper parser.
  * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
  * 	will extend to the end of the master MTD device.
  * offset: absolute starting position within the master MTD device; if
@@ -38,6 +44,7 @@
 
 struct mtd_partition {
 	const char *name;		/* identifier string */
+	const char *format;		/* partition format */
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
-- 
2.11.0
