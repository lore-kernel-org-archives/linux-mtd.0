In-Reply-To: <OF039421E5.05D3267C-ONC1257BD0.0071BBE2-C1257BD0.007746F1@rohde-schwarz.com>
References: <000a01ce8ccc$8ae14840$1c214a0a@ztedengchao>
 <OF039421E5.05D3267C-ONC1257BD0.0071BBE2-C1257BD0.007746F1@rohde-schwarz.com>
Subject: Re: [JFFS2]The patch "jffs2: Fix lock acquisition order bug in
 jffs2_write_begin" introduces another dead lock bug.
To: Thomas.Betker@rohde-schwarz.com, linux-mtd@lists.infradead.org,
 "\"linux-mtd\"" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <OFD828A6E5.209922BA-ON48257BD3.002B0216-48257BD3.002E9985@zte.com.cn>
From: deng.chao1@zte.com.cn
Date: Mon, 26 Aug 2013 16:26:21 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, wang.bo116@zte.com.cn,
 Ming Liu <liu.ming50@gmail.com>, Thomas Betker <thomas.betker@freenet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas:

The patch is below.
I just revert your patch, and add my fix:
In jffs2_garbage_collect_live, I change read_cache_page_async(page) to read_cache_page_async_trylock(page),
it only takes the page lock when the lock is not being taken, otherwise just returns result to upper.
Once jffs2_garbage_collect_past knows the lock contentions through the return value of jffs2_garbage_collect_live,
it can just return and wait the next garbage collect operation to continue the jffs2_gc_fetch_page opeation,
keeps making another try to accquire the page lock until the lock is available.

Thanks
Deng chao

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 1506673..60ef3fb 100755
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -138,39 +138,33 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct page *pg;
 	struct inode *inode = mapping->host;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
-	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
-	struct jffs2_raw_inode ri;
-	uint32_t alloc_len = 0;
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
 	int ret = 0;

-	jffs2_dbg(1, "%s()\n", __func__);
-
-	if (pageofs > inode->i_size) {
-		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
-					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
-		if (ret)
-			return ret;
-	}
-
-	mutex_lock(&f->sem);
 	pg = grab_cache_page_write_begin(mapping, index, flags);
-	if (!pg) {
-		if (alloc_len)
-			jffs2_complete_reservation(c);
-		mutex_unlock(&f->sem);
+	if (!pg)
 		return -ENOMEM;
-	}
 	*pagep = pg;

-	if (alloc_len) {
+	jffs2_dbg(1, "%s()\n", __func__);
+
+	if (pageofs > inode->i_size) {
 		/* Make new hole frag from old EOF to new page */
+		struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
+		uint32_t alloc_len;

 		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
 			  (unsigned int)inode->i_size, pageofs);

+		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
+					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+		if (ret)
+			goto out_page;
+
+		mutex_lock(&f->sem);
 		memset(&ri, 0, sizeof(ri));

 		ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -197,6 +191,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 		if (IS_ERR(fn)) {
 			ret = PTR_ERR(fn);
 			jffs2_complete_reservation(c);
+			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
@@ -211,10 +206,12 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 			jffs2_mark_node_obsolete(c, fn->raw);
 			jffs2_free_full_dnode(fn);
 			jffs2_complete_reservation(c);
+			mutex_unlock(&f->sem);
 			goto out_page;
 		}
 		jffs2_complete_reservation(c);
 		inode->i_size = pageofs;
+		mutex_unlock(&f->sem);
 	}

 	/*
@@ -223,18 +220,18 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	 * case of a short-copy.
 	 */
 	if (!PageUptodate(pg)) {
+		mutex_lock(&f->sem);
 		ret = jffs2_do_readpage_nolock(inode, pg);
+		mutex_unlock(&f->sem);
 		if (ret)
 			goto out_page;
 	}
-	mutex_unlock(&f->sem);
 	jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
 	return ret;

 out_page:
 	unlock_page(pg);
 	page_cache_release(pg);
