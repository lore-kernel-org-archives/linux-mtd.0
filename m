Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SgBA-0001Yv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 16:48:28 +0100
Date: Thu, 11 Jul 2002 17:48:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: jffs-dev@axis.com
Subject: [patch 3] jffs2 for ecc nor
Message-ID: <20020711154828.GA28576@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Two things are needed:
- erase marker has to be n times 8 byte, which makes it 16.
- wbuf.c has to be used, with a tiny buffer of 8 byte.

The former is done in an ugly way. David already prepared the
infrastructure for a nicer one, but that is untested.

The latter pulls all necessary functionality from wbuf.c into
nor_wbuf.c and touches a couple of other spots. This is currently a
config option, but it would make some sense to make this generic, as
already two types of flashes use it.

Joern

diff -Naur jffs2/fs/jffs2/Makefile jffs2.new/fs/jffs2/Makefile
--- jffs2/fs/jffs2/Makefile	Wed Jun 19 18:56:23 2002
+++ jffs2.new/fs/jffs2/Makefile	Thu Jul 11 16:06:24 2002
@@ -19,6 +19,7 @@
 LINUX_OBJS-25	:= super.o
 
 NAND_OBJS-$(CONFIG_JFFS2_FS_NAND)	:= wbuf.o
+NAND_OBJS-$(CONFIG_JFFS2_FS_ECC_NOR)	:= nor_wbuf.o
 
 O_TARGET := jffs2.o
 
