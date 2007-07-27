Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IEQ5O-0004Oj-AE
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 14:42:31 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6RDgDk5023711
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 09:42:13 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6RDgBTv533554
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 09:42:13 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6RDgAX1017641
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 09:42:11 -0400
Subject: Re: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: ye janboe <janboe.ye@gmail.com>
In-Reply-To: <af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 27 Jul 2007 13:42:09 +0000
Message-Id: <1185543729.13873.10.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-27 at 11:38 +0800, ye janboe wrote:
> Does this make fsync system call failed to cause a risk of loss data?

Could be.  It looks like I wasn't careful about considering all the
callers of jffs2_garbage_collect_pass().  I assume the problem is when
it is called from jffs2_flush_wbuf_gc().

> I posted my fix base on your patch, please review it.
> 
> Thanks
> 
> --- gc.c@@/main/fl71_main/a22116_jffs2_sync_debug/0     2007-07-24
> 17:02:26.746154000 +0800
> +++ gc.c@@/main/fl71_main/a22116_jffs2_sync_debug/2     2007-07-24
> 17:39:35.000000000 +0800
> @@ -1299,7 +1299,10 @@ static int jffs2_garbage_collect_dnode(s
>         if (IS_ERR(pg_ptr)) {
>                 if ( PTR_ERR(pg_ptr) == -EBUSY ) {
>                         printk(KERN_WARNING "jffs2_gc_fetch_page() rc
> -EBUSY. Deadlock avoided.\n" );
> -                       return 0;
> +                       if (current->flags & PF_SYNCWRITE)
> +                               return -EBUSY;
> +                       else
> +                               return 0;
>                 } else {
>                         printk(KERN_WARNING "jffs2_gc_fetch_page() rc
> %ld\n", PTR_ERR(pg_ptr));
>                         return PTR_ERR(pg_ptr);

That is probably okay, but I think it is getting more complicated than
it needs to be. 

What if we let jffs2_garbage_collect_dnode() return -EBUSY all the time,
and let the callers that don't care ignore it?

How's this look?

diff -Nurp linux.orig/fs/jffs2/gc.c linux/fs/jffs2/gc.c
--- linux.orig/fs/jffs2/gc.c	2007-07-27 08:32:36.000000000 -0500
+++ linux/fs/jffs2/gc.c	2007-07-27 08:33:59.000000000 -0500
@@ -1221,13 +1221,8 @@ static int jffs2_garbage_collect_dnode(s
 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
 
 	if (IS_ERR(pg_ptr)) {
-		if ( PTR_ERR(pg_ptr) == -EBUSY ) {
-			printk(KERN_WARNING "jffs2_gc_fetch_page() rc -EBUSY. Deadlock avoided.\n" );
-			return 0;
-		} else {
-			printk(KERN_WARNING "jffs2_gc_fetch_page() rc %ld\n", PTR_ERR(pg_ptr));
-			return PTR_ERR(pg_ptr);
-		}
+		printk(KERN_WARNING "jffs2_gc_fetch_page() rc %ld\n", PTR_ERR(pg_ptr));
+		return PTR_ERR(pg_ptr);
 	}
 
 	offset = start;
diff -Nurp linux.orig/fs/jffs2/nodemgmt.c linux/fs/jffs2/nodemgmt.c
--- linux.orig/fs/jffs2/nodemgmt.c	2007-07-27 08:32:25.000000000 -0500
+++ linux/fs/jffs2/nodemgmt.c	2007-07-27 08:35:46.000000000 -0500
@@ -117,7 +117,7 @@ int jffs2_reserve_space(struct jffs2_sb_
 			spin_unlock(&c->erase_completion_lock);
 
 			ret = jffs2_garbage_collect_pass(c);
-			if (ret)
+			if (ret && (ret != -EBUSY))
 				return ret;
 
 			cond_resched();

-- 
David Kleikamp
IBM Linux Technology Center
