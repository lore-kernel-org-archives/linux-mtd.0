Received: from ia-in-x0236.1e100.net ([2607:f8b0:4001:c02::236]
 helo=mail-ia0-x236.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2LHn-0006BB-7x
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 12:36:35 +0000
Received: by mail-ia0-f182.google.com with SMTP id w33so8028315iag.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2013 04:36:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1359125428-23801-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1359125428-23801-2-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Mon, 4 Feb 2013 09:36:33 -0300
Message-ID: <CALF0-+WzFdwyMmNB4A0RjisQRA-xR1TcOgOitJbQL9T9sgLSVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Convert device allocation to managed
 devm_kzalloc()
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, thierry.reding@avionic-design.de,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On Fri, Jan 25, 2013 at 11:50 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Tested by compilation only.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/maps/physmap_of.c |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 67cc73c..c69e5c4 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -68,9 +68,6 @@ static int of_flash_remove(struct platform_device *dev)
>                         kfree(info->list[i].res);
>                 }
>         }
> -
> -       kfree(info);
> -
>         return 0;
>  }
>
> @@ -199,8 +196,9 @@ static int of_flash_probe(struct platform_device *dev)
>         map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
>
>         err = -ENOMEM;
> -       info = kzalloc(sizeof(struct of_flash) +
> -                      sizeof(struct of_flash_list) * count, GFP_KERNEL);
> +       info = devm_kzalloc(&dev->dev,
> +                           sizeof(struct of_flash) +
> +                           sizeof(struct of_flash_list) * count, GFP_KERNEL);
>         if (!info)
>                 goto err_flash_remove;
>
> --
> 1.7.8.6
>

I've just tested this physmap series.
Can you pick only this one?

The other two depend on the devm_ioremap_resource() patch,
so I'll re-submit them when that patch hits your tree.

Thanks,

-- 
    Ezequiel
