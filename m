Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNYP6-0008BE-1s
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 04:05:24 +0000
Received: by mail-pf0-x22d.google.com with SMTP id e65so75330863pfe.0
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2016 20:05:03 -0800 (PST)
Date: Sun, 24 Jan 2016 20:04:59 -0800
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
Message-ID: <20160125040459.GA4386@localhost>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
 <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.00.1601240345260.5958@tp.orcam.me.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 24, 2016 at 08:17:37PM +0000, Maciej W. Rozycki wrote:
> On Sun, 17 Jan 2016, Rafał Miłecki wrote:
[...]

> > diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
> > index 347bb83..84f8fae 100644
> > --- a/drivers/mtd/devices/bcm47xxsflash.c
> > +++ b/drivers/mtd/devices/bcm47xxsflash.c
> > @@ -275,15 +275,33 @@ static void bcm47xxsflash_bcma_cc_write(struct bcm47xxsflash *b47s, u16 offset,
> >  
> >  static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
> >  {
> > -	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
> > +	struct device *dev = &pdev->dev;
> > +	struct bcma_sflash *sflash = dev_get_platdata(dev);
> >  	struct bcm47xxsflash *b47s;
> > +	struct resource *res;
> >  	int err;
> >  
> > -	b47s = devm_kzalloc(&pdev->dev, sizeof(*b47s), GFP_KERNEL);
> > +	b47s = devm_kzalloc(dev, sizeof(*b47s), GFP_KERNEL);
> >  	if (!b47s)
> >  		return -ENOMEM;
> >  	sflash->priv = b47s;
> >  
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(dev, "invalid resource\n");
> > +		return -EINVAL;
> > +	}
> > +	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> > +				     res->name)) {
> > +		dev_err(dev, "can't request region for resource %pR\n", res);
> > +		return -EBUSY;
> > +	}
> > +	b47s->window = ioremap_cachable(res->start, resource_size(res));
> > +	if (!b47s->window) {
> > +		dev_err(dev, "ioremap failed for resource %pR\n", res);
> 
>  You need to call `devm_release_mem_region' in this case.

No he doesn't. devm_* functions automatically release their resources
when either the device is removed, or the probe() fails. So the whole
point is that we don't have to explicitly manage the error case.

But...since he's not using a devm_* version of ioremap (there isn't one
for ioremap_cachable()), we actually need to add an iounmap() for the
case where mtd_device_parse_register() fails. If we fix that one, I can
apply this.

> > +		return -ENOMEM;
> > +	}
> > +
> >  	b47s->bcma_cc = container_of(sflash, struct bcma_drv_cc, sflash);
> >  	b47s->cc_read = bcm47xxsflash_bcma_cc_read;
> >  	b47s->cc_write = bcm47xxsflash_bcma_cc_write;
> 
>  LGTM otherwise.

Thanks for the review!

Brian
