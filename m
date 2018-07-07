Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbk00-0000Gg-JW
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 09:59:30 +0000
Date: Sat, 7 Jul 2018 11:59:16 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: gpio_flash: add error handling for ioremap_nocache
Message-ID: <20180707115916.1bbe954c@bbrezillon>
In-Reply-To: <1529632343-70907-1-git-send-email-jiazhouyang09@gmail.com>
References: <1528773302-37265-1-git-send-email-jiazhouyang09@gmail.com>
 <1529632343-70907-1-git-send-email-jiazhouyang09@gmail.com>
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

On Fri, 22 Jun 2018 09:52:20 +0800
Zhouyang Jia <jiazhouyang09@gmail.com> wrote:

> When ioremap_nocache fails, the lack of error-handling code may
> cause unexpected results.
> 
> This patch adds error-handling code after calling ioremap_nocache.
> 
> Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>

Applied.

Thanks,

Boris

> ---
> v1->v2:
> - Move the test just after the ioremap_nocache() call.
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index 385305e..9d97236 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -239,6 +239,9 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	state->map.bankwidth  = pdata->width;
>  	state->map.size       = state->win_size * (1 << state->gpio_count);
>  	state->map.virt       = ioremap_nocache(memory->start, state->map.size);
> +	if (!state->map.virt)
> +		return -ENOMEM;
> +
>  	state->map.phys       = NO_XIP;
>  	state->map.map_priv_1 = (unsigned long)state;
>  
