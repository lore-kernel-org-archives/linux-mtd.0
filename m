Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQLdg-0005pB-3u
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 21:04:00 +0000
Received: by mail-pa0-x232.google.com with SMTP id yy13so87944907pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 13:03:38 -0800 (PST)
Date: Mon, 1 Feb 2016 13:03:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 "R, Vignesh" <vigneshr@ti.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Message-ID: <20160201210335.GM19540@google.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <20160113022608.GA17483@rob-hp-laptop>
 <201601130339.17520.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201601130339.17520.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 03:39:17AM +0100, Marek Vasut wrote:
> On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
> > On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> > > @@ -0,0 +1,56 @@
> > > +* Cadence Quad SPI controller
> > > +
> > > +Required properties:
> > > +- compatible : Should be "cdns,qspi-nor".
> > 
> > Fine, but I expect to see SOCs using this block add their own compatible
> > strings. It wouldn't surprise me that we already have some using this
> > block.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> I finally got an Ack on this, I am so happy :-)
> 
> As for the SoCs, there is Altera SoCFPGA Gen 5 and Gen 10 which uses this.
> Then there is some TI SoC, but I don't know the model. Vignesh (on CC) would.
> Then there is some ST SoC, but I have no idea what that's all about, sorry.
> 
> All these SoCs should be capable of tweaking the block to fit their needs
> by just the DT properties. I believe they differ only in the FIFO depth and
> sometimes someone is greedy and uses 4:16 CS multiplexer, which is an external
> passive component, but that's all.
> 
> Would we need soc-specific compatible strings if this is the case?

It's nice when most things can be supported with a small set of DT
properties, as you've done. But IUIC, I think it's usually good practice
to define and use SoC-specific (or maybe SoC family) compatible strings
in the docs and DTS files, in addition to the generic one, in case there
are future quirks that need to be handled. Note that you don't actually
have to use these in the driver yet, but it's good to have a definition.
So you can, today, have:

	foo@xxxx {
		compatible = "ti,baz-12345", "cdns,qspi-nor";
		...
	};

And we have the option to pick up "ti,baz-12345" in the Linux driver *if
needed.*

Brian
