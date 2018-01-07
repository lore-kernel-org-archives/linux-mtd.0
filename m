Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eY80s-0006s2-TZ
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 10:17:12 +0000
Date: Sun, 7 Jan 2018 11:16:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>
Subject: Re: [PATCH] mtd: Remove unneeded checks in part_{read,write}_oob()
Message-ID: <20180107111647.191e2a7b@bbrezillon>
In-Reply-To: <20180106204917.1266-1-boris.brezillon@free-electrons.com>
References: <20180106204917.1266-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat,  6 Jan 2018 21:49:17 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> mtd_{read,write}_oob() are already checking parameters consistency,
> remove the checks done in part_{read,write}_oob().

Please ignore this patch. I realized I had already submitted a patch
removing redundant checks in various drivers/sub-layers [1], so I'll
just prepare a v2 of this patch integrating the mtdpart changes.

Regards,

Boris

[1]http://patchwork.ozlabs.org/patch/781354/

> 
> Suggested-by: Peter Pan <peterpansjtu@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/mtdpart.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 4d1140c23ead..88f94d672e40 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -117,25 +117,6 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
>  	struct mtd_part *part = mtd_to_part(mtd);
>  	int res;
>  
> -	if (from >= mtd->size)
> -		return -EINVAL;
> -	if (ops->datbuf && from + ops->len > mtd->size)
> -		return -EINVAL;
> -
> -	/*
> -	 * If OOB is also requested, make sure that we do not read past the end
> -	 * of this partition.
> -	 */
> -	if (ops->oobbuf) {
> -		size_t len, pages;
> -
> -		len = mtd_oobavail(mtd, ops);
> -		pages = mtd_div_by_ws(mtd->size, mtd);
> -		pages -= mtd_div_by_ws(from, mtd);
> -		if (ops->ooboffs + ops->ooblen > pages * len)
> -			return -EINVAL;
> -	}
> -
>  	res = mtd_read_oob(part->parent, from + part->offset, ops);
>  	if (unlikely(res)) {
>  		if (mtd_is_bitflip(res))
> @@ -194,10 +175,6 @@ static int part_write_oob(struct mtd_info *mtd, loff_t to,
>  {
>  	struct mtd_part *part = mtd_to_part(mtd);
>  
> -	if (to >= mtd->size)
> -		return -EINVAL;
> -	if (ops->datbuf && to + ops->len > mtd->size)
> -		return -EINVAL;
>  	return mtd_write_oob(part->parent, to + part->offset, ops);
>  }
>  
