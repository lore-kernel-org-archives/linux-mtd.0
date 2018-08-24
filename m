Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ft2IG-0001Zf-4S
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2018 02:57:49 +0000
Received: by mail-yb0-x242.google.com with SMTP id l16-v6so2984466ybk.11
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2018 19:57:37 -0700 (PDT)
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com.
 [209.85.213.174])
 by smtp.gmail.com with ESMTPSA id z193-v6sm3510655ywd.90.2018.08.23.19.57.36
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Aug 2018 19:57:37 -0700 (PDT)
Received: by mail-yb0-f174.google.com with SMTP id z12-v6so2987534ybg.9
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2018 19:57:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180824010938.GA25581@embeddedor.com>
References: <20180824010938.GA25581@embeddedor.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 23 Aug 2018 19:57:35 -0700
Message-ID: <CAGXu5jL_p6Z863qq5=K2B+=AW6LuxmBu23bjhQe-1saz4kdeFA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: use struct_size() in devm_kzalloc()
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 23, 2018 at 6:09 PM, Gustavo A. R. Silva
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
> This issue was detected with the help of Coccinelle.
>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index a068b21..b17cfd0 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1586,9 +1586,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       nand = devm_kzalloc(nc->dev,
> -                           sizeof(*nand) + (numcs * sizeof(*nand->cs)),
> -                           GFP_KERNEL);
> +       nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
>         if (!nand) {
>                 dev_err(nc->dev, "Failed to allocate NAND object\n");
>                 return ERR_PTR(-ENOMEM);
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
