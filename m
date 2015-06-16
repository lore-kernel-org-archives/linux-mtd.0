Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4jo2-0003Di-T6
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 05:53:08 +0000
Received: by lbbti3 with SMTP id ti3so3803413lbb.1
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2015 22:52:44 -0700 (PDT)
Date: Tue, 16 Jun 2015 08:58:59 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add Spansion S25FL204K support
Message-Id: <20150616085859.a3c6ede052990e9a6c392313@gmail.com>
In-Reply-To: <CACna6rwkFVezEM3-M0-sVJ5Ad8=9cy4DzO2C_OfwqHWqk4oHvA@mail.gmail.com>
References: <1434399606-19228-1-git-send-email-antonynpavlov@gmail.com>
 <CACna6rwkFVezEM3-M0-sVJ5Ad8=9cy4DzO2C_OfwqHWqk4oHvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 Jun 2015 23:04:37 +0200
Rafał Miłecki <zajec5@gmail.com> wrote:

> On 15 June 2015 at 22:20, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
> > with Uniform 4 kB Sectors.
> >
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > ---
> >  drivers/mtd/devices/m25p80.c  | 2 +-
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 3af137f..85be835 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -281,7 +281,7 @@ static const struct spi_device_id m25p_ids[] = {
> >         {"s25fl512s"},  {"s70fl01gs"},  {"s25sl12800"}, {"s25sl12801"},
> >         {"s25fl129p0"}, {"s25fl129p1"}, {"s25sl004a"},  {"s25sl008a"},
> >         {"s25sl016a"},  {"s25sl032a"},  {"s25sl064a"},  {"s25fl008k"},
> > -       {"s25fl016k"},  {"s25fl064k"},  {"s25fl132k"},
> > +       {"s25fl016k"},  {"s25fl064k"},  {"s25fl132k"},  {"s25fl204k"},
> >         {"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
> >         {"sst25vf064c"},{"sst25wf512"}, {"sst25wf010"}, {"sst25wf020"},
> >         {"sst25wf040"},
> 
> And why do we need it in this table (above)? You didn't add any extra
> handling for it. You also didn't call it anything like "nonjedec", so
> I guess it supports JEDEC's RD ID.

My original patch was made for linux-3.19 (Feb 8 2015), 
I just used commit 3e38933dd894b4 as an example

  commit 3e38933dd894b48d422113cb26fd3510fd2a80bd
  Author: Knut Wohlrab <knut.wohlrab@de.bosch.com>
  Date:   Mon Nov 10 16:54:53 2014 +0100

      mtd: m25p80: Add support for serial flash Spansion S25FL132K

Now I see that some things are changed with commit 1103b8517041b.

  commit 1103b8517041b08286cae0da8481bef9164c961a
  Author: Brian Norris <computersforpeace@gmail.com>
  Date:   Fri Mar 27 10:29:50 2015 -0700

      mtd: m25p80: bind to "nor-jedec" ID, for auto-detection

I will resubmit V2 of my patch in a short while.

-- 
Best regards,
  Antony Pavlov
