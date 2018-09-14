Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g0oNB-0001fV-IR
 for linux-mtd@lists.infradead.org; Fri, 14 Sep 2018 13:43:03 +0000
Date: Fri, 14 Sep 2018 15:42:46 +0200
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: Rob Herring <robh+dt@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek =?utf-8?B?VmHFoXV0?= <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>,
 =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] mtd: mtdconcat: add dt driver for concat devices
Message-ID: <20180914134246.GB5913@dellux>
References: <20180908131345.8145-1-kernel@nospam.obeliks.de>
 <20180908131345.8145-4-kernel@nospam.obeliks.de>
 <CAL_JsqL+CMzkyeHLxa+6xf0FkM3mSPiGvoMrRoVV-FS1Q7SQsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqL+CMzkyeHLxa+6xf0FkM3mSPiGvoMrRoVV-FS1Q7SQsA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rob,

sorry it took me so long to reply, I had to set up mutt first ;)

On Mon, Sep 10, 2018 at 04:47:22PM -0500, Rob Herring wrote:
> On Sat, Sep 8, 2018 at 8:20 AM Bernhard Frauendienst
> <kernel@nospam.obeliks.de> wrote:
> >
> > Some mtd drivers like physmap variants have support for concatenating
> > multiple mtd devices, but there is no generic way to define such a
> > concat device from within the device tree.
> 
> That is the generic way, but I suppose that only works for parallel
> memory mapped devices. So is it just spi-nor that you need to support?

I'm no expert in this domain, or regarding OpenWRT, but as far as I can
tell this only concerns spi-nor devices. It definitely does in my
specific use-case.

> Can we just make reg take multiple chip selects just like the existing
> support takes multiple reg entries?

That sounds like an interesting idea, but I'm afraid it's not a trivial
change, as far as I can tell from looking at spi.c. 

The 'reg' property is currently read in of_spi_parse_dt which gets
passed the spi device created in of_register_spi_device. The latter
would have to create multiple devices from a single OF node, and pass
the chipselect value to of_spi_parse_dt, which would have to parse the
same node multiple times, which feels a bit strange. To make things
worse, of_register_spi_device returns the created device, although that
value seems unused in the current tree (except for error checks).

Am I correct to assume that this change in method signature could be
accteptable since both functions are not exported?

Regards,
Bernhard
