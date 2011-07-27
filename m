Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmBEg-0002an-5T
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 21:01:47 +0000
Date: Wed, 27 Jul 2011 16:01:37 -0500
From: Scott Wood <scottwood@freescale.com>
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Message-ID: <20110727160137.4cb98970@schlenkerla.am.freescale.net>
In-Reply-To: <20110727195512.GC3001@gallagher>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
	<20110727144501.7e0420cd@schlenkerla.am.freescale.net>
	<20110727195512.GC3001@gallagher>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jul 2011 20:55:12 +0100
Jamie Iles <jamie@jamieiles.com> wrote:

> Hmm, get_maintainer.pl got Artem's address wrong (old Nokia address) for 
> gpio-nand.c so correct one on CC now!
> 
> On Wed, Jul 27, 2011 at 02:45:01PM -0500, Scott Wood wrote:
> > On Wed, 27 Jul 2011 15:03:30 +0100
> > Jamie Iles <jamie@jamieiles.com> wrote:
> > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/gpio-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > > new file mode 100644
> > > index 0000000..98cb152
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > > @@ -0,0 +1,43 @@
> > > +GPIO assisted NAND flash
> > > +
> > > +Required properties:
> > > +- compatible : "gpio-nand"
> > > +- reg : should specify localbus chip select and size used for the chip.  For
> > > +  ARM platforms where a dummy read is needed to provide synchronisation with
> > > +  regards to bus reordering, an optional second resource describes the
> > > +  location to read from.
> > 
> > I don't see how a pure "gpio nand" device would have any memory mapped
> > I/O.  I think you need a more specific compatible for this.
> 
> OK, fair point.  I'm not sure what a better name would be though, maybe 
> gpio-assisted-nand?

Not sure, but if the name is generic at all the binding should thorougly
describe what is expected of the hardware.

-Scott
