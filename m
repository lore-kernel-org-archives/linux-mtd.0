Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QmACM-0001zu-CQ
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2011 19:55:19 +0000
Received: by wwf22 with SMTP id 22so1235673wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jul 2011 12:55:16 -0700 (PDT)
Date: Wed, 27 Jul 2011 20:55:12 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
Message-ID: <20110727195512.GC3001@gallagher>
References: <1311775410-5158-1-git-send-email-jamie@jamieiles.com>
	<20110727144501.7e0420cd@schlenkerla.am.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110727144501.7e0420cd@schlenkerla.am.freescale.net>
Cc: Jamie Iles <jamie@jamieiles.com>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hmm, get_maintainer.pl got Artem's address wrong (old Nokia address) for 
gpio-nand.c so correct one on CC now!

On Wed, Jul 27, 2011 at 02:45:01PM -0500, Scott Wood wrote:
> On Wed, 27 Jul 2011 15:03:30 +0100
> Jamie Iles <jamie@jamieiles.com> wrote:
> 
> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > new file mode 100644
> > index 0000000..98cb152
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/gpio-nand.txt
> > @@ -0,0 +1,43 @@
> > +GPIO assisted NAND flash
> > +
> > +Required properties:
> > +- compatible : "gpio-nand"
> > +- reg : should specify localbus chip select and size used for the chip.  For
> > +  ARM platforms where a dummy read is needed to provide synchronisation with
> > +  regards to bus reordering, an optional second resource describes the
> > +  location to read from.
> 
> I don't see how a pure "gpio nand" device would have any memory mapped
> I/O.  I think you need a more specific compatible for this.

OK, fair point.  I'm not sure what a better name would be though, maybe 
gpio-assisted-nand?

> > +Optional properties:
> > +- bank-width : Width (in bytes) of the bank.  Equal to the device width times
> > +  the number of interleaved chips.
> 
> Interleaved NAND chips?  Is that actually done?

Doh, that shouldn't read like that.  It's really just the bank width.

> > +Examples:
> > +
> > +gpio-nand@1,0 {
> > +	compatible = "gpio-nand";
> > +	reg = <1 0x0000 0x1000>;
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	gpios = <&banka 1 0	/* rdy */
> > +		 &banka 2 0 	/* nce */
> > +		 &banka 3 0 	/* ale */
> > +		 &banka 4 0 	/* cle */
> > +		 0		/* nwp */>;
> > +
> > +	flash {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "...";
> > +
> > +		partition@0 {
> > +			...
> > +		};
> > +	};
> > +};
> 
> Here you have a separate flash node underneath the gpio-nand node, but
> earlier in the patch comment you show the partitions being directly under
> gpio-nand, and from a quick glance it appears the latter is what the code
> supports.

Yes, that's definitely wrong!  The partitions should be directly under the 
nand controller node.

Thanks for the review!

Jamie
