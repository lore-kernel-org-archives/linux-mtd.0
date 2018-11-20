Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1EH-0005Ej-Se
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 08:17:54 +0000
Received: by mail-ua1-f68.google.com with SMTP id p9so345610uaa.5
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 00:17:39 -0800 (PST)
MIME-Version: 1.0
References: <CGME20181115050737eucas1p104ccec527d0713f9414bc75e0959feb6@eucas1p1.samsung.com>
 <1542258449-19930-1-git-send-email-huijin.park@samsung.com>
In-Reply-To: <1542258449-19930-1-git-send-email-huijin.park@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Nov 2018 09:17:26 +0100
Message-ID: <CAMuHMdWwj6t6Pw==HG+jHC8y6rooWROuQjxJZNUwcXjimai8Pg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: cast to u64 to avoid uint overflows
To: huijin.park@samsung.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bbanghj.park@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huijin,

On Thu, Nov 15, 2018 at 6:08 AM Huijin Park <huijin.park@samsung.com> wrote:
> From: "huijin.park" <huijin.park@samsung.com>
>
> The "params->size" is defined as "u64".
> And "info->sector_size" and "info->n_sectors" are defined as
> unsigned int and u16.
> Thus, u64 data might have strange data(loss data) if the result
> overflows an unsigned int.
> This patch casts "info->sector_size" and "info->n_sectors" to an u64.
>
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d9c368c..527f281 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2459,7 +2459,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
>         memset(params, 0, sizeof(*params));
>
>         /* Set SPI NOR sizes. */
> -       params->size = info->sector_size * info->n_sectors;
> +       params->size = (u64)info->sector_size * (u64)info->n_sectors;

Adding the cast to only the first operand should be sufficient, and may lead
to faster code, as only a 64x16 multiplication needs to be done, instead of
a 64x64.

>         params->page_size = info->page_size;
>
>         /* (Fast) Read settings. */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
