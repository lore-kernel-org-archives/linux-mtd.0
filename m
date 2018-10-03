Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7mvA-0001eA-07
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 19:34:57 +0000
Received: by mail-lj1-x244.google.com with SMTP id p89-v6so6229451ljb.3
 for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2018 12:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181001124351.31615-1-ricardo.ribalda@gmail.com>
 <20181001124351.31615-8-ricardo.ribalda@gmail.com>
 <20181003190130.4c9e509f@bbrezillon>
In-Reply-To: <20181003190130.4c9e509f@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 3 Oct 2018 21:34:25 +0200
Message-ID: <CAPybu_06=Mz+wGLeodM4CjP810Dphm9JKLmX62FVmspy0888ag@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
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
On Wed, Oct 3, 2018 at 7:01 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Mon,  1 Oct 2018 14:43:51 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > +static int gpio_flash_probe_gpios(struct platform_device *pdev,
> > +                               struct async_state *state)
> > +{
> > +     struct physmap_flash_data *pdata;
> > +     struct device_node *dn;
> > +     struct resource *gpios = NULL;
> > +     int i;
> > +
> > +     dn = pdev->dev.of_node;
> > +     if (dn) {
> > +             state->gpios = devm_gpiod_get_array(&pdev->dev, NULL,
> > +                                                 GPIOD_OUT_LOW);
>
> Did you consider using gpiod_set_array_value() to update the gpio vals
> instead of having your own update loop (the for loop in the
> gf_set_gpios() func)?

Yes briefly but there are some cons:

- I need to allocate the value_array
- I want to relay on my cached old values, so I still have to loop


-- 
Ricardo Ribalda
