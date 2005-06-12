Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DhUPS-0002Xj-Ny
	for linux-mtd@lists.infradead.org; Sun, 12 Jun 2005 11:30:07 -0400
Received: from atlantis.8hz.com (localhost [127.0.0.1])
	by atlantis.8hz.com (Postfix) with ESMTP id 2B8BFBA86
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Jun 2005 17:09:55 +0200 (CEST)
Received: (from sean@localhost)
	by atlantis.8hz.com (8.13.1/8.13.1/Submit) id j5CF9tDW013370
	for linux-mtd@lists.infradead.org;
	Sun, 12 Jun 2005 17:09:55 +0200 (CEST) (envelope-from sean)
Resent-Message-Id: <200506121509.j5CF9tDW013370@atlantis.8hz.com>
Date: Sun, 12 Jun 2005 16:47:08 +0200
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20050612144708.GA28512@levin.pad.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is an FTL used by General Software on their Embedded BIOS. Is it
okay to commit to cvs?


Sean

diff -urpN linux-2.6.9/drivers/mtd/embiosftl.c /usr/src/linux-2.6.9/drivers/mtd/embiosftl.c
--- linux-2.6.9/drivers/mtd/embiosftl.c	1970-01-01 01:00:00.000000000 +0100
+++ /usr/src/linux-2.6.9/drivers/mtd/embiosftl.c	2005-06-12 16:08:59.000000000 +0200
@@ -0,0 +1,840 @@
+/*
+ * embiosftl.c -- embedded bios flash translation layer
+ *
+ * Copyright (C) 2005  Sean Young <sean@mess.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
+ *
+ * $Id: embiosftl.c,v 1.0 2005/06/12 15:33:26 sean Exp $
+ *
+ * This flash translation layer (FTL) is built into the Embedded BIOS
+ * by General Software. It is known as the Resident Flash Disk (RFD), see:
+ *
+ * 	http://www.gensw.com/pages/prod/bios/rfd.htm
+ */
+
+#include <linux/init.h>
+#include <asm/types.h>
+#include <linux/mtd/blktrans.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/ftl.h>
+#include <linux/hdreg.h>
+#include <linux/vmalloc.h>
+
+
+/* #define EBFTL_DEBUG */
+
+static int block_size = 0;
+MODULE_PARM(block_size, "i");
+
+#define PREFIX "embiosftl: "
+
+/* Major device # for FTL device */
+#ifndef FTL_MAJOR
+#define FTL_MAJOR       	44
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
+struct block_t {
+	enum {
+		BLOCK_OK,
+		BLOCK_PREPARED,
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
+struct partition_t {
+	struct mtd_blktrans_dev mbd;
+
+	u_int block_size;		/* size of erase unit */
+	u_int total_blocks;		/* number of erase units */
+	u_int header_sectors_per_block;	/* header sectors in erase unit */
+	u_int data_sectors_per_block;	/* data sectors in erase unit */
+	u_int sector_count;		/* sectors in translated disk */
+	u_int header_size;		/* bytes in header sector */
+	u_int total_free_sectors;	/* total number of free sectors */
+	int reserved_block;		/* block next up for reclaim */
+	int current_block;		/* block to write to */
+	u16 *header_cache;		/* cached header */
+
+	int is_reclaiming;
+	u_long *sector_map;
+	struct block_t *blocks;
+};
+
+static int ebftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf);
+static int build_block_map(struct partition_t *part, int block_no);
+static void erase_callback (struct erase_info *erase);
+
+static int scan_header(struct partition_t *part)
+{
+	int sectors_per_block;
+	int i, rc = 0;
+	int blocks_found;
+	size_t retlen;
+
+	sectors_per_block  = part->block_size / SECTOR_SIZE;
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
+			part->data_sectors_per_block) * sizeof(u16);
+	part->sector_count = part->data_sectors_per_block * 
+				(part->total_blocks - 1);
+	part->current_block = -1;
+	part->reserved_block = -1;
+	part->is_reclaiming= 0;
+
+	part->header_cache = kmalloc(part->header_size, GFP_KERNEL);
+	if(!part->header_cache) {
+		printk (KERN_ERR PREFIX "failed to malloc %d bytes to scan "
+			"'%s'\n", part->header_size, part->mbd.mtd->name);
+		rc = -ENOMEM;
+		goto err_out_header_cache_malloc_fail;
+	}
+
+	part->blocks = kmalloc(part->total_blocks * sizeof(struct block_t), 
+			GFP_KERNEL);
+	if(!part->blocks) {
+		printk (KERN_ERR PREFIX "failed to malloc %d bytes to scan "
+			"'%s'\n", part->total_blocks * sizeof(struct block_t),
+			part->mbd.mtd->name);
+		rc = -ENOMEM;
+		goto err_out_blocks_malloc_fail;
+	}
+	memset(part->blocks, 0, part->total_blocks * sizeof(struct block_t));
+
+	part->sector_map = vmalloc(part->sector_count * sizeof(u_long));
+
+	if(!part->sector_map) {
+		printk (KERN_ERR PREFIX "failed to malloc %d bytes to scan "
+			"'%s'\n", part->sector_count * sizeof(u_long),
+			part->mbd.mtd->name);
+		rc = -ENOMEM;
+		goto err_out_sector_map_malloc_fail;
+	}
+
+	for(i=0; i<part->sector_count; i++) 
+		part->sector_map[i] = -1;
+
+	for(i=0, blocks_found= 0; i<part->total_blocks; i++) {
+		rc = part->mbd.mtd->read(part->mbd.mtd, 
+				i * part->block_size, part->header_size,
+				&retlen, (u_char*)part->header_cache);
+
+		if(retlen != part->header_size)
+			rc = -EIO;
+
+		if(rc) 
+			goto err_out;
+
+		if(!build_block_map(part, i)) {
+			blocks_found++;
+		}
+		part->total_free_sectors += part->blocks[i].free_sectors;
+	}
+
+	if(blocks_found == 0) {
+		printk(KERN_NOTICE PREFIX "no FTL header found for '%s'.\n",
+				part->mbd.mtd->name);
+		rc = -ENOENT;
+		goto err_out;
+	}
+	
+	return 0;
+
+err_out:
+	vfree(part->sector_map);
+err_out_sector_map_malloc_fail:
+	kfree(part->header_cache);
+err_out_blocks_malloc_fail:
+	kfree(part->blocks);
+err_out_header_cache_malloc_fail:
+
+	return rc;
+}
+
+static int build_block_map(struct partition_t *part, int block_no)
+{
+	int i;
+	struct block_t *block = &part->blocks[block_no];
+	
+	block->offset = part->block_size * block_no;
+
+	if(__le16_to_cpu(part->header_cache[0]) != RFD_MAGIC) {
+		block->state = BLOCK_ERASED; /* assumption */
+		block->free_sectors = part->data_sectors_per_block;
+		part->reserved_block = block_no;
+		return 1;
+	}
+
+	block->state = BLOCK_OK;
+
+	for(i=0; i<part->data_sectors_per_block; i++) {
+		u16 s;
+		
+		s = __le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]);
+		if(SECTOR_DELETED == s) {
+			continue;
+		}
+		if(SECTOR_FREE == s) {
+			block->free_sectors++;
+			continue;
+		}
+		if(SECTOR_ZERO == s) {
+			s = 0;
+		}
+		if(s >= part->sector_count) {
+			printk(KERN_NOTICE PREFIX 
+				"'%s': unit #%d: entry %d corrupt, "
+				"sector %d out of range\n",
+				part->mbd.mtd->name, block_no, i, s);
+			continue;
+		}
+		if(part->sector_map[s] != -1) {
+			printk(KERN_NOTICE PREFIX 
+				"'%s': unit #%d: entry %d corrupt, "
+				"sector %d linked twice\n",
+				part->mbd.mtd->name, block_no, i, s);
+			continue;
+		}
+
+		part->sector_map[s] = block->offset + 
+			(i + part->header_sectors_per_block) * SECTOR_SIZE;
+
+		block->used_sectors++;
+	}
+
+	if(block->free_sectors == part->data_sectors_per_block)
+		part->reserved_block = block_no;
+
+	return 0;
+}
+
+static int ebftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
+{
+	struct partition_t *part= (struct partition_t*)dev;
+	u_long addr;
+	size_t retlen;
+	int rc;
+	
+	if(sector >= part->sector_count) {
+		printk(KERN_NOTICE PREFIX "'%s': bad read offset %lu => %u\n",
+				part->mbd.mtd->name, sector, part->sector_count);
+		return -EIO;
+	}
+	addr = part->sector_map[sector];
+	if(addr != -1) {
+		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
+						&retlen, (u_char*)buf);
+		if(retlen != SECTOR_SIZE)
+			rc = -EIO;
+
+	    	if(rc) {
+			printk(KERN_WARNING PREFIX "error reading '%s' at "
+				"0x%lx\n", part->mbd.mtd->name, addr);
+			return rc;
+		}
+	}
+	else
+		memset(buf, 0, SECTOR_SIZE);
+	
+	return 0;
+} 
+
+static int erase_block(struct partition_t *part, int block)
+{
+	struct erase_info *erase;
+	int rc = 0;
+
+	erase = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
+	if(!erase) {
+		printk(KERN_WARNING PREFIX "unable to allocate memory to "
+			"reclaim block for '%s'\n", part->mbd.mtd->name);
+		rc = -ENOMEM;
+		goto err_out_erase_malloc_fail;
+	}
+
+	erase->mtd = part->mbd.mtd;
+	erase->callback = erase_callback;
+	erase->addr = part->blocks[block].offset;
+	erase->len = part->block_size;
+	erase->priv = (u_long)part;
+	part->blocks[block].state = BLOCK_ERASING;
+
+	rc = part->mbd.mtd->erase(part->mbd.mtd, erase);
+
+	if(rc) {
+		printk(KERN_WARNING PREFIX "erase of region %x,%x on '%s' "
+				"failed\n", erase->addr, erase->len,
+				part->mbd.mtd->name);
+		kfree(erase);
+	}
+
+err_out_erase_malloc_fail:
+
+	return rc;
+}
+
+static void erase_callback (struct erase_info *erase)
+{
+	struct partition_t *part;
+	int i;
+
+	part = (struct partition_t*)erase->priv;
+	for (i=0; i<part->total_blocks; i++) {
+		if(part->blocks[i].offset == erase->addr) {
+			break;
+		}
+	}
+
+	if(i == part->total_blocks) {
+		printk(KERN_ERR PREFIX "internal error: erase callback "
+				"for unknown offset %x on '%s'\n", 
+				erase->addr, part->mbd.mtd->name);
+		return;
+	}
+
+	if(erase->state == MTD_ERASE_DONE) {
+		part->blocks[i].state = BLOCK_ERASED;
+		part->blocks[i].free_sectors = part->data_sectors_per_block;
+		part->blocks[i].used_sectors = 0;
+		part->blocks[i].erases++;
+	}
+	else {
+		printk(KERN_WARNING PREFIX "erase failed at 0x%x on '%s', "
+				"state %d\n", erase->addr, 
+				part->mbd.mtd->name, erase->state);
+
+		part->blocks[i].state = BLOCK_FAILED;
+		part->blocks[i].free_sectors = 0;
+		part->blocks[i].used_sectors = 0;
+	}
+	part->total_free_sectors += part->blocks[i].free_sectors;
+
+	kfree(erase);
+}
+
+static int reclaim_block (struct partition_t *part, u_long *skip) 
+{
+	int block, best_block, score, skip_block;
+	u_char *sector = NULL;
+	u16 *map = NULL;
+	int i, rc = 0;
+	size_t retlen;
+	
+	BUG_ON(part->is_reclaiming);
+
+	if(part->mbd.mtd->sync)
+		part->mbd.mtd->sync(part->mbd.mtd);
+
+	score = 0x7fffffff; /* MAX_INT */
+	best_block = -1;
+	if(skip && *skip != -1)
+		skip_block = *skip / part->block_size;
+	else
+		skip_block = -1;
+
+	for(block=0; block<part->total_blocks; block++) {
+		int this_score;
+
+		if(block == part->reserved_block)
+			continue;
+
+		if(part->blocks[block].free_sectors) 
+			return 0;
+
+		if(block == skip_block) 
+			this_score = part->blocks[block].used_sectors - 1;
+		else {
+			if(part->blocks[block].used_sectors == 
+					part->data_sectors_per_block)
+				continue;
+
+			this_score = part->blocks[block].used_sectors;
+		}
+
+		this_score += part->blocks[block].erases;
+
+		if(this_score < score) {
+			best_block = block;
+			score = this_score;
+		}
+	}
+
+	if(best_block == -1)
+		return -ENOSPC;
+
+	part->current_block = -1;
+	part->reserved_block = best_block;
+
+	if(!part->blocks[best_block].used_sectors) {
+		erase_block(part, best_block);
+	}
+	else {
+
+		part->is_reclaiming = 1;
+
+		sector = kmalloc(SECTOR_SIZE, GFP_KERNEL);
+		if(!sector) {
+			printk(KERN_WARNING PREFIX "unable to allocate memory "
+					"to reclaim block for '%s'\n",
+					part->mbd.mtd->name);
+			rc = -ENOMEM;
+			goto err_out;
+		}
+		map = kmalloc(part->header_size, GFP_KERNEL);
+		if(!map) {
+			printk(KERN_WARNING PREFIX "unable to allocate memory "
+					"to reclaim block for '%s'\n",
+					part->mbd.mtd->name);
+			rc = -ENOMEM;
+			goto err_out;
+		}
+		
+		rc = part->mbd.mtd->read(part->mbd.mtd, 
+			part->blocks[best_block].offset, part->header_size, 
+			&retlen, (u_char*)map);
+		
+		if(retlen != part->header_size)
+			rc = -EIO;
+
+		if(rc) {
+			printk(KERN_NOTICE PREFIX "error reading '%s' at "
+				"0x%lx\n", part->mbd.mtd->name, 
+				part->blocks[best_block].offset);
+
+			goto err_out;
+		}
+
+		for(i=0; i<part->data_sectors_per_block; i++) {
+			u16 s;
+			u_long addr;
+
+			s = __le16_to_cpu(map[HEADER_MAP_OFFSET + i]);
+
+			if(s == SECTOR_FREE || s == SECTOR_DELETED)
+				continue;
+
+			if(s == SECTOR_ZERO) 
+				s = 0;
+
+			if(s >= part->sector_count) {
+				printk(KERN_NOTICE PREFIX "'%s' existing "
+					"sector %d out of range (max %d)\n", 
+					part->mbd.mtd->name, 
+					s, part->sector_count);
+				continue;
+			}
+
+			addr = part->blocks[best_block].offset +
+				(i + part->header_sectors_per_block)
+				 	* SECTOR_SIZE;
+	
+			if(skip && *skip == addr) {
+				*skip = -1;
+				part->blocks[best_block].used_sectors--;
+				if(!part->blocks[best_block].used_sectors) {
+					erase_block(part, best_block);
+				}
+				continue;
+			}
+			rc = part->mbd.mtd->read(part->mbd.mtd, addr,
+				SECTOR_SIZE, &retlen, sector);
+		
+			if(retlen != SECTOR_SIZE)
+				rc = -EIO;
+
+			if(rc) {
+				printk(KERN_NOTICE PREFIX "'%s': Unable to "
+					"read sector for relocation\n",
+					part->mbd.mtd->name);
+
+				goto err_out;
+			}
+			
+			rc = ebftl_writesect((struct mtd_blktrans_dev*)part,
+					s, sector);
+			
+			if(rc) goto err_out;
+		}
+	}
+
+
+err_out:
+	if(map) kfree(map);
+	if(sector) kfree(sector);
+	part->is_reclaiming = 0;
+
+	return rc;
+}
+
+static int find_free_block (struct partition_t *part, u_long *skip)
+{
+	u16 s;
+	int rc, retlen;
+	int block, stop;
+	int found_free = 0;
+
+	while(1) {
+		block = part->current_block == -1 ?
+			jiffies % part->total_blocks : part->current_block;
+		stop = block;
+
+		do {
+			if(part->blocks[block].free_sectors && 
+				block != part->reserved_block &&
+				(part->blocks[block].state == BLOCK_OK ||
+				 part->blocks[block].state == BLOCK_ERASED)) {
+
+				found_free = 1;
+				break;
+			}
+
+			if(++block >= part->total_blocks)
+				block = 0;
+		}
+		while(block != stop);
+
+		if(found_free)
+			break;
+
+		rc = reclaim_block(part, skip);
+		if(rc)
+			return rc;
+	}
+
+	part->current_block = block;
+
+	if(part->blocks[block].state == BLOCK_ERASED) {
+		s = __cpu_to_le16(RFD_MAGIC);
+
+		rc = part->mbd.mtd->write(part->mbd.mtd, 
+			part->blocks[block].offset, sizeof(u16), &retlen, 
+			(u_char*)&s);
+		
+		if(retlen != sizeof(u16))
+			rc = -EIO;
+
+		if(rc) {
+			printk(KERN_NOTICE PREFIX "'%s': unable to write RFD "
+					"header at 0x%lx\n",
+					part->mbd.mtd->name, 
+					part->blocks[block].offset);
+			return -EIO;
+		}
+		part->blocks[block].state = BLOCK_OK;
+	}
+
+	rc = part->mbd.mtd->read(part->mbd.mtd, 
+		part->blocks[part->current_block].offset, part->header_size,
+				&retlen, (u_char*)part->header_cache);
+
+	if(retlen != part->header_size)
+		rc = -EIO;
+
+	if(rc) {
+		printk(KERN_NOTICE PREFIX "'%s': unable to read header at "
+				"0x%lx\n", part->mbd.mtd->name, 
+				part->blocks[part->current_block].offset);
+		return rc;
+	}
+
+	return 0;
+}	
+
+static int ebftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
+{
+	struct partition_t *part= (struct partition_t*)dev;
+	u_long old_addr, addr, mtd_addr;
+	int i;
+	int rc;
+	size_t retlen;
+	u16 s;
+
+#ifdef EBFTL_DEBUG
+	printk(KERN_NOTICE PREFIX "writing sector 0x%lx\n", sector);
+#endif
+
+	if(part->reserved_block == -1)
+		return -EACCES;
+
+	if(sector >= part->sector_count)
+		return -EIO;
+
+	old_addr = part->sector_map[sector];
+
+	if(part->current_block == -1 ||
+		!part->blocks[part->current_block].free_sectors) {
+
+		rc = find_free_block(part, &old_addr);
+		if(rc) goto err_out;
+	}
+
+#ifdef EBFTL_DEBUG
+	printk(KERN_NOTICE PREFIX "after find_free_block 0x%lx\n", sector);
+#endif
+
+	for(i=0; i<part->data_sectors_per_block; i++) {
+		if(__le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]) 
+				== SECTOR_FREE) {
+			break;
+		}
+	}
+	BUG_ON(part->data_sectors_per_block == i);
+
+	addr = (i + part->header_sectors_per_block) * SECTOR_SIZE + 
+		part->blocks[part->current_block].offset;
+
+	rc = part->mbd.mtd->write(part->mbd.mtd, 
+		addr, SECTOR_SIZE, &retlen, (u_char*)buf);
+
+	if(retlen != SECTOR_SIZE)
+		rc = -EIO;
+
+	if(rc) {
+		printk(KERN_WARNING PREFIX "error writing '%s' at 0x%lx\n",
+				part->mbd.mtd->name, addr);
+		if(rc) goto err_out;
+	}
+
+	part->sector_map[sector] = addr;
+
+	s = __cpu_to_le16(sector == 0 ? SECTOR_ZERO : sector);
+
+	part->header_cache[i + HEADER_MAP_OFFSET] = s;
+	mtd_addr = part->blocks[part->current_block].offset +
+			(HEADER_MAP_OFFSET + i) * sizeof(u16);
+	rc = part->mbd.mtd->write(part->mbd.mtd, mtd_addr,
+			sizeof(u16), &retlen, (u_char*)&s);
+
+	if(retlen != sizeof(u16))
+		rc = -EIO;
+
+	if(rc) {
+		printk(KERN_WARNING PREFIX "error writing '%s' at 0x%lx\n",
+				part->mbd.mtd->name, mtd_addr);
+		if(rc) goto err_out;
+	}
+	part->blocks[part->current_block].used_sectors++;
+	part->blocks[part->current_block].free_sectors--;
+	part->total_free_sectors--;
+
+	if(old_addr != -1) {
+		int block, offset;
+		u16 old, del = __cpu_to_le16(SECTOR_DELETED);
+
+		block = old_addr / part->block_size;
+		offset = (old_addr % part->block_size) / SECTOR_SIZE - 
+			part->header_sectors_per_block;
+
+		mtd_addr = part->blocks[block].offset +
+				(HEADER_MAP_OFFSET + offset) * sizeof(u16);
+		rc = part->mbd.mtd->read(part->mbd.mtd, mtd_addr,
+				sizeof(old), &retlen, (u_char*)&old);
+
+		if(retlen != sizeof(old))
+			rc = -EIO;
+
+		if(rc) {
+			printk(KERN_WARNING PREFIX "error reading '%s' at "
+				"0x%lx\n", part->mbd.mtd->name, mtd_addr);
+			if(rc) goto err_out;
+		}
+		if(old != s) {
+			printk(KERN_NOTICE PREFIX "index of '%s' corrupt, old "
+				"entry of %x is %x (addr was %lx, now %lx)\n",
+				part->mbd.mtd->name, old, s, old_addr, addr);
+		}
+
+		mtd_addr = part->blocks[block].offset +
+			(HEADER_MAP_OFFSET + offset) * sizeof(u16);
+		rc = part->mbd.mtd->write(part->mbd.mtd, mtd_addr,
+			sizeof(del), &retlen, (u_char*)&del);
+
+		if(retlen != sizeof(del))
+			rc = -EIO;
+
+		if(rc) {
+			printk(KERN_WARNING PREFIX "error writing '%s' at "
+				"0x%lx\n", part->mbd.mtd->name, mtd_addr);
+			if(rc) goto err_out;
+		}
+		if(block == part->current_block) {
+			part->header_cache[offset + HEADER_MAP_OFFSET] = del;
+		}
+		part->blocks[block].used_sectors--;
+
+		if(!part->blocks[block].used_sectors &&
+		   !part->blocks[block].free_sectors) {
+
+			part->blocks[block].state = BLOCK_PREPARED;
+
+			erase_block(part, block);
+		}
+	}
+
+err_out:
+	return rc;
+}
+
+static int ebftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
+{
+	struct partition_t *part = (struct partition_t*)dev;
+
+	geo->heads = 1;
+	geo->sectors = part->data_sectors_per_block;
+	geo->cylinders = part->total_blocks - 1;
+
+	return 0;
+}
+
+static void ebftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct partition_t *partition;
+
+	partition = kmalloc(sizeof(struct partition_t), GFP_KERNEL);
+		
+	if (!partition) {
+		printk(KERN_WARNING PREFIX "out of memory to scan '%s'\n",
+		       mtd->name);
+		return;
+	}    
+
+	memset(partition, 0, sizeof(struct partition_t));
+
+	partition->mbd.mtd = mtd;
+
+	if(block_size) {
+		partition->block_size = block_size;
+	}
+	else {
+		if(!mtd->erasesize) {
+			printk(KERN_NOTICE PREFIX "please provide block_size");
+			return;
+		}
+		else {
+			partition->block_size = mtd->erasesize;
+		}
+	}
+
+	if (scan_header(partition) == 0) {
+		
+		partition->mbd.size = SECTOR_SIZE * partition->sector_count;
+		partition->mbd.blksize = SECTOR_SIZE;
+		partition->mbd.tr = tr;
+		partition->mbd.devnum = -1;
+		if(!(mtd->flags & MTD_WRITEABLE)) {
+			partition->mbd.readonly = 1;
+		}
+		else if(partition->reserved_block == -1) {
+			printk(KERN_NOTICE PREFIX "'%s': no empty erase unit "
+				"found, setting read-only\n",
+				partition->mbd.mtd->name);
+	
+			partition->mbd.readonly = 1;
+		}
+
+
+		printk(KERN_INFO PREFIX "name: '%s' type: %d flags %x\n",
+				mtd->name, mtd->type, mtd->flags);
+
+		if(!add_mtd_blktrans_dev((void *)partition)) {
+			return;
+		}
+	} 
+
+	kfree(partition);
+}
+
+static void ebftl_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	struct partition_t *part = (struct partition_t*)dev;
+#ifdef EBFTL_DEBUG
+	int i;
+
+	for (i=0; i<part->total_blocks; i++) {
+		printk(KERN_NOTICE PREFIX "'%s': erase unit #%02d: %d erases\n",
+				part->mbd.mtd->name, i, part->blocks[i].erases);
+	}
+#endif
+
+	del_mtd_blktrans_dev(dev);
+	vfree(part->sector_map);
+	kfree(part->header_cache);
+	kfree(part->blocks);
+	kfree(part);
+
+}
+
+struct mtd_blktrans_ops ebftl_tr = {
+	.name		= "embiosftl",
+	.major		= FTL_MAJOR,
+	.part_bits	= PART_BITS,
+	.readsect	= ebftl_readsect,
+	.writesect	= ebftl_writesect, 
+	.getgeo		= ebftl_getgeo,
+	.add_mtd	= ebftl_add_mtd,
+	.remove_dev	= ebftl_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+static int __init init_ebftl(void)
+{
+	return register_mtd_blktrans(&ebftl_tr);
+}
+
+static void __exit cleanup_ebftl(void)
+{
+	deregister_mtd_blktrans(&ebftl_tr);
+}
+
+module_init(init_ebftl);
+module_exit(cleanup_ebftl);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Sean Young <sean@mess.org>");
+MODULE_DESCRIPTION("Support code for RFD Flash Translation Layer, "
+		"used by General Software's Embedded BIOS");
+
diff -urpN linux-2.6.9/drivers/mtd/Kconfig /usr/src/linux-2.6.9/drivers/mtd/Kconfig
--- linux-2.6.9/drivers/mtd/Kconfig	2005-06-12 15:56:16.000000000 +0200
+++ /usr/src/linux-2.6.9/drivers/mtd/Kconfig	2005-06-12 14:16:09.000000000 +0200
@@ -253,6 +253,15 @@ config INFTL
 	  permitted to copy, modify and distribute the code as you wish. Just
 	  not use it.
 
+config EMBIOSFTL
+        tristate "Embedded BIOS FTL (Flash Translation Layer) support"
+	depends on MTD
+	---help---
+	  This provides support for the Flash Translation Layer as used
+	  by the Embedded BIOS of General Software. There is a blurb at
+
+		http://www.gensw.com/pages/prod/bios/rfd.htm
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff -urpN linux-2.6.9/drivers/mtd/Makefile /usr/src/linux-2.6.9/drivers/mtd/Makefile
--- linux-2.6.9/drivers/mtd/Makefile	2004-10-18 23:53:51.000000000 +0200
+++ /usr/src/linux-2.6.9/drivers/mtd/Makefile	2005-06-12 14:15:56.000000000 +0200
@@ -20,6 +20,7 @@ obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_r
 obj-$(CONFIG_FTL)		+= ftl.o mtd_blkdevs.o
 obj-$(CONFIG_NFTL)		+= nftl.o mtd_blkdevs.o
 obj-$(CONFIG_INFTL)		+= inftl.o mtd_blkdevs.o
+obj-$(CONFIG_EMBIOSFTL)		+= embiosftl.o mtd_blkdevs.o
 
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
