Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DiH57-0006Jy-U8
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 15:28:22 -0400
Date: Tue, 14 Jun 2005 21:28:09 +0200
From: Sean Young <sean@mess.org>
To: Joern Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20050614192809.GA46302@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050613123626.GB30868@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 13, 2005 at 02:36:26PM +0200, Joern Engel wrote:
> In principle, yes.  But this is a good time for some review, so please
> take a look at my comments first. 

Thank you, I've applied your comments. Indeed it is much nicer now. 

> Also, do you know of any patents this code would infringe?  You don't
> have to actively look for any - that is a dangerous hobby for any
> developer.  Just tell if you already know of such a thing.

AFAICS General Software makes no mention of applicable patents. I am not 
aware of any patents which are infringed.

I've renamed it to `rfd' as `/dev/rfda' is much nicer than
`/dev/embiosftla', IMHO. Documentation refers to the RFD anyway, not to
the product which uses it (which isn't just the bios anyway).

dwmw2 pointed out that a major block number needs to be allocated, for
which I've sent a request to device@lanana.org. No response so far.

Any ideas for how it can be improved or reasons why it shouldn't be
commited to cvs?


Sean
--- 
diff -urpN linux-2.6.9/drivers/mtd/rfdftl.c /usr/src/linux-2.6.9/drivers/mtd/rfdftl.c
--- linux-2.6.9/drivers/mtd/rfdftl.c	1970-01-01 01:00:00.000000000 +0100
+++ /usr/src/linux-2.6.9/drivers/mtd/rfdftl.c	2005-06-14 20:41:34.000000000 +0200
@@ -0,0 +1,787 @@
+/*
+ * rfdftl.c -- resident flash disk (flash translation layer)
+ *
+ * Copyright (C) 2005  Sean Young <sean@mess.org>
+ *
+ * $Id: rfdftl.c,v 1.0 2005/06/14 15:33:26 sean Exp $
+ *
+ * This type of flash translation layer (FTL) is used by the Embedded BIOS
+ * by General Software. It is known as the Resident Flash Disk (RFD), see:
+ *
+ * 	http://www.gensw.com/pages/prod/bios/rfd.htm
+ *
+ * based on ftl.c
+ */
+
+#include <linux/hdreg.h>
+#include <linux/init.h>
+#include <linux/mtd/blktrans.h>
+#include <linux/mtd/mtd.h>
+#include <linux/vmalloc.h>
+
+#include <asm/types.h>
+
+static int block_size = 0;
+MODULE_PARM(block_size, "i");
+
+#define PREFIX "rfdftl: "
+
+/* Major device # for FTL device */
+
+/* A request for this major has been sent to device@lanana.org */
+#ifndef RFDFTL_MAJOR
+#define RFDFTL_MAJOR       	95	
+#endif
+
+/* Maximum number of partitions in an FTL region */
+#define PART_BITS		4
+
+/* An erase unit should start with this value */
+#define RFD_MAGIC		0x9193
+
+/* the second value is 0xffff or 0xffc8; function unknown */
+
+/* the third value is always 0xffff, ignored */
+
+/* next is an array of mapping for each corresponding sector */
+#define HEADER_MAP_OFFSET	3
+#define SECTOR_DELETED		0x0000
+#define SECTOR_ZERO		0xfffe
+#define SECTOR_FREE		0xffff
+
+#define SECTOR_SIZE		512
+
+struct block {
+	enum {
+		BLOCK_OK,
+		BLOCK_ERASING,
+		BLOCK_ERASED,
+		BLOCK_FAILED
+	} state;
+	int free_sectors;
+	int used_sectors;
+	int erases;
+	u_long offset;
+};
+
+struct partition {
+	struct mtd_blktrans_dev mbd;
+
+	u_int block_size;		/* size of erase unit */
+	u_int total_blocks;		/* number of erase units */
+	u_int header_sectors_per_block;	/* header sectors in erase unit */
+	u_int data_sectors_per_block;	/* data sectors in erase unit */
+	u_int sector_count;		/* sectors in translated disk */
+	u_int header_size;		/* bytes in header sector */
+	int reserved_block;		/* block next up for reclaim */
+	int current_block;		/* block to write to */
+	u16 *header_cache;		/* cached header */
+
+	int is_reclaiming;
+	u_long *sector_map;
+	struct block *blocks;
+};
+
+static int rfdftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf);
+static int build_block_map(struct partition *part, int block_no);
+static void erase_callback(struct erase_info *erase);
+static int move_block_contents(struct partition *part, int block_no, u_long *old_sector);
+static int mark_sector_removed(struct partition *part, u_long old_sector);
+
+static int scan_header(struct partition *part)
+{
+	int sectors_per_block;
+	int i, rc = -ENOMEM;
+	int blocks_found;
+	size_t retlen;
+
+	sectors_per_block = part->block_size / SECTOR_SIZE;
+	part->total_blocks = part->mbd.mtd->size / part->block_size;
+
+	/* each erase block has three bytes header, followed by the map */
+	part->header_sectors_per_block = 
+		((HEADER_MAP_OFFSET + sectors_per_block) * 
+		 sizeof(u16) + SECTOR_SIZE - 1) / SECTOR_SIZE;
+	part->data_sectors_per_block = sectors_per_block - 
+				part->header_sectors_per_block;
+
+	part->header_size = (HEADER_MAP_OFFSET + 
+				part->data_sectors_per_block) * sizeof(u16);
+	part->sector_count = part->data_sectors_per_block * 
+				(part->total_blocks - 1);
+	part->current_block = -1;
+	part->reserved_block = -1;
+	part->is_reclaiming = 0;
+
+	part->header_cache = kmalloc(part->header_size, GFP_KERNEL);
+	if (!part->header_cache)
+		goto err4;
+
+	part->blocks = kcalloc(part->total_blocks, sizeof(struct block), 
+			GFP_KERNEL);
+	if (!part->blocks)
+		goto err3;
+
+	part->sector_map = vmalloc(part->sector_count * sizeof(u_long));
+	if (!part->sector_map) {
+		printk (KERN_ERR PREFIX "'%s': unable to allocate memory for "
+			"sector map", part->mbd.mtd->name);
+		goto err2;
+	}
+
+	for (i=0; i<part->sector_count; i++) 
+		part->sector_map[i] = -1;
+
+	for (i=0, blocks_found= 0; i<part->total_blocks; i++) {
+		rc = part->mbd.mtd->read(part->mbd.mtd, 
+				i * part->block_size, part->header_size,
+				&retlen, (u_char*)part->header_cache);
+
+		if (!rc && retlen != part->header_size)
+			rc = -EIO;
+
+		if (rc) 
+			goto err;
+
+		if (!build_block_map(part, i))
+			blocks_found++;
+	}
+
+	if (blocks_found == 0) {
+		printk(KERN_NOTICE PREFIX "no FTL header found for '%s'.\n",
+				part->mbd.mtd->name);
+		rc = -ENOENT;
+		goto err;
+	}
+	
+	return 0;
+
+err:
+	vfree(part->sector_map);
+err2:
+	kfree(part->header_cache);
+err3:
+	kfree(part->blocks);
+err4:
+
+	return rc;
+}
+
+static int build_block_map(struct partition *part, int block_no)
+{
+	struct block *block = &part->blocks[block_no];
+	int i;
+	
+	block->offset = part->block_size * block_no;
+
+	if (le16_to_cpu(part->header_cache[0]) != RFD_MAGIC) {
+		block->state = BLOCK_ERASED; /* assumption */
+		block->free_sectors = part->data_sectors_per_block;
+		part->reserved_block = block_no;
+		return 1;
+	}
+
+	block->state = BLOCK_OK;
+
+	for (i=0; i<part->data_sectors_per_block; i++) {
+		u16 entry;
+		
+		entry = le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]);
+
+		if (entry == SECTOR_DELETED)
+			continue;
+	
+		if (entry == SECTOR_FREE) {
+			block->free_sectors++;
+			continue;
+		}
+
+		if (entry == SECTOR_ZERO)
+			entry = 0;
+	
+		if (entry >= part->sector_count) {
+			printk(KERN_NOTICE PREFIX 
+				"'%s': unit #%d: entry %d corrupt, "
+				"sector %d out of range\n",
+				part->mbd.mtd->name, block_no, i, entry);
+			continue;
+		}
+
+		if (part->sector_map[entry] != -1) {
+			printk(KERN_NOTICE PREFIX 
+				"'%s': unit #%d: entry %d corrupt, "
+				"sector %d linked twice\n",
+				part->mbd.mtd->name, block_no, i, entry);
+			continue;
+		}
+
+		part->sector_map[entry] = block->offset + 
+			(i + part->header_sectors_per_block) * SECTOR_SIZE;
+
+		block->used_sectors++;
+	}
+
+	if (block->free_sectors == part->data_sectors_per_block)
+		part->reserved_block = block_no;
+
+	return 0;
+}
+
+static int rfdftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
+{
+	struct partition *part= (struct partition*)dev;
+	u_long addr;
+	size_t retlen;
+	int rc;
+	
+	if (sector >= part->sector_count)
+		return -EIO;
+
+	addr = part->sector_map[sector];
+	if (addr != -1) {
+		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
+						&retlen, (u_char*)buf);
+		if (!rc && retlen != SECTOR_SIZE)
+			rc = -EIO;
+
+	    	if (rc) {
+			printk(KERN_WARNING PREFIX "error reading '%s' at "
+				"0x%lx\n", part->mbd.mtd->name, addr);
+			return rc;
+		}
+	} else
+		memset(buf, 0, SECTOR_SIZE);
+	
+	return 0;
+} 
+
+static int erase_block(struct partition *part, int block)
+{
+	struct erase_info *erase;
+	int rc = -ENOMEM;
+
+	erase = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
+	if (!erase)
+		goto err;
+
+	erase->mtd = part->mbd.mtd;
+	erase->callback = erase_callback;
+	erase->addr = part->blocks[block].offset;
+	erase->len = part->block_size;
+	erase->priv = (u_long)part;
+
+	part->blocks[block].state = BLOCK_ERASING;
+	part->blocks[block].free_sectors = 0;
+
+	rc = part->mbd.mtd->erase(part->mbd.mtd, erase);
+
+	if (rc) {
+		printk(KERN_WARNING PREFIX "erase of region %x,%x on '%s' "
+				"failed\n", erase->addr, erase->len,
+				part->mbd.mtd->name);
+		kfree(erase);
+	}
+
+err:
+	return rc;
+}
+
+static void erase_callback(struct erase_info *erase)
+{
+	struct partition *part;
+	int i;
+
+	part = (struct partition*)erase->priv;
+
+	i = erase->addr / part->block_size;
+	if (i >= part->total_blocks || part->blocks[i].offset != erase->addr) {
+		printk(KERN_ERR PREFIX "internal error: erase callback "
+				"for unknown offset %x on '%s'\n", 
+				erase->addr, part->mbd.mtd->name);
+		return;
+	}
+
+	if (erase->state == MTD_ERASE_DONE) {
+		part->blocks[i].state = BLOCK_ERASED;
+		part->blocks[i].free_sectors = part->data_sectors_per_block;
+		part->blocks[i].used_sectors = 0;
+		part->blocks[i].erases++;
+	} else {
+		printk(KERN_WARNING PREFIX "erase failed at 0x%x on '%s', "
+				"state %d\n", erase->addr, 
+				part->mbd.mtd->name, erase->state);
+
+		part->blocks[i].state = BLOCK_FAILED;
+		part->blocks[i].free_sectors = 0;
+		part->blocks[i].used_sectors = 0;
+	}
+
+	kfree(erase);
+}
+
+static int reclaim_block (struct partition *part, u_long *old_sector) 
+{
+	int block, best_block, score, old_sector_block;
+	int rc;
+	
+	/* we have a race if sync doesn't exist */
+	if (part->mbd.mtd->sync)
+		part->mbd.mtd->sync(part->mbd.mtd);
+
+	score = 0x7fffffff; /* MAX_INT */
+	best_block = -1;
+	if (*old_sector != -1)
+		old_sector_block = *old_sector / part->block_size;
+	else
+		old_sector_block = -1;
+
+	for (block=0; block<part->total_blocks; block++) {
+		int this_score;
+
+		if (block == part->reserved_block)
+			continue;
+
+		/*
+		 * post-pone reclaiming if there is a free sector as
+		 * more removed sectors is more efficient (have to move
+		 * less).
+		 */
+		if (part->blocks[block].free_sectors) 
+			return 0;
+
+		this_score = part->blocks[block].used_sectors;
+
+		if (block == old_sector_block) 
+			this_score--;
+		else {
+			/* no point in moving a full block */
+			if (part->blocks[block].used_sectors == 
+					part->data_sectors_per_block)
+				continue;
+		}
+
+		this_score += part->blocks[block].erases;
+
+		if (this_score < score) {
+			best_block = block;
+			score = this_score;
+		}
+	}
+
+	if (best_block == -1)
+		return -ENOSPC;
+
+	part->current_block = -1;
+	part->reserved_block = best_block;
+
+	pr_debug("reclaim_block: reclaiming block #%d with %d used "
+		 "%d free sectors\n", best_block,
+		 part->blocks[best_block].used_sectors,
+		 part->blocks[best_block].free_sectors);
+
+	if (part->blocks[best_block].used_sectors)
+		rc = move_block_contents(part, best_block, old_sector);
+	else
+		rc = erase_block(part, best_block);
+
+	return rc;
+}
+
+static int move_block_contents(struct partition *part, int block_no, u_long *old_sector)
+{
+	void *sector_data;
+	u16 *map;
+	size_t retlen;
+	int i, rc = -ENOMEM;
+
+	part->is_reclaiming = 1;
+
+	sector_data = kmalloc(SECTOR_SIZE, GFP_KERNEL);
+	if (!sector_data)
+		goto err3;
+
+	map = kmalloc(part->header_size, GFP_KERNEL);
+	if (!map)
+		goto err2;
+	
+	rc = part->mbd.mtd->read(part->mbd.mtd, 
+		part->blocks[block_no].offset, part->header_size, 
+		&retlen, (u_char*)map);
+	
+	if (!rc && retlen != part->header_size)
+		rc = -EIO;
+
+	if (rc) {
+		printk(KERN_NOTICE PREFIX "error reading '%s' at "
+			"0x%lx\n", part->mbd.mtd->name, 
+			part->blocks[block_no].offset);
+
+		goto err;
+	}
+
+	for (i=0; i<part->data_sectors_per_block; i++) {
+		u16 entry = le16_to_cpu(map[HEADER_MAP_OFFSET + i]);
+		u_long addr;
+
+
+		if (entry == SECTOR_FREE || entry == SECTOR_DELETED)
+			continue;
+
+		if (entry == SECTOR_ZERO) 
+			entry = 0;
+
+		if (entry >= part->sector_count) {
+			printk(KERN_NOTICE PREFIX "'%s' existing "
+				"sector %d out of range (max %d)\n", 
+				part->mbd.mtd->name, 
+				entry, part->sector_count);
+			continue;
+		}
+
+		addr = part->blocks[block_no].offset +
+			(i + part->header_sectors_per_block) * SECTOR_SIZE;
+
+		if (*old_sector == addr) {
+			*old_sector = -1;
+			part->blocks[block_no].used_sectors--;
+			if (!part->blocks[block_no].used_sectors) {
+				rc = erase_block(part, block_no);
+				break;
+			}
+			continue;
+		}
+		rc = part->mbd.mtd->read(part->mbd.mtd, addr,
+			SECTOR_SIZE, &retlen, sector_data);
+	
+		if (!rc && retlen != SECTOR_SIZE)
+			rc = -EIO;
+
+		if (rc) {
+			printk(KERN_NOTICE PREFIX "'%s': Unable to "
+				"read sector for relocation\n",
+				part->mbd.mtd->name);
+
+			goto err;
+		}
+		
+		rc = rfdftl_writesect((struct mtd_blktrans_dev*)part,
+				entry, sector_data);
+		
+		if (rc) 
+			goto err;
+	}
+
+err:
+	kfree(map);
+err2:
+	kfree(sector_data);
+err3:
+	part->is_reclaiming = 0;
+
+	return rc;
+}
+
+static int find_free_block (struct partition *part)
+{
+	int block, stop;
+
+	block = part->current_block == -1 ?
+			jiffies % part->total_blocks : part->current_block;
+	stop = block;
+
+	do {
+		if (part->blocks[block].free_sectors && 
+				block != part->reserved_block)
+			return block;
+
+		if (++block >= part->total_blocks)
+			block = 0;
+
+	} while (block != stop);
+
+	return -1;
+}
+
+static int find_writeable_block (struct partition *part, u_long *old_sector)
+{
+	int rc, block;
+	size_t retlen;
+
+	block = find_free_block(part);
+
+	if (block == -1) {
+		if (!part->is_reclaiming) {
+			rc = reclaim_block(part, old_sector);
+			if (rc)
+				goto err;
+
+			block = find_free_block(part);
+		}
+
+		if (block == -1) {
+			rc = -ENOSPC;
+			goto err;
+		}
+	}
+
+	if (part->blocks[block].state == BLOCK_ERASED) {
+		u16 magic = cpu_to_le16(RFD_MAGIC);
+
+		rc = part->mbd.mtd->write(part->mbd.mtd, 
+			part->blocks[block].offset, sizeof(magic), &retlen, 
+			(u_char*)&magic);
+		
+		if (!rc && retlen != sizeof(magic))
+			rc = -EIO;
+
+		if (rc) {
+			printk(KERN_NOTICE PREFIX "'%s': unable to write RFD "
+					"header at 0x%lx\n",
+					part->mbd.mtd->name, 
+					part->blocks[block].offset);
+			goto err;
+		}
+		part->blocks[block].state = BLOCK_OK;
+	}
+
+	rc = part->mbd.mtd->read(part->mbd.mtd, 
+		part->blocks[block].offset, part->header_size,
+				&retlen, (u_char*)part->header_cache);
+
+	if (!rc && retlen != part->header_size)
+		rc = -EIO;
+
+	if (rc) {
+		printk(KERN_NOTICE PREFIX "'%s': unable to read header at "
+				"0x%lx\n", part->mbd.mtd->name, 
+				part->blocks[block].offset);
+		goto err;
+	}
+
+	part->current_block = block;
+
+err:
+	return rc;
+}	
+
+static int rfdftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
+{
+	struct partition *part= (struct partition*)dev;
+	u_long old_addr, addr;
+	int i;
+	int rc;
+	size_t retlen;
+	u16 entry;
+
+	pr_debug("rfdftl_writesect(sector=0x%lx)\n", sector);
+
+	if (part->reserved_block == -1)
+		return -EACCES;
+
+	if (sector >= part->sector_count)
+		return -EIO;
+
+	old_addr = part->sector_map[sector];
+
+	if (part->current_block == -1 ||
+		!part->blocks[part->current_block].free_sectors) {
+
+		rc = find_writeable_block(part, &old_addr);
+		if (rc) 
+			goto err;
+	}
+
+	for (i=0; i<part->data_sectors_per_block; i++) {
+		if (le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]) 
+				== SECTOR_FREE)
+			break;
+	}
+	BUG_ON(part->data_sectors_per_block == i);
+
+	addr = (i + part->header_sectors_per_block) * SECTOR_SIZE + 
+		part->blocks[part->current_block].offset;
+	rc = part->mbd.mtd->write(part->mbd.mtd, 
+		addr, SECTOR_SIZE, &retlen, (u_char*)buf);
+
+	if (!rc && retlen != SECTOR_SIZE)
+		rc = -EIO;
+
+	if (rc) {
+		printk(KERN_WARNING PREFIX "error writing '%s' at 0x%lx\n",
+				part->mbd.mtd->name, addr);
+		if (rc) 
+			goto err;
+	}
+
+	part->sector_map[sector] = addr;
+
+	entry = cpu_to_le16(sector == 0 ? SECTOR_ZERO : sector);
+
+	part->header_cache[i + HEADER_MAP_OFFSET] = entry;
+
+	addr = part->blocks[part->current_block].offset +
+			(HEADER_MAP_OFFSET + i) * sizeof(u16);
+	rc = part->mbd.mtd->write(part->mbd.mtd, addr,
+			sizeof(entry), &retlen, (u_char*)&entry);
+
+	if (!rc && retlen != sizeof(entry))
+		rc = -EIO;
+
+	if (rc) {
+		printk(KERN_WARNING PREFIX "error writing '%s' at 0x%lx\n",
+				part->mbd.mtd->name, addr);
+		if (rc) 
+			goto err;
+	}
+	part->blocks[part->current_block].used_sectors++;
+	part->blocks[part->current_block].free_sectors--;
+
+	if (old_addr != -1)
+		rc = mark_sector_removed(part, old_addr);
+
+err:
+	return rc;
+}
+
+static int mark_sector_removed(struct partition *part, u_long old_addr)
+{
+	int block, offset, rc;
+	u_long addr;
+	size_t retlen;
+	u16 del = cpu_to_le16(SECTOR_DELETED);
+
+	block = old_addr / part->block_size;
+	offset = (old_addr % part->block_size) / SECTOR_SIZE - 
+		part->header_sectors_per_block;
+
+	addr = part->blocks[block].offset +
+			(HEADER_MAP_OFFSET + offset) * sizeof(u16);
+	rc = part->mbd.mtd->write(part->mbd.mtd, addr,
+		sizeof(del), &retlen, (u_char*)&del);
+
+	if (!rc && retlen != sizeof(del))
+		rc = -EIO;
+
+	if (rc) {
+		printk(KERN_WARNING PREFIX "error writing '%s' at "
+			"0x%lx\n", part->mbd.mtd->name, addr);
+		if (rc) 
+			goto err;
+	}
+	if (block == part->current_block)
+		part->header_cache[offset + HEADER_MAP_OFFSET] = del;
+
+	part->blocks[block].used_sectors--;
+
+	if (!part->blocks[block].used_sectors &&
+	    !part->blocks[block].free_sectors)
+		rc = erase_block(part, block);
+
+err:
+	return rc;
+}
+
+static int rfdftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
+{
+	struct partition *part = (struct partition*)dev;
+
+	geo->heads = 1;
+	geo->sectors = part->data_sectors_per_block;
+	geo->cylinders = part->total_blocks - 1;
+
+	return 0;
+}
+
+static void rfdftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct partition *part;
+
+	part = kcalloc(1, sizeof(struct partition), GFP_KERNEL);
+	if (!part)
+		return;
+
+	part->mbd.mtd = mtd;
+
+	if (block_size)
+		part->block_size = block_size;
+	else {
+		if (!mtd->erasesize) {
+			printk(KERN_NOTICE PREFIX "please provide block_size");
+			return;
+		}
+		else
+			part->block_size = mtd->erasesize;
+	}
+
+	if (scan_header(part) == 0) {
+		part->mbd.size = part->sector_count;
+		part->mbd.blksize = SECTOR_SIZE;
+		part->mbd.tr = tr;
+		part->mbd.devnum = -1;
+		if (!(mtd->flags & MTD_WRITEABLE))
+			part->mbd.readonly = 1;
+		else if (part->reserved_block == -1) {
+			printk(KERN_NOTICE PREFIX "'%s': no empty erase unit "
+				"found, setting read-only\n",
+				part->mbd.mtd->name);
+	
+			part->mbd.readonly = 1;
+		}
+
+		printk(KERN_INFO PREFIX "name: '%s' type: %d flags %x\n",
+				mtd->name, mtd->type, mtd->flags);
+
+		if (!add_mtd_blktrans_dev((void*)part))
+			return;
+	} 
+
+	kfree(part);
+}
+
+static void rfdftl_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	struct partition *part = (struct partition*)dev;
+	int i;
+
+	for (i=0; i<part->total_blocks; i++) {
+		pr_debug("rfdftl_remove_dev:'%s': erase unit #%02d: %d erases\n",
+			part->mbd.mtd->name, i, part->blocks[i].erases);
+	}
+
+	del_mtd_blktrans_dev(dev);
+	vfree(part->sector_map);
+	kfree(part->header_cache);
+	kfree(part->blocks);
+	kfree(part);
+}
+
+struct mtd_blktrans_ops rfdftl_tr = {
+	.name		= "rfd",
+	.major		= RFDFTL_MAJOR,
+	.part_bits	= PART_BITS,
+	.readsect	= rfdftl_readsect,
+	.writesect	= rfdftl_writesect, 
+	.getgeo		= rfdftl_getgeo,
+	.add_mtd	= rfdftl_add_mtd,
+	.remove_dev	= rfdftl_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+static int __init init_rfdftl(void)
+{
+	return register_mtd_blktrans(&rfdftl_tr);
+}
+
+static void __exit cleanup_rfdftl(void)
+{
+	deregister_mtd_blktrans(&rfdftl_tr);
+}
+
+module_init(init_rfdftl);
+module_exit(cleanup_rfdftl);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("Support code for RFD Flash Translation Layer, "
+		"used by General Software's Embedded BIOS");
+
diff -urpN linux-2.6.9/drivers/mtd/Kconfig /usr/src/linux-2.6.9/drivers/mtd/Kconfig
--- linux-2.6.9/drivers/mtd/Kconfig	2005-06-13 00:27:43.000000000 +0200
+++ /usr/src/linux-2.6.9/drivers/mtd/Kconfig	2005-06-14 19:54:37.000000000 +0200
@@ -253,6 +253,16 @@ config INFTL
 	  permitted to copy, modify and distribute the code as you wish. Just
 	  not use it.
 
+config RFDFTL
+        tristate "Resident Flash Disk (Flash Translation Layer) support"
+	depends on MTD
+	---help---
+	  This provides support for the flash translation layer known 
+	  as the Resident Flash Disk (RFD), as used by the Embedded BIOS 
+	  of General Software. There is a blurb at:
+
+		http://www.gensw.com/pages/prod/bios/rfd.htm
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff -urpN linux-2.6.9/drivers/mtd/Makefile /usr/src/linux-2.6.9/drivers/mtd/Makefile
--- linux-2.6.9/drivers/mtd/Makefile	2004-10-18 23:53:51.000000000 +0200
+++ /usr/src/linux-2.6.9/drivers/mtd/Makefile	2005-06-14 20:01:46.000000000 +0200
@@ -20,6 +20,7 @@ obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_r
 obj-$(CONFIG_FTL)		+= ftl.o mtd_blkdevs.o
 obj-$(CONFIG_NFTL)		+= nftl.o mtd_blkdevs.o
 obj-$(CONFIG_INFTL)		+= inftl.o mtd_blkdevs.o
+obj-$(CONFIG_RFDFTL)		+= rfdftl.o mtd_blkdevs.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
