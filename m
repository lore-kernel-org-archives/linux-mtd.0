Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsxVP-0006pc-SB
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2018 21:51:06 +0000
Received: by mail-yb0-x241.google.com with SMTP id f4-v6so2766549ybp.7
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2018 14:50:52 -0700 (PDT)
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com.
 [209.85.213.169])
 by smtp.gmail.com with ESMTPSA id i190-v6sm6679990ywc.60.2018.08.23.14.50.49
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Aug 2018 14:50:49 -0700 (PDT)
Received: by mail-yb0-f169.google.com with SMTP id y20-v6so2751035ybi.13
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2018 14:50:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180823193332.GA31602@embeddedor.com>
References: <20180823193332.GA31602@embeddedor.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 23 Aug 2018 14:50:48 -0700
Message-ID: <CAGXu5j+biznRQt+gi7Nj1GZ0zk-s6JRh1NB5DhOOOMq0sf8ciQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: jz4780: use struct_size() in devm_kzalloc()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Linux mtd <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 23, 2018 at 12:33 PM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
>
> struct foo {
>         int stuff;
>         void *entry[];
> };
>
> instance = devm_kzalloc(dev, sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);
>
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
>
> instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index db4fa60..ac62395 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -352,7 +352,7 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       nfc = devm_kzalloc(dev, sizeof(*nfc) + (sizeof(nfc->cs[0]) * num_banks), GFP_KERNEL);
> +       nfc = devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
>         if (!nfc)
>                 return -ENOMEM;
>
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
