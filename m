Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CnNyu-0005CX-63
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2005 16:18:48 -0500
Received: from wohnheim.fh-wedel.de ([213.39.233.138]:52026)
	by moskovskaya.fh-wedel.de with esmtp (Exim 4.34) id 1CnNyr-00065w-De
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2005 22:18:41 +0100
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.35 #1 (Debian))
	id 1CnNys-0005p6-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Jan 2005 22:18:42 +0100
Date: Sat, 8 Jan 2005 22:18:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050108211842.GA17176@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: jffs2 simplifications
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After my employer kindly suggested I could take a week off, I finally
know roughly what jffs2 is doing behind the scenes.  Fun.

29 patches later, it does look slightly different, though.  The
patches were created pretty carelessly and have introduced at least
one new bug.  But they have imo simplified the code to a good deal, so
something similar with a little more care might be a good idea.  I'm
up for discussion.

As an example, scan.c used to be really horrible (and contained one or
two bugs).  After removing all the printk()s, I was able to see what
the code was doing.  Then quite a few obvious changes were possible.
Some things were simple changed to my personal style.  And finally,
the data reading code was abstracted out of the scanning code, which
resulted in about 120 lines less code.

Currently, the scanning should be substantially slower, but getting
back to the old speed should be possible in less than 120 lines.


So: Do people want something like this for jffs3?  If noone cares, I
will get back to my old behaviour of ignoring it.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius

/*
 * JFFS2 -- Journalling Flash File System, Version 2.
 *
 * Copyright (C) 2001-2003	Red Hat, Inc.
 * Copyright (C) 2005		Jörn Engel <joern@wh.fh-wedel.de>
 *
 * Created by David Woodhouse <dwmw2@redhat.com>
 * Partially rewritten by Jörn Engel
 *
 * For licensing information, see the file 'LICENCE' in this directory.
 *
 * $Id: scan.c,v 1.112 2004/09/12 09:56:13 gleixner Exp $
 */
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/mtd/mtd.h>
#include <linux/pagemap.h>
#include <linux/crc32.h>
#include <linux/compiler.h>
#include "jffs2.h"

#define EMPTY_SCAN_SIZE 1024

static uint32_t dirty_space(struct jffs2_sb *c, struct jffs2_eraseblock *jeb,
		uint32_t unpadded_space)
{
	uint32_t ret = PAD(unpadded_space);
	c->free_size -= ret;	c->dirty_size += ret;
	jeb->free_size -= ret;	jeb->dirty_size += ret;
	return ret;
}

static uint32_t used_space(struct jffs2_sb *c, struct jffs2_eraseblock *jeb,
		uint32_t unpadded_space)
{
	uint32_t ret = PAD(unpadded_space);
	c->free_size -= ret;	c->used_size += ret;
	jeb->free_size -= ret;	jeb->used_size += ret;
	return ret;
}

#define UNCHECKED_SPACE(x) do { typeof(x) _x = (x); \
		c->free_size -= _x; c->unchecked_size += _x; \
		jeb->free_size -= _x; jeb->unchecked_size += _x; \
		}while(0)

#define BLK_STATE_ALLFF		0
#define BLK_STATE_CLEAN		1
#define BLK_STATE_PARTDIRTY	2
#define BLK_STATE_CLEANMARKER	3
#define BLK_STATE_ALLDIRTY	4
#define BLK_STATE_BADBLOCK	5


/**
 * This function is enough to remove all the data reading mess from
 * jffs2_scan_eraseblock().  Right now it's still horribly stupid and
 * causes lots of data to be read over and over.  With a little more
 * logic and some accounting, it can just memmove() still-valid data.
 * Memory bandwidth on a buffer that should fit into L1 can hardly be
 * an issue.
 */
#define JFFS2_MAP_SIZE	\
	((uint32_t) PAGE_ALIGN(sizeof(union jffs2_node_union) + 4096))
