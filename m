Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7X4L-00065P-0K
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 23:25:46 +0000
Received: by pabur14 with SMTP id ur14so72568204pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2015 15:25:24 -0800 (PST)
Date: Fri, 11 Dec 2015 15:25:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Cc: Heiko Schocher <hs@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Pekon Gupta <pekon@pek-sem.com>, Roger Quadros <rogerq@ti.com>,
 Nicholas Mc Guire <hofrat@osadl.org>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefano Babic <sbabic@denx.de>,
 "Stahl Martin (Helbling Technik)" <Martin.Stahl@helbling.ch>
Subject: Re: mtd, nand, omap2: parse cmdline partition fail
Message-ID: <20151211232521.GA130567@google.com>
References: <56613747.8040907@denx.de>
 <CAH6sp9M=vSQbVa7exRvHF+5o9dPz=wLrN3a1cL2O1kkcuDZGHg@mail.gmail.com>
 <566151DE.9070706@denx.de> <20151209231901.GA64855@google.com>
 <CAH6sp9OqYt76FGbOWKxSovvbx8+TjGCKbAvy-V7t5N6FDuO3pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH6sp9OqYt76FGbOWKxSovvbx8+TjGCKbAvy-V7t5N6FDuO3pQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 10, 2015 at 08:13:15AM +0100, Frans Klaver wrote:
> On Thu, Dec 10, 2015 at 12:19 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Fri, Dec 04, 2015 at 09:42:06AM +0100, Heiko Schocher wrote:
> >> >>But wondering, if there are two or more identical nand chips in the
> >> >>system, they will have the same mtd->name ... which seems buggy to me...
> >> >
> >> >Agree.
> >>
> >> Good, so we must fix it ;-)
> >
> > Yeah, that's a bad problem. Most people only plan for one chip and then
> > realize they need 2 later. nand_base should probably support something
> > to do this easily. Unfortunately, making a change like that could cause
> > some problems with cmdline naming across kernel versions, if we start
> > changing the convention for some drivers...(do we consider the MTD name
> > part of the ABI?)
> 
> I would expect a name to be just a name; something parsable by humans.
> By definition that cannot be an ABI. On the other hand, maybe it has
> grown to become part of the ABI.

So far, we've tried not to break it if possible. Perhaps if we come up
with a better solution for automatically naming/numbering chips attached
to the same device/controller, we can test out whether it hurts to
change.

> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 89d811e7b04a..185dc36c687f 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -592,6 +592,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
> >         struct mtd_partitions parsed;
> >         int ret;
> >
> > +       if (mtd->dev.parent) {
> > +               if (!mtd->owner && mtd->dev.parent->driver)
> > +                       mtd->owner = mtd->dev.parent->driver->owner;
> > +               if (!mtd->name)
> > +                       mtd->name = dev_name(mtd->dev.parent);
> > +       } else {
> > +               pr_debug("mtd device won't show a device symlink in sysfs\n");
> > +       }
> > +
> >         memset(&parsed, 0, sizeof(parsed));
> >
> >         ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
> 
> This was the first thing I thought of when this issue was brought up.
> If you do this, do you still need the chunk of code you copied from in
> add_mtd_device()? Since we fill in these things on the master, I
> wouldn't think we do.

I guess we don't need the code in add_mtd_device().

I'll send a patch against linux-mtd.git shortly (essentially 4.4-rc1).

Brian
