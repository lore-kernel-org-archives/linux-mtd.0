Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JMhOA-0002kg-4p
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 10:20:28 +0000
Subject: Re: [PATCH] [JFFS2] Fix free space leaking
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Damir Shayhutdinov <lost404@gmail.com>
In-Reply-To: <20071113102323.GA5933@damir.rnd.local>
References: <20071113102323.GA5933@damir.rnd.local>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 06 Feb 2008 11:20:19 +0100
Message-Id: <1202293219.25864.45.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2007-11-13 at 13:23 +0300, Damir Shayhutdinov wrote:
> This patch is addressed to fix very-long-standing problem in JFFS2,
> first described in 2004:
> http://lists.infradead.org/pipermail/linux-mtd/2004-March/009456.html
> 
> jffs2_link_node_ref() decreases c->free_size by
> c->cleanmarker_size but the clean marker space can't
> be accounted as free space! So we just compensate
> the difference.
> 
> Signed-off-by: Alexander Yurchenko <grange@tecon.ru>
> Signed-off-by: Damir Shayhutdinov <damir@tecon.ru>
> ---
>  fs/jffs2/erase.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> index a1db918..c574fa3 100644
> --- a/fs/jffs2/erase.c
> +++ b/fs/jffs2/erase.c
> @@ -454,6 +454,17 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
>  		jeb->free_size = c->sector_size;
>  		/* FIXME Special case for cleanmarker in empty block */
>  		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
> +		/*
> +		 * XXX: I'm not sure this is correct but it prevents
> +		 * c->free_size from slow leaking under a frequent file
> +		 * overwriting.
> +		 * jffs2_link_node_ref() decreases c->free_size by
> +		 * c->cleanmarker_size but the clean marker space can't
> +		 * be accounted as free space! So we just compensate
> +		 * the difference.
> +		 */
> +		c->free_size += c->cleanmarker_size;
> +		c->used_size -= c->cleanmarker_size;
>  	}
>  
>  	down(&c->erase_free_sem);

What happened to this patch? Just forgotten or was it rejected?

   Jocke
