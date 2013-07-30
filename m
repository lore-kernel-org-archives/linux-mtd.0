Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4GKe-0001G7-Pt
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 20:15:45 +0000
Received: by mail-ve0-f182.google.com with SMTP id m1so4133479ves.41
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 13:15:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375182376-30043-2-git-send-email-shc_work@mail.ru>
References: <1375182376-30043-1-git-send-email-shc_work@mail.ru>
 <1375182376-30043-2-git-send-email-shc_work@mail.ru>
Date: Tue, 30 Jul 2013 13:15:23 -0700
Message-ID: <CAN8TOE8aMV9kdPp-2SWK82Yvh7D6iF2tLaD8QDXVdrjdjH4XJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: gpio: Return real nand_scan() error
 code on fail and simplify error path
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 4:06 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/mtd/nand/gpio.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
> index e432f1d..5eabd19 100644
> --- a/drivers/mtd/nand/gpio.c
> +++ b/drivers/mtd/nand/gpio.c
> @@ -212,7 +212,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
>         struct nand_chip *chip;
>         struct resource *res;
>         struct mtd_part_parser_data ppdata = {};
> -       int ret = 0;
> +       int ret;
>
>         if (!pdev->dev.of_node && !pdev->dev.platform_data)
>                 return -EINVAL;
> @@ -288,23 +288,20 @@ static int gpio_nand_probe(struct platform_device *pdev)
>
>         gpio_nand_set_wp(gpiomtd, 1);
>
> -       if (nand_scan(&gpiomtd->mtd_info, 1)) {
> -               ret = -ENXIO;
> -               goto err_wp;
> +       ret = nand_scan(&gpiomtd->mtd_info, 1);
> +       if (!ret) {
> +               if (gpiomtd->plat.adjust_parts)
> +                       gpiomtd->plat.adjust_parts(&gpiomtd->plat,
> +                                                  gpiomtd->mtd_info.size);
> +
> +               ppdata.of_node = pdev->dev.of_node;
> +               ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL,
> +                                               &ppdata, gpiomtd->plat.parts,
> +                                               gpiomtd->plat.num_parts);
> +               if (!ret)
> +                       return 0;
>         }
>
> -       if (gpiomtd->plat.adjust_parts)
> -               gpiomtd->plat.adjust_parts(&gpiomtd->plat,
> -                                          gpiomtd->mtd_info.size);
> -
> -       ppdata.of_node = pdev->dev.of_node;
> -       ret = mtd_device_parse_register(&gpiomtd->mtd_info, NULL, &ppdata,
> -                                       gpiomtd->plat.parts,
> -                                       gpiomtd->plat.num_parts);
> -       if (!ret)
> -               return 0;
> -
> -err_wp:
>         gpio_nand_set_wp(gpiomtd, 0);
>
>         return ret;

Does this really simplify the error path? It removes the 'goto', but
it increases indentation and makes this less scalable (i.e.,
currently, the average indentation level remains constant; under your
change, any additional initialization steps may require modifying the
indentation of unrelated steps). Plus, this doesn't really follow the
style of most other drivers.

This patch could be very simple; just something like this (with proper
whitespace, of course):

--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -279,10 +279,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
        if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
                gpio_direction_output(gpiomtd->plat.gpio_nwp, 1);

-       if (nand_scan(&gpiomtd->mtd_info, 1)) {
-               ret = -ENXIO;
+       ret = nand_scan(&gpiomtd->mtd_info, 1);
+       if (ret)
                goto err_wp;
-       }

        if (gpiomtd->plat.adjust_parts)
                gpiomtd->plat.adjust_parts(&gpiomtd->plat,

BTW, if you think it makes more sense to return the error code from
nand_scan directly, could you change this for all other NAND drivers?
My reading shows there's approx a 50/50 split between those that
choose -ENXIO and those that just return the NAND error code.
Uniformity is good in this case, and nand_base.c gives sane error
codes, I believe.

Brian
