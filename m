Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEVYA-0006bD-RW
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 22:46:12 +0000
In-Reply-To: <1274209152.6930.7802.camel@macbook.infradead.org>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>	
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
	<1274207844.6930.7754.camel@macbook.infradead.org>
	<1274209152.6930.7802.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OFD51FB25D.7FE00DFB-ONC1257727.007C6420-C1257727.007CE876@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 19 May 2010 00:44:19 +0200
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

David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/18 20:59:12:
>
> On Tue, 2010-05-18 at 19:37 +0100, David Woodhouse wrote:
> >
> > Hrm, and now everything which calls jffs2_erase_pending_trigger()
> > needs
> > _not_ to be holding c->erase_completion_lock, or it'll deadlock...
>
> Playing with this incremental patch now...

oops, this got a lot more complicated. I will have closer look tmw.

BTW, I had a much simpler patch to start with but it was reject because
it tested for signals in erase_pending_blocks(). Look for
  jffs2: Move erasing from write_super to GC.
and
  jffs2: Make jffs2_erase_pending_trigger() initiate GC.
if you want to look.

>
> I also moved the erasing into jffs2_garbage_collect_pass() itself rather
> than having both callers of jffs2_garbage_collect_pass() do it for
> themselves, under different circumstances. I think the one in
> jffs2_reserve_space() was buggy anyway.
>
> diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> index 6cc014c..8c9ffdc 100644
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
>     if (c->gc_task && jffs2_thread_should_wake(c))
>        send_sig(SIGHUP, c->gc_task, 1);
> -   spin_unlock(&c->erase_completion_lock);
>  }
>
>  /* This must only ever be called when no GC thread is currently running */
> @@ -146,9 +145,8 @@ static int jffs2_garbage_collect_thread(void *_c)
>        disallow_signal(SIGHUP);
>
>        D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
> -      if (jffs2_erase_pending_blocks(c, 1))
> -         /* Nothing more to do ATM */;
> -      else if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
> +
> +      if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
>           printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
>           goto die;
>        }
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index 2a6cc6c..e8638f8 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -168,8 +168,11 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info
> *c, struct jffs2_eraseblo
>     mutex_lock(&c->erase_free_sem);
>     spin_lock(&c->erase_completion_lock);
>     list_move_tail(&jeb->list, &c->erase_complete_list);
> +   /* Wake the GC thread to mark them clean */
> +   jffs2_erase_pending_trigger(c);
>     spin_unlock(&c->erase_completion_lock);
>     mutex_unlock(&c->erase_free_sem);
> +   wake_up(&c->erase_wait);
>  }
>
>  static void jffs2_erase_failed(struct jffs2_sb_info *c, struct
> jffs2_eraseblock *jeb, uint32_t bad_offset)
> @@ -488,9 +491,9 @@ filebad:
>
>  refile:
>     /* Stick it back on the list from whence it came and come back later */
> -   jffs2_erase_pending_trigger(c);
>     mutex_lock(&c->erase_free_sem);
>     spin_lock(&c->erase_completion_lock);
> +   jffs2_erase_pending_trigger(c);
>     list_move(&jeb->list, &c->erase_complete_list);
>     spin_unlock(&c->erase_completion_lock);
>     mutex_unlock(&c->erase_free_sem);
> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
> index 3b6f2fa..1ea4a84 100644
> --- a/fs/jffs2/gc.c
> +++ b/fs/jffs2/gc.c
> @@ -214,6 +214,19 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
>        return ret;
>     }
>
> +   /* If there are any blocks which need erasing, erase them now */
> +   if (!list_empty(&c->erase_complete_list) ||
> +       !list_empty(&c->erase_pending_list)) {
> +      spin_unlock(&c->erase_completion_lock);
> +      D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass() erasing pending blocks\n"));
> +      if (jffs2_erase_pending_blocks(c, 1)) {
> +         mutex_unlock(&c->alloc_sem);
> +         return 0;
> +      }
> +      D1(printk(KERN_DEBUG "No progress from erasing blocks; doing GC anyway\n"));
> +      spin_lock(&c->erase_completion_lock);
> +   }
> +
>     /* First, work out which block we're garbage-collecting */
>     jeb = c->gcblock;
>
> @@ -222,7 +235,7 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
>
>     if (!jeb) {
>        /* Couldn't find a free block. But maybe we can just erase one and make
> 'progress'? */
> -      if (!list_empty(&c->erase_pending_list)) {
> +      if (c->nr_erasing_blocks) {
>           spin_unlock(&c->erase_completion_lock);
>           mutex_unlock(&c->alloc_sem);
>           return -EAGAIN;
> diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
> index 4779301..8ec436a 100644
> --- a/fs/jffs2/nodemgmt.c
> +++ b/fs/jffs2/nodemgmt.c
> @@ -115,9 +115,21 @@ int jffs2_reserve_space(struct jffs2_sb_info *c, uint32_t minsize,
>           spin_unlock(&c->erase_completion_lock);
>
>           ret = jffs2_garbage_collect_pass(c);
> -
> -         if (ret == -EAGAIN)
> -            jffs2_erase_pending_blocks(c, 1);
> +         if (ret == -EAGAIN) {
> +            spin_lock(&c->erase_completion_lock);
> +            if (c->nr_erasing_blocks &&
> +                list_empty(&c->erase_pending_list) &&
> +                list_empty(&c->erase_complete_list)) {
> +               DECLARE_WAITQUEUE(wait, current);
> +               set_current_state(TASK_UNINTERRUPTIBLE);
> +               add_wait_queue(&c->erase_wait, &wait);
> +               D1(printk(KERN_DEBUG "%s waiting for erase to complete\n", __func__));
> +               spin_unlock(&c->erase_completion_lock);
> +
> +               schedule();
> +            } else
> +               spin_unlock(&c->erase_completion_lock);
> +         }
>           else if (ret)
>              return ret;
>
> @@ -469,7 +481,9 @@ struct jffs2_raw_node_ref *jffs2_add_physical_node_ref
> (struct jffs2_sb_info *c,
>  void jffs2_complete_reservation(struct jffs2_sb_info *c)
>  {
>     D1(printk(KERN_DEBUG "jffs2_complete_reservation()\n"));
> -   jffs2_garbage_collect_trigger(c);
> +   spin_lock(&c->erase_completion_lock);
> +   jffs2_erase_pending_trigger(c);
> +   spin_unlock(&c->erase_completion_lock);
>     mutex_unlock(&c->alloc_sem);
>  }
>
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index 5d26362..64ac455 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -148,13 +148,7 @@ static inline void jffs2_dirty_trigger(struct jffs2_sb_info *c)
>  /* background.c */
>  int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c);
>  void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c);
> -void jffs2_garbage_collect_trigger(struct jffs2_sb_info *c);
> -
> -/* erase.c */
> -static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
> -{
> -   jffs2_garbage_collect_trigger(c);
> -}
> +void jffs2_erase_pending_trigger(struct jffs2_sb_info *c);
>
>  /* dir.c */
>  extern const struct file_operations jffs2_dir_operations;
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> index 696686c..1312552 100644
> --- a/fs/jffs2/scan.c
> +++ b/fs/jffs2/scan.c
> @@ -260,7 +260,9 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
>           ret = -EIO;
>           goto out;
>        }
> +      spin_lock(&c->erase_completion_lock);
>        jffs2_erase_pending_trigger(c);
> +      spin_unlock(&c->erase_completion_lock);
>     }
>     ret = 0;
>   out:
>
>
> --
> dwmw2
>
>
>
