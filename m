Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRYpr-0002wH-2G
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 04:49:20 +0000
From: Marek Vasut <marex@denx.de>
To: vikas <vikas.manocha@st.com>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Tue, 18 Aug 2015 06:47:30 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D29A0B.20408@st.com>
In-Reply-To: <55D29A0B.20408@st.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508180647.30119.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 18, 2015 at 04:35:55 AM, vikas wrote:
> Hi Marek,
> 
> On 08/13/2015 08:28 PM, Marek Vasut wrote:
> > From: Graham Moore <grmoore@opensource.altera.com>
> > 
> > Add binding document for the Cadence QSPI controller.
> > 
> > Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Alan Tull <atull@opensource.altera.com>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> > Cc: Graham Moore <grmoore@opensource.altera.com>
> > Cc: Vikas MANOCHA <vikas.manocha@st.com>
> > Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> > Cc: devicetree@vger.kernel.org
> > ---
> > 
> >  .../devicetree/bindings/mtd/cadence_quadspi.txt    | 50
> >  ++++++++++++++++++++++ 1 file changed, 50 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> > 
> > V2: Add cdns prefix to driver-specific bindings.
> > V3: Use existing property "is-decoded-cs" instead of creating a
> > 
> >     duplicate, "ext-decoder". Timing parameters are in nanoseconds,
> >     not master reference clocks. Remove bus-num completely.
> > 
> > V4: Add new properties fifo-width and trigger-address
> > V7: - Prefix all of the Cadence-specific properties with cdns prefix,
> > 
> >       those are in particular "cdns,is-decoded-cs", "cdns,fifo-depth",
> >       "cdns,fifo-width", "cdns,trigger-address".
> >     
> >     - Drop bogus properties which were not used and were incorrect.
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> > b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt new file
> > mode 100644
> > index 0000000..ebaf1fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/cadence_quadspi.txt
> > @@ -0,0 +1,50 @@
> > +* Cadence Quad SPI controller
> > +
> > +Required properties:
> > +- compatible : Should be "cdns,qspi-nor".
> > +- reg : Contains two entries, each of which is a tuple consisting of a
> > +	physical address and length.  The first entry is the address and
> > +	length of the controller register set.  The second entry is the
> > +	address and length of the QSPI Controller data area.
> 
> "Controller data area", i think it means mapped NOR Flash address ?

Probably ; Graham ?

> If yes, it would be more clear with "Physical base address & size of NOR
> Flash".

This is the Direct mode thing, correct ? We don't support this, so I think
we should drop this bit altogether and keep only one single address in this
field.

> > +- interrupts : Unit interrupt specifier for the controller interrupt.
> > +- clocks : phandle to the Quad SPI clock.
> > +- cdns,fifo-depth : Size of the data FIFO in words.
> 
> It actually is sram-depth, better would be "sram-depth" to avoid confusion.

Is there any documentation for this piece to which you can point me ?

> > +- cdns,fifo-width: Bus width of the data FIFO in bytes.
> > +- cdns,trigger-address : 32-bit indirect AHB trigger address.
> 
> we might make trigger-address also part of property "reg".

No, we cannot, it's not part of the controller's base address, is it ?

> > +
> > +Optional properties:
> > +- cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
> 
> Not clear about the usage of decoder, if it does not make sense we might
> remove it from driver.

Graham ? SoCFPGA uses this decoded-cs thing, so we absolutely can not remove
it from the driver.

> > +Optional subnodes:
> I think flash subnode is mandatory.

You can have a controller with no SPI NORs on it.
