Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNmqw-0007sD-BH
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 19:31:06 +0000
Received: by mail-pa0-x241.google.com with SMTP id gi1so6990083pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 11:30:46 -0800 (PST)
Date: Mon, 25 Jan 2016 11:30:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use ioremap_cachable() instead of
 KSEG0ADDR()
Message-ID: <20160125193042.GA47436@google.com>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
 <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
 <20160125040459.GA4386@localhost>
 <alpine.DEB.2.00.1601250414200.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1601250414200.5958@tp.orcam.me.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 25, 2016 at 07:15:49PM +0000, Maciej W. Rozycki wrote:
> On Mon, 25 Jan 2016, Brian Norris wrote:
> 
> > > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +	if (!res) {
> > > > +		dev_err(dev, "invalid resource\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> > > > +				     res->name)) {
> > > > +		dev_err(dev, "can't request region for resource %pR\n", res);
> > > > +		return -EBUSY;
> > > > +	}
> > > > +	b47s->window = ioremap_cachable(res->start, resource_size(res));
> > > > +	if (!b47s->window) {
> > > > +		dev_err(dev, "ioremap failed for resource %pR\n", res);
> > > 
> > >  You need to call `devm_release_mem_region' in this case.
> > 
> > No he doesn't. devm_* functions automatically release their resources
> > when either the device is removed, or the probe() fails. So the whole
> > point is that we don't have to explicitly manage the error case.
> 
>  Why does `devm_ioremap_resource' (in lib/devres.c) do that manually then?
> 
> 	dest_ptr = devm_ioremap(dev, res->start, size);
> 	if (!dest_ptr) {
> 		dev_err(dev, "ioremap failed for resource %pR\n", res);
> 		devm_release_mem_region(dev, res->start, size);
> 		dest_ptr = IOMEM_ERR_PTR(-ENOMEM);
> 	}
> 
> Is this an oversight or was it a deliberate design decision?

I didn't design it, but I suspect it's because the API for
devm_ioremap_resource() doesn't assume that a failed
devm_ioremap_resource() means probe() will exit. Perhaps the driver will
have some alternative action instead. It's still good to release the
resources implicitly requested by devm_ioremap_resource().

The difference for us is that we *know* we're exiting the probe(), so we
can rely on the automatic cleanup.

> > But...since he's not using a devm_* version of ioremap (there isn't one
> > for ioremap_cachable()), we actually need to add an iounmap() for the
> > case where mtd_device_parse_register() fails. If we fix that one, I can
> > apply this.
> 
>  As from 4.5-rc1 we now have `ioremap_cache' available for MIPS as well 
> (thanks, Ralf, for a quick action on that!), so you can use that instead 
> to make your code generic.

OK, but there's still not a devm_* version of ioremap_cache(), so we'd still need to do the iounmap() ourselves.

Also, it looks like kernel/memremap.c is suggesting we use memremap()
instead of ioremap_cache()... But I'm not sure if that's really what we
want.

Brian
