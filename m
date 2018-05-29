Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNjp2-0004pM-GE
 for linux-mtd@lists.infradead.org; Tue, 29 May 2018 18:58:25 +0000
Date: Tue, 29 May 2018 20:57:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 5/5] mtd: cfi_cmdset_0002: Change erase one block to
 enable XIP once
Message-ID: <20180529205751.44b2ba92@bbrezillon>
In-Reply-To: <20180527232801.1666-6-ikegami@allied-telesis.co.jp>
References: <20180527232801.1666-1-ikegami@allied-telesis.co.jp>
 <20180527232801.1666-6-ikegami@allied-telesis.co.jp>
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

On Mon, 28 May 2018 08:28:01 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> To enable XIP it is executed both normal and error cases.
> This call can be moved after the for loop as same with erase chip.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org

Is this really a bug fix? Doesn't look like a bug fix to me.

Also, every time you add Cc stable you should try to find the commit
that introduced the bug. Sometime it's not possible because the bug
existed before git was in use, but most of the time you'll find the
offending commit using git blame.

A fixes tag should be formatted like that:

Fixes: <commit-id> ("commit subject")

> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 6adda4dc2007..6c681cbf2d37 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2389,13 +2389,10 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  			chip->erase_suspended = 0;
>  		}
>  
> -		if (chip_good(map, adr, map_word_ff(map))) {
> -			xip_enable(map, chip, adr);
> +		if (chip_good(map, adr, map_word_ff(map)))
>  			break;
> -		}
>  
>  		if (time_after(jiffies, timeo)) {
> -			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software timeout\n",
>  			       __func__);
>  			ret = -EIO;
> @@ -2418,6 +2415,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  	}
>  
>  	chip->state = FL_READY;
> +	xip_enable(map, chip, adr);
>  	DISABLE_VPP(map);
>  	put_chip(map, chip, adr);
>  	mutex_unlock(&chip->mutex);
