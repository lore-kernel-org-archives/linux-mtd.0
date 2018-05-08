Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG0g0-0006Io-J7
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 11:21:03 +0000
Date: Tue, 8 May 2018 13:20:37 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Change erase functions to retry
 for error
Message-ID: <20180508132037.152cc581@bbrezillon>
In-Reply-To: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB0954474CBDBF98D0E3D3E648DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

Hello,

On Tue, 8 May 2018 10:20:29 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> 
> For the word write functions it is retried for error.
> But it is not implemented to retry for the erase functions.
> To make sure for the erase functions change to retry as same.

Can you give a bit more context, like why this is needed, where did
you see the problem (which chip/controller), ...

> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 56aa6b75213d..e2dc020cd102 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -42,7 +42,7 @@
>  #define AMD_BOOTLOC_BUG
>  #define FORCE_WORD_WRITE 0
>  
> -#define MAX_WORD_RETRIES 3
> +#define MAX_WRITE_RETRIES 3

Not sure why you rename this macro, but if it's needed can you do that
in a separate patch?

>  
>  #define SST49LF004B	        0x0060
>  #define SST49LF040B	        0x0050
> @@ -207,7 +207,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
>  	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	if (cfi->cfiq->BufWriteTimeoutTyp) {
> -		pr_debug("Using buffer write method\n" );
> +		pr_debug("Using buffer write method\n");

Same for coding style issues, they should be fixed in a separate commit.

>  		mtd->_write = cfi_amdstd_write_buffers;
>  	}
>  }
> @@ -1577,7 +1577,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	}
>  
>  	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> -	       __func__, adr, datum.x[0] );
> +	       __func__, adr, datum.x[0]);
>  
>  	if (mode == FL_OTP_WRITE)
>  		otp_enter(map, chip, adr, map_bankwidth(map));
> @@ -1643,10 +1643,10 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  	/* Did we succeed? */
>  	if (!chip_good(map, adr, datum)) {
>  		/* reset on all failures. */
> -		map_write( map, CMD(0xF0), chip->start );
> +		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
> -		if (++retry_cnt <= MAX_WORD_RETRIES)
> +		if (++retry_cnt <= MAX_WRITE_RETRIES)
>  			goto retry;
>  
>  		ret = -EIO;
> @@ -1821,7 +1821,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>  	datum = map_word_load(map, buf);
>  
>  	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
> -	       __func__, adr, datum.x[0] );
> +	       __func__, adr, datum.x[0]);
>  
>  	XIP_INVAL_CACHED_RANGE(map, adr, len);
>  	ENABLE_VPP(map);
> @@ -2105,7 +2105,7 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
>  		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
> -		if (++retry_cnt <= MAX_WORD_RETRIES)
> +		if (++retry_cnt <= MAX_WRITE_RETRIES)
>  			goto retry;
>  
>  		ret = -EIO;
> @@ -2240,6 +2240,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  	unsigned long int adr;
>  	DECLARE_WAITQUEUE(wait, current);
>  	int ret = 0;
> +	int retry_cnt = 0;
>  
>  	adr = cfi->addr_unlock1;
>  
> @@ -2251,12 +2252,13 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  	}
>  
>  	pr_debug("MTD %s(): ERASE 0x%.8lx\n",
> -	       __func__, chip->start );
> +	       __func__, chip->start);
>  
>  	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
>  	ENABLE_VPP(map);
>  	xip_disable(map, chip, adr);
>  
> + retry:
>  	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
> @@ -2297,7 +2299,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  
>  		if (time_after(jiffies, timeo)) {
>  			printk(KERN_WARNING "MTD %s(): software timeout\n",
> -				__func__ );
> +				__func__);
>  			break;
>  		}
>  
> @@ -2307,9 +2309,12 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
>  	/* Did we succeed? */
>  	if (!chip_good(map, adr, map_word_ff(map))) {
>  		/* reset on all failures. */
> -		map_write( map, CMD(0xF0), chip->start );
> +		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
>  
> +		if (++retry_cnt <= MAX_WRITE_RETRIES)
> +			goto retry;

Shouldn't we have a MAX_ERASE_RETRY for that? Also, what makes you
think the following erase operations will work?

Thanks,

Boris