static void *jffs2_map_buf[JFFS2_MAP_SIZE];
static void *jffs2_scan_map(struct jffs2_sb *c, uint32_t ofs)
{
	uint32_t len = min(c->flash_size-ofs, JFFS2_MAP_SIZE);
	int err = jffs2_flash_read_nonshort(c, ofs, len,
			jffs2_map_buf);
	if (err)
		return ERR_PTR(err);
	return jffs2_map_buf;
}


/**********/


static size_t jffs2_count_u32(void *buf, u32 val, size_t n)
{
	size_t ret = 0;
	while ((ret < n) && (*(u32*)(buf+ret) == val))
		ret += 4;
	return ret;
}


/**********/


static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb *c,
		uint32_t ino)
{
	struct jffs2_inode_cache *ic = jffs2_get_ino_cache(c, ino);
	if (ic)
		return ic;

	ic = jffs2_alloc_inode_cache();
	if (!ic)
		return NULL;

	if (ino > c->highest_ino)
		c->highest_ino = ino;

	memset(ic, 0, sizeof(*ic));

	ic->ino = ino;
	ic->nodes = (void*)ic;
	jffs2_add_ino_cache(c, ic);
	if (ino == 1)
		ic->nlink = 1;
	return ic;
}


/* FIXME, JE: With adler32, there is little point to postpone checksum
 * calculation, so do it immediatly.  This should simplify code and prevent
 * cache misses. */
/* These helper functions _must_ do the dirty/used space accounting. 
 * Returning an error will abort the mount - bad checksums etc. should just
 * mark the space as dirty.
 */
static int jffs2_scan_inode_node(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb, struct jffs2_raw_inode *ri,
		uint32_t ofs)
{
	struct jffs2_raw_node_ref *raw;
	struct jffs2_inode_cache *ic;
	uint32_t ino = je32_to_cpu(ri->ino);

	/* We do very little here now. Just check the ino# to which we should
	 * attribute this node; we can do all the CRC checking etc. later.
	 * There's a tradeoff here -- we used to scan the flash once only,
	 * reading everything we want from it into memory, then building all
	 * our in-core data structures and freeing the extra information. Now
	 * we allow the first part of the mount to complete a lot quicker, but
	 * we have to go _back_ to the flash in order to finish the CRC
	 * checking, etc.  Which means that the _full_ amount of time to get to
	 * proper write mode with GC operational may actually be _longer_ than
	 * before. Sucks to be me. */

	raw = jffs2_alloc_raw_node_ref();
	if (!raw)
		return -ENOMEM;

	ic = jffs2_get_ino_cache(c, ino);
	if (!ic) {
		/* Inocache get failed. Either we read a bogus ino# or it's
		 * just genuinely the first node we found for this inode. Do
		 * a CRC check to protect against the former case */
		uint32_t crc = crc32(0, ri, sizeof(*ri)-8);

		if (crc != je32_to_cpu(ri->node_crc)) {
			/* We believe totlen because the CRC on the node
			 * _header_ was OK, just the node itself failed. */
			dirty_space(c, jeb, je32_to_cpu(ri->totlen));
			jffs2_free_raw_node_ref(raw);
			return 0;
		}
		ic = jffs2_scan_make_ino_cache(c, ino);
		if (!ic) {
			jffs2_free_raw_node_ref(raw);
			return -ENOMEM;
		}
	}

	/* Wheee. It worked */

	raw->flash_offset = (jeb->offset + ofs) | REF_UNCHECKED;
	raw->__totlen = PAD(je32_to_cpu(ri->totlen));
	raw->next_phys = NULL;
	raw->next_in_ino = ic->nodes;

	ic->nodes = raw;
	if (!jeb->first_node)
		jeb->first_node = raw;
	if (jeb->last_node)
		jeb->last_node->next_phys = raw;
	jeb->last_node = raw;

	UNCHECKED_SPACE(PAD(je32_to_cpu(ri->totlen)));
	return 0;
}


