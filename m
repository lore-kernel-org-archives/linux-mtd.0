Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gv7E-0004lv-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 23:35:16 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1400KLV41WI2@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 20 Aug 2002 00:34:46 +0200 (MEST)
Date: Tue, 20 Aug 2002 00:34:31 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: No free space left for GC
In-reply-to: <1029793649.22781.129.camel@thomas.tec.linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Message-id: <1029796472.22781.136.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_cb6HV5VRYu/PlD9oyFeHMw)"
References: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
 <1029793649.22781.129.camel@thomas.tec.linutronix.de>
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

--Boundary_(ID_cb6HV5VRYu/PlD9oyFeHMw)
Content-type: text/plain
Content-transfer-encoding: 7BIT

Forgot to attach a diff :)

Last try brought average dirty_space 11 bytes in 492 Blocks in
clean_list. I think we can live with that

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

--Boundary_(ID_cb6HV5VRYu/PlD9oyFeHMw)
Content-type: text/plain; name=cvs.diff; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=cvs.diff

? cvs.diff
Index: fs/jffs2/background.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/background.c,v
retrieving revision 1.30
diff -u -r1.30 background.c
--- fs/jffs2/background.c	5 Aug 2002 14:46:47 -0000	1.30
+++ fs/jffs2/background.c	19 Aug 2002 22:30:39 -0000
@@ -155,18 +155,11 @@
 static int thread_should_wake(struct jffs2_sb_info *c)
 {
 	uint32_t gcnodeofs = 0;
-	int ret;
+	int ret = 0;
 
-	/* Don't count any progress we've already made through the gcblock
-	   as dirty space, for the purposes of this calculation */
-	if (c->gcblock && c->gcblock->gc_node)
-		gcnodeofs = c->gcblock->gc_node->flash_offset & ~3 & (c->sector_size-1);
-
-	if (c->nr_free_blocks + c->nr_erasing_blocks < JFFS2_RESERVED_BLOCKS_GCTRIGGER &&
-	    (c->dirty_size - gcnodeofs) > c->sector_size)
+	if (c->nr_free_blocks + c->nr_erasing_blocks < JFFS2_RESERVED_BLOCKS_GCTRIGGER && 
+		!jffs2_gc_checkspace (c, JFFS2_RESERVED_BLOCKS_BASE))
 		ret = 1;
-	else 
-		ret = 0;
 
 	D1(printk(KERN_DEBUG "thread_should_wake(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x (mod 0x%x): %s\n", 
 		  c->nr_free_blocks, c->nr_erasing_blocks, c->dirty_size,
Index: fs/jffs2/build.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/build.c,v
retrieving revision 1.36
diff -u -r1.36 build.c
--- fs/jffs2/build.c	7 Aug 2002 18:37:32 -0000	1.36
+++ fs/jffs2/build.c	19 Aug 2002 22:30:40 -0000
@@ -43,6 +43,7 @@
 		return ret;
 
 	D1(printk(KERN_DEBUG "Scanned flash completely\n"));
+	D1(jffs2_dump_block_lists(c));
 	/* Now build the data map for each inode, marking obsoleted nodes
 	   as such, and also increase nlink of any children. */
 	for_each_inode(i, c, ic) {
@@ -54,7 +55,8 @@
 		}
 	}
 	D1(printk(KERN_DEBUG "Pass 1 complete\n"));
-
+	D1(jffs2_dump_block_lists(c));
+	
 	/* Next, scan for inodes with nlink == 0 and remove them. If
 	   they were directories, then decrement the nlink of their
 	   children too, and repeat the scan. As that's going to be
@@ -75,6 +77,7 @@
 		   and furthermore that it had children and their nlink has now
 		   gone to zero too. So we have to restart the scan. */
 		} 
+		D1(jffs2_dump_block_lists(c));
 	} while(ret == -EAGAIN);
 	
 	D1(printk(KERN_DEBUG "Pass 2 complete\n"));
@@ -99,6 +102,7 @@
 		kfree(scan);
 	}
 	D1(printk(KERN_DEBUG "Pass 3 complete\n"));
+	D1(jffs2_dump_block_lists(c));
 
 	/* Rotate the lists by some number to ensure wear levelling */
 	jffs2_rotate_lists(c);
Index: fs/jffs2/gc.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v
retrieving revision 1.78
diff -u -r1.78 gc.c
--- fs/jffs2/gc.c	7 Aug 2002 11:01:14 -0000	1.78
+++ fs/jffs2/gc.c	19 Aug 2002 22:30:42 -0000
@@ -33,6 +33,40 @@
 				       struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
 				       uint32_t start, uint32_t end);
 
