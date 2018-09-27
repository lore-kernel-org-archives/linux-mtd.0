Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5Uh5-0006BQ-Ot
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 11:43:33 +0000
Date: Thu, 27 Sep 2018 13:42:16 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 5/8] mtd: maps: gpio-addr-flash: Replace array with
 an integer
Message-ID: <20180927134216.1952f668@bbrezillon>
In-Reply-To: <20180905143643.9871-6-ricardo.ribalda@gmail.com>
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-6-ricardo.ribalda@gmail.com>
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

On Wed,  5 Sep 2018 16:36:40 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> By replacing the array with an integer we can avoid completely
> the bit comparison loop if the value has not changed (by far
> the most common case).
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 31 +++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index 22e100f07112..8f5e3dce9be3 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -43,7 +43,7 @@ struct async_state {
>  	struct map_info map;
>  	size_t gpio_count;
>  	unsigned *gpio_addrs;
> -	int *gpio_values;
> +	unsigned int gpio_values;
>  	unsigned int win_order;
>  };
>  #define gf_map_info_to_state(mi) ((struct async_state *)(mi)->map_priv_1)
> @@ -55,22 +55,25 @@ struct async_state {
>   *
>   * Rather than call the GPIO framework every time, cache the last-programmed
>   * value.  This speeds up sequential accesses (which are by far the most common
> - * type).  We rely on the GPIO framework to treat non-zero value as high so
> - * that we don't have to normalize the bits.
> + * type).
>   */
>  static void gf_set_gpios(struct async_state *state, unsigned long ofs)
>  {
> -	size_t i = 0;
> -	int value;
> +	int i;
>  
>  	ofs >>= state->win_order;
> -	do {
> -		value = ofs & (1 << i);
> -		if (state->gpio_values[i] != value) {
> -			gpio_set_value(state->gpio_addrs[i], value);
> -			state->gpio_values[i] = value;
> -		}
> -	} while (++i < state->gpio_count);
> +
> +	if (ofs == state->gpio_values)
> +		return;
> +
> +	for (i = 0; i < state->gpio_count; i++) {
> +		if ((ofs & BIT(i)) == (state->gpio_values & BIT(i)))

Parens around the xx & BIT(i) operations are unneeded.

> +			continue;
> +
> +		gpio_set_value(state->gpio_addrs[i], !!(ofs & BIT(i)));
> +	}
> +
> +	state->gpio_values = ofs;
>  }
>  
>  /**
> @@ -215,7 +218,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	if (!memory || !gpios || !gpios->end)
>  		return -EINVAL;
>  
> -	arr_size = sizeof(int) * gpios->end;
> +	arr_size = sizeof(state->gpio_addrs[0]) * gpios->end;
>  	state = devm_kzalloc(&pdev->dev, sizeof(*state) + arr_size, GFP_KERNEL);
>  	if (!state)
>  		return -ENOMEM;
> @@ -226,9 +229,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
>  	 */
>  	state->gpio_count     = gpios->end;
>  	state->gpio_addrs     = (void *)(unsigned long)gpios->start;
> -	state->gpio_values    = (void *)(state + 1);
>  	state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
> -	memset(state->gpio_values, 0xff, arr_size);
>  
>  	state->map.name       = DRIVER_NAME;
>  	state->map.read       = gf_read;
