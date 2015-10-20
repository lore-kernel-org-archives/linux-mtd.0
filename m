Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoREc-00014i-1E
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 07:21:27 +0000
Received: by wicfx6 with SMTP id fx6so31378325wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 00:21:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1445283119-96697-1-git-send-email-computersforpeace@gmail.com>
References: <1445283119-96697-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 20 Oct 2015 09:21:04 +0200
Message-ID: <CAH6sp9O7jwkcJWxh723CWtV8hFBTxq8QrjF7fwyye4h78uu6vQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: rbtx4939-flash: fix compile error
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 19, 2015 at 9:31 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> We got the syntax wrong here. Compile tested this time!
>
> Error:
>
>    drivers/mtd/maps/rbtx4939-flash.c: In function 'rbtx4939_flash_probe':
>>> drivers/mtd/maps/rbtx4939-flash.c:99:11: error: request for member 'dev' in something not a structure or union
>      info->mtd.dev.parent = &dev->dev;
>               ^

*Sigh*

Thanks Brian.

Frans

> Fixes: 9aa7e50276c1 ("mtd: maps: rbtx4939-flash: show parent device in sysfs")
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/mtd/maps/rbtx4939-flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
> index 18ee361455a2..3a06ecfc55ff 100644
> --- a/drivers/mtd/maps/rbtx4939-flash.c
> +++ b/drivers/mtd/maps/rbtx4939-flash.c
> @@ -96,7 +96,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
>                 err = -ENXIO;
>                 goto err_out;
>         }
> -       info->mtd.dev.parent = &dev->dev;
> +       info->mtd->dev.parent = &dev->dev;
>         err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
>                                         pdata->nr_parts);
>
> --
> 2.6.0.rc2.230.g3dd15c0
>
