Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4kge-00085c-1w
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 06:49:32 +0000
Received: by laka10 with SMTP id a10so4599144lak.0
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2015 23:49:09 -0700 (PDT)
Date: Tue, 16 Jun 2015 09:55:24 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: add Spansion S25FL204K support
Message-Id: <20150616095524.933f62a2b6a83b7bb0f9095c@gmail.com>
In-Reply-To: <CACna6rwTMFo9mE-umGhnKEQntoSVzymQZUaXMG40cunUJ-PKXg@mail.gmail.com>
References: <1434434789-25915-1-git-send-email-antonynpavlov@gmail.com>
 <CACna6rwTMFo9mE-umGhnKEQntoSVzymQZUaXMG40cunUJ-PKXg@mail.gmail.com>
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

On Tue, 16 Jun 2015 08:40:40 +0200
Rafał Miłecki <zajec5@gmail.com> wrote:

> On 16 June 2015 at 08:06, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
> > with Uniform 4 kB Sectors.
> >
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 14a5d23..274083c 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -614,6 +614,7 @@ static const struct spi_device_id spi_nor_ids[] = {
> >         { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
> >         { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> >         { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, 0) },
> > +       { "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K) },
> >
> >         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
> >         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
> 
> Change looks fine, I just noticed it's not based on the latest code from:
> http://git.infradead.org/l2-mtd.git
> (the patch won't apply).
>
> Depending on the maintainer's time you may be asked to rebase your
> patch (or just do it yourself if you have a moment).

Ok, I'll try to rebase it by myself.
 
-- 
Best regards,
  Antony Pavlov
