Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6uz1-0003k2-Ld
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 09:59:21 +0000
Received: by mail-lf1-x144.google.com with SMTP id v17-v6so9368371lfe.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2018 02:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-7-ricardo.ribalda@gmail.com>
In-Reply-To: <20180905143643.9871-7-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 1 Oct 2018 11:58:49 +0200
Message-ID: <CAPybu_2WZd8w-HbW-7gn=Z+9LmRYV--pag--xjT=UBDgcxWYnA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mtd: maps: gpio-addr-flash: Split allocation in two
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

PLEASE do not apply this one!

There is a bug, value from gpio->addr is lost.
On Wed, Sep 5, 2018 at 4:37 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Instead of making one allocation and then calculating the addresses of
> those two pointers in that area make two allocations. This simplifies
> the code.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/mtd/maps/gpio-addr-flash.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index 8f5e3dce9be3..9455a8448064 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -205,7 +205,7 @@ static const char * const part_probe_types[] = {
>   */
>  static int gpio_flash_probe(struct platform_device *pdev)
>  {
> -       size_t i, arr_size;
> +       size_t i;
>         struct physmap_flash_data *pdata;
>         struct resource *memory;
>         struct resource *gpios;
> @@ -218,8 +218,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
>         if (!memory || !gpios || !gpios->end)
>                 return -EINVAL;
>
> -       arr_size = sizeof(state->gpio_addrs[0]) * gpios->end;
> -       state = devm_kzalloc(&pdev->dev, sizeof(*state) + arr_size, GFP_KERNEL);
> +       state = devm_kzalloc(&pdev->dev, sizeof(*state), GFP_KERNEL);
>         if (!state)
>                 return -ENOMEM;
>
> @@ -228,7 +227,12 @@ static int gpio_flash_probe(struct platform_device *pdev)
>          * away their pointer types here to the known types (gpios->xxx).
>          */
>         state->gpio_count     = gpios->end;
> -       state->gpio_addrs     = (void *)(unsigned long)gpios->start;
> +       state->gpio_addrs     = devm_kzalloc(&pdev->dev,
> +                                            sizeof(state->gpio_addrs[0]) *
> +                                                               gpios->end,
> +                                            GFP_KERNEL);
> +       if (!state->gpio_addrs)
> +               return -ENOMEM;
>         state->win_order      = get_bitmask_order(resource_size(memory)) - 1;
>
>         state->map.name       = DRIVER_NAME;
> --
> 2.18.0
>


-- 
Ricardo Ribalda
