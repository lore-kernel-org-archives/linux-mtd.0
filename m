Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEFTR-0003fD-Gf
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 09:54:22 +0000
Date: Fri, 14 Feb 2014 17:11:50 +0800
From: Huang Shijie <b32955@freescale.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH resend] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Message-ID: <20140214091148.GA30044@shlinux2.ap.freescale.net>
References: <1392365295-19299-1-git-send-email-b32955@freescale.com>
 <1392369532.12215.61.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1392369532.12215.61.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 11:18:52AM +0200, Artem Bityutskiy wrote:
> On Fri, 2014-02-14 at 16:08 +0800, Huang Shijie wrote:
> > If the master mtd does not have any slave mtd partitions,
> > and its numeraseregions is one(only has one erease block), and
> > we attach the master mtd with : ubiattach -m 0 -d 0
> > 
> > We will meet the error with (Micron M29W256GL7AN6):
> > -------------------------------------------------------
> > root@freescale ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
> > UBI: attaching mtd0 to ubi0
> > UBI error: io_init: multiple regions, not implemented
> > ubiattach: error!: cannot attach mtd0
> >            error 22 (Invalid argument)
> > -------------------------------------------------------
> > 
> > In fact, if there is only one "erase block", we should not
> > prevent the attach.
> > 
> > This patch fixes it.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> 
> Did you investigate the entire MTD subsystem an figure out what exactly
> 'numeraseregions=0' and 'numeraseregions=1' mean? What is the difference
> between these 2. Is there consistency?
i think the 'numeraseregions=0' and 'numeraseregions=1' is the same case.

For the NOR, there are maybe several erase regions, such as region A and B.
A is erased by the unit of 4K size, while B is erased by the unit of 64K.
Please correct me if i am wrong.

In actually, the UBI is cheated by the MTD code.

please see the allocate_partition().
---------------------------------------------------------------
	if (master->numeraseregions > 1) {
		/* Deal with variable erase size stuff */
		int i, max = master->numeraseregions;
		u64 end = slave->offset + slave->mtd.size;
		struct mtd_erase_region_info *regions = master->eraseregions;

		/* Find the first erase regions which is part of this
		 * partition. */
		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
			;
		/* The loop searched for the region _behind_ the first one */
		if (i > 0)
			i--;

		/* Pick biggest erasesize */
		for (; i < max && regions[i].offset < end; i++) {
			if (slave->mtd.erasesize < regions[i].erasesize) {
				slave->mtd.erasesize = regions[i].erasesize;
			}
		}
		BUG_ON(slave->mtd.erasesize == 0);
	} else {
		/* Single erase size */
		slave->mtd.erasesize = master->erasesize;
	}
---------------------------------------------------------------

If we set a slave partition, the slave->numeraseregions is 0 which makes the
UBI run well. As you see, the UBI is cheated in this case: 
   we do not assign any value to the slave partition's numeraseregions.

But if we do not have any _slave_ partitions, we will only have one master partition.
and the numeraseregions is kept. this is the case i meet.

> 
> E.g., if 'numeraseregions=1' should there be non-NULL
> 'mtd->eraseregions'? What UBI should do with that then?
> 
> I am fine to apply your patch, but I would like to understand the whole
> 'erase regions' thing - what is this, what exactly are the semantics,
> how UBI should use them, etc.
> 
> So far, for me 'numeraseregions=0' means there is no erase regions, and
> this is what all drivers UBI has been working so far have.
> 
> I have no idea what are 'numeraseregions=1' beats, and how to deal with
For the parallel NOR, the numeraseregions maybe 1 which means there is only
one erase region.  

thanks
Huang Shijie
> them.
> 
> Ideally, I'd love to see a repsons to this e-mail like this:
> 
> 
> From: Huang Shijie <b32955@freescale.com>, 
> Subject: mtd-www: document erase regions
> 
> This patch is against the mtd-www project and it adds a piece of
> documentation about MTD erase regions.
> 
> 
> :-)
> 
> Thanks!
> 
> -- 
> Best Regards,
> Artem Bityutskiy
> 
> 
> 
