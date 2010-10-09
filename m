Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P4cQi-0007Tg-Kj
	for linux-mtd@lists.infradead.org; Sat, 09 Oct 2010 16:37:53 +0000
In-Reply-To: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1286467304-23370-1-git-send-email-Joakim.Tjernlund@transmode.se>
Subject: Re: [PATCH] jffs2: Fix serious write stall due to erase
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF75BA9795.D3DFC6A0-ONC12577B7.005B0CDA-C12577B7.005B3EA4@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sat, 9 Oct 2010 18:36:38 +0200
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

David, pretty please :)

  Jocke
>
> Drop the alloc_sem before erasing flash in
> jffs2_garbage_collect_pass().
> Otherwise writes are put on hold until the erase
> has finised.
>
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>
>  I am fairly sure it is safe to unlock the alloc_sem before
>  calling jffs2_erase_pending_blocks(). Extra confirmation
>  would be great though.
>
>  This problem was introduced in 2.6.35
>
>  fs/jffs2/gc.c |    7 ++++---
>  1 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
> index f5e96bd..b5f7175 100644
> --- a/fs/jffs2/gc.c
> +++ b/fs/jffs2/gc.c
> @@ -218,13 +218,14 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
>     if (!list_empty(&c->erase_complete_list) ||
>         !list_empty(&c->erase_pending_list)) {
>        spin_unlock(&c->erase_completion_lock);
> +      mutex_unlock(&c->alloc_sem);
>        D1(printk(KERN_DEBUG "jffs2_garbage_collect_pass() erasing pending blocks\n"));
> -      if (jffs2_erase_pending_blocks(c, 1)) {
> -         mutex_unlock(&c->alloc_sem);
> +      if (jffs2_erase_pending_blocks(c, 1))
>           return 0;
> -      }
> +
>        D1(printk(KERN_DEBUG "No progress from erasing blocks; doing GC anyway\n"));
>        spin_lock(&c->erase_completion_lock);
> +      mutex_lock(&c->alloc_sem);
>     }
>
>     /* First, work out which block we're garbage-collecting */
> --
> 1.7.2.2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
