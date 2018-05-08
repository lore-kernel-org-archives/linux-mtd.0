Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG67A-0004t1-GC
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 17:09:27 +0000
Date: Tue, 8 May 2018 19:09:02 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Fix coding style issues
Message-ID: <20180508190902.32c344b7@bbrezillon>
In-Reply-To: <TY1PR01MB09543004A0EDF2E03783E6D9DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09543004A0EDF2E03783E6D9DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

On Tue, 8 May 2018 16:17:59 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

Please add a commit message here saying which kind of coding stype
issues you're fixing (removal of unneeded spaces after '(' and before
')').

Also, I found [1] which you probably want to fix in this patch.

Thanks,

Boris

[1]https://elixir.bootlin.com/linux/v4.17-rc4/source/drivers/mtd/chips/cfi_cmdset_0002.c#L1566

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 56aa6b75213d..6f3619392506 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -207,7 +207,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
>  	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	if (cfi->cfiq->BufWriteTimeoutTyp) {
> -		pr_debug("Using buffer write method\n" );
> +		pr_debug("Using buffer write method\n");
>  		mtd->_write = cfi_amdstd_write_buffers;
>  	}
>  }
> @@ -1577,7 +1577,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	}
>  
>  	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> -	       __func__, adr, datum.x[0] );
> +		 __func__, adr, datum.x[0]);
>  
>  	if (mode == FL_OTP_WRITE)
>  		otp_enter(map, chip, adr, map_bankwidth(map));
> @@ -1643,7 +1643,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	/* Did we succeed? */
>  	if (!chip_good(map, adr, datum)) {
>  		/* reset on all failures. */
> -		map_write( map, CMD(0xF0), chip->start );
> +		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
>  		if (++retry_cnt <= MAX_WORD_RETRIES)
> @@ -1821,7 +1821,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	datum = map_word_load(map, buf);
>  
>  	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> -	       __func__, adr, datum.x[0] );
> +		 __func__, adr, datum.x[0]);
>  
>  	XIP_INVAL_CACHED_RANGE(map, adr, len);
>  	ENABLE_VPP(map);
> @@ -2251,7 +2251,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  	}
>  
>  	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
> -	       __func__, chip->start );
> +	       __func__, chip->start);
>  
>  	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
>  	ENABLE_VPP(map);
> @@ -2297,7 +2297,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  
>  		if (time_after(jiffies, timeo)) {
>  			printk(KERN_WARNING "MTD %s(): software timeout\n",
> -				__func__ );
> +			       __func__);
>  			break;
>  		}
>  
> @@ -2307,7 +2307,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  	/* Did we succeed? */
>  	if (!chip_good(map, adr, map_word_ff(map))) {
>  		/* reset on all failures. */
> -		map_write( map, CMD(0xF0), chip->start );
> +		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
>  		ret = -EIO;
> @@ -2340,7 +2340,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  	}
>  
>  	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
> -	       __func__, adr );
> +		 __func__, adr);
>  
>  	XIP_INVAL_CACHED_RANGE(map, adr, len);
>  	ENABLE_VPP(map);
> @@ -2389,7 +2389,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  		if (time_after(jiffies, timeo)) {
>  			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software timeout\n",
> -				__func__ );
> +			       __func__);
>  			break;
>  		}
>  
> @@ -2399,7 +2399,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>  	/* Did we succeed? */
>  	if (!chip_good(map, adr, map_word_ff(map))) {
>  		/* reset on all failures. */
> -		map_write( map, CMD(0xF0), chip->start );
> +		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
>  		ret = -EIO;
