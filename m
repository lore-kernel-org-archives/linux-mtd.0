Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vVH-00074t-6B
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:06:15 +0000
Received: by oiww189 with SMTP id w189so135778283oiw.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2015 10:05:52 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1448295329-3087-1-git-send-email-saurabh.truth@gmail.com>
References: <201511232333.kj6JWXch%fengguang.wu@intel.com>
 <1448295329-3087-1-git-send-email-saurabh.truth@gmail.com>
Date: Mon, 23 Nov 2015 19:05:52 +0100
Message-ID: <CAMuHMdUw-Da+5wX4vv7KAo408yvM+AaHCRSZOgfB0-J1fAHEcQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: use of_property_read_u8()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Saurab,

On Mon, Nov 23, 2015 at 5:15 PM, Saurabh Sengar <saurabh.truth@gmail.com> wrote:
> use of_property_read_u8() for u8 values

Why are you making this change?
Have you tested this?

drivers/of/base.c says

     * dts entry of array should be like:
     *      property = /bits/ 8 <0x50 0x60 0x70>;

but Documentation/devicetree/bindings/mtd/orion-nand.txt doesn't say
anything about the "/bits/ 8" part, thus "normal" 32-bit cells are assumed.

> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
> ---
> v2 :  added the missed semi colon
>  drivers/mtd/nand/orion_nand.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index ee83749..0cbebc5 100644
>
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -83,7 +83,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>         struct clk *clk;
>         void __iomem *io_base;
>         int ret = 0;
> -       u32 val = 0;
>
>         nc = devm_kzalloc(&pdev->dev,
>                         sizeof(struct nand_chip) + sizeof(struct mtd_info),
> @@ -103,22 +102,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>                                         GFP_KERNEL);
>                 if (!board)
>                         return -ENOMEM;
> -               if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
> -                       board->cle = (u8)val;
> -               else
> -                       board->cle = 0;
> -               if (!of_property_read_u32(pdev->dev.of_node, "ale", &val))
> -                       board->ale = (u8)val;
> -               else
> +               of_property_read_u8(pdev->dev.of_node, "cle", &board->cle);
> +
> +               if (of_property_read_u8(pdev->dev.of_node, "ale", &board->ale))
>                         board->ale = 1;
> -               if (!of_property_read_u32(pdev->dev.of_node,
> -                                               "bank-width", &val))
> -                       board->width = (u8)val * 8;
> -               else
> +               if (of_property_read_u8(pdev->dev.of_node,
> +                                               "bank-width", &board->width))
>                         board->width = 8;
> -               if (!of_property_read_u32(pdev->dev.of_node,
> -                                               "chip-delay", &val))
> -                       board->chip_delay = (u8)val;
> +               of_property_read_u8(pdev->dev.of_node,
> +                                       "chip-delay", &board->chip_delay);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
