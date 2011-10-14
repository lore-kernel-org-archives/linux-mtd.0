Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REie2-0005yJ-RV
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:21:55 +0000
Received: by wyi11 with SMTP id 11so3776214wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:21:52 -0700 (PDT)
Date: Fri, 14 Oct 2011 15:21:49 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
Message-ID: <20111014142149.GA25079@totoro>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
	<1318600108.12351.130.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318600108.12351.130.camel@sauron>
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

Hi Artem,

On Fri, Oct 14, 2011 at 04:48:20PM +0300, Artem Bityutskiy wrote:
> On Wed, 2011-10-12 at 00:10 +0100, Jamie Iles wrote:
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id gpio_nand_id_table[] = {
> > +	{ .compatible = "gpio-control-nand" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
> ...
> > +#else /* CONFIG_OF */
> ...
> > +#endif /* CONFIG_OF */
> 
> I wonder, why it is either OF of platform data? What if I want my kernel
> to fall-back to platform data if device tree data is absent? What is the
> general policy? Sorry, I am not very well aware of the DT stuff. But off

I think the general policy is that for device tree everything should be 
in the device tree.  There is a mechanism for device tree platforms to 
pass platform data too, but I believe this is more as a tool for 
migrating existing platforms to device tree.

Also, the device tree binding should be well documented - if the device 
is present in the tree it should have all of the required properties.  
If the device isn't there at all then it won't get registered.

> the top of my head, it is logical when things go like this: I have a
> kernel with working platform data, but I can change that dynamically by
> feeding it a device tree configuration. Hmm?

I think in general platform data and device tree should be mutually 
exclusive.

Jamie
