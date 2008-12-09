Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LA0hC-0005PK-W1
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2008 11:24:07 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mB9BNQit018068
	for <linux-mtd@lists.infradead.org>; Tue, 9 Dec 2008 06:23:26 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mB9BO6rQ196626
	for <linux-mtd@lists.infradead.org>; Tue, 9 Dec 2008 06:24:06 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mB9BO5UZ018744
	for <linux-mtd@lists.infradead.org>; Tue, 9 Dec 2008 06:24:06 -0500
Date: Tue, 9 Dec 2008 06:24:01 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081209062401.502f2c48@zod.rchland.ibm.com>
In-Reply-To: <200812090710.27781.sr@denx.de>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
	<20081208193446.37e27e26@lappy.seanm.ca>
	<200812090710.27781.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org, Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 9 Dec 2008 07:10:27 +0100
Stefan Roese <sr@denx.de> wrote:

> On Tuesday 09 December 2008, Sean MacLennan wrote:
> > On Thu, 4 Dec 2008 09:01:07 -0500
> >
> > "Josh Boyer" <jwboyer@linux.vnet.ibm.com> wrote:
> > > In addition to an example DTS patch (probably to warp itself), could
> > > you briefly write up a binding and put it in
> > > Documentation/powerpc/dts-bindings/amcc (or similar)?  Also please CC
> > > the devicetree-discuss list on that part.
> >
> > Here is a start at the doc. I have sent it as a patch, but could just
> > as easily send raw text.
> >
> > The example comes from the warp dts, just with less partitions, so I
> > have not included a warp dts patch here.
> >
> > Cheers,
> >    Sean
> >
> > diff --git a/Documentation/powerpc/dts-bindings/amcc/ndfc.txt
> > b/Documentation/powerpc/dts-bindings/amcc/ndfc.txt new file mode 100644
> > index 0000000..668f4a9
> > --- /dev/null
> > +++ b/Documentation/powerpc/dts-bindings/amcc/ndfc.txt
> > @@ -0,0 +1,31 @@
> > +AMCC NDFC (NanD Flash Controller)
> > +
> > +Required properties:
> > +- compatible : "amcc,ndfc".
> 
> The 4xx NAND controller was first implemented on the 440EP, IIRC. So I'm 
> pretty sure that this controller is an IBM core and not am AMCC core. So this 
> should be "ibm,ndfc".

That is true.  It's an IBM blue logic core.
 
> And with this change it makes no sense to put this file "ndfc.txt" into the 
> amcc directory.
> 
> Josh, where should this go then?

I declare it to be: dts-bindings/4xx/

mostly because I don't want the bindings scattered across two
directories simply because of the timeframe they showed up in the
marketplace.

If there are better ideas, I'm all ears.

josh
