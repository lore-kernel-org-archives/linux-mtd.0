Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7jVo-0002Yw-HC
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 15:56:34 +0000
Received: by mail-lf1-x141.google.com with SMTP id p34-v6so4516916lfg.10
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 08:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
 <20181001124351.31615-6-ricardo.ribalda@gmail.com>
 <20181003171114.51ab47b8@bbrezillon>
 <20181003171727.145e7e41@bbrezillon>
In-Reply-To: <20181003171727.145e7e41@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 3 Oct 2018 17:56:03 +0200
Message-ID: <CAPybu_0uheoKRd01V_WQg10gaY2xkkZTxXuz+LKunMoSe97GYg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] mtd: maps: gpio-addr-flash: Convert to gpiod
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
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
On Wed, Oct 3, 2018 at 5:17 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Wed, 3 Oct 2018 17:11:14 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>
> > Hi Ricardo,
> >
> > On Mon,  1 Oct 2018 14:43:49 +0200
> > Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
> >
> > > @@ -248,14 +252,19 @@ static int gpio_flash_probe(struct platform_device *pdev)
> > >
> > >     i = 0;
> > >     do {
> > > -           if (devm_gpio_request(&pdev->dev, state->gpio_addrs[i],
> > > -                                 DRIVER_NAME)) {
> > > +           unsigned int *gpio_id = (unsigned int *)gpios->start;
> > > +
> > > +           if (devm_gpio_request_one(&pdev->dev, gpio_id[i], GPIOD_OUT_LOW,
> > > +                                   DRIVER_NAME)) {
> > >                     dev_err(&pdev->dev, "failed to request gpio %d\n",
> > > -                           state->gpio_addrs[i]);
> > > +                           gpio_id[i]);
> > >                     return -EBUSY;
> > >             }
> > > -           gpio_direction_output(state->gpio_addrs[i], 0);
> > > -   } while (++i < state->gpio_count);
> > > +
> > > +           state->gpios->desc[i] = gpio_to_desc(gpio_id[i]);
> > > +           if (!state->gpios->desc[i])
> > > +                   return -EINVAL;
> > > +   } while (++i < state->gpios->ndescs);
> >
> > Actually, I was thinking about using devm_gpiod_get_array() here and
> > defining a gpio lookup table in the board file registering the device.
> > This way, adding support for DT based parsing is transparent.
>
> It's actually easier than I thought since no one is registering such a
> device, so all you have to do is call devm_gpiod_get_array() and have a
> struct gpio_descs pointer in struct async_state.

That is what I do in patch 8/8 for DT based parsing.

I am am doing the gpio_to_desc and other to maintain compatibility
with old platform board files (in and out tree).

I think is important to maintain that compatibility, but you decide ;)

Cheers

-- 
Ricardo Ribalda