diff -Naur jffs2/fs/jffs2/erase.c jffs2.new/fs/jffs2/erase.c
--- jffs2/fs/jffs2/erase.c	Thu Jul 11 16:16:15 2002
+++ jffs2.new/fs/jffs2/erase.c	Thu Jul 11 16:11:08 2002
@@ -262,12 +262,21 @@
 
 void jffs2_mark_erased_blocks(struct jffs2_sb_info *c)
 {
+	static struct jffs2_cleanmarker marker = {
+		magic:		JFFS2_MAGIC_BITMASK,
+		nodetype:	JFFS2_NODETYPE_CLEANMARKER,
+		padding:	0x0add0add,
+		totlen:		sizeof(struct jffs2_cleanmarker)
+	};
 	struct jffs2_eraseblock *jeb;
 	struct jffs2_raw_node_ref *marker_ref = NULL;
 	unsigned char *ebuf;
 	size_t retlen;
 	int ret;
 
+	if (unlikely(!marker.hdr_crc))
+		marker.hdr_crc = crc32(0, &marker, sizeof(struct jffs2_unknown_node)-4);
+
 	spin_lock_bh(&c->erase_completion_lock);
 	while (!list_empty(&c->erase_complete_list)) {
 		jeb = list_entry(c->erase_complete_list.next, struct jffs2_eraseblock, list);
@@ -345,14 +354,6 @@
 			jeb->used_size = 0;
 			jeb->dirty_size = 0;
 		} else {
-			struct jffs2_unknown_node marker = {
-				magic:		JFFS2_MAGIC_BITMASK,
-				nodetype:	JFFS2_NODETYPE_CLEANMARKER,
-				totlen:		c->cleanmarker_size
-			};
-
-			marker.hdr_crc = crc32(0, &marker, sizeof(marker) - 4);
-
 			ret = jffs2_flash_write(c, jeb->offset, sizeof(marker), &retlen, (char *)&marker);
 			if (ret) {
 				printk(KERN_WARNING "Write clean marker to block at 0x%08x failed: %d\n",
@@ -368,7 +369,7 @@
 			marker_ref->next_in_ino = NULL;
 			marker_ref->next_phys = NULL;
 			marker_ref->flash_offset = jeb->offset;
-			marker_ref->totlen = PAD(marker.totlen);
+			marker_ref->totlen = PAD(sizeof(marker));
 			
 			jeb->first_node = jeb->last_node = marker_ref;
 			
diff -Naur jffs2/fs/jffs2/fs.c jffs2.new/fs/jffs2/fs.c
--- jffs2/fs/jffs2/fs.c	Wed Jul  3 15:23:51 2002
+++ jffs2.new/fs/jffs2/fs.c	Thu Jul 11 16:11:30 2002
@@ -266,7 +266,6 @@
 {
 	struct jffs2_sb_info *c;
 	struct inode *root_i;
-	int ret;
 
 	c = JFFS2_SB_INFO(sb);
 
@@ -285,26 +284,18 @@
 		       c->flash_size / c->sector_size);
 		return -EINVAL;
 	}
-
-	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
-
-	if (c->mtd->eccsize) {
-		c->cleanmarker_size = (c->cleanmarker_size-1) / c->mtd->eccsize
-			* c->mtd->eccsize + c->mtd->eccsize;
-	}
-
-	if (jffs2_cleanmarker_oob(c)) {
-		/* Cleanmarker is out-of-band, so inline size zero */
-		c->cleanmarker_size = 0;
-	}
-
+	
+	/*
+	 * TODO: Move the following code into a function, as it is
+	 * duplicated almost verbatim 
+	 */
 	if (c->mtd->type == MTD_NANDFLASH) {
 		/* Initialise write buffer */
 		c->wbuf_pagesize = c->mtd->oobblock;
 		c->wbuf_ofs = 0xFFFFFFFF;
 		c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
 		if (!c->wbuf)
-			return -ENOMEM;
+			goto out_mtd;
 
 		/* Initialize process for timed wbuf flush */
 		INIT_TQUEUE(&c->wbuf_task,(void*) jffs2_wbuf_process, (void *)c);
@@ -312,19 +303,24 @@
 		init_timer(&c->wbuf_timer);
 		c->wbuf_timer.function = jffs2_wbuf_timeout;
 		c->wbuf_timer.data = (unsigned long) c;
-	}
+	} else if ((c->mtd->type == MTD_NORFLASH) && (c->mtd->flags & MTD_ECC)) {
+		/* Initialise write buffer */
+		c->wbuf_pagesize = c->mtd->eccsize; /* FIXME: is this the correct field? */
+		c->wbuf_ofs = 0xFFFFFFFF;
+		c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+		if (!c->wbuf)
+			goto out_mtd;
 
-	c->inocache_list = kmalloc(INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
-	if (!c->inocache_list) {
-		ret = -ENOMEM;
-		goto out_wbuf;
+		/* Initialize process for timed wbuf flush */
+		INIT_TQUEUE(&c->wbuf_task,(void*) jffs2_wbuf_process, (void *)c);
+		/* Initialize timer for timed wbuf flush */
+		init_timer(&c->wbuf_timer);
+		c->wbuf_timer.function = jffs2_wbuf_timeout;
+		c->wbuf_timer.data = (unsigned long) c;
 	}
-	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
-
-	if ((ret = jffs2_do_mount_fs(c)))
-		goto out_inohash;
 
-	ret = -EINVAL;
+	if (jffs2_do_mount_fs(c))
+		goto out_mtd;
 
 	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): Getting root inode\n"));
 	root_i = iget(sb, 1);
@@ -354,10 +350,6 @@
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	kfree(c->blocks);
- out_inohash:
-	kfree(c->inocache_list);
- out_wbuf:
-	if (c->wbuf)
-		kfree(c->wbuf);
-	return ret;
+ out_mtd:
+	return -EINVAL;
 }
diff -Naur jffs2/fs/jffs2/nor_wbuf.c jffs2.new/fs/jffs2/nor_wbuf.c
--- jffs2/fs/jffs2/nor_wbuf.c	Thu Jan  1 01:00:00 1970
+++ jffs2.new/fs/jffs2/nor_wbuf.c	Thu Jul 11 16:15:10 2002
@@ -0,0 +1,477 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2001, 2002 Red Hat, Inc.
+ *
+ * Created by David Woodhouse <dwmw2@cambridge.redhat.com>
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/interrupt.h>
+#include "crc32.h"
+#include <linux/mtd/nand.h>
+#include "nodelist.h"
+
+#if 0 /* toggle this for debugging */
+#define CHECKPOINT(n) printk(__FUNCTION__ ": %d\n", n)
+#else
+#define CHECKPOINT(n)
+#endif
+
+/* max. erase failures before we mark a block bad */
+#define MAX_ERASE_FAILURES 	5
+
+/* two seconds timeout for timed wbuf-flushing */
+#define WBUF_FLUSH_TIMEOUT	HZ / 4
+
+static inline void jffs2_refile_wbuf_blocks(struct jffs2_sb_info *c)
+{
+	struct list_head *this, *next;
+	static int n;
+
+	CHECKPOINT(0);
+	if (list_empty(&c->erasable_pending_wbuf_list))
+		return;
+
+	list_for_each_safe(this, next, &c->erasable_pending_wbuf_list) {
+		struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+
+		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x from erasable_pending_wbuf_list...\n", jeb->offset));
+		list_del(this);
+		if ((jiffies + (n++)) & 127) {
+			/* Most of the time, we just erase it immediately. Otherwise we
+			   spend ages scanning it on mount, etc. */
+			D1(printk(KERN_DEBUG "...and adding to erase_pending_list\n"));
+			list_add_tail(&jeb->list, &c->erase_pending_list);
+			c->nr_erasing_blocks++;
+			jffs2_erase_pending_trigger(c);
+		} else {
+			/* Sometimes, however, we leave it elsewhere so it doesn't get
+			   immediately reused, and we spread the load a bit. */
+			D1(printk(KERN_DEBUG "...and adding to erasable_list\n"));
+			list_add_tail(&jeb->list, &c->erasable_list);
+		}
+	}
+}
+
+/* 
+*	Timed flushing of wbuf. If we have no consecutive write to wbuf, within	
+*	the specified time, we flush the contents with padding !
+*/
+void jffs2_wbuf_timeout (unsigned long data)
+{
+	struct jffs2_sb_info *c = (struct jffs2_sb_info *) data;
+	CHECKPOINT(0);
+	/* 
+	* Wake up the flush process, we need process context to have the right 
+	* to sleep on flash write
+	*/
+	D1(printk(KERN_DEBUG "jffs2_wbuf_timeout(): timer expired\n"));
+	schedule_task(&c->wbuf_task);
+}
+
+/*
+*	Process for timed wbuf flush
+*
+*	FIXME What happens, if we have a write failure there ????
+*/
+void jffs2_wbuf_process (void *data)
+{
+	struct jffs2_sb_info *c = (struct jffs2_sb_info *) data;	
+	
+	CHECKPOINT(0);
+	D1(printk(KERN_DEBUG "jffs2_wbuf_process() entered\n"));
+
+	if (!down_trylock(&c->alloc_sem)) {
+		D1(printk (KERN_DEBUG "jffs2_wbuf_process() alloc_sem got\n"));
+	
+		if(!c->nextblock || (c->nextblock->free_size < (c->wbuf_pagesize - c->wbuf_len)))
+			jffs2_flush_wbuf(c, 1); /* pad only */
+		else			
+			jffs2_flush_wbuf(c, 2); /* pad and adjust nextblock */
+		up(&c->alloc_sem);
+	} else {
+		D1(printk (KERN_DEBUG "jffs2_wbuf_process() alloc_sem already occupied\n"));
+	}	
+}
+
+
+/* Meaning of pad argument:
+   0: Do not pad. Probably pointless - we only ever use this when we can't pad anyway.
+   1: Pad, do not adjust nextblock free_size
+   2: Pad, adjust nextblock free_size
+*/
+int jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
+{
+	int ret;
+	size_t retlen;
+	
+	CHECKPOINT(0);
+	if (!down_trylock(&c->alloc_sem)) {
+		up(&c->alloc_sem);
+		printk(KERN_CRIT "jffs2_flush_wbuf() called with alloc_sem not locked!\n");
+		BUG();
+	}
+
+	/* delete a eventually started timed wbuf flush */
+	del_timer_sync(&c->wbuf_timer);
+
+	if(!c->wbuf || !c->wbuf_len)
+		return 0;
+
+	/* claim remaining space on the page
+	   this happens, if we have a change to a new block,
+	   or if fsync forces us to flush the writebuffer.
+	   if we have a switch to next page, we will not have
+	   enough remaining space for this. 
+	*/
+	if (pad) {
+		c->wbuf_len = PAD(c->wbuf_len);
+		
+		if ( c->wbuf_len + sizeof(struct jffs2_unknown_node) < c->wbuf_pagesize) {
+			struct jffs2_unknown_node *padnode = (void *)(c->wbuf + c->wbuf_len);
+			padnode->magic = JFFS2_MAGIC_BITMASK;
+			padnode->nodetype = JFFS2_NODETYPE_PADDING;
+			padnode->totlen = c->wbuf_pagesize - c->wbuf_len;
+			padnode->hdr_crc = crc32(0, padnode, sizeof(*padnode)-4);
+		}
+	}
+	/* else jffs2_flash_writev has actually filled in the rest of the
+	   buffer for us, and will deal with the node refs etc. later. */
+	
+	ret = c->mtd->write(c->mtd, c->wbuf_ofs, c->wbuf_pagesize, &retlen, c->wbuf);
+	
+	if (ret || retlen != c->wbuf_pagesize) {
+		if (ret)
+			printk(KERN_CRIT "jffs2_flush_wbuf(): Write failed with %d\n",ret);
+		else
+			printk(KERN_CRIT "jffs2_flush_wbuf(): Write was short %d instead of %d\n",retlen,c->wbuf_pagesize);
+			
+		ret = -EIO;		
+		/* CHECKME NAND 
+		   So that the caller knows what happened. If
+		   we were called from jffs2_flash_writev(), it'll
+		   know to return failure and _its_ caller will
+		   try again. writev gives back to jffs2_write_xxx 
+		   in write.c. There are the real fixme's
+		 */
+
+		/*  FIXME NAND
+		   If we were called from GC or fsync, there's no repair kit yet
+		*/
+		    
+		return ret; 
+	}
+
+	/* Adjusting free size of next block only, if it's called from fsync ! */
+	if (pad == 2) {
+		D1(printk(KERN_DEBUG "jffs2_flush_wbuf() adjusting free_size of c->nextblock\n"));
+		spin_lock_bh(&c->erase_completion_lock);
+		if (!c->nextblock)
+			BUG();
+		if (c->nextblock->free_size < (c->wbuf_pagesize - c->wbuf_len))
+			BUG();
+		c->nextblock->free_size -= (c->wbuf_pagesize - c->wbuf_len);
+		c->nextblock->dirty_size += (c->wbuf_pagesize - c->wbuf_len);
+		spin_unlock_bh(&c->erase_completion_lock);
+	}
+
+	/* Stick any now-obsoleted blocks on the erase_pending_list */
+	spin_lock_bh(&c->erase_completion_lock);
+	jffs2_refile_wbuf_blocks(c);
+	spin_unlock_bh(&c->erase_completion_lock);
+
+	memset(c->wbuf,0xff,c->wbuf_pagesize);
+	/* adjust write buffer offset, else we get a non contigous write bug */
+	c->wbuf_ofs+= c->wbuf_pagesize;
+	c->wbuf_len = 0;
+	return 0;
+}
+
+#define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
+#define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
+int jffs2_flash_writev(struct jffs2_sb_info *c, const struct iovec *invecs, unsigned long count, loff_t to, size_t *retlen)
+{
+	struct iovec outvecs[3];
+	uint32_t totlen = 0;
+	uint32_t split_ofs = 0;
+	uint32_t old_totlen;
+	int ret, splitvec = -1;
+	int invec, outvec;
+	size_t wbuf_retlen;
+	unsigned char *wbuf_ptr;
+	size_t donelen = 0;
+	uint32_t outvec_to = to;
+
+	CHECKPOINT(0);
+	/* If not NAND flash, don't bother */
+	if (!c->wbuf)
+		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
+	
+	CHECKPOINT(1);
+	/* If wbuf_ofs is not initialized, set it to target adress */
+	if (c->wbuf_ofs == 0xFFFFFFFF) {
+		c->wbuf_ofs = PAGE_DIV(to);
+		c->wbuf_len = PAGE_MOD(to);			
+		memset(c->wbuf,0xff,c->wbuf_pagesize);
+	}
+
+	CHECKPOINT(2);
+	/* Sanity checks on target address. 
+	   It's permitted to write at PAD(c->wbuf_len+c->wbuf_ofs), 
+	   and it's permitted to write at the beginning of a new 
+	   erase block. Anything else, and you die.
+	   New block starts at xxx000c (0-b = block header)
+	*/
+	if ( (to & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) {
+		/* It's a write to a new block */
+		if (c->wbuf_len) {
+			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
+			ret = jffs2_flush_wbuf(c, 1);
+			if (ret) {
+				/* the underlying layer has to check wbuf_len to do the cleanup */
+				D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
+				*retlen = 0;
+				return ret;
+			}
+		}
+		/* set pointer to new block */
+		c->wbuf_ofs = PAGE_DIV(to);
+		c->wbuf_len = PAGE_MOD(to);			
+	} 
+
+	CHECKPOINT(3);
+	if (to != PAD(c->wbuf_ofs + c->wbuf_len)) {
+		/* We're not writing immediately after the writebuffer. Bad. */
+		printk(KERN_CRIT "jffs2_flash_writev(): Non-contiguous write to %08lx\n", (unsigned long)to);
+		if (c->wbuf_len)
+			printk(KERN_CRIT "wbuf was previously %08x-%08x\n",
+					  c->wbuf_ofs, c->wbuf_ofs+c->wbuf_len);
+		printk(KERN_CRIT "wbuf size is 0x%08x\n", c->wbuf_pagesize);
+		BUG();
+	}
+
+	CHECKPOINT(4);
+	/* Note outvecs[3] above. We know count is never greater than 2 */
+	if (count > 2) {
+		printk(KERN_CRIT "jffs2_flash_writev(): count is %ld\n", count);
+		BUG();
+	}
+
+	invec = 0;
+	outvec = 0;
+
+
+	CHECKPOINT(5);
+	/* Fill writebuffer first, if already in use */	
+	if (c->wbuf_len) {
+		uint32_t invec_ofs = 0;
+
+		/* adjust alignment offset */ 
+		if (c->wbuf_len != PAGE_MOD(to)) {
+			c->wbuf_len = PAGE_MOD(to);
+			/* take care of alignment to next page */
+			if (!c->wbuf_len)
+				c->wbuf_len = c->wbuf_pagesize;
+		}
+		
+		while(c->wbuf_len < c->wbuf_pagesize) {
+			uint32_t thislen;
+			
+			if (invec == count)
+				goto alldone;
+
+			thislen = c->wbuf_pagesize - c->wbuf_len;
+
+			if (thislen >= invecs[invec].iov_len)
+				thislen = invecs[invec].iov_len;
+	
+			invec_ofs = thislen;
+
+			memcpy(c->wbuf + c->wbuf_len, invecs[invec].iov_base, thislen);
+			c->wbuf_len += thislen;
+			donelen += thislen;
+			/* Get next invec, if actual did not fill the buffer */
+			if (c->wbuf_len < c->wbuf_pagesize) 
+				invec++;
+		}			
+		
+		/* write buffer is full, flush buffer */
+		ret = jffs2_flush_wbuf(c, 0);
+		if (ret) {
+			/* the underlying layer has to check wbuf_len to do the cleanup */
+			D1(printk(KERN_WARNING "jffs2_flush_wbuf() called from jffs2_flash_writev() failed %d\n", ret));
+			*retlen = 0;
+			return ret;
+		}
+		outvec_to += donelen;
+		c->wbuf_ofs = outvec_to;
+		
+		/* All invecs done ? */
+		if (invec == count)
+			goto alldone;
+
+		/* Set up the first outvec, containing the remainder of the
+		   invec we partially used */
+		if (invecs[invec].iov_len > invec_ofs) {
+			outvecs[0].iov_base = invecs[invec].iov_base+invec_ofs;
+			totlen = outvecs[0].iov_len = invecs[invec].iov_len-invec_ofs;
+			if (totlen > c->wbuf_pagesize) {
+				splitvec = outvec;
+				split_ofs = outvecs[0].iov_len - PAGE_MOD(totlen);
+			}
+			outvec++;
+		}
+		invec++;
+	}
+
+	/* OK, now we've flushed the wbuf and the start of the bits
+	   we have been asked to write, now to write the rest.... */
+
+	CHECKPOINT(6);
+	/* totlen holds the amount of data still to be written */
+	old_totlen = totlen;
+	for ( ; invec < count; invec++,outvec++ ) {
+		outvecs[outvec].iov_base = invecs[invec].iov_base;
+		totlen += outvecs[outvec].iov_len = invecs[invec].iov_len;
+		if (PAGE_DIV(totlen) != PAGE_DIV(old_totlen)) {
+			splitvec = outvec;
+			split_ofs = outvecs[outvec].iov_len - PAGE_MOD(totlen);
+			old_totlen = totlen;
+		}
+	}
+
+	/* Now the outvecs array holds all the remaining data to write */
+	/* Up to splitvec,split_ofs is to be written immediately. The rest
+	   goes into the (now-empty) wbuf */
+
+	CHECKPOINT(7);
+	if (splitvec != -1) {
+		uint32_t remainder;
+		int ret;
+
+		remainder = outvecs[splitvec].iov_len - split_ofs;
+		outvecs[splitvec].iov_len = split_ofs;
+
+		/* We did cross a page boundary, so we write some now */
+		ret = jffs2_flash_direct_writev(c, outvecs, splitvec+1, outvec_to, &wbuf_retlen); 
+		if (ret < 0 || wbuf_retlen != PAGE_DIV(totlen)) {
+			/* At this point we have no problem,
+			   c->wbuf is empty. 
+			*/
+			*retlen = donelen;
+			return ret;
+		}
+		
+		donelen += wbuf_retlen;
+		c->wbuf_ofs = PAGE_DIV(outvec_to) + PAGE_DIV(totlen);
+
+		if (remainder) {
+			outvecs[splitvec].iov_base += split_ofs;
+			outvecs[splitvec].iov_len = remainder;
+		} else {
+			splitvec++;
+		}
+
+	} else {
+		splitvec = 0;
+	}
+
+	/* Now splitvec points to the start of the bits we have to copy
+	   into the wbuf */
+	wbuf_ptr = c->wbuf;
+
+	CHECKPOINT(8);
+	for ( ; splitvec < outvec; splitvec++) {
+		/* Don't copy the wbuf into itself */
+		if (outvecs[splitvec].iov_base == c->wbuf)
+			continue;
+		memcpy(wbuf_ptr, outvecs[splitvec].iov_base, outvecs[splitvec].iov_len);
+		wbuf_ptr += outvecs[splitvec].iov_len;
+		donelen += outvecs[splitvec].iov_len;
+	}
+	c->wbuf_len = wbuf_ptr - c->wbuf;
+
+alldone:	
+	CHECKPOINT(9);
+	*retlen = donelen;
+	/* Setup timed wbuf flush, if buffer len != 0 */
+	if (c->wbuf_len) {
+		D1(printk (KERN_DEBUG "jffs2_flash_writev: mod wbuf_timer\n"));	
+		mod_timer(&c->wbuf_timer, jiffies + WBUF_FLUSH_TIMEOUT);
+	}
+	return 0;
+}
+
+/*
+	This is the entry for NOR-Flash. We use it also for NAND to flush wbuf
+*/
+int jffs2_flash_write(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, const u_char *buf)
+{
+	CHECKPOINT(0);
+	return c->mtd->write(c->mtd, ofs, len, retlen, buf);
+}
+
+/*
+	Handle readback from writebuffer and ECC failure return
+*/
+int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, u_char *buf)
+{
+	loff_t	orbf = 0, owbf = 0, lwbf = 0;
+	int	ret;
+
+	/* Read flash */
+	ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
+
+	if (!jffs2_can_mark_obsolete(c) && (ret == -EIO) && (*retlen == len) ) {
+		printk(KERN_WARNING "mtd->read(0x%x bytes from 0x%llx) returned ECC error\n", len, ofs);
+		/* 
+		 * We have the raw data without ECC correction in the buffer, maybe 
+		 * we are lucky and all data or parts are correct. We check the node.
+		 * If data are corrupted node check will sort it out.
+		 * We keep this block, it will fail on write or erase and the we
+		 * mark it bad. Or should we do that now? But we should give him a chance.
+		 * Maybe we had a system crash or power loss before the ecc write or  
+		 * a erase was completed.
+		 * So we return success. :)
+		 */
+		 ret = 0;	
+	}
+
+	/* if no writebuffer available or write buffer empty, return */
+	if (!c->wbuf_pagesize || !c->wbuf_len)
+		return ret;
+
+
+	/* if we read in a different block, return */
+	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
+		return ret;	
+
+	if (ofs >= c->wbuf_ofs) {
+		owbf = (ofs - c->wbuf_ofs);	/* offset in write buffer */
+		if (owbf > c->wbuf_len)		/* is read beyond write buffer ? */
+			return ret;
+		lwbf = c->wbuf_len - owbf;	/* number of bytes to copy */
+		if (lwbf > len)	
+			lwbf = len;
+	} else {	
+		orbf = (c->wbuf_ofs - ofs);	/* offset in read buffer */
+		if (orbf > len)			/* is write beyond write buffer ? */
+			return ret;
+		lwbf = len - orbf; 		/* number of bytes to copy */
+		if (lwbf > c->wbuf_len)	
+			lwbf = c->wbuf_len;
+	}	
+	if (lwbf > 0)
+		memcpy(buf+orbf,c->wbuf+owbf,lwbf);
+
+	return ret;
+}
+
diff -Naur jffs2/fs/jffs2/os-linux.h jffs2.new/fs/jffs2/os-linux.h
--- jffs2/fs/jffs2/os-linux.h	Wed Jun 19 18:56:25 2002
+++ jffs2.new/fs/jffs2/os-linux.h	Thu Jul 11 16:13:32 2002
@@ -67,6 +67,24 @@
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
 
 #ifndef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_ECC_NOR /* ECC'd NOR flash */
+
+#define jffs2_can_mark_obsolete(c) (0)
+#define jffs2_cleanmarker_oob(c) (0)
+#define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
+
+#define jffs2_nand_read_failcnt(c,jeb) do { ; } while(0)
+#define jffs2_write_nand_badblock(c,jeb) do { ; } while(0)
+
+/* nor_wbuf.c */
+int jffs2_flash_writev(struct jffs2_sb_info *c, const struct iovec *vecs, unsigned long count, loff_t to, size_t *retlen);
+int jffs2_flash_write(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, const u_char *buf);
+int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len, size_t *retlen, u_char *buf);
+void jffs2_wbuf_timeout(unsigned long data);
+void jffs2_wbuf_process(void *data);
+
+#else /* normal NOR flash */
+
 #define jffs2_can_mark_obsolete(c) (1)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
@@ -80,6 +98,7 @@
 #define jffs2_wbuf_timeout NULL
 #define jffs2_wbuf_process NULL
 
+#endif
 #else /* NAND support present */
 
 #define jffs2_can_mark_obsolete(c) (c->mtd->type == MTD_NORFLASH || c->mtd->type == MTD_RAM)
diff -Naur jffs2/fs/jffs2/scan.c jffs2.new/fs/jffs2/scan.c
--- jffs2/fs/jffs2/scan.c	Wed Jul  3 15:36:02 2002
+++ jffs2.new/fs/jffs2/scan.c	Thu Jul 11 16:14:19 2002
@@ -342,14 +342,14 @@
 			break;
 
 		case JFFS2_NODETYPE_CLEANMARKER:
-			if (node.totlen != c->cleanmarker_size) {
+			if (node.totlen != sizeof(struct jffs2_cleanmarker)) {
 				printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x has totlen 0x%x != normal 0x%x\n", 
-				       ofs, node.totlen, c->cleanmarker_size);
-				DIRTY_SPACE(PAD(sizeof(struct jffs2_unknown_node)));
+				       ofs, node.totlen, sizeof(struct jffs2_cleanmarker));
+				DIRTY_SPACE(PAD(sizeof(struct jffs2_cleanmarker)));
 			} else if (jeb->first_node) {
 				printk(KERN_NOTICE "CLEANMARKER node found at 0x%08x, not first node in block (0x%08x)\n", ofs, jeb->offset);
-				DIRTY_SPACE(PAD(c->cleanmarker_size));
-				ofs += PAD(c->cleanmarker_size);
+				DIRTY_SPACE(PAD(sizeof(struct jffs2_cleanmarker)));
+				ofs += PAD(sizeof(struct jffs2_cleanmarker));
 				continue;
 			} else {
 				struct jffs2_raw_node_ref *marker_ref = jffs2_alloc_raw_node_ref();
@@ -360,12 +360,12 @@
 				marker_ref->next_in_ino = NULL;
 				marker_ref->next_phys = NULL;
 				marker_ref->flash_offset = ofs;
-				marker_ref->totlen = c->cleanmarker_size;
+				marker_ref->totlen = sizeof(struct jffs2_cleanmarker);
 				jeb->first_node = jeb->last_node = marker_ref;
 			     
-				USED_SPACE(PAD(c->cleanmarker_size));
+				USED_SPACE(PAD(sizeof(struct jffs2_cleanmarker)));
 			}