static int jffs2_scan_dirent_node(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb, struct jffs2_raw_dirent *rd,
		uint32_t ofs)
{
	struct jffs2_full_dirent *fd;
	struct jffs2_raw_node_ref *raw;
	struct jffs2_inode_cache *ic;
	uint32_t crc;

	/* We don't get here unless the node is still valid, so we don't have to
	   mask in the ACCURATE bit any more. */
	crc = crc32(0, rd, sizeof(*rd)-8);

	if (crc != je32_to_cpu(rd->node_crc)) {
		/* We believe totlen because the CRC on the node _header_ was
		 * OK, just the node itself failed. */
		dirty_space(c, jeb, je32_to_cpu(rd->totlen));
		return 0;
	}
	crc = crc32(0, rd->name, rd->nsize);
	if (crc != je32_to_cpu(rd->name_crc)) {
		dirty_space(c, jeb, je32_to_cpu(rd->totlen));
		return 0;
	}

	fd = jffs2_alloc_full_dirent(rd->nsize+1);
	if (!fd)
		return -ENOMEM;

	memcpy(&fd->name, rd->name, rd->nsize);
	fd->name[rd->nsize] = 0;

	raw = jffs2_alloc_raw_node_ref();
	if (!raw) {
		jffs2_free_full_dirent(fd);
		return -ENOMEM;
	}
	ic = jffs2_scan_make_ino_cache(c, je32_to_cpu(rd->pino));
	if (!ic) {
		jffs2_free_full_dirent(fd);
		jffs2_free_raw_node_ref(raw);
		return -ENOMEM;
	}
	
	raw->__totlen = PAD(je32_to_cpu(rd->totlen));
	raw->flash_offset = ofs | REF_PRISTINE;
	raw->next_phys = NULL;
	raw->next_in_ino = ic->nodes;
	ic->nodes = raw;
	if (!jeb->first_node)
		jeb->first_node = raw;
	if (jeb->last_node)
		jeb->last_node->next_phys = raw;
	jeb->last_node = raw;

	fd->raw = raw;
	fd->next = NULL;
	fd->version = je32_to_cpu(rd->version);
	fd->ino = je32_to_cpu(rd->ino);
	fd->nhash = full_name_hash(fd->name, rd->nsize);
	fd->type = rd->type;
	used_space(c, jeb, je32_to_cpu(rd->totlen));
	jffs2_add_fd_to_list(c, fd, &ic->scan_dents);

	return 0;
}


static int cleanmarkerfound;
static int jffs2_nand_initial_scan(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb)
{
#ifdef CONFIG_JFFS2_FS_NAND
	int ret;

	if (!jffs2_cleanmarker_oob(c))
		return 0;

	ret = jffs2_check_nand_cleanmarker(c, jeb);
	switch (ret) {
	case 0: cleanmarkerfound = 1; return 0;
	case 1: return 0;
	case 2: return BLK_STATE_BADBLOCK;
	case 3: return BLK_STATE_ALLDIRTY; /* Block has failed to erase min. once */
	default: return ret;
	}
#endif
	return 0;
}


static int jffs2_nand_ff_scan(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb)
{
#ifdef CONFIG_JFFS2_FS_NAND
	int ret = jffs2_check_oob_empty(c, jeb, cleanmarkerfound);
	switch (ret) {
	case 0: return cleanmarkerfound ? BLK_STATE_CLEANMARKER : BLK_STATE_ALLFF;
	case 1: return BLK_STATE_ALLDIRTY;
	default: return ret;
	}
#endif
	return BLK_STATE_ALLFF;
}


static inline int min_free(struct jffs2_sb *c)
{
	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
#ifdef CONFIG_JFFS2_FS_NAND
	if (!jffs2_can_mark_obsolete(c) && min < c->wbuf_pagesize)
		return c->wbuf_pagesize;
#endif
	return min;

}


