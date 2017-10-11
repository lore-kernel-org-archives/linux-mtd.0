Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2O3J-00014Y-SO
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 20:56:31 +0000
Received: by mail-qt0-x22e.google.com with SMTP id z19so9271731qtg.11
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 13:56:09 -0700 (PDT)
Date: Wed, 11 Oct 2017 16:56:07 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 3/5] MTD: chips/map_rom.c: implement point and unpoint
 methods
In-Reply-To: <CAFLxGvzPBU-HM8nwP+0Or14XrheB3LSj9_4iKE4mUU+xJNAn7A@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1710111650040.6870@knanqh.ubzr>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-4-nicolas.pitre@linaro.org>
 <CAFLxGvzPBU-HM8nwP+0Or14XrheB3LSj9_4iKE4mUU+xJNAn7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Oct 2017, Richard Weinberger wrote:

> On Wed, Oct 11, 2017 at 5:26 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> > ---
> >  drivers/mtd/chips/map_rom.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
> > index e67f73ab44..722afb1cf4 100644
> > --- a/drivers/mtd/chips/map_rom.c
> > +++ b/drivers/mtd/chips/map_rom.c
> > @@ -22,6 +22,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map);
> >  static int maprom_erase (struct mtd_info *mtd, struct erase_info *info);
> >  static unsigned long maprom_unmapped_area(struct mtd_info *, unsigned long,
> >                                           unsigned long, unsigned long);
> > +static int maprom_point (struct mtd_info *mtd, loff_t from, size_t len,
> > +                        size_t *retlen, void **virt, resource_size_t *phys);
> > +static int maprom_unpoint(struct mtd_info *mtd, loff_t from, size_t len);
> > +
> >
> >  static struct mtd_chip_driver maprom_chipdrv = {
> >         .probe  = map_rom_probe,
> > @@ -52,6 +56,8 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
> >         mtd->type = MTD_ROM;
> >         mtd->size = map->size;
> >         mtd->_get_unmapped_area = maprom_unmapped_area;
> > +       mtd->_point = maprom_point;
> > +       mtd->_unpoint = maprom_unpoint;
> >         mtd->_read = maprom_read;
> >         mtd->_write = maprom_write;
> >         mtd->_sync = maprom_nop;
> > @@ -78,6 +84,24 @@ static unsigned long maprom_unmapped_area(struct mtd_info *mtd,
> >  {
> >         struct map_info *map = mtd->priv;
> >         return (unsigned long) map->virt + offset;
> > +
> > +static int maprom_point(struct mtd_info *mtd, loff_t from, size_t len,
> > +                       size_t *retlen, void **virt, resource_size_t *phys)
> > +{
> > +       struct map_info *map = mtd->priv;
> > +
> > +       if (!map->virt)
> > +               return -EINVAL;
> > +       *virt = map->virt + from;
> > +       if (phys)
> > +               *phys = map->phys + from;
> > +       *retlen = len;
> > +       return 0;
> > +}
> > +
> > +static int maprom_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
> > +{
> > +       return 0;
> >  }
> 
> Can we please have a generic helper function for un/point instead of
> copy&pasting?

I'd prefer not. In this case (and the mapram case) the point/unpoint 
code is unusuably simple.  I don't want people to think that such 
simpleness is expected by making this into a common or generic function. 
Normally this ought to be more involved (see cfi_cmdset_0001 for 
a real example).


Nicolas
