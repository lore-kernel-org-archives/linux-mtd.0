Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLN96-0004PG-PK
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 06:21:14 +0000
Date: Wed, 23 May 2018 08:20:47 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Atsushi Nemoto
 <anemo@mba.ocn.ne.jp>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cmdlinepart: Update comment for introduction of
 OFFSET_CONTINUOUS
Message-ID: <20180523082047.2aa9e6ac@bbrezillon>
In-Reply-To: <1527001673-16318-1-git-send-email-geert+renesas@glider.be>
References: <1527001673-16318-1-git-send-email-geert+renesas@glider.be>
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

On Tue, 22 May 2018 17:07:53 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> The comment about offset zero was not updated when changing behavior:
>   - Automatic offset calculation is indicated by OFFSET_CONTINUOUS,
>   - Zero really means offset zero.
> 
> Fixes: b175d03dd2072836 ("[PATCH] mtd cmdlinepart: allow zero offset value")

Did we switch to 16bytes for the short commit ids (I usually use 12
bytes)?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/mtd/cmdlinepart.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index fbd5affc0acfe3fe..3ea44cff9b759e3c 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -190,7 +190,10 @@ static struct mtd_partition * newpart(char *s,
>  		extra_mem = (unsigned char *)(parts + *num_parts);
>  	}
>  
> -	/* enter this partition (offset will be calculated later if it is zero at this point) */
> +	/*
> +	 * enter this partition (offset will be calculated later if it is
> +	 * OFFSET_CONTINUOUS at this point)
> +	 */
>  	parts[this_part].size = size;
>  	parts[this_part].offset = offset;
>  	parts[this_part].mask_flags = mask_flags;