-	mutex_unlock(&f->sem);
 	return ret;
 }

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index fe3c052..7c875d2 100755
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -682,8 +682,16 @@ unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
 	struct inode *inode = OFNI_EDONI_2SFFJ(f);
 	struct page *pg;

-	pg = read_cache_page_async(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
-			     (void *)jffs2_do_readpage_unlock, inode);
+	/* read_cache_page_async_trylock will return -EBUSY
+	if it is not possible to lock the cache page. If we
+	get -EBUSY, then avoid a deadlock between
+	cache page locks and f->sem.
+	*/
+	pg = read_cache_page_async_trylock(inode->i_mapping,
+				offset >> PAGE_CACHE_SHIFT,
+				(void *)jffs2_do_readpage_unlock,
+				inode);
+
 	if (IS_ERR(pg))
 		return (void *)pg;

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 5a2dec2..76a4eb0 100755
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -445,6 +445,9 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)

 	jffs2_gc_release_inode(c, f);

+	if (!ret)
+		goto release_sem;
+
  test_gcnode:
 	if (jeb->dirty_size == gcblock_dirty && !ref_obsolete(jeb->gc_node)) {
 		/* Eep. This really should never happen. GC is broken */
@@ -1306,9 +1309,15 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);

 	if (IS_ERR(pg_ptr)) {
-		pr_warn("read_cache_page() returned error: %ld\n",
-			PTR_ERR(pg_ptr));
-		return PTR_ERR(pg_ptr);
+		if (PTR_ERR(pg_ptr) == -EBUSY) {
+			pr_warn("jffs2_gc_fetch_page() returned -EBUSY. Deadlock avoided.\n");
+			return 0;
+
+		} else {
+			pr_warn("read_cache_page() returned error: %ld\n",
+				PTR_ERR(pg_ptr));
+			return PTR_ERR(pg_ptr);
+		}
 	}

 	offset = start;
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index e3dea75..a0bf9c9 100755
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -272,6 +272,9 @@ extern struct page * grab_cache_page_nowait(struct address_space *mapping,
 				pgoff_t index);
 extern struct page * read_cache_page_async(struct address_space *mapping,
 				pgoff_t index, filler_t *filler, void *data);
+extern struct page *read_cache_page_async_trylock(
+				struct address_space *mapping,
+				pgoff_t index, filler_t *filler, void *data);
 extern struct page * read_cache_page(struct address_space *mapping,
 				pgoff_t index, filler_t *filler, void *data);
 extern struct page * read_cache_page_gfp(struct address_space *mapping,
diff --git a/mm/filemap.c b/mm/filemap.c
index 4b51ac1..81259b7 100755
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1887,6 +1887,49 @@ struct page *read_cache_page_async(struct address_space *mapping,
 }
 EXPORT_SYMBOL(read_cache_page_async);

+/*
+* Same as read_cache_page, but abort if the page is locked.
+*/
+struct page *read_cache_page_async_trylock(struct address_space *mapping,
+					pgoff_t index,
+					int (*filler)(void *, struct page *),
+					void *data)
+{
+	struct page *page;
+	int err;
+
+retry:
+	page = __read_cache_page(mapping, index, filler, data, mapping_gfp_mask(mapping));
+	if (IS_ERR(page))
+		return page;
+	if (PageUptodate(page))
+		goto out;
+
+	if (!trylock_page(page)) {
+		page_cache_release(page);
+		return ERR_PTR(-EBUSY);
+	}
+
+	if (!page->mapping) {
+		unlock_page(page);
+		page_cache_release(page);
+		goto retry;
+	}
+	if (PageUptodate(page)) {
+		unlock_page(page);
+		goto out;
+	}
+	err = filler(data, page);
+	if (err < 0) {
+		page_cache_release(page);
+		return ERR_PTR(err);
+	}
+ out:
+	mark_page_accessed(page);
+	return page;
+}
+EXPORT_SYMBOL(read_cache_page_async_trylock);
+
 static struct page *wait_on_page_read(struct page *page)
 {
 	if (!IS_ERR(page)) {
