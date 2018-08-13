Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp6OE-0003Sl-OX
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 06:31:44 +0000
Date: Mon, 13 Aug 2018 08:31:27 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, David Gstir <david@sigma-star.at>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 05/25] ubifs: implement ubifs_lpt_lookup using
 ubifs_pnode_lookup
Message-ID: <20180813063127.kpxw6d5amna5wpas@pengutronix.de>
References: <20180704124137.13396-1-s.hauer@pengutronix.de>
 <20180704124137.13396-6-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704124137.13396-6-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 04, 2018 at 02:41:17PM +0200, Sascha Hauer wrote:
> ubifs_lpt_lookup() starts by looking up the nth pnode in the LPT. We
> already have this functionality in ubifs_pnode_lookup(). Use this
> function rather than open coding its functionality.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/lpt.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
> index 6cd6f23d4512..cde7b9484157 100644
> --- a/fs/ubifs/lpt.c
> +++ b/fs/ubifs/lpt.c
> @@ -1478,27 +1478,11 @@ struct ubifs_pnode *ubifs_pnode_lookup(struct ubifs_info *c, int i)
>   */
>  struct ubifs_lprops *ubifs_lpt_lookup(struct ubifs_info *c, int lnum)
>  {
> -	int err, i, h, iip, shft;
> -	struct ubifs_nnode *nnode;
> +	int i, iip;
>  	struct ubifs_pnode *pnode;
>  
> -	if (!c->nroot) {
> -		err = ubifs_read_nnode(c, NULL, 0);
> -		if (err)
> -			return ERR_PTR(err);
> -	}
> -	nnode = c->nroot;
>  	i = lnum - c->main_first;
> -	shft = c->lpt_hght * UBIFS_LPT_FANOUT_SHIFT;
> -	for (h = 1; h < c->lpt_hght; h++) {
> -		iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
> -		shft -= UBIFS_LPT_FANOUT_SHIFT;
> -		nnode = ubifs_get_nnode(c, nnode, iip);
> -		if (IS_ERR(nnode))
> -			return ERR_CAST(nnode);
> -	}
> -	iip = ((i >> shft) & (UBIFS_LPT_FANOUT - 1));
> -	pnode = ubifs_get_pnode(c, nnode, iip);
> +	pnode = ubifs_pnode_lookup(c, i);

This should be

	ubifs_pnode_lookup(c, i >> UBIFS_LPT_FANOUT_SHIFT);

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
