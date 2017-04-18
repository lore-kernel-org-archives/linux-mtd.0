Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0bpw-0002g9-3m
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 22:43:05 +0000
Message-ID: <1492555307.25766.95.camel@kernel.crashing.org>
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>, Rob Herring
 <robh+dt@kernel.org>
Date: Wed, 19 Apr 2017 08:41:47 +1000
In-Reply-To: <a99e6d1e-2dd2-5672-3ff5-adaea69bee75@kaod.org>
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
 <6f7f424c-2a3f-4b6d-f7aa-bfae749de0b3@gmail.com>
 <1492206032.25766.7.camel@kernel.crashing.org>
 <26f0d520-bfe3-cc26-d3d5-3185813b7ffb@gmail.com>
 <1492207894.25766.20.camel@kernel.crashing.org>
 <c5d30733-20c8-275a-03b1-9b446b5bcc71@gmail.com>
 <1492209763.25766.27.camel@kernel.crashing.org>
 <a99e6d1e-2dd2-5672-3ff5-adaea69bee75@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-04-18 at 17:46 +0200, Cédric Le Goater wrote:
> On 04/15/2017 12:42 AM, Benjamin Herrenschmidt wrote:
> > On Sat, 2017-04-15 at 00:25 +0200, Marek Vasut wrote:
> > > That sounds like a good option, yes. And if it's just forcing
> > > fixed
> > > speed, that's awesome, but I think there are more values that
> > > might need
> > > to be passed ... I think that's what Cedric can answer.
> > 
> > Yes, fixed and delay. Not a huge deal.
> 
> Do we really need to specify the delays in the DT ? As we loop on 
> the different delay settings, if a setting is bogus, we can just 
> pick the following HCLK divider. No ? I don't think it is worth 
> adding black magic properties like this in the DT. We never had to 
> tune it manually AFAICT and anyway, we can always add that later 
> if needed. 
> 
> So, that would leave two properties :
> 
>   - safe divider for "normal/write/erase" commands
>   - speedy divider for "read" commands

When the properties are present, we don't calibrate. So we need the
delay being specified. There's no "black magic" about it, it's about
specifying the appropriate configuration of the controller for the
given motherboard layout/flashchip/speed.

> If the property is not present, we would keep the low HW default, 
> which is /16. 

No misunderstood. The default is to calibrate. The properties allow you
to specify a fixed speed/delay combination in case the system has been
fully calibrated in the factory.

> If there is such a property, the divider value would be considered 
> as a max. The range should be 1..5. Let's introduce "literal" values 
> like "min" and "max" for 1 and 5 ?  
> 
> Do we care for the other HCLK settings < 5 for which we can not set
> any delay ?  

> > Also a module parameter makes it hard to specify different settings
> > for
> > different instances of the device/flash. IE, there can be multiple
> > flash controllers and each of them can have multiple chip selects.
> > 
> > The DT is the only sane way for that.
> 
> Yes. Can we keep the global module parameter as a global chicken 
> switch to deactivate the algo ? It could be useful, some chips tend
> to freak out when hammered on a bit too much. 

Yes, that's useful for diagnosis when things go wrong.

Cheers,
Ben.

> Thanks,
> 
> C.
> 
> 
> > > > That becomes akin to what we do with Ethernet PHYs for example
> > > > :)
> > > 
> > > Even better, I recall seeing some speed DT props in the SPI
> > > binding
> > > docs, so we already have those in place.
> > 
> > Right though the gate delay is rather IP block specific but that's
> > not a huge issue.
> > 
> > Cheers,
> > Ben.
> > 
