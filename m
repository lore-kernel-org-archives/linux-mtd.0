Received: from wr-out-0506.google.com ([64.233.184.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IESmq-00061u-QR
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 12:35:38 -0400
Received: by wr-out-0506.google.com with SMTP id i22so548436wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jul 2007 09:35:31 -0700 (PDT)
Message-ID: <af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
Date: Sat, 28 Jul 2007 00:35:29 +0800
From: "ye janboe" <janboe.ye@gmail.com>
To: "Dave Kleikamp" <shaggy@linux.vnet.ibm.com>
Subject: Re: JFFS2 deadlock with alloc_sem
In-Reply-To: <1185543729.13873.10.camel@kleikamp.austin.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David

Thanks for you comments.
I still can not understand why there is comment in code say the dead
lock can not happen.
Could you give me some hints?

2007/7/27, Dave Kleikamp <shaggy@linux.vnet.ibm.com>:
> On Fri, 2007-07-27 at 11:38 +0800, ye janboe wrote:
> > Does this make fsync system call failed to cause a risk of loss data?
>
> Could be.  It looks like I wasn't careful about considering all the
> callers of jffs2_garbage_collect_pass().  I assume the problem is when
> it is called from jffs2_flush_wbuf_gc().
>
> > I posted my fix base on your patch, please review it.
> >
> > Thanks
> >
> > --- gc.c@@/main/fl71_main/a22116_jffs2_sync_debug/0     2007-07-24
> > 17:02:26.746154000 +0800
> > +++ gc.c@@/main/fl71_main/a22116_jffs2_sync_debug/2     2007-07-24
> > 17:39:35.000000000 +0800
> > @@ -1299,7 +1299,10 @@ static int jffs2_garbage_collect_dnode(s
> >         if (IS_ERR(pg_ptr)) {
> >                 if ( PTR_ERR(pg_ptr) == -EBUSY ) {
> >                         printk(KERN_WARNING "jffs2_gc_fetch_page() rc
> > -EBUSY. Deadlock avoided.\n" );
> > -                       return 0;
> > +                       if (current->flags & PF_SYNCWRITE)
> > +                               return -EBUSY;
> > +                       else
> > +                               return 0;
> >                 } else {
> >                         printk(KERN_WARNING "jffs2_gc_fetch_page() rc
> > %ld\n", PTR_ERR(pg_ptr));
> >                         return PTR_ERR(pg_ptr);
>
> That is probably okay, but I think it is getting more complicated than
> it needs to be.
>
> What if we let jffs2_garbage_collect_dnode() return -EBUSY all the time,
> and let the callers that don't care ignore it?
>
> How's this look?
>
> diff -Nurp linux.orig/fs/jffs2/gc.c linux/fs/jffs2/gc.c
> --- linux.orig/fs/jffs2/gc.c    2007-07-27 08:32:36.000000000 -0500
> +++ linux/fs/jffs2/gc.c 2007-07-27 08:33:59.000000000 -0500
> @@ -1221,13 +1221,8 @@ static int jffs2_garbage_collect_dnode(s
>         pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
>
>         if (IS_ERR(pg_ptr)) {
> -               if ( PTR_ERR(pg_ptr) == -EBUSY ) {
> -                       printk(KERN_WARNING "jffs2_gc_fetch_page() rc -EBUSY. Deadlock avoided.\n" );
> -                       return 0;
> -               } else {
> -                       printk(KERN_WARNING "jffs2_gc_fetch_page() rc %ld\n", PTR_ERR(pg_ptr));
> -                       return PTR_ERR(pg_ptr);
> -               }
> +               printk(KERN_WARNING "jffs2_gc_fetch_page() rc %ld\n", PTR_ERR(pg_ptr));
> +               return PTR_ERR(pg_ptr);
>         }
>
>         offset = start;
> diff -Nurp linux.orig/fs/jffs2/nodemgmt.c linux/fs/jffs2/nodemgmt.c
> --- linux.orig/fs/jffs2/nodemgmt.c      2007-07-27 08:32:25.000000000 -0500
> +++ linux/fs/jffs2/nodemgmt.c   2007-07-27 08:35:46.000000000 -0500
> @@ -117,7 +117,7 @@ int jffs2_reserve_space(struct jffs2_sb_
>                         spin_unlock(&c->erase_completion_lock);
>
>                         ret = jffs2_garbage_collect_pass(c);
> -                       if (ret)
> +                       if (ret && (ret != -EBUSY))
>                                 return ret;
>
>                         cond_resched();
>
> --
> David Kleikamp
> IBM Linux Technology Center
>
>
