Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuWSD-0005ns-6h
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 21:18:13 +0000
Received: by wyh11 with SMTP id 11so2997464wyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 14:18:11 -0700 (PDT)
Date: Fri, 19 Aug 2011 22:18:08 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Message-ID: <20110819211808.GC12654@gallagher>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
	<20110815143816.GH2636@pulham.picochip.com>
	<1313419536.2600.7.camel@sauron>
	<20110815152447.GI2636@pulham.picochip.com>
	<1313783508.4475.8.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313783508.4475.8.camel@koala>
Cc: devicetree-discuss@lists.ozlabs.org,
	Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 19, 2011 at 10:51:46PM +0300, Artem Bityutskiy wrote:
> On Mon, 2011-08-15 at 16:24 +0100, Jamie Iles wrote:
> > @@ -178,7 +249,7 @@ static int __devexit gpio_nand_remove(struct platform_device *dev)
> >  
> >  	nand_release(&gpiomtd->mtd_info);
> >  
> > -	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
> > +	res = gpio_nand_get_io_sync(dev);
> 
> Why do you call 'gpio_nand_get_io_sync(dev)' here, in
> 'gpio_nand_remove()' function? You should have it in gpiomtd->io_sync.
> Right?
>
> If this is the case, then you do not need a separate
> 'gpio_nand_get_io_sync()' function at all, you can make
> 'gpio_nand_get_config()' to fetch the io_sync information from the DT.
> And then you will have one single function which gets data from DT, not
> 2 -> simpler code.
> 
> Do I miss something?

gpiomtd->io_sync is a void __iomem *, but we need a struct resource here 
so that we can do the release_mem_region().  I could store the struct 
resource pointer in gpiomtd rather than calling gpio_nand_get_io_sync() 
twice though, I'm happy to change if you prefer.

Note that for the device tree case, the iosync register isn't in the reg 
property so we can't do platform_get_resource() to get it.  We do this 
because the io_sync address isn't actually a gpio nand resource and 
can't always be expressed as such in the device tree.

Jamie
