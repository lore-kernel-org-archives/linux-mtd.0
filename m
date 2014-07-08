Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4Pz8-00057c-05
 for linux-mtd@lists.infradead.org; Tue, 08 Jul 2014 07:38:42 +0000
Received: by mail-la0-f41.google.com with SMTP id hz20so3727210lab.0
 for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2014 00:38:19 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1404795285-2929-1-git-send-email-Priyanka.Jain@freescale.com>
References: <1404795285-2929-1-git-send-email-Priyanka.Jain@freescale.com>
Date: Tue, 8 Jul 2014 09:38:19 +0200
Message-ID: <CAMuHMdV52qwThCezu=4NCpVBwbM2AjSK4cKXA+BdO=v_Yy2sBQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Correct device-id for n25q512a device
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CC linux-mtd

On Tue, Jul 8, 2014 at 6:54 AM, Priyanka Jain
<Priyanka.Jain@freescale.com> wrote:
> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c713c86..148bb51d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -487,7 +487,7 @@ const struct spi_device_id spi_nor_ids[] = {
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> -       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> +       { "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },
>
>         /* PMC */
>         { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> --
> 1.7.4.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
