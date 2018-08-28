Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuex0-0004MV-6C
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 14:26:35 +0000
Date: Tue, 28 Aug 2018 16:26:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] mtd: maps: gpio-addr-flash: Fix ioremapped size
Message-ID: <20180828162611.2f45e5c9@bbrezillon>
In-Reply-To: <20180821143152.32293-3-ricardo.ribalda@gmail.com>
References: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
 <20180821143152.32293-3-ricardo.ribalda@gmail.com>
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

On Tue, 21 Aug 2018 16:31:46 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> We should only iomap the area of the chip that is memory mapped.
> Otherwise we could be mapping devices beyond the memory space or that
> belong to other devices.
> 

Can you add

Fixes: ebd71e3a4861 ("mtd: maps: gpio-addr-flash: fix warnings and make more portable")

and in case you want to backport the fix:

Cc: <stable@vger.kernel.org>

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index 17be47f72973..6de16e81994c 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -234,7 +234,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	state->map.copy_to    = gf_copy_to;
>  	state->map.bankwidth  = pdata->width;
>  	state->map.size       = state->win_size * (1 << state->gpio_count);
> -	state->map.virt       = ioremap_nocache(memory->start, state->map.size);
> +	state->map.virt       = ioremap_nocache(memory->start, state->win_size);
>  	if (!state->map.virt)
>  		return -ENOMEM;
>  
