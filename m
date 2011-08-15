Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QsyJ7-0003Ak-6l
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 14:38:25 +0000
Received: by wyh11 with SMTP id 11so4258101wyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 07:38:20 -0700 (PDT)
Date: Mon, 15 Aug 2011 15:38:16 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Message-ID: <20110815143816.GH2636@pulham.picochip.com>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313418543.2600.2.camel@sauron>
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

On Mon, Aug 15, 2011 at 05:28:57PM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-08-09 at 16:12 +0100, Jamie Iles wrote:
> > -	res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> > +	if (!dev->dev.of_node)
> > +		res1 = platform_get_resource(dev, IORESOURCE_MEM, 1);
> > +	else
> > +		res1 = gpio_nand_of_get_io_sync(&dev->dev);
> > +
> >  	if (res1) {
> >  		gpiomtd->io_sync = request_and_remap(res1, 4, "NAND sync", &ret);
> >  		if (!gpiomtd->io_sync) {
> > @@ -257,7 +362,16 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
> >  		}
> >  	}
> >  
> > -	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
> > +	if (dev->dev.of_node)
> > +		kfree(res1);
> > +
> > +	if (dev->dev.platform_data)
> > +		memcpy(&gpiomtd->plat, dev->dev.platform_data,
> > +		       sizeof(gpiomtd->plat));
> > +	else
> > +		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
> > +	if (ret)
> > +		goto err_nce;
> >  
> 
> So with this code you can mix platform data and DT? Say, io_sync may
> come from platform data and the rest from the DT? Is this normal
> practice?

Well you can use platform_data with DT - it's the only way to pass 
function pointers for example, but I'm not convinced it's required in 
this case (there is the adjust_parts callback, but I can't see a user of 
it) so I'd be inclined to change the conditionals to:

	if (!dev->dev.of_node)
		memcpy(&gpiomtd->plat, dev->dev.platform_data, ...);
	else
		gpio_nand_of_get_config(...);

so that we don't use platform_data for the DT case.

Jamie
