Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DiJk2-0006oF-BI
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 18:18:45 -0400
Date: Wed, 15 Jun 2005 00:18:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sean Young <sean@mess.org>
Message-ID: <20050614221844.GB17547@wohnheim.fh-wedel.de>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050614192809.GA46302@atlantis.8hz.com>
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

On Tue, 14 June 2005 21:28:09 +0200, Sean Young wrote:
> 
> Thank you, I've applied your comments. Indeed it is much nicer now. 

I have to agree.  Nice work.

> AFAICS General Software makes no mention of applicable patents. I am not 
> aware of any patents which are infringed.

That's fine.

> I've renamed it to `rfd' as `/dev/rfda' is much nicer than
> `/dev/embiosftla', IMHO. Documentation refers to the RFD anyway, not to
> the product which uses it (which isn't just the bios anyway).

Yep, makes sense.

> dwmw2 pointed out that a major block number needs to be allocated, for
> which I've sent a request to device@lanana.org. No response so far.

Just keep your current one for now.  Fair enough.

> Any ideas for how it can be improved or reasons why it shouldn't be
> commited to cvs?

Next round of comments...

> diff -urpN linux-2.6.9/drivers/mtd/rfdftl.c /usr/src/linux-2.6.9/drivers/mtd/rfdftl.c
> --- linux-2.6.9/drivers/mtd/rfdftl.c	1970-01-01 01:00:00.000000000 +0100
> +++ /usr/src/linux-2.6.9/drivers/mtd/rfdftl.c	2005-06-14 20:41:34.000000000 +0200
> @@ -0,0 +1,787 @@
> +/*
> + * rfdftl.c -- resident flash disk (flash translation layer)
> + *
> + * Copyright (C) 2005  Sean Young <sean@mess.org>
> + *
> + * $Id: rfdftl.c,v 1.0 2005/06/14 15:33:26 sean Exp $
> + *
> + * This type of flash translation layer (FTL) is used by the Embedded BIOS
> + * by General Software. It is known as the Resident Flash Disk (RFD), see:
> + *
> + * 	http://www.gensw.com/pages/prod/bios/rfd.htm
> + *
> + * based on ftl.c
> + */
> +
> +#include <linux/hdreg.h>
> +#include <linux/init.h>
> +#include <linux/mtd/blktrans.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/vmalloc.h>
> +
> +#include <asm/types.h>
> +
> +static int block_size = 0;
> +MODULE_PARM(block_size, "i");

/* DEPRECATED: Do not use. */
#define MODULE_PARM(var,type)

Better change this to module_param_call() or one of its relatives.

> +#define PREFIX "rfdftl: "

I personally hate words without any vowels.  Ths s jst hrd t rd.  You
have to decide, though.

> +/* Major device # for FTL device */
> +
> +/* A request for this major has been sent to device@lanana.org */
> +#ifndef RFDFTL_MAJOR
> +#define RFDFTL_MAJOR       	95	
> +#endif
> +
> +/* Maximum number of partitions in an FTL region */
> +#define PART_BITS		4
> +
> +/* An erase unit should start with this value */
> +#define RFD_MAGIC		0x9193
> +
> +/* the second value is 0xffff or 0xffc8; function unknown */
> +
> +/* the third value is always 0xffff, ignored */
> +
> +/* next is an array of mapping for each corresponding sector */
> +#define HEADER_MAP_OFFSET	3
> +#define SECTOR_DELETED		0x0000
> +#define SECTOR_ZERO		0xfffe
> +#define SECTOR_FREE		0xffff
> +
> +#define SECTOR_SIZE		512
> +
> +struct block {
> +	enum {
> +		BLOCK_OK,
> +		BLOCK_ERASING,
> +		BLOCK_ERASED,
> +		BLOCK_FAILED
> +	} state;
> +	int free_sectors;
> +	int used_sectors;
> +	int erases;
> +	u_long offset;
> +};
> +
> +struct partition {
> +	struct mtd_blktrans_dev mbd;
> +
> +	u_int block_size;		/* size of erase unit */
> +	u_int total_blocks;		/* number of erase units */
> +	u_int header_sectors_per_block;	/* header sectors in erase unit */
> +	u_int data_sectors_per_block;	/* data sectors in erase unit */
> +	u_int sector_count;		/* sectors in translated disk */
> +	u_int header_size;		/* bytes in header sector */
> +	int reserved_block;		/* block next up for reclaim */
> +	int current_block;		/* block to write to */
> +	u16 *header_cache;		/* cached header */
> +
> +	int is_reclaiming;
> +	u_long *sector_map;
> +	struct block *blocks;
> +};
> +
> +static int rfdftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf);
> +static int build_block_map(struct partition *part, int block_no);
> +static void erase_callback(struct erase_info *erase);
> +static int move_block_contents(struct partition *part, int block_no, u_long *old_sector);
> +static int mark_sector_removed(struct partition *part, u_long old_sector);

