Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fufFH-0004cK-18
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 14:45:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id y17-v6so1648102ljy.8
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2018 07:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
 <20180821143152.32293-3-ricardo.ribalda@gmail.com>
 <20180828162611.2f45e5c9@bbrezillon>
In-Reply-To: <20180828162611.2f45e5c9@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 28 Aug 2018 16:44:57 +0200
Message-ID: <CAPybu_0yRQunWVoTKffm4NZaCNbiHpBQV11tJ3z62TpDGo1rVw@mail.gmail.com>
Subject: Re: [PATCH 2/8] mtd: maps: gpio-addr-flash: Fix ioremapped size
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
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

Hi Boris
On Tue, Aug 28, 2018 at 4:26 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Tue, 21 Aug 2018 16:31:46 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > We should only iomap the area of the chip that is memory mapped.
> > Otherwise we could be mapping devices beyond the memory space or that
> > belong to other devices.
> >
>
> Can you add
>
> Fixes: ebd71e3a4861 ("mtd: maps: gpio-addr-flash: fix warnings and make more portable")


Sure, I have some other changes for the patchset at
https://github.com/ribalda/linux/tree/gpio-addr-flash-v2

I will wait a couple of days for more reviews and I will resend the patches


>
> and in case you want to backport the fix:
>
> Cc: <stable@vger.kernel.org>
>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  drivers/mtd/maps/gpio-addr-flash.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> > index 17be47f72973..6de16e81994c 100644
> > --- a/drivers/mtd/maps/gpio-addr-flash.c
> > +++ b/drivers/mtd/maps/gpio-addr-flash.c
> > @@ -234,7 +234,7 @@ static int gpio_flash_probe(struct platform_device *pdev)
> >       state->map.copy_to    = gf_copy_to;
> >       state->map.bankwidth  = pdata->width;
> >       state->map.size       = state->win_size * (1 << state->gpio_count);
> > -     state->map.virt       = ioremap_nocache(memory->start, state->map.size);
> > +     state->map.virt       = ioremap_nocache(memory->start, state->win_size);
> >       if (!state->map.virt)
> >               return -ENOMEM;
> >
>


-- 
Ricardo Ribalda
