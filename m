Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91qw-0001bo-En
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:53:51 +0000
Date: Wed, 18 Jun 2008 19:53:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080618175342.GE10271@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
	<20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
	<20080618175253.GD10271@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080618175253.GD10271@logfs.org>
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH 2/4] [MTD][MTDPART] Handle most checkpatch findings

Remaining are 13 warnings about long lines, 1 about a CVS marker already
removed by Adrian and 1 about braces that could be argued about.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 drivers/mtd/mtdpart.c |  129 +++++++++++++++++++++++++------------------------
 1 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index f0d0430..e759ee6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -46,8 +46,8 @@ struct mtd_part {
  * to the _real_ device.
  */
 
-static int part_read (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
 	int res;
@@ -56,7 +56,7 @@ static int part_read (struct mtd_info *mtd, loff_t from, size_t len,
 		len = 0;
 	else if (from + len > mtd->size)
 		len = mtd->size - from;
-	res = part->master->read (part->master, from + part->offset,
+	res = part->master->read(part->master, from + part->offset,
 				   len, retlen, buf);
 	if (unlikely(res)) {
 		if (res == -EUCLEAN)
@@ -67,8 +67,8 @@ static int part_read (struct mtd_info *mtd, loff_t from, size_t len,
 	return res;
 }
 
-static int part_point (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, void **virt, resource_size_t *phys)
+static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct mtd_part *part = PART(mtd);
 	if (from >= mtd->size)
@@ -87,7 +87,7 @@ static void part_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 }
 
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
-			 struct mtd_oob_ops *ops)
+		struct mtd_oob_ops *ops)
 {
 	struct mtd_part *part = PART(mtd);
 	int res;
@@ -107,38 +107,38 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 	return res;
 }
 
-static int part_read_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+static int part_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->read_user_prot_reg (part->master, from,
+	return part->master->read_user_prot_reg(part->master, from,
 					len, retlen, buf);
 }
 
-static int part_get_user_prot_info (struct mtd_info *mtd,
-				    struct otp_info *buf, size_t len)
+static int part_get_user_prot_info(struct mtd_info *mtd,
+		struct otp_info *buf, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->get_user_prot_info (part->master, buf, len);
+	return part->master->get_user_prot_info(part->master, buf, len);
 }
 
-static int part_read_fact_prot_reg (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+static int part_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->read_fact_prot_reg (part->master, from,
+	return part->master->read_fact_prot_reg(part->master, from,
 					len, retlen, buf);
 }
 
-static int part_get_fact_prot_info (struct mtd_info *mtd,
-				    struct otp_info *buf, size_t len)
+static int part_get_fact_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->get_fact_prot_info (part->master, buf, len);
+	return part->master->get_fact_prot_info(part->master, buf, len);
 }
 
-static int part_write (struct mtd_info *mtd, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -147,12 +147,12 @@ static int part_write (struct mtd_info *mtd, loff_t to, size_t len,
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->write (part->master, to + part->offset,
+	return part->master->write(part->master, to + part->offset,
 				    len, retlen, buf);
 }
 
-static int part_panic_write (struct mtd_info *mtd, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -161,12 +161,12 @@ static int part_panic_write (struct mtd_info *mtd, loff_t to, size_t len,
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->panic_write (part->master, to + part->offset,
+	return part->master->panic_write(part->master, to + part->offset,
 				    len, retlen, buf);
 }
 
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
-			 struct mtd_oob_ops *ops)
+		struct mtd_oob_ops *ops)
 {
 	struct mtd_part *part = PART(mtd);
 
@@ -180,31 +180,32 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
 	return part->master->write_oob(part->master, to + part->offset, ops);
 }
 
-static int part_write_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len,
-			size_t *retlen, u_char *buf)
+static int part_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->write_user_prot_reg (part->master, from,
+	return part->master->write_user_prot_reg(part->master, from,
 					len, retlen, buf);
 }
 
-static int part_lock_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len)
+static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->lock_user_prot_reg (part->master, from, len);
+	return part->master->lock_user_prot_reg(part->master, from, len);
 }
 
-static int part_writev (struct mtd_info *mtd,  const struct kvec *vecs,
-			 unsigned long count, loff_t to, size_t *retlen)
+static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
+		unsigned long count, loff_t to, size_t *retlen)
 {
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	return part->master->writev (part->master, vecs, count,
+	return part->master->writev(part->master, vecs, count,
 					to + part->offset, retlen);
 }
 
-static int part_erase (struct mtd_info *mtd, struct erase_info *instr)
+static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct mtd_part *part = PART(mtd);
 	int ret;
@@ -236,7 +237,7 @@ void mtd_erase_callback(struct erase_info *instr)
 }
 EXPORT_SYMBOL_GPL(mtd_erase_callback);
 
