Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192WTu-0005gj-W4
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 14:16:15 +0100
Date: Mon, 7 Apr 2003 15:16:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030407131608.GF22630@wohnheim.fh-wedel.de>
References: <3E7E6DE5.5000003@interepoch.com.tw>
	<1048483100.3593.3.camel@gobbles>
	<20030325000503.GA14469@wohnheim.fh-wedel.de>
	<1048596666.12528.39.camel@passion.cambridge.redhat.com>
	<20030325133335.GF29035@wohnheim.fh-wedel.de>
	<1048602999.12528.156.camel@passion.cambridge.redhat.com>
	<20030330190120.GA31483@wohnheim.fh-wedel.de>
	<1049052224.16365.755.camel@imladris.demon.co.uk>
	<20030330200820.GB12927@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030330200820.GB12927@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: not enough blocks for JFFS?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 30 March 2003 22:08:20 +0200, Jörn Engel wrote:
> 
> > > Bottom line:
> > > It might be a good idea to get rid of the macros and add those values
> > > to the struct superblock instead. Then we can calculate their values
> > > on mount. Everything else can follow.
> > 
> > Makes sense, and perhaps we can make them user-tunable somehow too, or
> > mount options. I'm wondering if we want to continue having them in units
> > of blocks, or whether we want to count bytes.
> 
> Bytes make more sense to me.
> 
> I don't expect to work on it next week, but I can already give you my
> mount option "parser", if you are interested.

That week is over, so let's get back. :)

First version of the patch. This moves the macros to superblocks
fields, initializes them on read_super and shouldn't change the
behaviour. Untested, though.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu

