Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLqFF-0001Ok-4h
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 06:58:18 +0000
In-Reply-To: <507476E7.8030705@freenet.de>
References: <507321E6.1050609@freenet.de> <507476E7.8030705@freenet.de>
Subject: Re: [PATCH RESEND] jffs2: Fix lock acquisition order bug in
 jffs2_write_begin
To: Thomas Betker <thomas.betker@freenet.de>
Message-ID: <OFA7EB3EBC.A800CC26-ONC1257A93.00262334-C1257A93.00264752@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 10 Oct 2012 08:58:06 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, thomas.betker@rohde-schwarz.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> jffs2_write_begin() first acquires the page lock, then f->sem. This causes an AB-BA deadlock with jffs2_garbage_collect_live(), which first acquires f->sem, then the page lock:
>
> jffs2_garbage_collect_live
>      mutex_lock(&f->sem)                         (A)
>      jffs2_garbage_collect_dnode
>          jffs2_gc_fetch_page
>              read_cache_page_async
>                  do_read_cache_page
>                      lock_page(page)             (B)
>
> jffs2_write_begin
>      grab_cache_page_write_begin
>          find_lock_page
>              lock_page(page)                     (B)
>      mutex_lock(&f->sem)                         (A)
>
> We fix this by restructuring jffs2_write_begin() to take f->sem before the page lock. However, we make sure that f->sem is not held when calling jffs2_reserve_space(), as this is not permitted by the locking rules.
>
> The deadlock above was observed multiple times on an SoC with a dual ARMv7 (Cortex-A9), running the long-term 3.4.11 kernel; it occurred when using scp to copy files from a host system to the ARM target system. The fix was heavily tested on the same target system.
>
> If the patch is accepted, please get it also pushed to 3.4; it applies cleanly both to linux-mtd.git and the current linux-3.4 tree.
>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> Signed-off-by: Thomas Betker <thomas.betker@rohde-schwarz.com>

Acked-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>

David, are you happy with this?

 Jocke
