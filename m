Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJBLa-0002uC-9U
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 02:39:43 +0000
From: Marek Vasut <marex@denx.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Wed, 13 Jan 2016 03:39:17 +0100
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 "R, Vignesh" <vigneshr@ti.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <20160113022608.GA17483@rob-hp-laptop>
In-Reply-To: <20160113022608.GA17483@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201601130339.17520.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
> On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
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
> > Cc: "R, Vignesh" <vigneshr@ti.com>
> > Cc: Yves Vandervennet <yvanderv@opensource.altera.com>
> > Cc: devicetree@vger.kernel.org
> > ---
> > 
> >  .../devicetree/bindings/mtd/cadence-quadspi.txt    | 56
> >  ++++++++++++++++++++++ 1 file changed, 56 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
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
> > V8: Align lines to 80 chars.
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt new file
> > mode 100644
> > index 0000000..f248056
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > @@ -0,0 +1,56 @@
> > +* Cadence Quad SPI controller
> > +
> > +Required properties:
> > +- compatible : Should be "cdns,qspi-nor".
> 
> Fine, but I expect to see SOCs using this block add their own compatible
> strings. It wouldn't surprise me that we already have some using this
> block.
> 
> Acked-by: Rob Herring <robh@kernel.org>

I finally got an Ack on this, I am so happy :-)

As for the SoCs, there is Altera SoCFPGA Gen 5 and Gen 10 which uses this.
Then there is some TI SoC, but I don't know the model. Vignesh (on CC) would.
Then there is some ST SoC, but I have no idea what that's all about, sorry.

All these SoCs should be capable of tweaking the block to fit their needs
by just the DT properties. I believe they differ only in the FIFO depth and
sometimes someone is greedy and uses 4:16 CS multiplexer, which is an external
passive component, but that's all.

Would we need soc-specific compatible strings if this is the case?

Best regards,
Marek Vasut
