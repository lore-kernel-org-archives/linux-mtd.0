Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJsLl-0002QN-TM
	for linux-mtd@lists.infradead.org; Fri, 18 Jul 2008 15:58:31 +0000
Date: Sat, 19 Jul 2008 01:00:18 +0900 (JST)
Message-Id: <20080719.010018.03978420.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: [PATCH 1/5] [MTD][MTDPART] Seperate main loop from per-partition
	code in add_mtd_partition
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add_mtd_partition was a 150+ line monster consisting mostly of a single
loop.  Seperate the loop from most of the body.  Now it should be
obvious which variables are carried around from iteration to iteration.

Signed-off-by: Joern Engel <joern@logfs.org>
Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is a patch against mtd-2.6 tree.

 drivers/mtd/mtdpart.c |  324 +++++++++++++++++++++++++------------------------
 1 files changed, 166 insertions(+), 158 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 56a760a..45c6f32 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -313,6 +313,170 @@ int del_mtd_partitions(struct mtd_info *master)
 	return 0;
 }
 
+static struct mtd_part *add_one_partition(struct mtd_info *master,
+		const struct mtd_partition *part, int partno,
+		u_int32_t cur_offset)
+{
+	struct mtd_part *slave;
+
+	/* allocate the partition structure */
+	slave = kzalloc (sizeof(*slave), GFP_KERNEL);
+	if (!slave) {
+		printk("memory allocation error while creating partitions for \"%s\"\n",
+			master->name);
+		del_mtd_partitions(master);
+		return NULL;
+	}
+	list_add(&slave->list, &mtd_partitions);
+
+	/* set up the MTD object for this partition */
+	slave->mtd.type = master->type;
+	slave->mtd.flags = master->flags & ~part->mask_flags;
+	slave->mtd.size = part->size;
+	slave->mtd.writesize = master->writesize;
+	slave->mtd.oobsize = master->oobsize;
+	slave->mtd.oobavail = master->oobavail;
+	slave->mtd.subpage_sft = master->subpage_sft;
+
+	slave->mtd.name = part->name;
+	slave->mtd.owner = master->owner;
+
+	slave->mtd.read = part_read;
+	slave->mtd.write = part_write;
+
+	if (master->panic_write)
+		slave->mtd.panic_write = part_panic_write;
+
+	if(master->point && master->unpoint){
+		slave->mtd.point = part_point;
+		slave->mtd.unpoint = part_unpoint;
+	}
+
+	if (master->read_oob)
+		slave->mtd.read_oob = part_read_oob;
+	if (master->write_oob)
+		slave->mtd.write_oob = part_write_oob;
+	if(master->read_user_prot_reg)
+		slave->mtd.read_user_prot_reg = part_read_user_prot_reg;
+	if(master->read_fact_prot_reg)
+		slave->mtd.read_fact_prot_reg = part_read_fact_prot_reg;
+	if(master->write_user_prot_reg)
+		slave->mtd.write_user_prot_reg = part_write_user_prot_reg;
+	if(master->lock_user_prot_reg)
+		slave->mtd.lock_user_prot_reg = part_lock_user_prot_reg;
+	if(master->get_user_prot_info)
+		slave->mtd.get_user_prot_info = part_get_user_prot_info;
+	if(master->get_fact_prot_info)
+		slave->mtd.get_fact_prot_info = part_get_fact_prot_info;
+	if (master->sync)
+		slave->mtd.sync = part_sync;
+	if (!partno && master->suspend && master->resume) {
+			slave->mtd.suspend = part_suspend;
+			slave->mtd.resume = part_resume;
+	}
+	if (master->writev)
+		slave->mtd.writev = part_writev;
+	if (master->lock)
+		slave->mtd.lock = part_lock;
+	if (master->unlock)
+		slave->mtd.unlock = part_unlock;
+	if (master->block_isbad)
+		slave->mtd.block_isbad = part_block_isbad;
+	if (master->block_markbad)
+		slave->mtd.block_markbad = part_block_markbad;
+	slave->mtd.erase = part_erase;
+	slave->master = master;
+	slave->offset = part->offset;
+	slave->index = partno;
+
+	if (slave->offset == MTDPART_OFS_APPEND)
+		slave->offset = cur_offset;
+	if (slave->offset == MTDPART_OFS_NXTBLK) {
+		slave->offset = cur_offset;
+		if ((cur_offset % master->erasesize) != 0) {
+			/* Round up to next erasesize */
+			slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
+			printk(KERN_NOTICE "Moving partition %d: "
+			       "0x%08x -> 0x%08x\n", partno,
+			       cur_offset, slave->offset);
+		}
+	}
+	if (slave->mtd.size == MTDPART_SIZ_FULL)
+		slave->mtd.size = master->size - slave->offset;
+
+	printk (KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
+		slave->offset + slave->mtd.size, slave->mtd.name);
+
+	/* let's do some sanity checks */
+	if (slave->offset >= master->size) {
+			/* let's register it anyway to preserve ordering */
+		slave->offset = 0;
+		slave->mtd.size = 0;
+		printk ("mtd: partition \"%s\" is out of reach -- disabled\n",
+			part->name);
+	}
+	if (slave->offset + slave->mtd.size > master->size) {
+		slave->mtd.size = master->size - slave->offset;
+		printk ("mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
+			part->name, master->name, slave->mtd.size);
+	}
+	if (master->numeraseregions>1) {
+		/* Deal with variable erase size stuff */
+		int i;
+		struct mtd_erase_region_info *regions = master->eraseregions;
+
+		/* Find the first erase regions which is part of this partition. */
+		for (i=0; i < master->numeraseregions && regions[i].offset <= slave->offset; i++)
+			;
+
+		for (i--; i < master->numeraseregions && regions[i].offset < slave->offset + slave->mtd.size; i++) {
+			if (slave->mtd.erasesize < regions[i].erasesize) {
+				slave->mtd.erasesize = regions[i].erasesize;
+			}
+		}
+	} else {
+		/* Single erase size */
+		slave->mtd.erasesize = master->erasesize;
+	}
+
+	if ((slave->mtd.flags & MTD_WRITEABLE) &&
+	    (slave->offset % slave->mtd.erasesize)) {
+		/* Doesn't start on a boundary of major erase size */
+		/* FIXME: Let it be writable if it is on a boundary of _minor_ erase size though */
+		slave->mtd.flags &= ~MTD_WRITEABLE;
+		printk ("mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+			part->name);
+	}
+	if ((slave->mtd.flags & MTD_WRITEABLE) &&
+	    (slave->mtd.size % slave->mtd.erasesize)) {
+		slave->mtd.flags &= ~MTD_WRITEABLE;
+		printk ("mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+			part->name);
+	}
+
+	slave->mtd.ecclayout = master->ecclayout;
+	if (master->block_isbad) {
+		uint32_t offs = 0;
+
+		while(offs < slave->mtd.size) {
+			if (master->block_isbad(master,
+						offs + slave->offset))
+				slave->mtd.ecc_stats.badblocks++;
+			offs += slave->mtd.erasesize;
+		}
+	}
+
+	if(part->mtdp) {	/* store the object pointer (caller may or may not register it */
+		*part->mtdp = &slave->mtd;
+		slave->registered = 0;
+	} else {
+		/* register our partition */
+		add_mtd_device(&slave->mtd);
+		slave->registered = 1;
+	}
+	return slave;
+}
+
 /*
  * This function, given a master MTD object and a partition table, creates
  * and registers slave MTD objects which are bound to the master according to
@@ -331,166 +495,10 @@ int add_mtd_partitions(struct mtd_info *master,
 	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
-
-		/* allocate the partition structure */
-		slave = kzalloc (sizeof(*slave), GFP_KERNEL);
-		if (!slave) {
-			printk ("memory allocation error while creating partitions for \"%s\"\n",
-				master->name);
-			del_mtd_partitions(master);
+		slave = add_one_partition(master, parts + i, i, cur_offset);
+		if (!slave)
 			return -ENOMEM;
-		}
-		list_add(&slave->list, &mtd_partitions);
-
-		/* set up the MTD object for this partition */
-		slave->mtd.type = master->type;
-		slave->mtd.flags = master->flags & ~parts[i].mask_flags;
-		slave->mtd.size = parts[i].size;
-		slave->mtd.writesize = master->writesize;
-		slave->mtd.oobsize = master->oobsize;
-		slave->mtd.oobavail = master->oobavail;
-		slave->mtd.subpage_sft = master->subpage_sft;
-
-		slave->mtd.name = parts[i].name;
-		slave->mtd.owner = master->owner;
-
-		slave->mtd.read = part_read;
-		slave->mtd.write = part_write;
-
-		if (master->panic_write)
-			slave->mtd.panic_write = part_panic_write;
-
-		if(master->point && master->unpoint){
-			slave->mtd.point = part_point;
-			slave->mtd.unpoint = part_unpoint;
-		}
-
-		if (master->read_oob)
-			slave->mtd.read_oob = part_read_oob;
-		if (master->write_oob)
-			slave->mtd.write_oob = part_write_oob;
-		if(master->read_user_prot_reg)
-			slave->mtd.read_user_prot_reg = part_read_user_prot_reg;
-		if(master->read_fact_prot_reg)
-			slave->mtd.read_fact_prot_reg = part_read_fact_prot_reg;
-		if(master->write_user_prot_reg)
-			slave->mtd.write_user_prot_reg = part_write_user_prot_reg;
-		if(master->lock_user_prot_reg)
-			slave->mtd.lock_user_prot_reg = part_lock_user_prot_reg;
-		if(master->get_user_prot_info)
-			slave->mtd.get_user_prot_info = part_get_user_prot_info;
-		if(master->get_fact_prot_info)
-			slave->mtd.get_fact_prot_info = part_get_fact_prot_info;
-		if (master->sync)
-			slave->mtd.sync = part_sync;
-		if (!i && master->suspend && master->resume) {
-				slave->mtd.suspend = part_suspend;
-				slave->mtd.resume = part_resume;
-		}
-		if (master->writev)
-			slave->mtd.writev = part_writev;
-		if (master->lock)
-			slave->mtd.lock = part_lock;
-		if (master->unlock)
-			slave->mtd.unlock = part_unlock;
-		if (master->block_isbad)
-			slave->mtd.block_isbad = part_block_isbad;
-		if (master->block_markbad)
-			slave->mtd.block_markbad = part_block_markbad;
-		slave->mtd.erase = part_erase;
-		slave->master = master;
-		slave->offset = parts[i].offset;
-		slave->index = i;
-
-		if (slave->offset == MTDPART_OFS_APPEND)
-			slave->offset = cur_offset;
-		if (slave->offset == MTDPART_OFS_NXTBLK) {
-			slave->offset = cur_offset;
-			if ((cur_offset % master->erasesize) != 0) {
-				/* Round up to next erasesize */
-				slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
-				printk(KERN_NOTICE "Moving partition %d: "
-				       "0x%08x -> 0x%08x\n", i,
-				       cur_offset, slave->offset);
-			}
-		}
-		if (slave->mtd.size == MTDPART_SIZ_FULL)
-			slave->mtd.size = master->size - slave->offset;
 		cur_offset = slave->offset + slave->mtd.size;
-
-		printk (KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
-			slave->offset + slave->mtd.size, slave->mtd.name);
-
-		/* let's do some sanity checks */
-		if (slave->offset >= master->size) {
-				/* let's register it anyway to preserve ordering */
-			slave->offset = 0;
-			slave->mtd.size = 0;
-			printk ("mtd: partition \"%s\" is out of reach -- disabled\n",
-				parts[i].name);
-		}
-		if (slave->offset + slave->mtd.size > master->size) {
-			slave->mtd.size = master->size - slave->offset;
-			printk ("mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
-				parts[i].name, master->name, slave->mtd.size);
-		}
-		if (master->numeraseregions>1) {
-			/* Deal with variable erase size stuff */
-			int i;
-			struct mtd_erase_region_info *regions = master->eraseregions;
-
-			/* Find the first erase regions which is part of this partition. */
-			for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
-				;
-
-			for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
-				if (slave->mtd.erasesize < regions[i].erasesize) {
-					slave->mtd.erasesize = regions[i].erasesize;
-				}
-			}
-		} else {
-			/* Single erase size */
-			slave->mtd.erasesize = master->erasesize;
-		}
-
-		if ((slave->mtd.flags & MTD_WRITEABLE) &&
-		    (slave->offset % slave->mtd.erasesize)) {
-			/* Doesn't start on a boundary of major erase size */
-			/* FIXME: Let it be writable if it is on a boundary of _minor_ erase size though */
-			slave->mtd.flags &= ~MTD_WRITEABLE;
-			printk ("mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
-				parts[i].name);
-		}
-		if ((slave->mtd.flags & MTD_WRITEABLE) &&
-		    (slave->mtd.size % slave->mtd.erasesize)) {
-			slave->mtd.flags &= ~MTD_WRITEABLE;
-			printk ("mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
-				parts[i].name);
-		}
-
-		slave->mtd.ecclayout = master->ecclayout;
-		if (master->block_isbad) {
-			uint32_t offs = 0;
-
-			while(offs < slave->mtd.size) {
-				if (master->block_isbad(master,
-							offs + slave->offset))
-					slave->mtd.ecc_stats.badblocks++;
-				offs += slave->mtd.erasesize;
-			}
-		}
-
-		if(parts[i].mtdp)
-		{	/* store the object pointer (caller may or may not register it */
-			*parts[i].mtdp = &slave->mtd;
-			slave->registered = 0;
-		}
-		else
-		{
-			/* register our partition */
-			add_mtd_device(&slave->mtd);
-			slave->registered = 1;
-		}
 	}
 
 	return 0;
