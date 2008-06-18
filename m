Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91q9-0001Yn-Hx
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:53:02 +0000
Date: Wed, 18 Jun 2008 19:52:53 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080618175253.GD10271@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
	<20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080618174034.GA10271@logfs.org>
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

On Wed, 18 June 2008 19:40:34 +0200, Jörn Engel wrote:
> On Wed, 18 June 2008 11:19:07 +0900, Atsushi Nemoto wrote:
> 
> > Putting 'goto somewhere' or 'slave->mtd.erasesize = master->erasesize'
> > in the above 'if' block can be an alternative fix.
> 
> That seems a better idea.

I've had a quick go at it.  Three cleanup patches first, then the goto.
Patches have been compile-tested, but not more.  Would these work?

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000

[PATCH 1/4] [MTD][MTDPART] Seperate main loop from per-partition code in add_mtd_partition

add_mtd_partition was a 150+ line monster consisting mostly of a single
loop.  Seperate the loop from most of the body.  Now it should be
obvious which variables are carried around from iteration to iteration.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 drivers/mtd/mtdpart.c |  327 +++++++++++++++++++++++++------------------------
 1 files changed, 168 insertions(+), 159 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 07c7011..f0d0430 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -322,184 +322,193 @@ int del_mtd_partitions(struct mtd_info *master)
 	return 0;
 }
 
-/*
- * This function, given a master MTD object and a partition table, creates
- * and registers slave MTD objects which are bound to the master according to
- * the partition definitions.
- * (Q: should we register the master MTD object as well?)
- */
-
-int add_mtd_partitions(struct mtd_info *master,
-		       const struct mtd_partition *parts,
-		       int nbparts)
+static int add_one_partition(struct mtd_info *master,
+		const struct mtd_partition *part, int partno,
+		u_int32_t cur_offset)
 {
 	struct mtd_part *slave;
-	u_int32_t cur_offset = 0;
-	int i;
-
-	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
-
-	for (i = 0; i < nbparts; i++) {
 
-		/* allocate the partition structure */
-		slave = kzalloc (sizeof(*slave), GFP_KERNEL);
-		if (!slave) {
-			printk ("memory allocation error while creating partitions for \"%s\"\n",
-				master->name);
-			del_mtd_partitions(master);
-			return -ENOMEM;
-		}
-		list_add(&slave->list, &mtd_partitions);
+	/* allocate the partition structure */
+	slave = kzalloc (sizeof(*slave), GFP_KERNEL);
+	if (!slave) {
+		printk("memory allocation error while creating partitions for \"%s\"\n",
+			master->name);
+		del_mtd_partitions(master);
+		return -ENOMEM;
+	}
+	list_add(&slave->list, &mtd_partitions);
 
-		/* set up the MTD object for this partition */
-		slave->mtd.type = master->type;
-		slave->mtd.flags = master->flags & ~parts[i].mask_flags;
-		slave->mtd.size = parts[i].size;
-		slave->mtd.writesize = master->writesize;
-		slave->mtd.oobsize = master->oobsize;
-		slave->mtd.oobavail = master->oobavail;
-		slave->mtd.subpage_sft = master->subpage_sft;
+	/* set up the MTD object for this partition */
+	slave->mtd.type = master->type;
+	slave->mtd.flags = master->flags & ~part->mask_flags;
+	slave->mtd.size = part->size;
+	slave->mtd.writesize = master->writesize;
+	slave->mtd.oobsize = master->oobsize;
+	slave->mtd.oobavail = master->oobavail;
+	slave->mtd.subpage_sft = master->subpage_sft;
 
-		slave->mtd.name = parts[i].name;
-		slave->mtd.owner = master->owner;
+	slave->mtd.name = part->name;
+	slave->mtd.owner = master->owner;
 
-		slave->mtd.read = part_read;
-		slave->mtd.write = part_write;
+	slave->mtd.read = part_read;
+	slave->mtd.write = part_write;
 
-		if (master->panic_write)
-			slave->mtd.panic_write = part_panic_write;
+	if (master->panic_write)
+		slave->mtd.panic_write = part_panic_write;
 
-		if(master->point && master->unpoint){
-			slave->mtd.point = part_point;
-			slave->mtd.unpoint = part_unpoint;
-		}
+	if(master->point && master->unpoint){
+		slave->mtd.point = part_point;
+		slave->mtd.unpoint = part_unpoint;
+	}
 
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
 		}
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
 			}
 		}
-		if (slave->mtd.size == MTDPART_SIZ_FULL)
-			slave->mtd.size = master->size - slave->offset;
-		cur_offset = slave->offset + slave->mtd.size;
+	} else {
+		/* Single erase size */
+		slave->mtd.erasesize = master->erasesize;
+	}
 
-		printk (KERN_NOTICE "0x%08x-0x%08x : \"%s\"\n", slave->offset,
-			slave->offset + slave->mtd.size, slave->mtd.name);
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
+	slave->mtd.ecclayout = master->ecclayout;
+	if (master->block_isbad) {
+		uint32_t offs = 0;
 
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
+		while(offs < slave->mtd.size) {
+			if (master->block_isbad(master,
+						offs + slave->offset))
+				slave->mtd.ecc_stats.badblocks++;
+			offs += slave->mtd.erasesize;
 		}
+	}
 
-		slave->mtd.ecclayout = master->ecclayout;
-		if (master->block_isbad) {
-			uint32_t offs = 0;
+	if(part->mtdp) {	/* store the object pointer (caller may or may not register it */
+		*part->mtdp = &slave->mtd;
+		slave->registered = 0;
+	} else {
+		/* register our partition */
+		add_mtd_device(&slave->mtd);
+		slave->registered = 1;
+	}
+	return 0;
+}
 
-			while(offs < slave->mtd.size) {
-				if (master->block_isbad(master,
-							offs + slave->offset))
-					slave->mtd.ecc_stats.badblocks++;
-				offs += slave->mtd.erasesize;
-			}
-		}
+/*
+ * This function, given a master MTD object and a partition table, creates
+ * and registers slave MTD objects which are bound to the master according to
+ * the partition definitions.
+ * (Q: should we register the master MTD object as well?)
+ */
 
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
+int add_mtd_partitions(struct mtd_info *master,
+		       const struct mtd_partition *parts,
+		       int nbparts)
+{
+	struct mtd_part *slave;
+	u_int32_t cur_offset = 0;
+	int i, err;
+
+	printk (KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+
+	for (i = 0; i < nbparts; i++) {
+		err = add_one_partition(master, parts + i, i, cur_offset);
+		if (err)
+			return err;
+		slave = PART(parts[i].mtdp);
+		cur_offset = slave->offset + slave->mtd.size;
 	}
 
 	return 0;
-- 
1.5.3.5