static ssize_t jffs2_count_empty_space(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb, uint32_t ofs, uint32_t max)
{
	ssize_t len, ff, ret = 0;
	void *buf = jffs2_scan_map(c, jeb->offset+ofs);
	if (IS_ERR(buf))
		return PTR_ERR(buf);

	if (max)
		return jffs2_count_u32(buf, 0xffffffff, max);

	do {
		len = min(c->sector_size - ofs, JFFS2_MAP_SIZE);
		ff = jffs2_count_u32(buf, 0xffffffff, len);
		ret += ff;
		ofs += len;
		buf = jffs2_scan_map(c, jeb->offset+ofs);
		if (IS_ERR(buf))
			return PTR_ERR(buf);
	} while ((ff == len) && (ofs < c->sector_size));

	return ret;
}


static int jffs2_valid_header_crc(struct jffs2_unknown_node *node)
{
	struct jffs2_unknown_node crcnode;
	uint32_t hdr_crc;

	crcnode.magic = node->magic;
	crcnode.nodetype = cpu_to_je16( je16_to_cpu(node->nodetype)
			| JFFS2_NODE_ACCURATE);
	crcnode.totlen = node->totlen;
	hdr_crc = crc32(0, &crcnode, sizeof(crcnode)-4);

	return hdr_crc == je32_to_cpu(node->hdr_crc);
}


static int jffs2_scan_eraseblock(struct jffs2_sb *c,
		struct jffs2_eraseblock *jeb)
{
	ssize_t ofs = 0;
	int ret;

	ret = jffs2_nand_initial_scan(c, jeb);
	if (ret)
		return ret;

	ofs = jffs2_count_empty_space(c, jeb, 0, EMPTY_SCAN_SIZE);
	if (ofs < 0)
		return ofs;

	if (ofs == EMPTY_SCAN_SIZE)
		return jffs2_nand_ff_scan(c, jeb);
	if (ofs)
		dirty_space(c, jeb, ofs);

	while (ofs = PAD(ofs), ofs < c->sector_size) {
		struct jffs2_unknown_node *node;
		uint32_t empty;

		cond_resched();

		/* only short space remaining? */
		if (c->sector_size - ofs < sizeof(*node)) {
			dirty_space(c, jeb, c->sector_size - ofs);
			break;
		}

		empty = jffs2_count_empty_space(c, jeb, ofs, 0);
		if (empty < 0)
			return empty;

		/* remaining space empty? */
		if (empty == c->sector_size - ofs)
			break;
		/* range of FFs between other data? */
		if (empty) {
			dirty_space(c, jeb, empty);
			ofs += empty;
			continue;
		}

		node = jffs2_scan_map(c, jeb->offset+ofs);
		if (IS_ERR(node))
			return PTR_ERR(node);

		/* FIXME: why? */
		if (((je16_to_cpu(node->magic) == KSAMTIB_CIGAM_2SFFJ) && !ofs)
		  || (je16_to_cpu(node->magic) == JFFS2_DIRTY_BITMASK)
		  || (je16_to_cpu(node->magic) == JFFS2_OLD_MAGIC_BITMASK)
		  || (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK))
			goto dirty4;

		if (!jffs2_valid_header_crc(node))
			goto dirty4;

		/* node extends beyond erase block? */
		if (c->sector_size - ofs < je32_to_cpu(node->totlen))
			goto dirty4;

		/* obsoleted node? */
		if (!(je16_to_cpu(node->nodetype) & JFFS2_NODE_ACCURATE)) {
			ofs += dirty_space(c, jeb, je32_to_cpu(node->totlen));
			continue;
		}

		switch (je16_to_cpu(node->nodetype)) {
		case JFFS2_NODETYPE_INODE:
			ret = jffs2_scan_inode_node(c, jeb, (void *)node, ofs);
			if (ret)
				return ret;
			ofs += PAD(je32_to_cpu(node->totlen));
			break;
		case JFFS2_NODETYPE_DIRENT: 
			ret = jffs2_scan_dirent_node(c, jeb, (void *)node, ofs);
			if (ret)
				return ret;
			ofs += PAD(je32_to_cpu(node->totlen));
			break;
		case JFFS2_NODETYPE_PADDING:
			ofs += dirty_space(c, jeb, je32_to_cpu(node->totlen));
			break;
		case JFFS2_NODETYPE_CLEANMARKER:
			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
				ofs += dirty_space(c, jeb, sizeof(*node));
			} else if (jeb->first_node) { /* FIXME: why? */
				ofs += dirty_space(c, jeb, sizeof(*node));
			} else { /* FIXME: check again */
				struct jffs2_raw_node_ref *marker_ref;
				marker_ref = jffs2_alloc_raw_node_ref();
				if (!marker_ref)
					return -ENOMEM;

				marker_ref->next_in_ino = NULL;
				marker_ref->next_phys = NULL;
				marker_ref->flash_offset = ofs | REF_NORMAL;
				marker_ref->__totlen = c->cleanmarker_size;
				jeb->first_node = jeb->last_node = marker_ref;

				ofs += used_space(c, jeb, c->cleanmarker_size);
			}
			break;
		default:
			switch (je16_to_cpu(node->nodetype)&JFFS2_COMPAT_MASK) {
			case JFFS2_FEATURE_ROCOMPAT:
				c->flags |= JFFS2_SB_FLAG_RO;
				if (!(jffs2_is_readonly(c)))
					return -EROFS;
				ofs += dirty_space(c, jeb,
						je32_to_cpu(node->totlen));
				break;
			case JFFS2_FEATURE_INCOMPAT:
				return -EINVAL;
			case JFFS2_FEATURE_RWCOMPAT_DELETE:
				ofs += dirty_space(c, jeb,
						je32_to_cpu(node->totlen));
				break;
			case JFFS2_FEATURE_RWCOMPAT_COPY:
				ofs += used_space(c, jeb,
						je32_to_cpu(node->totlen));
				break;
			}
		}

