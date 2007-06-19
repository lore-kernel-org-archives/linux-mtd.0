Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I0jbO-0001aQ-W2
	for linux-mtd@lists.infradead.org; Tue, 19 Jun 2007 20:43:00 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5JJi0l0019458
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2007 15:44:00 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5JJgo4h500946
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2007 15:42:52 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5JJgoIr004592
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2007 15:42:50 -0400
Subject: RE: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>
In-Reply-To: <1182269506.14944.7.camel@kleikamp.austin.ibm.com>
References: <1181330764.10571.34.camel@kleikamp.austin.ibm.com>
	<1181564059.2801.93.camel@pmac.infradead.org>
	<F0A7A3D5461CB54F878D218854074FCE021A9529@de01exm63.ds.mot.com>
	<1182269506.14944.7.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain
Date: Tue, 19 Jun 2007 14:42:49 -0500
Message-Id: <1182282169.14944.16.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	copelanm@us.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-19 at 11:11 -0500, Dave Kleikamp wrote:

> We came up with a fix for the hang were seeing on an older kernel.  It's
> hacky and intrusive, but I wanted to offer it up at least to see if it
> fixes Nathan's hang, and if so, maybe it can lead to some nicer patch
> that may be acceptable.
> 
> This version, against linux-2.6.22-rc5 has been compile-tested only.
> Don't let the _async scare you.  Since jffs2's filler function is
> synchronous, so there's no need to wait for the page to become unlocked
> again.

Monte Copeland pointed out that my last patch could pass the -EBUSY
return code up to a calling thread which would be undesirable.  I was
only considering the garbage-collector thread which ignores the return
code.  Here is the fixed patch.  This has been tested against a
2.6.16-based kernel.

Again, this is a bit intrusive, but it may be a step in the right
direction.

diff -Nurp linux-2.6.22-rc5/fs/jffs2/fs.c linux/fs/jffs2/fs.c
--- linux-2.6.22-rc5/fs/jffs2/fs.c	2007-06-17 08:01:52.000000000 -0500
+++ linux/fs/jffs2/fs.c	2007-06-19 14:28:30.000000000 -0500
@@ -627,8 +627,15 @@ unsigned char *jffs2_gc_fetch_page(struc
 	struct inode *inode = OFNI_EDONI_2SFFJ(f);
 	struct page *pg;
 
-	pg = read_cache_page(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
-			     (void *)jffs2_do_readpage_unlock, inode);
+	/* read_cache_page_async_trylock will return -EBUSY
+	 * if it is not possible to lock the cache page. If we
+	 * get -EBUSY, then avoid a deadlock between
+	 * cache page locks and f->sem.
+	 */
+	pg = read_cache_page_async_trylock(inode->i_mapping,
+					   offset >> PAGE_CACHE_SHIFT,
+					   (void *)jffs2_do_readpage_unlock,
+					   inode);
 	if (IS_ERR(pg))
 		return (void *)pg;
 
diff -Nurp linux-2.6.22-rc5/fs/jffs2/gc.c linux/fs/jffs2/gc.c
--- linux-2.6.22-rc5/fs/jffs2/gc.c	2007-06-17 08:01:52.000000000 -0500
+++ linux/fs/jffs2/gc.c	2007-06-19 14:30:00.000000000 -0500
@@ -1221,8 +1221,13 @@ static int jffs2_garbage_collect_dnode(s
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
 
 	if (IS_ERR(pg_ptr)) {
-		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg_ptr));
-		return PTR_ERR(pg_ptr);
+		if ( PTR_ERR(pg_ptr) == -EBUSY ) {
+			printk(KERN_WARNING "jffs2_gc_fetch_page() rc -EBUSY. Deadlock avoided.\n" );
+			return 0;
+		} else {
+			printk(KERN_WARNING "jffs2_gc_fetch_page() rc %ld\n", PTR_ERR(pg_ptr));
+			return PTR_ERR(pg_ptr);
+		}
 	}
 
 	offset = start;
diff -Nurp linux-2.6.22-rc5/include/linux/pagemap.h linux/include/linux/pagemap.h
--- linux-2.6.22-rc5/include/linux/pagemap.h	2007-06-17 08:02:01.000000000 -0500
+++ linux/include/linux/pagemap.h	2007-06-19 14:30:12.000000000 -0500
@@ -112,6 +112,10 @@ extern struct page * read_cache_page_asy
 extern struct page * read_cache_page(struct address_space *mapping,
 				unsigned long index, filler_t *filler,
 				void *data);
+extern struct page * read_cache_page_async_trylock(
+				struct address_space *mapping,
+				unsigned long index, filler_t *filler,
+				void *data);
 extern int read_cache_pages(struct address_space *mapping,
 		struct list_head *pages, filler_t *filler, void *data);
 
diff -Nurp linux-2.6.22-rc5/mm/filemap.c linux/mm/filemap.c
--- linux-2.6.22-rc5/mm/filemap.c	2007-06-17 08:02:02.000000000 -0500
+++ linux/mm/filemap.c	2007-06-19 14:31:36.000000000 -0500
@@ -1843,6 +1843,51 @@ struct page *read_cache_page(struct addr
 }
 EXPORT_SYMBOL(read_cache_page);
 
+
+/*
+ * Same as read_cache_page, but abort if the page is locked.
+ */
+struct page *read_cache_page_async_trylock(struct address_space *mapping,
+				unsigned long index,
+				int (*filler)(void *, struct page *),
+				void *data)
+{
+	struct page *page;
+	int err;
+
+retry:
+	page = __read_cache_page(mapping, index, filler, data);
+	if (IS_ERR(page))
+		goto out;
+	mark_page_accessed(page);
+	if (PageUptodate(page))
+		goto out;
+
+	if (TestSetPageLocked(page)) {
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
+		page = ERR_PTR(err);
+	}
+ out:
+	mark_page_accessed(page);
+	return page;
+}
+EXPORT_SYMBOL(read_cache_page_async_trylock);
+
 /*
  * If the page was newly created, increment its refcount and add it to the
  * caller's lru-buffering pagevec.  This function is specifically for

-- 
David Kleikamp
IBM Linux Technology Center
