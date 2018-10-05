Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8Jeg-0002xv-8N
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 06:32:08 +0000
Received: by mail-lj1-x241.google.com with SMTP id j4-v6so6785260ljc.12
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 23:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
 <20181004142942.11887-2-ricardo.ribalda@gmail.com>
 <20181005002125.12fd229f@bbrezillon>
In-Reply-To: <20181005002125.12fd229f@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 5 Oct 2018 08:31:35 +0200
Message-ID: <CAPybu_26HST5xGfhE6MoVTRZok_gfDqN=ZOAesuEMVskdrCpLA@mail.gmail.com>
Subject: Re: [PATCH v10 10/10] mtd: maps: gpio-addr-flash: Add support for
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


On Fri, Oct 5, 2018 at 12:21 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Hi Ricardo,
>
> On Thu,  4 Oct 2018 16:29:42 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> > Allow creating gpio-addr-flash via device-tree and not just via platform
> > data.
> >
> > Mimic what physmap_of_versatile and physmap_of_gemini does to reduce
> > code duplicity.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
> >  drivers/mtd/maps/Kconfig           |  8 +++
> >  drivers/mtd/maps/Makefile          |  3 +-
> >  drivers/mtd/maps/gpio-addr-flash.c | 95 +++++++++++++++++++-----------
> >  drivers/mtd/maps/gpio-addr-flash.h | 34 +++++++++++
> >  drivers/mtd/maps/physmap_of_core.c |  5 ++
> >  drivers/mtd/maps/physmap_of_gpio.c | 21 +++++++
> >  6 files changed, 129 insertions(+), 37 deletions(-)
> >  create mode 100644 drivers/mtd/maps/gpio-addr-flash.h
> >  create mode 100644 drivers/mtd/maps/physmap_of_gpio.c
> >
> > diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> > index afb36bff13a7..427143d42168 100644
> > --- a/drivers/mtd/maps/Kconfig
> > +++ b/drivers/mtd/maps/Kconfig
> > @@ -94,6 +94,14 @@ config MTD_PHYSMAP_OF_GEMINI
> >         platforms, some detection and setting up parallel mode on the
> >         external interface.
> >
> > +config MTD_PHYSMAP_OF_GPIO
> > +     bool "GPIO-assisted OF-based physical memory map handling"
> > +     depends on MTD_PHYSMAP_OF
> > +     depends on MTD_GPIO_ADDR
> > +     help
> > +       This provides some extra DT physmap parsing for flashes that are
> > +       partially physically addressed and assisted by GPIOs.
> > +
>
> Hm, so now we have the physmap_of driver which uses a function exposed
> by the gpio-addr-flash module, but this module is also declaring a
> platform_driver. It's probably working fine, but it's hard to follow.
>
> So, I decided to give it a try and started to rework a bit the physmap,
> physmap_of and gpio-addr-flash drivers. Here is the result [1] (it's
> only been compile tested). With this rework we now have a single
> driver which supports DT and !DT init and can also use GPIOs to
> extend the physical memory range in case it's not large enough to
> address the whole memory dev.
>
> Let me know what you think of this approach.
>

The code is definitely easier to follow. But I believe you should
rebase your changes on mines (1-9) and instead of 10 apply your
patch-set.:
- "mtd: maps: Merge gpio-addr-flash.c into physmap-core.c" includes
all my changes and some of them are not obvious:( Port to gpiod,
gpio_values, win_order, use new apis....)
- Also there would be 1 (or 2) fixes that should be included in stable
that we lose using your approach "mtd: maps: gpio-addr-flash: Fix
ioremapped size", "mtd: physmap_of: Release resources on error"
- And last, but not least, I want some credit for all this work ;)
After 10 iterations I guess that I deserve more than a Documentation
change, specially when my code would be on the tree.

My other concern is that maybe we are giving too much entity to
gpio-addr by including it in the core. But if you are fine with it, I
am fine with it.

If you want i can do the rebase and start testing on my board. What do
you think?

Regards!



> Regards,
>
> Boris
>
> [1]https://github.com/bbrezillon/linux-0day/commits/mtd/physmap-cleanup



--
Ricardo Ribalda
