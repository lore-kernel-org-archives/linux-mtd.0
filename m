Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9yWe-0005nm-D2
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 09:37:28 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id 42D8865000F
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 May 2009 11:37:16 +0200 (CEST)
In-Reply-To: <1243525439-32485-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1243525439-32485-1-git-send-email-Joakim.Tjernlund@transmode.se>
Subject: Re: [PATCH] [JFFS2] Fix corruption when flash erase/write failure
Cc: linux-mtd@lists.infradead.org
Message-ID: <OF210B0D1A.6794A260-ONC12575C5.0034AB5F-C12575C5.0034DA54@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 29 May 2009 11:37:18 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think this is 2.6.30 material, please comment soon(or send upstream)

 Jocke

Joakim Tjernlund <Joakim.Tjernlund@transmode.se> wrote on 28/05/2009 17:43:59:
>
> Erase errors such as:
> "Newly-erased block contained word 0xa4ef223e at offset 0x0296a014"
> and failure to write the clean marker,
> moves the offending erase block to erasing list before calling
> jffs2_erase_failed(). This is bad as jffs2_erase_failed() will
> also move the block to the bad_list, but is now moving the
> wrong block, causing FS corruption.
>
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/erase.c |    7 -------
>  1 files changed, 0 insertions(+), 7 deletions(-)
>
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index 51024ac..b082655 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -488,13 +488,6 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
>     return;
>
>  filebad:
> -   mutex_lock(&c->erase_free_sem);
> -   spin_lock(&c->erase_completion_lock);
> -   /* Stick it on a list (any list) so erase_failed can take it
> -      right off again.  Silly, but shouldn't happen often. */
> -   list_move(&jeb->list, &c->erasing_list);
> -   spin_unlock(&c->erase_completion_lock);
> -   mutex_unlock(&c->erase_free_sem);
>     jffs2_erase_failed(c, jeb, bad_offset);
>     return;
>
> --
> 1.6.2.3
>
