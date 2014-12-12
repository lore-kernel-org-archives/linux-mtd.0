Received: from mail-la0-f42.google.com ([209.85.215.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzSy9-0002nW-Ty
 for linux-mtd@lists.infradead.org; Fri, 12 Dec 2014 16:21:31 +0000
Received: by mail-la0-f42.google.com with SMTP id gd6so6463204lab.15
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 08:21:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
Date: Fri, 12 Dec 2014 17:21:06 +0100
Message-ID: <CAKv+Gu_qWrH77Yk1=Kuo5gMJ70PCYfVM6P3N=KZ2BvwaAqQB-w@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: fix potential NULL dereference
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 November 2014 at 13:51, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On device remove, when testing the cmtd field of an of_flash
> struct to decide whether it is a concatenated device or not,
> we get a false positive on cmtd == NULL, and dereference it
> subsequently. This may occur if of_flash_remove() is called
> from the cleanup path of of_flash_probe().
>
> Instead, test for NULL first, and only then perform the test
> for a concatenated device.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/mtd/maps/physmap_of.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>

Ping?


> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index c1d21cb501ca..e48930424091 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -47,14 +47,12 @@ static int of_flash_remove(struct platform_device *dev)
>                 return 0;
>         dev_set_drvdata(&dev->dev, NULL);
>
> -       if (info->cmtd != info->list[0].mtd) {
> +       if (info->cmtd) {
>                 mtd_device_unregister(info->cmtd);
> -               mtd_concat_destroy(info->cmtd);
> +               if (info->cmtd != info->list[0].mtd)
> +                       mtd_concat_destroy(info->cmtd);
>         }
>
> -       if (info->cmtd)
> -               mtd_device_unregister(info->cmtd);
> -
>         for (i = 0; i < info->list_size; i++) {
>                 if (info->list[i].mtd)
>                         map_destroy(info->list[i].mtd);
> --
> 1.8.3.2
>