-			ofs += PAD(c->cleanmarker_size);
+			ofs += PAD(sizeof(struct jffs2_cleanmarker));
 			break;
 
 		case JFFS2_NODETYPE_PADDING:
@@ -407,7 +407,7 @@
 	D1(printk(KERN_DEBUG "Block at 0x%08x: free 0x%08x, dirty 0x%08x, used 0x%08x\n", jeb->offset, 
 		  jeb->free_size, jeb->dirty_size, jeb->used_size));
 
-	if (jeb->used_size == PAD(c->cleanmarker_size) && 
+	if (jeb->used_size == PAD(sizeof(struct jffs2_cleanmarker)) && 
 	    !jeb->first_node->next_in_ino && !jeb->dirty_size)
 		return BLK_STATE_CLEANMARKER;
 	else if (jeb->used_size > c->sector_size - (2*sizeof(struct jffs2_raw_inode)))
@@ -628,7 +628,7 @@
 		if (!jeb->used_size) {
 			D1(printk(KERN_DEBUG "No valid nodes yet found in this eraseblock 0x%08x, so obsoleting the new instance at 0x%08x\n", 
 				  jeb->offset, raw->flash_offset & ~3));
- 			ri.nodetype &= ~JFFS2_NODE_ACCURATE;
+			ri.nodetype &= ~JFFS2_NODE_ACCURATE;
 			/* Perhaps we could also mark it as such on the medium. Maybe later */
 		}
 		break;
@@ -654,11 +654,7 @@
 		tn->version = ri.version;
 
 		USED_SPACE(PAD(ri.totlen));
-
-		/* No need to scan from the beginning of the list again. 
-		   We can start from tn_list instead (Thanks Jocke) */
-		jffs2_add_tn_to_list(tn, tn_list);
-
+		jffs2_add_tn_to_list(tn, &ic->scan->tmpnodes);
 		/* Make sure the one we just added is the _last_ in the list
 		   with this version number, so the older ones get obsoleted */
 		while (tn->next && tn->next->version == tn->version) {
diff -Naur jffs2/include/linux/jffs2.h jffs2.new/include/linux/jffs2.h
--- jffs2/include/linux/jffs2.h	Wed Jun 19 18:56:27 2002
+++ jffs2.new/include/linux/jffs2.h	Thu Jul 11 16:03:37 2002
@@ -77,6 +77,15 @@
 	uint32_t hdr_crc;
 } __attribute__((packed));
 
+struct jffs2_cleanmarker
+{
+	uint16_t magic;
+	uint16_t nodetype;
+	uint32_t totlen;
+	uint32_t hdr_crc;
+	uint32_t padding; /* Necessary for some STMicro flashes */
+} __attribute__((packed));
+
 struct jffs2_raw_dirent
 {
 	uint16_t magic;
@@ -130,6 +139,7 @@
 union jffs2_node_union {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
+	struct jffs2_cleanmarker c;
 	struct jffs2_unknown_node u;
 };
 