diff -Naur linux-2.4.20-pre7/fs/jffs2/background.c linux-2.4.20-pre7-jffs2/fs/jffs2/background.c
--- linux-2.4.20-pre7/fs/jffs2/background.c	2001-10-25 09:07:09.000000000 +0200
+++ linux-2.4.20-pre7-jffs2/fs/jffs2/background.c	2003-04-07 13:58:51.000000000 +0200
@@ -175,7 +175,7 @@
 {
 	D1(printk(KERN_DEBUG "thread_should_wake(): nr_free_blocks %d, nr_erasing_blocks %d, dirty_size 0x%x\n", 
 		  c->nr_free_blocks, c->nr_erasing_blocks, c->dirty_size));
-	if (c->nr_free_blocks + c->nr_erasing_blocks < JFFS2_RESERVED_BLOCKS_GCTRIGGER &&
+	if (c->nr_free_blocks + c->nr_erasing_blocks < c->reserved_blocks_gctrigger &&
 	    c->dirty_size > c->sector_size)
 		return 1;
 	else 
diff -Naur linux-2.4.20-pre7/fs/jffs2/gc.c linux-2.4.20-pre7-jffs2/fs/jffs2/gc.c
--- linux-2.4.20-pre7/fs/jffs2/gc.c	2002-11-29 00:53:15.000000000 +0100
+++ linux-2.4.20-pre7-jffs2/fs/jffs2/gc.c	2003-04-07 13:51:00.000000000 +0200
@@ -66,7 +66,7 @@
 
 	/* Pick an eraseblock to garbage collect next. This is where we'll
 	   put the clever wear-levelling algorithms. Eventually.  */
-	if (!list_empty(&c->bad_used_list) && c->nr_free_blocks > JFFS2_RESERVED_BLOCKS_GCBAD) {
+	if (!list_empty(&c->bad_used_list) && c->nr_free_blocks > c->reserved_blocks_gcbad) {
 		D1(printk(KERN_DEBUG "Picking block from bad_used_list to GC next\n"));
 		nextlist = &c->bad_used_list;
 	} else if (jiffies % 100 && !list_empty(&c->dirty_list)) {
@@ -572,7 +572,7 @@
 	   the GC would churn and churn, and just leave dirty blocks in
 	   it's wake.
 	*/
-	if(c->nr_free_blocks + c->nr_erasing_blocks > JFFS2_RESERVED_BLOCKS_GCMERGE - (fn->raw->next_phys?0:1)) {
+	if(c->nr_free_blocks + c->nr_erasing_blocks > c->reserved_blocks_gcmerge - (fn->raw->next_phys?0:1)) {
 		/* Shitloads of space */
 		/* FIXME: Integrate this properly with GC calculations */
 		start &= ~(PAGE_CACHE_SIZE-1);
diff -Naur linux-2.4.20-pre7/fs/jffs2/nodelist.h linux-2.4.20-pre7-jffs2/fs/jffs2/nodelist.h
--- linux-2.4.20-pre7/fs/jffs2/nodelist.h	2003-04-07 12:17:44.000000000 +0200
+++ linux-2.4.20-pre7-jffs2/fs/jffs2/nodelist.h	2003-04-07 13:42:06.000000000 +0200
@@ -222,13 +222,6 @@
 #define ALLOC_DELETION	1	/* Deletion node. Best to allow it */
 #define ALLOC_GC	2	/* Space requested for GC. Give it or die */
 
-#define JFFS2_RESERVED_BLOCKS_BASE 3						/* Number of free blocks there must be before we... */
-#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 2)		/* ... allow a normal filesystem write */
-#define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE + 1)		/* ... allow a normal filesystem deletion */
-#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 3)	/* ... wake up the GC thread */
-#define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)		/* ... pick a block from the bad_list to GC */
-#define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)		/* ... merge pages when garbage collecting */
-
 
 #define PAD(x) (((x)+3)&~3)
 
diff -Naur linux-2.4.20-pre7/fs/jffs2/nodemgmt.c linux-2.4.20-pre7-jffs2/fs/jffs2/nodemgmt.c
--- linux-2.4.20-pre7/fs/jffs2/nodemgmt.c	2002-08-03 02:39:45.000000000 +0200
+++ linux-2.4.20-pre7-jffs2/fs/jffs2/nodemgmt.c	2003-04-07 13:57:40.000000000 +0200
@@ -67,12 +67,12 @@
 int jffs2_reserve_space(struct jffs2_sb_info *c, __u32 minsize, __u32 *ofs, __u32 *len, int prio)
 {
 	int ret = -EAGAIN;
-	int blocksneeded = JFFS2_RESERVED_BLOCKS_WRITE;
+	int blocksneeded = c->reserved_blocks_write;
 	/* align it */
 	minsize = PAD(minsize);
 
 	if (prio == ALLOC_DELETION)
-		blocksneeded = JFFS2_RESERVED_BLOCKS_DELETION;
+		blocksneeded = c->reserved_blocks_deletion;
 
 	D1(printk(KERN_DEBUG "jffs2_reserve_space(): Requested 0x%x bytes\n", minsize));
 	down(&c->alloc_sem);
diff -Naur linux-2.4.20-pre7/fs/jffs2/super.c linux-2.4.20-pre7-jffs2/fs/jffs2/super.c
--- linux-2.4.20-pre7/fs/jffs2/super.c	2002-11-29 00:53:15.000000000 +0100
+++ linux-2.4.20-pre7-jffs2/fs/jffs2/super.c	2003-04-07 14:54:32.000000000 +0200
@@ -86,8 +86,8 @@
 	spin_lock_bh(&c->erase_completion_lock);
 
 	avail = c->dirty_size + c->free_size;
-	if (avail > c->sector_size * JFFS2_RESERVED_BLOCKS_WRITE)
-		avail -= c->sector_size * JFFS2_RESERVED_BLOCKS_WRITE;
+	if (avail > c->sector_size * c->reserved_blocks_write)
+		avail -= c->sector_size * c->reserved_blocks_write;
 	else
 		avail = 0;
 
@@ -196,6 +196,7 @@
 	struct jffs2_sb_info *c;
 	struct inode *root_i;
 	int i;
+	uint32_t reserved_blocks_base = 3;
 
 	D1(printk(KERN_DEBUG "jffs2: read_super for device %s\n", kdevname(sb->s_dev)));
 
@@ -245,6 +246,12 @@
 	INIT_LIST_HEAD(&c->bad_used_list);
 	c->highest_ino = 1;
 
+	c->reserved_blocks_write	= reserved_blocks_base + 2;
+	c->reserved_blocks_deletion	= reserved_blocks_base + 1;
+	c->reserved_blocks_gctrigger	= reserved_blocks_base + 3;
+	c->reserved_blocks_gcbad	= reserved_blocks_base + 1;
+	c->reserved_blocks_gcmerge	= reserved_blocks_base + 0;
+
 	if (jffs2_build_filesystem(c)) {
 		D1(printk(KERN_DEBUG "build_fs failed\n"));
 		goto out_nodes;
diff -Naur linux-2.4.20-pre7/include/linux/jffs2_fs_sb.h linux-2.4.20-pre7-jffs2/include/linux/jffs2_fs_sb.h
--- linux-2.4.20-pre7/include/linux/jffs2_fs_sb.h	2002-08-03 02:39:45.000000000 +0200
+++ linux-2.4.20-pre7-jffs2/include/linux/jffs2_fs_sb.h	2003-04-07 13:41:50.000000000 +0200
@@ -71,6 +71,12 @@
 	wait_queue_head_t erase_wait;		/* For waiting for erases to complete */
 	struct jffs2_inode_cache *inocache_list[INOCACHE_HASHSIZE];
 	spinlock_t inocache_lock;
+	/* Reserved blocks for various actions */
+	uint32_t reserved_blocks_write; 
+	uint32_t reserved_blocks_deletion; 
+	uint32_t reserved_blocks_gctrigger; 
+	uint32_t reserved_blocks_gcbad; 
+	uint32_t reserved_blocks_gcmerge; 
 };
 
 #ifdef JFFS2_OUT_OF_KERNEL
