Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC3oB-0003J2-E7
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 08:30:29 +0000
Received: by mail-pb0-f42.google.com with SMTP id un15so141447pbc.29
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2013 01:30:03 -0700 (PDT)
Date: Wed, 21 Aug 2013 01:30:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RESEND][PATCH] mtd: chips: Add support for PMC SPI Flash chips
 in m25p80.c
Message-ID: <20130821083000.GD31788@brian-ubuntu>
References: <51E3CB64.4080107@wanadoo.fr> <201308210941.38483.marex@denx.de>
 <20130821075903.GC31788@brian-ubuntu>
 <201308211007.18051.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201308211007.18051.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Michel Stempin <michel.stempin@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 21, 2013 at 10:07:17AM +0200, Marek Vasut wrote:
> > On Wed, Aug 21, 2013 at 09:41:38AM +0200, Marek Vasut wrote:
> > > > + Marek, since he's been reviewing (with dismay?) the increase in macro
> > > > flags in this driver. If there are any objections, I can amend/drop the
> > > > patch.
> > > 
> > > Hmmm ... this SECT_4K_PMC seems too combined to me. Why don't we use the
> > > SECT_4K flag and another flag to indicate it's a PMC part? Even better,
> > > I recall you can
> > 
> > Separating manufacturer from SECT_4K sounds good, but it really doesn't
> > buy us much. See my next comments.
> 
> I see, that's really bad news. Thanks for the explanation!
> 
> I guess there really is nothing much we can do about such parts. But then if we 
> take device tree probe into consideration, we might actually want to match the 
> part name to discern the PMS device. Or am I talking complete nonsense?

I don't think the device tree probe really gives us anything different
than the platform_device probe (a non-JEDEC device can be matched via
device-tree "compatible" property or via platform_device "name"
property, I think?). So in either case, are you suggesting a string
comparison for "pm25" on the spi_device_id.name field? Seems a bit
like nonsense :)

Additionally, this still doesn't solve the problem that the old PMC
chips need the special opcode, but the newer one doesn't.

Brian