-static int part_lock (struct mtd_info *mtd, loff_t ofs, size_t len)
+static int part_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
@@ -244,7 +245,7 @@ static int part_lock (struct mtd_info *mtd, loff_t ofs, size_t len)
 	return part->master->lock(part->master, ofs + part->offset, len);
 }
 
-static int part_unlock (struct mtd_info *mtd, loff_t ofs, size_t len)
+static int part_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
 {
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
@@ -270,7 +271,7 @@ static void part_resume(struct mtd_info *mtd)
 	part->master->resume(part->master);
 }
 
-static int part_block_isbad (struct mtd_info *mtd, loff_t ofs)
+static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
 	if (ofs >= mtd->size)
@@ -279,7 +280,7 @@ static int part_block_isbad (struct mtd_info *mtd, loff_t ofs)
 	return part->master->block_isbad(part->master, ofs);
 }
 
-static int part_block_markbad (struct mtd_info *mtd, loff_t ofs)
+static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
 	int res;
@@ -312,7 +313,7 @@ int del_mtd_partitions(struct mtd_info *master)
 		if (slave->master == master) {
 			struct list_head *prev = node->prev;
 			__list_del(prev, node->next);
-			if(slave->registered)
+			if (slave->registered)
 				del_mtd_device(&slave->mtd);
 			kfree(slave);
 			node = prev;
@@ -321,6 +322,7 @@ int del_mtd_partitions(struct mtd_info *master)
 
 	return 0;
 }
