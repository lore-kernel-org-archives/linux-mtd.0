Received: from mail-sn1nam02on0059.outbound.protection.outlook.com
 ([104.47.36.59] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv38V-0006DO-6u
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 14:39:17 +0000
Date: Mon, 3 Apr 2017 16:38:40 +0200
From: Jan Glauber <jan.glauber@caviumnetworks.com>
To: Rob Herring <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
Message-ID: <20170403143840.GA23698@hardcore>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-2-jglauber@cavium.com>
 <20170403132937.z5mxksabo6kmo4jy@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170403132937.z5mxksabo6kmo4jy@rob-hp-laptop>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 03, 2017 at 08:29:37AM -0500, Rob Herring wrote:
> On Mon, Mar 27, 2017 at 06:05:23PM +0200, Jan Glauber wrote:
> > Add device tree binding description for Cavium SOC nand flash controller.
> > 
> > CC: Rob Herring <robh+dt@kernel.org>
> > CC: Mark Rutland <mark.rutland@arm.com>
> > CC: devicetree@vger.kernel.org
> > 
> > Signed-off-by: Jan Glauber <jglauber@cavium.com>
> > ---
> >  .../devicetree/bindings/mtd/cavium_nand.txt        | 32 ++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/cavium_nand.txt b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
> > new file mode 100644
> > index 0000000..4698d1f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
> > @@ -0,0 +1,32 @@
> > +* Cavium NAND controller
> > +
> > +Required properties:
> > +
> > +- compatible:		should be "cavium,cn8xxx-nand"
> 
> Don't use wildcards in compatible strings. For PCI devices, this should 
> be based on the PCI vendor and device IDs.
>

Is there a syntax for compatible PCI devices? I'm afraid I've not seen
this yet, can you give an example?

Most of Cavium's devices are PCI devices, we just added the compatible
as convenience and usually it is not parsed.

thanks,
Jan

> > +- reg:			PCI devfn
> > +- clocks:		must contain system clock
> > +- #address-cells:	<1>
> > +- #size-cells:		<0>
> > +
> > +The nand flash controller may contain up to 8 subnodes representing
> > +NAND flash chips. Their properties are as follows.
> > +
> > +Required properties:
> > +- compatible:		should be "cavium,nandcs"
> > +- reg:			a single integer representing the chip-select number
> > +- nand-ecc-mode:	see nand.txt
> > +
> > +Example:
> > +
> > +nfc: nand@b,0 {
> > +	compatible = "cavium,cn8xxx-nand";
> > +	reg = <0x5800 0 0 0 0>;
> > +	clocks = <&sclk>;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	nand@1 {
> > +		compatible = "cavium,nandcs";
> > +		reg = <1>;
> > +		nand-ecc-mode = "on-die";
> > +};
> > -- 
> > 2.9.0.rc0.21.g7777322
> > 
