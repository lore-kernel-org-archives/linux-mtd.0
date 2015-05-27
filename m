Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxiO9-0005FW-UB
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 20:57:22 +0000
Received: by paza2 with SMTP id a2so6472469paz.3
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 13:57:00 -0700 (PDT)
Date: Wed, 27 May 2015 13:56:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] drivers/mtd: add powernv flash MTD abstraction driver
Message-ID: <20150527205559.GK27753@ld-irv-0074>
References: <1430721739-17517-1-git-send-email-cyrilbur@gmail.com>
 <1430721739-17517-2-git-send-email-cyrilbur@gmail.com>
 <20150520211716.GM11598@ld-irv-0074>
 <1432188772.2911.15.camel@cyril>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432188772.2911.15.camel@cyril>
Cc: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, jk@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyril,

On Thu, May 21, 2015 at 04:12:52PM +1000, Cyril Bur wrote:
> One question though,
> 
> On Wed, 2015-05-20 at 14:17 -0700, Brian Norris wrote:
> > On Mon, May 04, 2015 at 04:42:19PM +1000, Cyril Bur wrote:
> > > Powerpc powernv platforms allow access to certain system flash devices
> > > through a firmwarwe interface. This change adds an mtd driver for these
> > > flash devices.
> > > 
> > > Minor updates from Jeremy Kerr and Joel Stanley.
> > > 
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> > > ---
> > >  drivers/mtd/devices/Kconfig         |   6 +
> > >  drivers/mtd/devices/Makefile        |   1 +
> > >  drivers/mtd/devices/powernv_flash.c | 288 ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 295 insertions(+)
> > >  create mode 100644 drivers/mtd/devices/powernv_flash.c
> > > 
> 
> [snip]
> 
> > > +
> > > +/**
> > > + * powernv_flash_set_driver_info - Fill the mtd_info structure and docg3
> > > + * structure @pdev: The platform device
> > > + * @mtd: The structure to fill
> > > + */
> > > +static int __init powernv_flash_set_driver_info(struct device *dev,
> > > +		struct mtd_info *mtd)
> > > +{
...
> > > +	/* Going to have to check what details I need to set and how to
> > > +	 * get them */
> > > +	mtd->name = of_get_property(dev->of_node, "name", NULL);
> > > +	mtd->type = MTD_NANDFLASH;
> > > +	mtd->flags = MTD_CAP_NANDFLASH;
> > 
> > Is this really NAND flash? It doesn't look like it; I see no bad block
> > implementation, and writesize==1.
> 
> Correct, but the type here is a bit misleading, we have a firmware
> interface for the low level read/write/erase functions, all this driver
> does is pass the calls through to firmware, there isn't much that linux
> or userspace can do since it doesn't actually do the hardware accesses. 
> 
> I've checked with Jeremy, turns out the hardware is actually NOR, no
> idea how I ever thought it was NAND.
> 
> Perhaps just:
> 	mtd->type = MTD_RAM;
> 	mtd->flags = MTD_WRITEABLE;
> 
> I would have used MTD_NOR but Jeremy confirms that the backing flash may
> not always be NOR on other platforms.

Well, it definitely shouldn't have a type of MTD_NANDFLASH if it's
actually NOR. MTD users may very well treat NAND differently than
anything else. And MTD_RAM is also pretty misleading.

Also, the comments throughout the driver about PNOR will be misleading
if it's not always PNOR.

What other type of memory might be used? Would it act any differently
than PNOR? If so, then I'd expect the driver would need to account for
this anyway (at a minimum, just by exposing that information through an
MTD API, so users can treat it differently) so we'd have a chance to
change the mtd->type.

Brian