+EXPORT_SYMBOL(del_mtd_partitions);
 
 static int add_one_partition(struct mtd_info *master,
 		const struct mtd_partition *part, int partno,
@@ -329,9 +331,9 @@ static int add_one_partition(struct mtd_info *master,
 	struct mtd_part *slave;
 
 	/* allocate the partition structure */
-	slave = kzalloc (sizeof(*slave), GFP_KERNEL);
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	if (!slave) {
-		printk("memory allocation error while creating partitions for \"%s\"\n",
+		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
 			master->name);
 		del_mtd_partitions(master);
 		return -ENOMEM;
@@ -356,7 +358,7 @@ static int add_one_partition(struct mtd_info *master,
 	if (master->panic_write)
 		slave->mtd.panic_write = part_panic_write;
 
-	if(master->point && master->unpoint){
+	if (master->point && master->unpoint) {
 		slave->mtd.point = part_point;
 		slave->mtd.unpoint = part_unpoint;
 	}
@@ -365,17 +367,17 @@ static int add_one_partition(struct mtd_info *master,
 		slave->mtd.read_oob = part_read_oob;
 	if (master->write_oob)
 		slave->mtd.write_oob = part_write_oob;
-	if(master->read_user_prot_reg)
+	if (master->read_user_prot_reg)
 		slave->mtd.read_user_prot_reg = part_read_user_prot_reg;
-	if(master->read_fact_prot_reg)
+	if (master->read_fact_prot_reg)
 		slave->mtd.read_fact_prot_reg = part_read_fact_prot_reg;
-	if(master->write_user_prot_reg)
+	if (master->write_user_prot_reg)
 		slave->mtd.write_user_prot_reg = part_write_user_prot_reg;
-	if(master->lock_user_prot_reg)
+	if (master->lock_user_prot_reg)
 		slave->mtd.lock_user_prot_reg = part_lock_user_prot_reg;
-	if(master->get_user_prot_info)
+	if (master->get_user_prot_info)
 		slave->mtd.get_user_prot_info = part_get_user_prot_info;
-	if(master->get_fact_prot_info)
+	if (master->get_fact_prot_info)
 		slave->mtd.get_fact_prot_info = part_get_fact_prot_info;
 	if (master->sync)
 		slave->mtd.sync = part_sync;
@@ -413,7 +415,7 @@ static int add_one_partition(struct mtd_info *master,
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
 		slave->mtd.size = master->size - slave->offset;
 
-	printk (KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
+	printk(KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
 		slave->offset + slave->mtd.size, slave->mtd.name);
 
 	/* let's do some sanity checks */
@@ -421,21 +423,21 @@ static int add_one_partition(struct mtd_info *master,
 			/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
-		printk ("mtd: partition \"%s\" is out of reach -- disabled\n",
+		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
 	}
 	if (slave->offset + slave->mtd.size > master->size) {
 		slave->mtd.size = master->size - slave->offset;
-		printk ("mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
+		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
 			part->name, master->name, slave->mtd.size);
 	}
-	if (master->numeraseregions>1) {
+	if (master->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
 		int i;
 		struct mtd_erase_region_info *regions = master->eraseregions;
 
 		/* Find the first erase regions which is part of this partition. */
-		for (i=0; i < master->numeraseregions && regions[i].offset <= slave->offset; i++)
+		for (i = 0; i < master->numeraseregions && regions[i].offset <= slave->offset; i++)
 			;
 
 		for (i--; i < master->numeraseregions && regions[i].offset < slave->offset + slave->mtd.size; i++) {
@@ -451,15 +453,16 @@ static int add_one_partition(struct mtd_info *master,
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
 	    (slave->offset % slave->mtd.erasesize)) {
 		/* Doesn't start on a boundary of major erase size */
-		/* FIXME: Let it be writable if it is on a boundary of _minor_ erase size though */
+		/* FIXME: Let it be writable if it is on a boundary of
+		 * _minor_ erase size though */
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk ("mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
 			part->name);
 	}
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
 	    (slave->mtd.size % slave->mtd.erasesize)) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk ("mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
 			part->name);
 	}
 
@@ -467,7 +470,7 @@ static int add_one_partition(struct mtd_info *master,
 	if (master->block_isbad) {
 		uint32_t offs = 0;
 
-		while(offs < slave->mtd.size) {
+		while (offs < slave->mtd.size) {
 			if (master->block_isbad(master,
 						offs + slave->offset))
 				slave->mtd.ecc_stats.badblocks++;
@@ -475,7 +478,8 @@ static int add_one_partition(struct mtd_info *master,
 		}
 	}
 
-	if(part->mtdp) {	/* store the object pointer (caller may or may not register it */
+	if (part->mtdp) {
+		/* store the object pointer (caller may or may not register it*/
 		*part->mtdp = &slave->mtd;
 		slave->registered = 0;
 	} else {
@@ -501,7 +505,7 @@ int add_mtd_partitions(struct mtd_info *master,
 	u_int32_t cur_offset = 0;
 	int i, err;
 
-	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
 		err = add_one_partition(master, parts + i, i, cur_offset);
@@ -513,9 +517,7 @@ int add_mtd_partitions(struct mtd_info *master,
 
 	return 0;
 }
-
 EXPORT_SYMBOL(add_mtd_partitions);
-EXPORT_SYMBOL(del_mtd_partitions);
 
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
@@ -547,6 +549,7 @@ int register_mtd_parser(struct mtd_part_parser *p)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(register_mtd_parser);
 
 int deregister_mtd_parser(struct mtd_part_parser *p)
 {
@@ -555,6 +558,7 @@ int deregister_mtd_parser(struct mtd_part_parser *p)
 	spin_unlock(&part_parser_lock);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
 int parse_mtd_partitions(struct mtd_info *master, const char **types,
 			 struct mtd_partition **pparts, unsigned long origin)
@@ -582,7 +586,4 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 	}
 	return ret;
 }
-
 EXPORT_SYMBOL_GPL(parse_mtd_partitions);
-EXPORT_SYMBOL_GPL(register_mtd_parser);
-EXPORT_SYMBOL_GPL(deregister_mtd_parser);
-- 
1.5.3.5
