Received: from mail-sn1nam01on0045.outbound.protection.outlook.com
 ([104.47.32.45] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csyhT-0000XQ-1V
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 21:30:49 +0000
Date: Tue, 28 Mar 2017 23:30:13 +0200
From: Jan Glauber <jan.glauber@caviumnetworks.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
Message-ID: <20170328213013.GA2972@hardcore>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-2-jglauber@cavium.com>
 <20170328222035.29f4ed31@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328222035.29f4ed31@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 28, 2017 at 10:20:35PM +0200, Boris Brezillon wrote:
> Hi Jan,
> 
> On Mon, 27 Mar 2017 18:05:23 +0200
> Jan Glauber <jglauber@cavium.com> wrote:
> 
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
> 
> Why do you need a compatible here? All sub-nodes should be representing
> NAND devices connected to the NAND controller. If you need an extra
> subnode to represent something that is not a NAND device, then it should
> not have a reg property, so testing if reg is present to detect if the
> subnode is reprensenting a NAND device should be enough.
> 
> Am I missing something?

Hi Boris,

You're right. We don't need or check this compatible. The chip type
which would make more sense than what I used above is detected via ONFI,
so I can just remove the compatible string.

> > +- reg:			a single integer representing the chip-select number
> > +- nand-ecc-mode:	see nand.txt
> > +
> > +Example:
> > +
> > +nfc: nand@b,0 {
> 
>         ^ nand-controller@xxx

OK.

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