		continue;
dirty4:
		ofs += dirty_space(c, jeb, 4);
		continue;
	}

	/* mark_node_obsolete can add to wasted !! */
	if (jeb->wasted_size) { /* FIXME: why? */
		jeb->dirty_size += jeb->wasted_size;
		c->dirty_size += jeb->wasted_size;
		c->wasted_size -= jeb->wasted_size;
		jeb->wasted_size = 0;
	}

	if ((jeb->used_size + jeb->unchecked_size) == PAD(c->cleanmarker_size)
			&& !jeb->dirty_size 
			&& (!jeb->first_node || !jeb->first_node->next_in_ino))
		return BLK_STATE_CLEANMARKER;

	if (!ISDIRTY(c->sector_size - (jeb->used_size + jeb->unchecked_size))) {
		c->dirty_size -= jeb->dirty_size;
		c->wasted_size += jeb->dirty_size;
		jeb->wasted_size += jeb->dirty_size;
		jeb->dirty_size = 0;
		return BLK_STATE_CLEAN;
	}

	if (jeb->used_size || jeb->unchecked_size)
		return BLK_STATE_PARTDIRTY;

	return BLK_STATE_ALLDIRTY;
}


/* FIXME, JE: still lacks a proof-reading session */
int jffs2_scan_medium(struct jffs2_sb *c)
{
	int i, ret;
	uint32_t empty_blocks = 0, bad_blocks = 0;

	for (i=0; i<c->nr_blocks; i++) {
		struct jffs2_eraseblock *jeb = &c->blocks[i];

		ret = jffs2_scan_eraseblock(c, jeb);
		if (ret < 0)
			return ret;

		ACCT_PARANOIA_CHECK(c, jeb);

		/* Now decide which list to put it on */
		switch(ret) {
		case BLK_STATE_ALLFF:
			/* 
			 * Empty block.   Since we can't be sure it 
			 * was entirely erased, we just queue it for erase
			 * again.  It will be marked as such when the erase
			 * is complete.  Meanwhile we still count it as empty
			 * for later checks.
			 */
			empty_blocks++;
			list_add(&jeb->list, &c->erase_pending_list);
			c->nr_erasing_blocks++;
			break;

		case BLK_STATE_CLEANMARKER:
			/* Only a CLEANMARKER node is valid */
			if (!jeb->dirty_size) {
				/* It's actually free */
				list_add(&jeb->list, &c->free_list);
				c->nr_free_blocks++;
			} else {
				/* Dirt */
				list_add(&jeb->list, &c->erase_pending_list);
				c->nr_erasing_blocks++;
			}
			break;

		case BLK_STATE_CLEAN:
                        /* Full (or almost full) of clean data. Clean list */
                        list_add(&jeb->list, &c->clean_list);
			break;

		case BLK_STATE_PARTDIRTY:
                        /* Some data, but not full. Dirty list. */
                        /* Except that we want to remember the block with most
			 * free space, and stick it in the 'nextblock' position
			 * to start writing to it.  Later when we do snapshots,
			 * this must be the most recent block, not the one with
			 * most free space.
                         */
                        if (jeb->free_size > min_free(c) && 
			    (!c->nextblock || c->nextblock->free_size < jeb->free_size)) {
                                /* Better candidate for the next writes to go
				 * to */
                                if (c->nextblock) {
					c->nextblock->dirty_size += c->nextblock->free_size + c->nextblock->wasted_size;
					c->dirty_size += c->nextblock->free_size + c->nextblock->wasted_size;
					c->free_size -= c->nextblock->free_size;
					c->wasted_size -= c->nextblock->wasted_size;
					c->nextblock->free_size = c->nextblock->wasted_size = 0;
					if (VERYDIRTY(c, c->nextblock->dirty_size)) {
						list_add(&c->nextblock->list, &c->very_dirty_list);
					} else {
						list_add(&c->nextblock->list, &c->dirty_list);
					}
				}
                                c->nextblock = jeb;
                        } else {
				jeb->dirty_size += jeb->free_size + jeb->wasted_size;
				c->dirty_size += jeb->free_size + jeb->wasted_size;
				c->free_size -= jeb->free_size;
				c->wasted_size -= jeb->wasted_size;
				jeb->free_size = jeb->wasted_size = 0;
				if (VERYDIRTY(c, jeb->dirty_size)) {
					list_add(&jeb->list, &c->very_dirty_list);
				} else {
					list_add(&jeb->list, &c->dirty_list);
				}
                        }
			break;

		case BLK_STATE_ALLDIRTY:
			/* Nothing valid - not even a clean marker. Needs
			 * erasing. */
                        /* For now we just put it on the erasing list. We'll
			 * start the erases later */
                        list_add(&jeb->list, &c->erase_pending_list);
			c->nr_erasing_blocks++;
			break;
			
		case BLK_STATE_BADBLOCK:
                        list_add(&jeb->list, &c->bad_list);
			c->bad_size += c->sector_size;
			c->free_size -= c->sector_size;
			bad_blocks++;
			break;
		default:
			BUG();	
		}
	}
	
	/* Nextblock dirty is always seen as wasted, because we cannot recycle
	 * it now */
	if (c->nextblock && (c->nextblock->dirty_size)) {
		c->nextblock->wasted_size += c->nextblock->dirty_size;
		c->wasted_size += c->nextblock->dirty_size;
		c->dirty_size -= c->nextblock->dirty_size;
		c->nextblock->dirty_size = 0;
	}
#ifdef CONFIG_JFFS2_FS_NAND
	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
		/* If we're going to start writing into a block which already 
		   contains data, and the end of the data isn't page-aligned,
		   skip a little and align it. */

		uint32_t skip = c->nextblock->free_size & (c->wbuf_pagesize-1);

		c->nextblock->wasted_size += skip;
		c->wasted_size += skip;

		c->nextblock->free_size -= skip;
		c->free_size -= skip;
	}
#endif
	if (c->nr_erasing_blocks) {
		if ( !c->used_size && ((c->nr_free_blocks+empty_blocks+bad_blocks)!= c->nr_blocks || bad_blocks == c->nr_blocks) ) { 
			return -EIO;
		}
		jffs2_erase_pending_trigger(c);
	}
	return 0;
}
