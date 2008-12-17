Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD0dr-0007M4-DI
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 17:57:04 +0000
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
Date: Wed, 17 Dec 2008 09:56:55 -0800
References: <1229532627.17960.37.camel@sauron>
In-Reply-To: <1229532627.17960.37.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200812170956.55539.david-b@pacbell.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 17 December 2008, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Wed, 17 Dec 2008 19:42:38 +0200
> Subject: [PATCH] MTD: fix dataflash 64-bit divisions
> 
> MTD has recently been upgraded for 64-bit support, see commit
> number 69423d99fc182a81f3c5db3eb5c140acc6fc64be in the
> mtd-2.6.git tree (git://git.infradead.org/mtd-2.6.git)

Hmm, in another thread I was just reading about how Linux
would only support the first 2 GBytes of a 4 GByte NAND
chip (Samsung MT29F16G08DAA) ... the updates to support
large pages were easy, but signed 32-bit offsets prevented
the full size from being recognized.  Slightly older parts
integrated four dies with 2K pages, not two with 4KB ones,
and gave no trouble.

Would this be part of a set of patches making 4 GByte
(and eventually, larger) NAND chips behave?

(There was one other issue reported with those chips,
having to do with wanting more ECC data than some old
kernel liked to store in the OOB area.)


> or see this URL:
> http://git.infradead.org/mtd-2.6.git?a=commit;h=69423d99fc182a81f3c5db3eb5c140acc6fc64be
> 
> Some variables in MTD data structures which were 32-bit
> became 64-bit. Namely, the 'size' field in 'struct mtd_info'
> and the 'addr'/'len' fields in 'struct erase_info'. This
> means we have to use 'do_div' to divide them.
> 
> This patch fixes the following linking error:
> ERROR: "__udivdi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
> ERROR: "__umoddi3" [drivers/mtd/devices/mtd_dataflash.ko] undefined!
> 
> This patch changes divisions of 64-bit variable so that they use
> 'do_div'. This patch also change some print placeholders to
> get rid of gcc warnings.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: David Brownell <david-b@pacbell.net>

Looks OK to me, but I can't exactly test it in all its
glory.  ;)


> ---
>  drivers/mtd/devices/mtd_dataflash.c |   22 +++++++++++++++-------
>  1 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
> index 6dd9aff..948193c 100644
> --- a/drivers/mtd/devices/mtd_dataflash.c
> +++ b/drivers/mtd/devices/mtd_dataflash.c
> @@ -16,6 +16,7 @@
>  #include <linux/device.h>
>  #include <linux/mutex.h>
>  #include <linux/err.h>
> +#include <asm/div64.h>
>  
>  #include <linux/spi/spi.h>
>  #include <linux/spi/flash.h>
> @@ -152,15 +153,20 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
>  	struct spi_message	msg;
>  	unsigned		blocksize = priv->page_size << 3;
>  	uint8_t			*command;
> +	uint64_t		tmp;
>  
> -	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%x len 0x%x\n",
> +	DEBUG(MTD_DEBUG_LEVEL2, "%s: erase addr=0x%llx len 0x%llx\n",
>  			spi->dev.bus_id,
>  			instr->addr, instr->len);
>  
>  	/* Sanity checks */
> -	if ((instr->addr + instr->len) > mtd->size
> -			|| (instr->len % priv->page_size) != 0
> -			|| (instr->addr % priv->page_size) != 0)
> +	if (instr->addr + instr->len > mtd->size)
> +		return -EINVAL;
> +	tmp = instr->len;
> +	if (do_div(tmp, priv->page_size))
> +		return -EINVAL;
> +	tmp = instr->addr;
> +	if (do_div(tmp, priv->page_size))
>  		return -EINVAL;
>  
>  	spi_message_init(&msg);
> @@ -178,7 +184,9 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		/* Calculate flash page address; use block erase (for speed) if
>  		 * we're at a block boundary and need to erase the whole block.
>  		 */
> -		pageaddr = instr->addr / priv->page_size;
> +		tmp = instr->len;
> +		do_div(tmp, priv->page_size);
> +		pageaddr = tmp;
>  		do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
>  		pageaddr = pageaddr << priv->page_offset;
>  
> @@ -667,8 +675,8 @@ add_dataflash_otp(struct spi_device *spi, char *name,
>  	if (revision >= 'c')
>  		otp_tag = otp_setup(device, revision);
>  
> -	dev_info(&spi->dev, "%s (%d KBytes) pagesize %d bytes%s\n",
> -			name, DIV_ROUND_UP(device->size, 1024),
> +	dev_info(&spi->dev, "%s (%lld KBytes) pagesize %d bytes%s\n",
> +			name, (device->size + 1023) >> 10,
>  			pagesize, otp_tag);
>  	dev_set_drvdata(&spi->dev, priv);
>  
> -- 
> 1.5.4.3
> 
> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
> 
