Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ7cT-0001Pq-1H
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 18:55:02 +0000
In-Reply-To: <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
 <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
 <OFF2FAA55C.4813D4C0-ONC1257A8B.0060F9EA-C1257A8B.00634CA4@transmode.se>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
Message-ID: <OF930A0EE5.DA214D86-ONC1257A8B.00673BC9-C1257A8B.0067E92C@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 2 Oct 2012 20:54:59 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



linux-mtd-bounces@lists.infradead.org wrote on 2012/10/02 20:04:36:

> From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
> To:
> Cc: linux-mtd@lists.infradead.org, Thomas.Betker@rohde-schwarz.com
> Date: 2012/10/02 20:08
> Subject: Re: JFFS2 deadlock, kernel 3.4.11
> Sent by: linux-mtd-bounces@lists.infradead.org
>
> > >
> > > Hello all,
> > >
> > > I have encountered multiple times a deadlock between two JFFS2 threads:
> >
> > [SNIP]
> >
> > >
> > > The target system is an SoC with a dual ARMv7 (Cortex-A9), and we are
> > > running the long-term 3.4.11 kernel (whose fs/jffs2/ seems to be pretty
> > > close to the latest mainline kernel). The deadlock occurred when using scp
> > > to copy files from a host system to the target system.
> > >
> > > The GC thread hangs in lock_page(page), the write thread hangs in the
> > > first mutex_lock(&f->sem). The cause seems to be an AB-BA deadlock:
> > >
> > > jffs2_garbage_collect_live
> > >     mutex_lock(&f->sem)                         (A)
> > >     jffs2_garbage_collect_dnode [inlined]
> > >         jffs2_gc_fetch_page
> > >             read_cache_page_async
> > >                 do_read_cache_page
> > >                     lock_page(page) [inlined]
> > >                         __lock_page             (B) ***
> > >
> > > jffs2_write_begin
> > >     grab_cache_page_write_begin
> > >         find_lock_page
> > >             lock_page(page)                     (B)
> > >     mutex_lock(&f->sem)                         (A) ***
> > >
> > > I have manually analyzed the stacks and confirmed that both threads sit on
> > > the theme 'struct page'.
> > >
> >
> > hmm, not something I have seen but your analysis seems spot on. With any luck
> > you only need to move the mutex_lock in the write begin before lock_page. I
> > am only guessing now though.
>
> I had a look at jffs2_write_begin() and it looks fishy:
> It can write a hole frag sucessfully but still fail in:
>    if (!PageUptodate(pg)) {
>       mutex_lock(&f->sem);
>       ret = jffs2_do_readpage_nolock(inode, pg);
>       mutex_unlock(&f->sem);
>       if (ret)
>          goto out_page;
>    }
> which seems a bit strange.
>
> Further up we have this:
>       ri.isize = cpu_to_je32(max((uint32_t)inode->i_size, pageofs));
>       ...
>       ri.dsize = cpu_to_je32(pageofs - inode->i_size);
> Why max(..) when pageofs  must be > inode->i_size for ri.dsize
> to make sense?

So maybe this will help(not even compile tested), don't know if jffs2_reserve_space()
can be called with f->sem held.
If this is bad, then perhaps move pg = grab_cache_page_write_begin(mapping, index, flags)
to later in this function somehow?

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index db3889b..fb58622 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -142,9 +142,12 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
        uint32_t pageofs = index << PAGE_CACHE_SHIFT;
        int ret = 0;

+       mutex_lock(&f->sem);
        pg = grab_cache_page_write_begin(mapping, index, flags);
-       if (!pg)
+       if (!pg) {
+               mutex_unlock(&f->sem);
                return -ENOMEM;
+       }
        *pagep = pg;

        jffs2_dbg(1, "%s()\n", __func__);
@@ -164,7 +167,6 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
                if (ret)
                        goto out_page;

-               mutex_lock(&f->sem);
                memset(&ri, 0, sizeof(ri));

                ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -191,7 +193,6 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
                if (IS_ERR(fn)) {
                        ret = PTR_ERR(fn);
                        jffs2_complete_reservation(c);
-                       mutex_unlock(&f->sem);
                        goto out_page;
                }
                ret = jffs2_add_full_dnode_to_inode(c, f, fn);
@@ -206,12 +207,10 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
                        jffs2_mark_node_obsolete(c, fn->raw);
                        jffs2_free_full_dnode(fn);
                        jffs2_complete_reservation(c);
-                       mutex_unlock(&f->sem);
                        goto out_page;
                }
                jffs2_complete_reservation(c);
                inode->i_size = pageofs;
-               mutex_unlock(&f->sem);
        }

        /*
@@ -220,18 +219,18 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
         * case of a short-copy.
         */
        if (!PageUptodate(pg)) {
-               mutex_lock(&f->sem);
                ret = jffs2_do_readpage_nolock(inode, pg);
-               mutex_unlock(&f->sem);
                if (ret)
                        goto out_page;
        }
+       mutex_unlock(&f->sem);
        jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
        return ret;

 out_page:
        unlock_page(pg);
        page_cache_release(pg);
+       mutex_unlock(&f->sem);
        return ret;
 }
