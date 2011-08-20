Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QufCH-0008KW-G8
	for linux-mtd@lists.infradead.org; Sat, 20 Aug 2011 06:38:22 +0000
Received: by wwj26 with SMTP id 26so983029wwj.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 23:38:18 -0700 (PDT)
Date: Sat, 20 Aug 2011 07:38:16 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Message-ID: <20110820063816.GA18892@gallagher>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
	<1313418543.2600.2.camel@sauron>
	<20110815143816.GH2636@pulham.picochip.com>
	<1313419536.2600.7.camel@sauron>
	<20110815152447.GI2636@pulham.picochip.com>
	<1313811552.4475.10.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313811552.4475.10.camel@koala>
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

On Sat, Aug 20, 2011 at 06:39:10AM +0300, Artem Bityutskiy wrote:
> On Mon, 2011-08-15 at 16:24 +0100, Jamie Iles wrote:
> > From: Jamie Iles <jamie@jamieiles.com>
> > Subject: [PATCH] mtd: gpio-nand: add device tree bindings
> > 
> > Add device tree bindings so that the gpio-nand driver may be
> > instantiated from the device tree.  This also allows the partitions
> > to be specified in the device tree.
> > 
> > v5:	- fold dt config helpers into a single gpio_nand_of_get_config()
> > v4:	- get io sync address from gpio-control-nand,io-sync-reg
> > 	  property rather than a resource
> > 	- clarified a few details in the binding
> > v3:	- remove redundant cast and a couple of whitespace/naming
> > 	  changes
> > v2:	- add CONFIG_OF guards for non-dt platforms
> > 	- compatible becomes gpio-control-nand
> > 	- clarify some binding details
> > 
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Artem Bityutskiy <dedekind1@gmail.com>
> > Cc: Scott Wood <scottwood@freescale.com>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> 
> Pushed this patch to l2-mtd-2.6.git, thanks.
> 
> P.S. probably it should contain some reviewed-by tags? I can always add
> them, though, if needed.

This patch needs of_read_property_u64() from 
http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg05973.html
which hasn't been merged yet for the CONFIG_OF case so I'm not sure how this 
should be handled.

Thanks,

Jamie
