Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjjWK-0002Bn-B8
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 09:29:06 +0000
Date: Fri, 3 Mar 2017 10:28:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>, Arnaud Mouiche <arnaud.mouiche@gmail.com>
Subject: Re: [PATCH v2 1/6] nand: spi: Add init/release function
Message-ID: <20170303102831.4d6fac6c@bbrezillon>
In-Reply-To: <CAAyFORL67p4y8ZeoZg1iD4SOF5e+d6u8tC=--eHdPWgvBWTE9g@mail.gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-2-git-send-email-peterpandong@micron.com>
 <20170301105851.5bc9eb0d@bbrezillon>
 <CAAyFORL67p4y8ZeoZg1iD4SOF5e+d6u8tC=--eHdPWgvBWTE9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Mar 2017 16:37:55 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> >  
> >>
> >> Signed-off-by: Peter Pan <peterpandong@micron.com>
> >> ---
> >>  drivers/mtd/nand/Kconfig            |   1 +
> >>  drivers/mtd/nand/Makefile           |   1 +
> >>  drivers/mtd/nand/spi/Kconfig        |   5 +
> >>  drivers/mtd/nand/spi/Makefile       |   2 +
> >>  drivers/mtd/nand/spi/spinand_base.c | 469 ++++++++++++++++++++++++++++++++++++
> >>  drivers/mtd/nand/spi/spinand_ids.c  |  29 +++
> >>  include/linux/mtd/spinand.h         | 315 ++++++++++++++++++++++++  
> >
> > If you're okay with that, I'd like you to add an entry in MAINTAINERS
> > for the spinand sub-sub-sub-system :-). This way you'll be tagged as
> > the maintainer of this code and will be Cc when a patch is submitted.  
> 
> If you are OK with this. I'm glad to update the MAINTAINERS file. :)

Of course I am. Anything that can help me maintain the NAND
sub-system is welcome.

> Besides, is there a rule to add this info?

You can be a driver maintainer, or a sub-system maintainer. People
usually don't do this for drivers, but it's actually good to have
someone that can review/test changes.
So, my rule is: if you had a new driver or a new subsystem (which is
the case here), add an entry in MAINTAINERS.

> >> diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
> >> new file mode 100644
> >> index 0000000..97d47146
> >> --- /dev/null
> >> +++ b/drivers/mtd/nand/spi/spinand_base.c  
> >
> > How about renaming this file into core.c?  
> 
> core.c is much more clear while spinand_base.c matches rawnand_base.c
> Should we rename them at the same time or rename spinand_base.c first?

No, let's keep rawnand code unchanged.


> >  
> >> +{
> >> +     struct nand_device *nand = &chip->base;
> >> +
> >> +     return nand_diesize(nand) * nand_ndies(nand);
> >> +}  
> >
> > Probably something that should go in include/linux/mtd/nand.h or
> > drivers/mtd/nand/core.c.  
> 
> Yes. I will add an interface in include/linux/mtd/nand.h.
> nand_chip_size() or nand_device_size(), which one is better?

Maybe just nand_size(), to be consistent with other function names.


> > That does not mean manufacture drivers can't have their own table, but
> > if there's nothing to share between manufacturers (IOW, if the dev_id
> > field is not standardized), then there's no need to expose a huge id
> > table in the core.  
> 
> Good comment. Let manufacture's detect function to handle there own table.
> What do you think, Boris?

Actually, I'm the one asking? :-)
If there's nothing to share between manufacturers, then yes, let's keep
the NAND id table private to each manufacturer driver.

> BTW, there is another question. read id method is not unique. Micron spi nand
> need a dummy byte before reading ID while some vendors don't. Now I define
> vendor alias in DTS and use this info to choose right manufacture ops. Do you
> have a better idea?

Ouch. That's bad news. How about letting the manufacturer code read the
ID and detect the NAND?

That means you'll iterate over all manufacturer entries in the
manufacturer table and call ->detect(). The ->detect() hook will be
responsible for reading the ID (with the proper read-id sequence) and
initialize the NAND parameters.

If we find a common pattern between different vendors, we can then
provide default helpers for the read-id and/or detect implementation.
