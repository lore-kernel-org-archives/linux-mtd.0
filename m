Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJ5fR-0003Kh-EY
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2012 16:49:58 +0000
In-Reply-To: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
References: <OFB9AE3BAC.A5615989-ONC1257A8A.0032CA58-C1257A8B.004EAAA5@rohde-schwarz.com>
Subject: Re: JFFS2 deadlock, kernel 3.4.11
To: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF52EBAA51.F623F8FB-ONC1257A8B.005B88EA-C1257A8B.005BD53C@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 2 Oct 2012 18:43:03 +0200
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

linux-mtd-bounces@lists.infradead.org wrote on 2012/10/02 16:19:10:
>
> Hello all,
>
> I have encountered multiple times a deadlock between two JFFS2 threads:

[SNIP]

>
> The target system is an SoC with a dual ARMv7 (Cortex-A9), and we are
> running the long-term 3.4.11 kernel (whose fs/jffs2/ seems to be pretty
> close to the latest mainline kernel). The deadlock occurred when using scp
> to copy files from a host system to the target system.
>
> The GC thread hangs in lock_page(page), the write thread hangs in the
> first mutex_lock(&f->sem). The cause seems to be an AB-BA deadlock:
>
> jffs2_garbage_collect_live
>     mutex_lock(&f->sem)                         (A)
>     jffs2_garbage_collect_dnode [inlined]
>         jffs2_gc_fetch_page
>             read_cache_page_async
>                 do_read_cache_page
>                     lock_page(page) [inlined]
>                         __lock_page             (B) ***
>
> jffs2_write_begin
>     grab_cache_page_write_begin
>         find_lock_page
>             lock_page(page)                     (B)
>     mutex_lock(&f->sem)                         (A) ***
>
> I have manually analyzed the stacks and confirmed that both threads sit on
> the theme 'struct page'.
>

hmm, not something I have seen but your analysis seems spot on. With any luck
you only need to move the mutex_lock in the write begin before lock_page. I
am only guessing now though.

 Jocke
