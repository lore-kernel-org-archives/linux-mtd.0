Received: from mout2.freenet.de ([2001:748:100:40::2:4])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLfFl-0005s7-6e
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 19:14:06 +0000
Message-ID: <507476E7.8030705@freenet.de>
Date: Tue, 09 Oct 2012 21:11:35 +0200
From: Thomas Betker <thomas.betker@freenet.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, thomas.betker@rohde-schwarz.com
Subject: [PATCH RESEND] jffs2: Fix lock acquisition order bug in
 jffs2_write_begin
References: <507321E6.1050609@freenet.de>
In-Reply-To: <507321E6.1050609@freenet.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2_write_begin() first acquires the page lock, then f->sem. This causes an AB-BA deadlock with jffs2_garbage_collect_live(), which first acquires f->sem, then the page lock:

jffs2_garbage_collect_live
     mutex_lock(&f->sem)                         (A)
     jffs2_garbage_collect_dnode
         jffs2_gc_fetch_page
             read_cache_page_async
                 do_read_cache_page
                     lock_page(page)             (B)

jffs2_write_begin
     grab_cache_page_write_begin
         find_lock_page
             lock_page(page)                     (B)
     mutex_lock(&f->sem)                         (A)

We fix this by restructuring jffs2_write_begin() to take f->sem before the page lock. However, we make sure that f->sem is not held when calling jffs2_reserve_space(), as this is not permitted by the locking rules.

The deadlock above was observed multiple times on an SoC with a dual ARMv7 (Cortex-A9), running the long-term 3.4.11 kernel; it occurred when using scp to copy files from a host system to the ARM target system. The fix was heavily tested on the same target system.

If the patch is accepted, please get it also pushed to 3.4; it applies cleanly both to linux-mtd.git and the current linux-3.4 tree.

Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Signed-off-by: Thomas Betker <thomas.betker@rohde-schwarz.com>

diff -Naur linux-3.4.11-orig/fs/jffs2/file.c linux-3.4.11/fs/jffs2/file.c
--- linux-3.4.11-orig/fs/jffs2/file.c	2012-09-14 22:18:55.000000000 +0000
+++ linux-3.4.11/fs/jffs2/file.c	2012-10-05 09:01:10.000000000 +0000
@@ -138,33 +138,39 @@
  	struct page *pg;
  	struct inode *inode = mapping->host;
  	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_raw_inode ri;
+	uint32_t alloc_len = 0;
  	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
  	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
  	int ret = 0;
  
+	jffs2_dbg(1, "%s()\n", __func__);
+
+	if (pageofs > inode->i_size) {
+		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
+					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+		if (ret)
+			return ret;
+	}
+
+	mutex_lock(&f->sem);
  	pg = grab_cache_page_write_begin(mapping, index, flags);
-	if (!pg)
+	if (!pg) {
+		if (alloc_len)
+			jffs2_complete_reservation(c);
+		mutex_unlock(&f->sem);
  		return -ENOMEM;
+	}
  	*pagep = pg;
  
-	jffs2_dbg(1, "%s()\n", __func__);
-
-	if (pageofs > inode->i_size) {
+	if (alloc_len) {
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
@@ -191,7 +197,6 @@
  		if (IS_ERR(fn)) {
  			ret = PTR_ERR(fn);
  			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
  			goto out_page;
  		}
  		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
@@ -206,12 +211,10 @@
  			jffs2_mark_node_obsolete(c, fn->raw);
  			jffs2_free_full_dnode(fn);
  			jffs2_complete_reservation(c);
-			mutex_unlock(&f->sem);
  			goto out_page;
  		}
  		jffs2_complete_reservation(c);
  		inode->i_size = pageofs;
-		mutex_unlock(&f->sem);
  	}
  
  	/*
@@ -220,18 +223,18 @@
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
  	return ret;
  
  out_page:
  	unlock_page(pg);
  	page_cache_release(pg);
+	mutex_unlock(&f->sem);
  	return ret;
  }
  
