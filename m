Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6Ok8-000393-Fg
 for linux-mtd@lists.infradead.org; Sun, 13 Jul 2014 18:43:24 +0000
Received: by mail-vc0-f169.google.com with SMTP id hu12so546779vcb.14
 for <linux-mtd@lists.infradead.org>; Sun, 13 Jul 2014 11:43:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1402582606-3523-1-git-send-email-ryazanov.s.a@gmail.com>
References: <1402439742-31999-1-git-send-email-ryazanov.s.a@gmail.com>
 <1402582606-3523-1-git-send-email-ryazanov.s.a@gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Sun, 13 Jul 2014 22:42:41 +0400
Message-ID: <CAHNKnsQE4Br7=wVQEjBX1gysJ3ZP3F9gRi5thOtvEbu=T5X_Bg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add support for EON EN25QH128
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linux MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-06-12 18:16 GMT+04:00 Sergey Ryazanov <ryazanov.s.a@gmail.com>:
> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> ---
> v2
> * Rebased on l2-mtd.git
> * Patch spi-nor instead of m25p80
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c713c86..ac1fefc 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -449,6 +449,7 @@ const struct spi_device_id spi_nor_ids[] = {
>         { "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
>         { "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>         { "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
> +       { "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>         { "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>
>         /* ESMT */
> --
> 1.8.1.5
>

Any issues with this patch?

Patchwork: http://patchwork.ozlabs.org/patch/359182/

-- 
BR,
Sergey