Function prototypes for static functions don't have many friends in
the kernel community.  Usually you can rearrange the order below and
then remove the prototypes.

> +static int scan_header(struct partition *part)
> +{
> +	int sectors_per_block;
> +	int i, rc = -ENOMEM;
> +	int blocks_found;
> +	size_t retlen;
> +
> +	sectors_per_block = part->block_size / SECTOR_SIZE;
> +	part->total_blocks = part->mbd.mtd->size / part->block_size;
> +
> +	/* each erase block has three bytes header, followed by the map */
> +	part->header_sectors_per_block = 
> +		((HEADER_MAP_OFFSET + sectors_per_block) * 
> +		 sizeof(u16) + SECTOR_SIZE - 1) / SECTOR_SIZE;
> +	part->data_sectors_per_block = sectors_per_block - 
> +				part->header_sectors_per_block;
> +
> +	part->header_size = (HEADER_MAP_OFFSET + 
> +				part->data_sectors_per_block) * sizeof(u16);
> +	part->sector_count = part->data_sectors_per_block * 
> +				(part->total_blocks - 1);
> +	part->current_block = -1;
> +	part->reserved_block = -1;
> +	part->is_reclaiming = 0;
> +
> +	part->header_cache = kmalloc(part->header_size, GFP_KERNEL);
> +	if (!part->header_cache)
> +		goto err4;
> +
> +	part->blocks = kcalloc(part->total_blocks, sizeof(struct block), 
> +			GFP_KERNEL);
> +	if (!part->blocks)
> +		goto err3;
> +
> +	part->sector_map = vmalloc(part->sector_count * sizeof(u_long));
> +	if (!part->sector_map) {
> +		printk (KERN_ERR PREFIX "'%s': unable to allocate memory for "
> +			"sector map", part->mbd.mtd->name);
> +		goto err2;
> +	}
> +
> +	for (i=0; i<part->sector_count; i++) 
> +		part->sector_map[i] = -1;
> +
> +	for (i=0, blocks_found= 0; i<part->total_blocks; i++) {
> +		rc = part->mbd.mtd->read(part->mbd.mtd, 
> +				i * part->block_size, part->header_size,
> +				&retlen, (u_char*)part->header_cache);
> +
> +		if (!rc && retlen != part->header_size)
> +			rc = -EIO;
> +
> +		if (rc) 
> +			goto err;
> +
> +		if (!build_block_map(part, i))
> +			blocks_found++;
> +	}
> +
> +	if (blocks_found == 0) {
> +		printk(KERN_NOTICE PREFIX "no FTL header found for '%s'.\n",
> +				part->mbd.mtd->name);
> +		rc = -ENOENT;
> +		goto err;
> +	}
> +	
> +	return 0;
> +
> +err:
> +	vfree(part->sector_map);
> +err2:
> +	kfree(part->header_cache);
> +err3:
> +	kfree(part->blocks);
> +err4:

Both vfree and kfree are happy with argument being NULL.  Looking at
the only caller of this function, part->everything is NULL when this
is called.  So you can remove all targets except err and change the
gotos.

> +	return rc;
> +}
> +
> +static int build_block_map(struct partition *part, int block_no)
> +{
> +	struct block *block = &part->blocks[block_no];
> +	int i;
> +	
> +	block->offset = part->block_size * block_no;
> +
> +	if (le16_to_cpu(part->header_cache[0]) != RFD_MAGIC) {
> +		block->state = BLOCK_ERASED; /* assumption */
> +		block->free_sectors = part->data_sectors_per_block;
> +		part->reserved_block = block_no;
> +		return 1;
> +	}
> +
> +	block->state = BLOCK_OK;
> +
> +	for (i=0; i<part->data_sectors_per_block; i++) {
> +		u16 entry;
> +		
> +		entry = le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]);
> +
> +		if (entry == SECTOR_DELETED)
> +			continue;
> +	
> +		if (entry == SECTOR_FREE) {
> +			block->free_sectors++;
> +			continue;
> +		}
> +
> +		if (entry == SECTOR_ZERO)
> +			entry = 0;
> +	
> +		if (entry >= part->sector_count) {
> +			printk(KERN_NOTICE PREFIX 
> +				"'%s': unit #%d: entry %d corrupt, "
> +				"sector %d out of range\n",
> +				part->mbd.mtd->name, block_no, i, entry);
> +			continue;
> +		}
> +
> +		if (part->sector_map[entry] != -1) {
> +			printk(KERN_NOTICE PREFIX 
> +				"'%s': unit #%d: entry %d corrupt, "
> +				"sector %d linked twice\n",
> +				part->mbd.mtd->name, block_no, i, entry);
> +			continue;
> +		}
> +
> +		part->sector_map[entry] = block->offset + 
> +			(i + part->header_sectors_per_block) * SECTOR_SIZE;
> +
> +		block->used_sectors++;
> +	}
> +
> +	if (block->free_sectors == part->data_sectors_per_block)
> +		part->reserved_block = block_no;
> +
> +	return 0;
> +}
> +
> +static int rfdftl_readsect(struct mtd_blktrans_dev *dev, u_long sector, char *buf)
> +{
> +	struct partition *part= (struct partition*)dev;
> +	u_long addr;
> +	size_t retlen;
> +	int rc;
> +	
> +	if (sector >= part->sector_count)
> +		return -EIO;
> +
> +	addr = part->sector_map[sector];
> +	if (addr != -1) {
> +		rc = part->mbd.mtd->read(part->mbd.mtd, addr, SECTOR_SIZE,
> +						&retlen, (u_char*)buf);
> +		if (!rc && retlen != SECTOR_SIZE)
> +			rc = -EIO;
> +
> +	    	if (rc) {
> +			printk(KERN_WARNING PREFIX "error reading '%s' at "
> +				"0x%lx\n", part->mbd.mtd->name, addr);
> +			return rc;
> +		}
> +	} else
> +		memset(buf, 0, SECTOR_SIZE);
> +	
> +	return 0;
> +} 
> +
> +static int erase_block(struct partition *part, int block)
> +{
> +	struct erase_info *erase;
> +	int rc = -ENOMEM;
> +
> +	erase = kmalloc(sizeof(struct erase_info), GFP_KERNEL);
> +	if (!erase)
> +		goto err;
> +
> +	erase->mtd = part->mbd.mtd;
> +	erase->callback = erase_callback;
> +	erase->addr = part->blocks[block].offset;
> +	erase->len = part->block_size;
> +	erase->priv = (u_long)part;
> +
> +	part->blocks[block].state = BLOCK_ERASING;
> +	part->blocks[block].free_sectors = 0;
> +
> +	rc = part->mbd.mtd->erase(part->mbd.mtd, erase);
> +
> +	if (rc) {
> +		printk(KERN_WARNING PREFIX "erase of region %x,%x on '%s' "
> +				"failed\n", erase->addr, erase->len,
> +				part->mbd.mtd->name);
> +		kfree(erase);
> +	}
> +
> +err:
> +	return rc;
> +}
> +
> +static void erase_callback(struct erase_info *erase)
> +{
> +	struct partition *part;
> +	int i;
> +
> +	part = (struct partition*)erase->priv;

This cast shouldn't exist.  Sadly, C doesn't support a truely opaque
data type that automatically casts to anything.  Would be a very
useful extension.

The rest of the code is very nice reading.  I cannot find any further
problems without actually using my brain and trying to understand it.
Considering the last few beers and the short night ahead of me, I'll
pass. :)

Hope I didn't create too many typos in this state.

Jörn

-- 
He who knows others is wise.
He who knows himself is enlightened.
-- Lao Tsu
