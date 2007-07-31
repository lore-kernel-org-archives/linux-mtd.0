Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFrhi-0003q1-1s
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 14:24:03 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6VDNrJm023703
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 09:23:53 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6VDNqr9155750
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 07:23:52 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6VDNpQT015479
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 07:23:52 -0600
Subject: Re: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1185883827.3083.109.camel@pmac.infradead.org>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
	<1185883827.3083.109.camel@pmac.infradead.org>
Content-Type: multipart/mixed; boundary="=-1WTuke/g+fOwq/TmX/l9"
Date: Tue, 31 Jul 2007 08:23:49 -0500
Message-Id: <1185888229.14534.13.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
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


--=-1WTuke/g+fOwq/TmX/l9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On Tue, 2007-07-31 at 13:10 +0100, David Woodhouse wrote:
> On Mon, 2007-07-30 at 11:45 -0500, Dave Kleikamp wrote:
> > Thus we conclude that the root cause of the problem is that jffs2 is not 
> > conforming to the strict order of acquiring multiple locks, ie., all code 
> > paths resulting in acquiring multiple locks must do so in the same order. 
> > In this case, gc thread requests first the file lock, then the page lock, 
> > however jffs2_readpage function requests the page lock first, then the file 
> > lock. Another potential deadlock source is in jffs2_prepare_write, in which it 
> > requests page lock, then the file lock. 
> 
> If that's the explanation, then the patch which Nathan tried (dropping
> f->sem before jffs2_gc_fetch_page(), followed by your cleanups¹) ought
> to have fixed the problem. And I'd be happier with that version rather
> than introducing a new read_cache_page_async_trylock() solely for JFFS2.
> 
> It's actually OK to drop f->sem in jffs2_garbage_collect_dnode(). We
> hold the alloc_sem anyway -- nobody's going to be _changing_ the file
> under us. In fact, the garbage collector probably doesn't need to grab
> f->sem until it's actually going to _change_ something.

We had tried a similar patch, attached here, but it caused problems.
Maybe our patch is missing something.

>From the bug report:
-----------------------------
Built and ran the 2nd patch (attachment 28493 [edit]).  Results are similar
as before, jffs2 runs for a little while, but soon complains there's 
already data at the point where it intends to write. 

ARGH. About to write node to 0x00140010 on flash, but there's data already 
there:
0x00140010: 19 85 e0 02 00 00 00 ac 0a 3e 48 74 00 00 00 74
argh. node added in wrong place
Node totlen on flash (0x00000004) != totlen in node ref (0x000000ac)
ARGH. About to write node to 0x00140010 on flash, but there's data already 
there:
0x00140010: 19 85 e0 02 00 00 00 04 08 34 00 74 00 00 00 74
argh. node added in wrong place
ARGH. About to write node to 0xc01a4600 on flash, but there's data already 
there:
0xc01a4600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Write of 324 bytes at 0xc01a4600 failed. returned 0, retlen 0
Not marking the space at 0xc01a4600 as dirty because the flash driver returned 
retlen zero

It appeared to deadlock here, and after a few minutes the unit check timer 
stepped in a rebooted the system. 
-- 
David Kleikamp
IBM Linux Technology Center

--=-1WTuke/g+fOwq/TmX/l9
Content-Disposition: attachment; filename=up_down_3.patch
Content-Type: text/x-patch; name=up_down_3.patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

diff -Nurp devel-2.4.18/fs/jffs2/file.c linux/fs/jffs2/file.c
--- devel-2.4.18/fs/jffs2/file.c	2007-06-07 13:01:11.000000000 -0500
+++ linux/fs/jffs2/file.c	2007-06-08 10:12:54.000000000 -0500
@@ -333,21 +333,19 @@ int jffs2_do_readpage_nolock (struct ino
 
 int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
 {
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+
+	down(&f->sem);
 	int ret = jffs2_do_readpage_nolock(inode, pg);
 	UnlockPage(pg);
+	up(&f->sem);
 	return ret;
 }
 
 
 int jffs2_readpage (struct file *filp, struct page *pg)
 {
-	struct jffs2_inode_info *f = JFFS2_INODE_INFO(filp->f_dentry->d_inode);
-	int ret;
-	
-	down(&f->sem);
-	ret = jffs2_do_readpage_unlock(filp->f_dentry->d_inode, pg);
-	up(&f->sem);
-	return ret;
+	return jffs2_do_readpage_unlock(filp->f_dentry->d_inode, pg);
 }
 
 int jffs2_prepare_write (struct file *filp, struct page *pg, unsigned start, unsigned end)
diff -Nurp devel-2.4.18/fs/jffs2/gc.c linux/fs/jffs2/gc.c
--- devel-2.4.18/fs/jffs2/gc.c	2007-06-07 13:01:09.000000000 -0500
+++ linux/fs/jffs2/gc.c	2007-06-08 10:12:54.000000000 -0500
@@ -703,7 +703,9 @@ static int jffs2_garbage_collect_dnode(s
 	 *    page OK. We'll actually write it out again in commit_write, which is a little
 	 *    suboptimal, but at least we're correct.
 	 */
+	up(f->sem);
 	pg = read_cache_page(inode->i_mapping, start >> PAGE_CACHE_SHIFT, (void *)jffs2_do_readpage_unlock, inode);
+	down(f->sem);
 
 	if (IS_ERR(pg)) {
 		printk(KERN_WARNING "read_cache_page() returned error: %ld\n", PTR_ERR(pg));

--=-1WTuke/g+fOwq/TmX/l9--
