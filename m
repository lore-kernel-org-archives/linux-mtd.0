Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hwk6J-0000Fn-Rd
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2007 15:26:25 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l58JQ5tk016481
	for <linux-mtd@lists.infradead.org>; Fri, 8 Jun 2007 15:26:05 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l58JQ56u437648
	for <linux-mtd@lists.infradead.org>; Fri, 8 Jun 2007 15:26:05 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l58JQ5Um005766
	for <linux-mtd@lists.infradead.org>; Fri, 8 Jun 2007 15:26:05 -0400
Subject: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Date: Fri, 08 Jun 2007 14:26:04 -0500
Message-Id: <1181330764.10571.34.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nathan.Roberts@motorola.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forgive me for not following up properly, but I'm not on the mailing
list, and I'm following up from the archives.

> On Mon, 2007-04-30 at 15:41 -0400, Roberts Nathan-mcg31137 wrote:
> > Has anyone seen this deadlock before? It seems to be a classic deadlock 
> > situation so I'm not sure if maybe I'm misinterpreting things or 
> > the use case (several postmark tests running in parallel on a
> > preemptible kernel) is especially vulnerable. 
> 
> I think Josh has spotted the real problem here. Does this help? If so,
> as better fix will be forthcoming....
> 
> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
> index 2d99e06..1066120 100644
> --- a/fs/jffs2/gc.c
> +++ b/fs/jffs2/gc.c
> @@ -1218,7 +1218,9 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
>  	 *    page OK. We'll actually write it out again in commit_write, which is a little
>  	 *    suboptimal, but at least we're correct.
>  	 */
> +	up(&f->sem);
>  	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
> +	down(&f->sem);
>  
>  	if (IS_ERR(pg_ptr)) {
>  		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg_ptr));

As you know, jffs2_gc_fetch_page() causes read_cache_page() to call
jffs2_do_readpage_unlock().  jffs2_do_readpage_unlock() expects f->sem
to be held, but in no longer is.  I think, with this change,
jffs2_do_readpage_unlock() is the right place to take f->sem.  What do
you think of this patch, and does it have any affect on Nathan's
deadlock?

Note: If this works out, jffs2_readpage and jffs2_do_readpage_unlock can
probably be collapsed into one function.

diff -Nurp linux-2.6.22-rc4/fs/jffs2/file.c linux/fs/jffs2/file.c
--- linux-2.6.22-rc4/fs/jffs2/file.c	2007-06-05 08:10:59.000000000 -0500
+++ linux/fs/jffs2/file.c	2007-06-08 13:18:18.000000000 -0500
@@ -102,21 +102,20 @@ static int jffs2_do_readpage_nolock (str
 
 int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
 {
-	int ret = jffs2_do_readpage_nolock(inode, pg);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	int ret;
+
+	down(&f->sem);
+	ret = jffs2_do_readpage_nolock(inode, pg);
 	unlock_page(pg);
+	up(&f->sem);
 	return ret;
 }
 
 
 static int jffs2_readpage (struct file *filp, struct page *pg)
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
diff -Nurp linux-2.6.22-rc4/fs/jffs2/gc.c linux/fs/jffs2/gc.c
--- linux-2.6.22-rc4/fs/jffs2/gc.c	2007-06-05 08:10:59.000000000 -0500
+++ linux/fs/jffs2/gc.c	2007-06-08 13:16:29.000000000 -0500
@@ -1218,7 +1218,9 @@ static int jffs2_garbage_collect_dnode(s
 	 *    page OK. We'll actually write it out again in commit_write, which is a little
 	 *    suboptimal, but at least we're correct.
 	 */
+	up(&f->sem);
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
+	down(&f->sem);
 
 	if (IS_ERR(pg_ptr)) {
 		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg_ptr));

Thanks,
Shaggy
-- 
David Kleikamp
IBM Linux Technology Center
