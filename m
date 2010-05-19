Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEfwc-0004TA-2w
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 09:52:07 +0000
In-Reply-To: <1274226122.6930.8416.camel@macbook.infradead.org>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>	
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
	<1274207844.6930.7754.camel@macbook.infradead.org>	
	<1274209152.6930.7802.camel@macbook.infradead.org>
	<OFD51FB25D.7FE00DFB-ONC1257727.007C6420-C1257727.007CE876@transmode.se>
	<1274226122.6930.8416.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OFC16DD021.1CA8E33E-ONC1257728.002FE329-C1257728.0035CD60@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 19 May 2010 11:47:39 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/19 01:42:02:
>
> On Wed, 2010-05-19 at 00:44 +0200, Joakim Tjernlund wrote:
> >
> > oops, this got a lot more complicated. I will have closer look tmw.
>
> It's not so bad -- the whole thing looks like this (I'll follow it up
> with a global s/jffs2_erase_pending_trigger/jffs2_gc_thread_trigger/).
>
> It could perhaps be broken into smaller simple patches along the lines
> of:
>  - Add 'work_done' return value from jffs2_erase_pending_blocks()
>  - Call jffs2_erase_pending_blocks() from jffs2_g_c_pass()
>  - Fix the conditions under which jffs2_g_c_pass() will return -EINVAL,
>    fix the way that jffs2_reserve_space() will respond to that, and fix
>    jffs2_erase_succeeded() to actually wake up the erase_wait queue.
>  - Remove locking from jffs2_garbage_collect_trigger() and require that
>    callers have c->erase_completion_lock already held.
>  - Change most callers of jffs2_erase_pending_trigger() to call
>    jffs2_garbage_collect_trigger() instead. To comply with the locking
>    rules, this may involve moving the call up or down a few lines, or
>    sometimes adding a new lock/unlock pair around it.
>  - Remove jffs2_erase_pending_blocks() call from jffs2_write_super().
>  - Rename jffs2_erase_pending_trigger() and its only remaining caller
>    in wbuf.c to jffs2_dirty_trigger().

I have tried this on my 2.6.33 tree and it seems to work OK.
I am currenltly copying lots of files and deleting them in a loop,
so far so good :) Needed to "tweak":

>
>
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 3ff50da..39c65ad 100644
> --- a/fs/jffs2/background.c
> +++ b/fs/jffs2/background.c
> @@ -21,12 +21,11 @@
>
>  static int jffs2_garbage_collect_thread(void *);
>
> -void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c)
> +void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
>  {
> -   spin_lock(&c->erase_completion_lock);
> +   BUG_ON(spin_trylock(&c->erase_completion_lock));

This looks like a typo and I had to change that to:
BUG_ON(spin_is_locked(&c->erase_completion_lock));

>     if (c->gc_task && jffs2_thread_should_wake(c))
>        send_sig(SIGHUP, c->gc_task, 1);
> -   spin_unlock(&c->erase_completion_lock);
>  }
>
>  /* This must only ever be called when no GC thread is currently running */
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index b47679b..e8638f8 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -103,9 +103,10 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
>     jffs2_erase_failed(c, jeb, bad_offset);
>  }
>
> -void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
> +int jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
>  {
>     struct jffs2_eraseblock *jeb;
> +   int work_done = 0;
>
>     mutex_lock(&c->erase_free_sem);
>
> @@ -123,6 +124,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
>
>           if (!--count) {
>              D1(printk(KERN_DEBUG "Count reached. jffs2_erase_pending_blocks
> leaving\n"));
> +            work_done = 1;

work_done = 1; should move outside the if, otherwise it might get set if count is big.
