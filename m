Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XD6Qy-0002v9-FK
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 06:35:21 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so5178480pac.18
 for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2014 23:34:59 -0700 (PDT)
Date: Thu, 31 Jul 2014 23:34:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Wu <Aaron.wu@analog.com>
Subject: Re: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded flash
Message-ID: <20140801063449.GD3095@norris-Latitude-E6410>
References: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, dwmw2@infradead.org,
 sonic.zhang@analog.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Mike Frysinger

Hi Aaron,

I'm trying to judge the quality of your patch, but I'm very distracted
from this by trying to figure out the original intent of this code.
Perhaps Mike can comment.

On Thu, Jul 03, 2014 at 04:13:34PM +0800, Aaron Wu wrote:
> In this bug, the address operation range may exceed the
> window size defined by gpio expanded flash MTD partition.
> 
> Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c |   34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index a4c477b..ca9282f 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -108,13 +108,24 @@ static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssi
>  {
>  	struct async_state *state = gf_map_info_to_state(map);
>  
> -	gf_set_gpios(state, from);
> +	int this_len;
>  
>  	/* BUG if operation crosses the win_size */
>  	BUG_ON(!((from + len) % state->win_size <= (from + len)));

What do you think of this BUG_ON()? AFAICT, the BUG_ON() predicate is
provably false [1], at least whenever

	from >= 0 && len >= 0 && state->win_size > 0.

Was the intent more like this?

	BUG_ON((from + len - 1) / state->win_size != from / state->win_size);

If so, then it seems like maybe this patch is trying to address the case
that was previously considered a BUG()?

In any case, if we can't figure out what the BUG_ON() really should have
been, then maybe we should kill it and take something like your patch to
fix the case you're looking at, Aaron.

>  
> -	/* operation does not cross the win_size, so one shot it */
> -	memcpy_fromio(to, map->virt + (from % state->win_size), len);
> +	while (len) {
> +		if ((from % state->win_size) + len > state->win_size)
> +			this_len = state->win_size - (from % state->win_size);
> +		else
> +			this_len = len;
> +
> +		gf_set_gpios(state, from);
> +		memcpy_fromio(to, map->virt + (from % state->win_size)
> +			, this_len);
> +		len -= this_len;
> +		from += this_len;
> +		to += this_len;
> +	}
>  }
>  
>  /**
> @@ -147,13 +158,24 @@ static void gf_copy_to(struct map_info *map, unsigned long to,
>  {
>  	struct async_state *state = gf_map_info_to_state(map);
>  
> -	gf_set_gpios(state, to);
> +	int this_len;
>  
>  	/* BUG if operation crosses the win_size */
>  	BUG_ON(!((to + len) % state->win_size <= (to + len)));

Same here. I think the BUG_ON() condition is a no-op (always false).

>  
> -	/* operation does not cross the win_size, so one shot it */
> -	memcpy_toio(map->virt + (to % state->win_size), from, len);
> +	while (len) {
> +		if ((to % state->win_size) + len > state->win_size)
> +			this_len = state->win_size - (to % state->win_size);
> +		else
> +			this_len = len;
> +
> +		gf_set_gpios(state, to);
> +		memcpy_toio(map->virt + (to % state->win_size), from, len);
> +
> +		len -= this_len;
> +		to += this_len;
> +		from += this_len;
> +	}
>  }
>  
>  static const char * const part_probe_types[] = {

Brian

[1] If it was provably false, then I should be able to write out a
proof! It relies on something like this:

	If x >= 0 and y > 0, then x % y <= x.
