Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g68gv-000724-CE
 for linux-mtd@lists.infradead.org; Sat, 29 Sep 2018 06:25:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id u21-v6so704633lja.8
 for <linux-mtd@lists.infradead.org>; Fri, 28 Sep 2018 23:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180905143643.9871-1-ricardo.ribalda@gmail.com>
 <20180905143643.9871-4-ricardo.ribalda@gmail.com>
 <20180927133513.487666f0@bbrezillon>
In-Reply-To: <20180927133513.487666f0@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Sat, 29 Sep 2018 08:24:55 +0200
Message-ID: <CAPybu_2hLyhrf+itbJthJG7+uWPs1jiiQaNRvRjh_FLJS65WRQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: maps: gpio-addr-flash: Use devm_* functions
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

On Thu, 27 Sep 2018, 13:35 Boris Brezillon, <boris.brezillon@bootlin.com> wrote:
>
> On Wed,  5 Sep 2018 16:36:38 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> > @@ -234,9 +234,11 @@ static int gpio_flash_probe(struct platform_device *pdev)
> >       state->map.copy_to    = gf_copy_to;
> >       state->map.bankwidth  = pdata->width;
> >       state->map.size       = state->win_size * (1 << state->gpio_count);
> > -     state->map.virt       = ioremap_nocache(memory->start, state->win_size);
> > -     if (!state->map.virt)
> > -             return -ENOMEM;
> > +     state->map.virt       = devm_ioremap_resource(&pdev->dev, memory);
> > +     if (IS_ERR(state->map.virt)) {
> > +             dev_err(&pdev->dev, "failed to map memory\n");
>
> You can drop this error message, devm_ioremap_resource() already takes
> care of that (no need to send a new version, I'll fix it when applying).

Thanks for you review. I will do the port to gpiod next monday (I want
to try it on real hw)

Cheers!
>
> > +             return PTR_ERR(state->map.virt);
> > +     }
>
