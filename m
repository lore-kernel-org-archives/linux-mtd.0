Received: from bay17-f30.bay17.hotmail.com ([64.4.43.80] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7udK-0007jp-0x
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 13:45:35 +0100
Message-ID: <BAY17-F30CC2FC4525C7421C68681E8A80@phx.gbl>
In-Reply-To: <20050824120535.GA8670@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Wed, 24 Aug 2005 20:45:23 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add erase count tracking support in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> > diff -auNrp ./mtd/include/linux/jffs2_fs_sb.h 
./mtd_new/include/linux/jffs2_fs_sb.h
> > --- ./mtd/include/linux/jffs2_fs_sb.h	2005-05-20 06:00:14.000000000 
+0800
> > +++ ./mtd_new/include/linux/jffs2_fs_sb.h	2005-08-18 13:28:36.000000000 
+0800
> > @@ -40,7 +40,9 @@ struct jffs2_sb_info {
> >  					   out-of-order writing of nodes. And GC. */
> >  	uint32_t cleanmarker_size;	/* Size of an _inline_ CLEANMARKER
> >  					 (i.e. zero for OOB CLEANMARKER */
> > -
> > +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> > +	uint32_t erasecount_size;	/* size of an _inline_ erase-count node */
> > +#endif
> >  	uint32_t flash_size;
> >  	uint32_t used_size;
> >  	uint32_t dirty_size;
> > @@ -89,6 +91,10 @@ struct jffs2_sb_info {
> >  	wait_queue_head_t inocache_wq;
> >  	struct jffs2_inode_cache **inocache_list;
> >  	spinlock_t inocache_lock;
> > +
> > +#ifdef CONFIG_JFFS2_FS_ERASE_COUNT_TRACKING
> > +	uint32_t total_erase_count;	/* The summary erase count of all erase 
blocks on a Flash  */
> > +#endif
>
>This field is write-only?  What did you plan to do with it?
>

total_erase_count will be used in my next patch for "enhanced 
wear-leveling" patch.
I'll send out another to fix other points soon.

Thanks,
Forrest
