Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1185883827.3083.109.camel@pmac.infradead.org>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
	<1185883827.3083.109.camel@pmac.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Jul 2007 13:40:27 +0100
Message-Id: <1185885627.3083.113.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-31 at 13:10 +0100, David Woodhouse wrote:
> If that's the explanation, then the patch which Nathan tried (dropping
> f->sem before jffs2_gc_fetch_page(), followed by your cleanups¹) ought
> to have fixed the problem. And I'd be happier with that version rather
> than introducing a new read_cache_page_async_trylock() solely for
> JFFS2.

This is the tidied-up version of that patch...

diff --git a/fs/jffs2/README.Locking b/fs/jffs2/README.Locking
index d14d5a4..5836de7 100644
--- a/fs/jffs2/README.Locking
+++ b/fs/jffs2/README.Locking
@@ -69,6 +69,8 @@ Ordering constraints:
 	   any f->sem held.
 	2. Never attempt to lock two file semaphores in one thread.
 	   No ordering rules have been made for doing so.
+(Linux)	3. f->sem must always be locked _after_ the page lock of
+	   any page cache page belonging to the file in question.
 
 
 	erase_completion_lock spinlock
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index c253019..4c09531 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -69,7 +69,7 @@ const struct address_space_operations jffs2_file_address_operations =
 	.commit_write =	jffs2_commit_write
 };
 
-static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
+static int jffs2_do_readpage(struct inode *inode, struct page *pg)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
@@ -83,8 +83,11 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	pg_buf = kmap(pg);
 	/* FIXME: Can kmap fail? */
 
+	down(&f->sem);
+
 	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
 
+	up(&f->sem);
 	if (ret) {
 		ClearPageUptodate(pg);
 		SetPageError(pg);
@@ -102,21 +105,14 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 
 int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
 {
-	int ret = jffs2_do_readpage_nolock(inode, pg);
+	int ret = jffs2_do_readpage(inode, pg);
 	unlock_page(pg);
 	return ret;
 }
 
-
-static int jffs2_readpage (struct file *filp, struct page *pg)
+static int jffs2_readpage(struct file *filp, struct page *pg)
 {
-	struct jffs2_inode_info *f = JFFS2_INODE_INFO(pg->mapping->host);
-	int ret;
-
-	down(&f->sem);
-	ret = jffs2_do_readpage_unlock(pg->mapping->host, pg);
-	up(&f->sem);
-	return ret;
+	return jffs2_do_readpage_unlock(pg->mapping->host, pg);
 }
 
 static int jffs2_prepare_write (struct file *filp, struct page *pg,
@@ -194,11 +190,9 @@ static int jffs2_prepare_write (struct file *filp, struct page *pg,
 	}
 
 	/* Read in the page if it wasn't already present, unless it's a whole page */
-	if (!PageUptodate(pg) && (start || end < PAGE_CACHE_SIZE)) {
-		down(&f->sem);
-		ret = jffs2_do_readpage_nolock(inode, pg);
-		up(&f->sem);
-	}
+	if (!PageUptodate(pg) && (start || end < PAGE_CACHE_SIZE))
+		ret = jffs2_do_readpage(inode, pg);
+
 	D1(printk(KERN_DEBUG "end prepare_write(). pg->flags %lx\n", pg->flags));
 	return ret;
 }
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index eded819..51cb3d1 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1218,7 +1218,9 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	 *    page OK. We'll actually write it out again in commit_write, which is a little
 	 *    suboptimal, but at least we're correct.
 	 */
+	up(&f->sem);
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
+	down(&f->sem);
 
 	if (IS_ERR(pg_ptr)) {
 		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg_ptr));
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h

-- 
dwmw2
