Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JkGrU-00088i-53
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 10:52:04 +0000
Subject: Re: [PATCH] compr_lzo.c: allocate enough memory for lzo compressor.
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Riku Voipio <riku.voipio@iki.fi>
In-Reply-To: <20080411093337.GA22045@kos.to>
References: <20080411093337.GA22045@kos.to>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 11 Apr 2008 12:52:02 +0200
Message-Id: <1207911122.9544.29.camel@gentoo-jocke.transmode.se>
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


On Fri, 2008-04-11 at 12:33 +0300, Riku Voipio wrote:
> This is the same bug as in kernel, pointed out the LZO author
> (Markus Oberhumer):
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=f2a11b158a24301e9158e9c873fa88e5eb775486
> ---
>  compr_lzo.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/compr_lzo.c b/compr_lzo.c
> index fb54600..a0bb362 100644
> --- a/compr_lzo.c
> +++ b/compr_lzo.c
> @@ -97,7 +97,7 @@ int jffs2_lzo_init(void)
>  		return -1;
>  
>  	/* Worse case LZO compression size from their FAQ */
> -	lzo_compress_buf = malloc(page_size + (page_size / 64) + 16 + 3);
> +	lzo_compress_buf = malloc(page_size + (page_size / 16) + 64 + 3);
>  	if (!lzo_compress_buf) {
>  		free(lzo_mem);
>  		return -1;

I think you should use lzo1x_worst_compress() from the link you posted
above.

  Jocke
