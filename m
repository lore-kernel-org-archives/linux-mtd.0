Received: from dsl-bow-205-233-15-i240-cgy.nucleus.com ([205.233.15.240]
	helo=CGY2000.Interalia.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw3R4-0000fA-Ho
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 18:07:06 +0000
From: Derek Jones <djones@interalia.ca>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1077731948.7826.792.camel@hades.cambridge.redhat.com>
References: <a06002001bc6281361918@[130.161.115.44]>
	 <1077731948.7826.792.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1077732403.2790.16.camel@localhost.localdomain>
Mime-Version: 1.0
Date: 25 Feb 2004 11:06:43 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips -- take 2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2004-02-25 at 10:59, David Woodhouse wrote:
> On Wed, 2004-02-25 at 18:44 +0100, J.D. Bakker wrote:
> > This is the plan; fire at will.
> 
> Why? What'd poor Will do wrong?
> 
> Join us on IRC and tglx can heckle you too :)
> 
> > * Assumption: all devices are the same type and size.
> 
My current non-linux product allows for different NAND sizes to be
populated. I would prefer that support for different sizes be added.

> I think that's acceptable. It's _definitely_ OK on NOR. On NAND we may
> be sharing some control lines between different chips, but I still think
> it's OK and we can deal with that in the board-level driver.
> 
> > * No support (yet) for building a wider data bus through putting 
> > multiple devices in parallel
> 
> I think that's OK too.
> 
> > * All detected devices are concatenated and represented as one large 
> > linear array of pages
> 
> Look at the DiskOnChip Millennium Plus address-mangling code and
> comments above DoC_GetDataOffset().
> 
> If we could support that it would perhaps be useful.
> 
> > * All devices are soldered to a motherboard. We are not interested in 
> > taking devices out of the array.
> 
> Not sure. Look at how the new DiskOnChip driver has to screw around
> before the chip probing, so it can pretend this is true. T'would be nice
> to deal with a sparse array, at least.
> 
> And if you mean hotplug -- think SmartMedia.
> 
> > * No optimizations (yet) wrt accessing device n while device m is 
> > busy. Easier to get working code fast than to get fast code working, 
> > and I don't see a way to take advantage of parallelism without 
> > modifying higher layers
> 
> OK.
> 
> > The general idea is to take a 'global' page_addr and turn it into a 
> > (chip,page) tuple like this:
> > 
> > chip = global_page_addr / pages_per_chip;
> > page = global_page_addr % pages_per_chip;
> > 
> > Does that look sane ?
> 
> I think so. I prefer it to the other.
> 
