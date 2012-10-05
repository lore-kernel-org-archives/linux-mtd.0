Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK494-000324-PC
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 09:24:35 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com,
 "David Woodhouse" <dwmw2@infradead.org>
Subject: [PATCH] jffs2: Fix lock acquisition order bug in jffs2_write_begin
Date: Fri, 5 Oct 2012 11:24:24 +0200
Message-Id: <1349429064-10241-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas.Betker@rohde-schwarz.com reports:

The target system is an SoC with a dual ARMv7 (Cortex-A9), and we are
running the long-term 3.4.11 kernel (whose fs/jffs2/ seems to be pretty
close to the latest mainline kernel). The deadlock occurred when using scp
to copy files from a host system to the target system.

The GC thread hangs in lock_page(page), the write thread hangs in the
first mutex_lock(&f->sem). The cause seems to be an AB-BA deadlock:

jffs2_garbage_collect_live
    mutex_lock(&f->sem)                         (A)
    jffs2_garbage_collect_dnode [inlined]
        jffs2_gc_fetch_page
            read_cache_page_async
                do_read_cache_page
                    lock_page(page) [inlined]
                        __lock_page             (B) ***

jffs2_write_begin
    grab_cache_page_write_begin
        find_lock_page
            lock_page(page)                     (B)
    mutex_lock(&f->sem)                         (A) ***

I have manually analyzed the stacks and confirmed that both threads sit on
the theme 'struct page'.

Fix this by restructuring jffs2_write_begin to take the f->sem lock
before the page lock. However one must make sure not to hold f->sem
when calling jffs2_reserve_space according to README.Locking

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---

 This needs to be review by someone that understands the
 looking rules better. David?

 fs/jffs2/file.c |   41 +++++++++++++++++++++--------------------
 1 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index db3889b..23adcdc 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -140,31 +140,35 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
-	int ret = 0;
+	int ret = -ENOMEM;
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_raw_inode ri;
+	uint32_t alloc_len;
 
+	if (pageofs > inode->i_size) {
+		/* reserve space must be be before locking f->sem */
+		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
+					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+		if (ret)
+			return ret;
+	}
+
+	mutex_lock(&f->sem);
 	pg = grab_cache_page_write_begin(mapping, index, flags);
 	if (!pg)
-		return -ENOMEM;
+		goto out_unlock;
+
 	*pagep = pg;
 
 	jffs2_dbg(1, "%s()\n", __func__);
 
-	if (pageofs > inode->i_size) {
+	if (!ret) { /* reserve_space succeded */
 		/* Make new hole frag from old EOF to new page */
-		struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
-		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
-		uint32_t alloc_len;
 
 		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
 			  (unsigned int)inode->i_size, pageofs);
 
-		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
-					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
-		if (ret)
-			goto out_page;
-
-		mutex_lock(&f->sem);
 		memset(&ri, 0, sizeof(ri));
 
 		ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -190,8 +194,6 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 
 		if (IS_ERR(fn)) {
 			ret = PTR_ERR(fn);
-			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
@@ -205,13 +207,10 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 				  ret);
 			jffs2_mark_node_obsolete(c, fn->raw);
 			jffs2_free_full_dnode(fn);
-			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		jffs2_complete_reservation(c);
 		inode->i_size = pageofs;
-		mutex_unlock(&f->sem);
 	}
 
 	/*
@@ -220,18 +219,20 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	 * case of a short-copy.
 	 */
 	if (!PageUptodate(pg)) {
-		mutex_lock(&f->sem);
 		ret = jffs2_do_readpage_nolock(inode, pg);
-		mutex_unlock(&f->sem);
 		if (ret)
 			goto out_page;
 	}
+	mutex_unlock(&f->sem);
 	jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
-	return ret;
+	return 0;
 
 out_page:
 	unlock_page(pg);
 	page_cache_release(pg);
+out_unlock:
+	jffs2_complete_reservation(c);
+	mutex_unlock(&f->sem);
 	return ret;
 }
 
-- 
1.7.8.6