+/* Check, if we have enough dirty space for GC */
+int jffs2_gc_checkspace (struct jffs2_sb_info *c, int blocksneeded)
+{
+	
+	if (c->dirty_size < blocksneeded * c->sector_size) {
+		
+		uint32_t dirty = 0;
+		struct list_head *this;
+		
+		if (!list_empty(&c->very_dirty_list)) {
+			list_for_each(this, &c->very_dirty_list) {
+				struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+				dirty += jeb->dirty_size;
+			}
+		}
+		if (!list_empty(&c->dirty_list)) {
+			list_for_each(this, &c->dirty_list) {
+				struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+				dirty += jeb->dirty_size;	
+			}
+		}
+		/* Add dirty size of current gc-block */
+		if (c->gcblock)
+			dirty += c->gcblock->dirty_size;
+					
+		if (dirty < c->sector_size) {
+			D1(printk(KERN_DEBUG "dirty size in dirty_lists 0x%08x < sector size 0x%08x\n", dirty, c->sector_size));
+			return 1;
+		}
+	}
+	/* yep, we can GC */
+	return 0;
+}
+
 /* Called with erase_completion_lock held */
 static struct jffs2_eraseblock *jffs2_find_gc_block(struct jffs2_sb_info *c)
 {
Index: fs/jffs2/nodelist.h
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodelist.h,v
retrieving revision 1.75
diff -u -r1.75 nodelist.h
--- fs/jffs2/nodelist.h	17 Aug 2002 22:28:04 -0000	1.75
+++ fs/jffs2/nodelist.h	19 Aug 2002 22:30:43 -0000
@@ -220,8 +220,9 @@
 /* How much dirty space before it goes on the very_dirty_list */
 #define VERYDIRTY(c, size) ((size) >= ((c)->sector_size / 2))
 
-/* check if unused space is more than sector - 2 * sizeof(struct jffs2_raw_inode) */
-#define ISDIRTY(c, size) ((size) < c->sector_size - (2 * sizeof(struct jffs2_raw_inode)))
+/* check if unused space is more than 256 Byte */
+#define ISDIRTY(c, size) ((size) < c->sector_size - 255) 
+#define MNTISDIRTY(c, size) ((size) < c->sector_size - 4) 
 
 #define PAD(x) (((x)+3)&~3)
 
@@ -299,6 +300,7 @@
 
 /* gc.c */
 int jffs2_garbage_collect_pass(struct jffs2_sb_info *c);
+int jffs2_gc_checkspace (struct jffs2_sb_info *c, int blocksneeded);
 
 /* read.c */
 int jffs2_read_dnode(struct jffs2_sb_info *c, struct jffs2_full_dnode *fd, unsigned char *buf, int ofs, int len);
Index: fs/jffs2/nodemgmt.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/nodemgmt.c,v
retrieving revision 1.71
diff -u -r1.71 nodemgmt.c
--- fs/jffs2/nodemgmt.c	17 Aug 2002 22:32:11 -0000	1.71
+++ fs/jffs2/nodemgmt.c	19 Aug 2002 22:30:44 -0000
@@ -62,32 +62,13 @@
 			int ret;
 
 			up(&c->alloc_sem);
-			if (c->dirty_size < c->sector_size) {
-				D1(printk(KERN_DEBUG "Short on space, but total dirty size 0x%08x < sector size 0x%08x, so -ENOSPC\n", c->dirty_size, c->sector_size));
+			
+			if (jffs2_gc_checkspace(c, blocksneeded)) {
+				D1(printk (KERN_DEBUG "Too little dirty_space for GC, returning -ENOSPC\n"));
 				spin_unlock_bh(&c->erase_completion_lock);
 				return -ENOSPC;
 			}
-			if (c->dirty_size < blocksneeded * c->sector_size) {
-				uint32_t dirty = 0;			
-				struct list_head *this;
-				if (!list_empty(&c->very_dirty_list)) {
-					list_for_each(this, &c->very_dirty_list) {
-						struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
-						dirty += jeb->dirty_size;	
-					}
-				}
-				if (!list_empty(&c->dirty_list)) {
-					list_for_each(this, &c->dirty_list) {
-						struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
-						dirty += jeb->dirty_size;	
-					}
-				}
-				if (dirty < c->sector_size) {
-					D1(printk(KERN_DEBUG "Short on space, but dirty size in dirty_lists 0x%08x < sector size 0x%08x, so -ENOSPC\n", dirty, c->sector_size));
-					spin_unlock_bh(&c->erase_completion_lock);
-					return -ENOSPC;
-				}
-			}
+			
 			D1(printk(KERN_DEBUG "Triggering GC pass. nr_free_blocks %d, nr_erasing_blocks %d, free_size 0x%08x, dirty_size 0x%08x, used_size 0x%08x, erasing_size 0x%08x, bad_size 0x%08x (total 0x%08x of 0x%08x)\n",
 				  c->nr_free_blocks, c->nr_erasing_blocks, c->free_size, c->dirty_size, c->used_size, c->erasing_size, c->bad_size,
 				  c->free_size + c->dirty_size + c->used_size + c->erasing_size + c->bad_size, c->flash_size));
@@ -498,6 +479,8 @@
 #if CONFIG_JFFS2_FS_DEBUG > 0
 void jffs2_dump_block_lists(struct jffs2_sb_info *c)
 {
+
+
 	printk(KERN_DEBUG "jffs2_dump_block_lists:\n");
 	printk(KERN_DEBUG "flash_size: %08x\n", c->flash_size);
 	printk(KERN_DEBUG "used_size: %08x\n", c->used_size);
@@ -522,31 +505,46 @@
 		printk(KERN_DEBUG "clean_list: empty\n");
 	} else {
 		struct list_head *this;
+		int	numblocks = 0;
+		uint32_t dirty = 0;
 
 		list_for_each(this, &c->clean_list) {
 			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+			numblocks ++;
+			dirty += jeb->dirty_size;
 			printk(KERN_DEBUG "clean_list: %08x (used %08x, dirty %08x, free %08x)\n", jeb->offset, jeb->used_size, jeb->dirty_size, jeb->free_size);
 		}
+		printk (KERN_DEBUG "Contains %d blocks with total dirty size %u, average dirty size: %u\n", numblocks, dirty, dirty / numblocks);
 	}
 	if (list_empty(&c->very_dirty_list)) {
 		printk(KERN_DEBUG "very_dirty_list: empty\n");
 	} else {
 		struct list_head *this;
+		int	numblocks = 0;
+		uint32_t dirty = 0;
 
 		list_for_each(this, &c->very_dirty_list) {
 			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+			numblocks ++;
+			dirty += jeb->dirty_size;
 			printk(KERN_DEBUG "very_dirty_list: %08x (used %08x, dirty %08x, free %08x)\n", jeb->offset, jeb->used_size, jeb->dirty_size, jeb->free_size);
 		}
+		printk (KERN_DEBUG "Contains %d blocks with total dirty size %u, average dirty size: %u\n", numblocks, dirty, dirty / numblocks);
 	}
 	if (list_empty(&c->dirty_list)) {
 		printk(KERN_DEBUG "dirty_list: empty\n");
 	} else {
 		struct list_head *this;
+		int	numblocks = 0;
+		uint32_t dirty = 0;
 
 		list_for_each(this, &c->dirty_list) {
 			struct jffs2_eraseblock *jeb = list_entry(this, struct jffs2_eraseblock, list);
+			numblocks ++;
+			dirty += jeb->dirty_size;
 			printk(KERN_DEBUG "dirty_list: %08x (used %08x, dirty %08x, free %08x)\n", jeb->offset, jeb->used_size, jeb->dirty_size, jeb->free_size);
 		}
+		printk (KERN_DEBUG "Contains %d blocks with total dirty size %u, average dirty size: %u\n", numblocks, dirty, dirty / numblocks);
 	}
 	if (list_empty(&c->erasable_list)) {
 		printk(KERN_DEBUG "erasable_list: empty\n");
Index: fs/jffs2/scan.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/scan.c,v
retrieving revision 1.80
diff -u -r1.80 scan.c
--- fs/jffs2/scan.c	17 Aug 2002 22:29:28 -0000	1.80
+++ fs/jffs2/scan.c	19 Aug 2002 22:30:47 -0000
@@ -420,7 +420,7 @@
 	if (jeb->used_size == PAD(sizeof(struct jffs2_unknown_node)) && 
 	    !jeb->first_node->next_in_ino && !jeb->dirty_size)
 		return BLK_STATE_CLEANMARKER;
-	else if (!ISDIRTY(c, jeb->used_size)) 
+	else if (!MNTISDIRTY(c, jeb->used_size)) 
 		return BLK_STATE_CLEAN;
 	else if (jeb->used_size)
 		return BLK_STATE_PARTDIRTY;

--Boundary_(ID_cb6HV5VRYu/PlD9oyFeHMw)--
