Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRxY1-00080R-JA
 for linux-mtd@lists.infradead.org; Sat, 06 Feb 2016 07:44:50 +0000
From: Marek Vasut <marex@denx.de>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Sat, 6 Feb 2016 08:42:07 +0100
Cc: Vignesh R <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602041225.11679.marex@denx.de> <56B38488.2000502@opensource.altera.com>
In-Reply-To: <56B38488.2000502@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201602060842.07120.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, February 04, 2016 at 06:04:08 PM, Dinh Nguyen wrote:
> On 02/04/2016 05:25 AM, Marek Vasut wrote:
> > On Thursday, February 04, 2016 at 08:38:47 AM, Vignesh R wrote:
> >> On 02/02/2016 02:43 AM, Marek Vasut wrote:
> >>> On Monday, February 01, 2016 at 10:03:35 PM, Brian Norris wrote:
> >>>> On Wed, Jan 13, 2016 at 03:39:17AM +0100, Marek Vasut wrote:
> >>>>> On Wednesday, January 13, 2016 at 03:26:08 AM, Rob Herring wrote:
> >>>>>> On Mon, Jan 11, 2016 at 05:34:45AM +0100, Marek Vasut wrote:
> >> [...]
> >> 
> >>>>> All these SoCs should be capable of tweaking the block to fit their
> >>>>> needs by just the DT properties. I believe they differ only in the
> >>>>> FIFO depth and sometimes someone is greedy and uses 4:16 CS
> >>>>> multiplexer, which is an external passive component, but that's all.
> >>>>> 
> >>>>> Would we need soc-specific compatible strings if this is the case?
> >>>> 
> >>>> It's nice when most things can be supported with a small set of DT
> >>>> properties, as you've done. But IUIC, I think it's usually good
> >>>> practice to define and use SoC-specific (or maybe SoC family)
> >>>> compatible strings in the docs and DTS files, in addition to the
> >>>> generic one, in case there are future quirks that need to be handled.
> >>>> Note that you don't actually have to use these in the driver yet, but
> >>>> it's good to have a definition.
> >>>> 
> >>>> So you can, today, have:
> >>>> 	foo@xxxx {
> >>>> 	
> >>>> 		compatible = "ti,baz-12345", "cdns,qspi-nor";
> >>>> 		...
> >>>> 	
> >>>> 	};
> >>>> 
> >>>> And we have the option to pick up "ti,baz-12345" in the Linux driver
> >>>> *if needed.*
> >> 
> >> The support for TI SoC that has this IP is not in upstream yet. I will
> >> 
> >> add TI-specific compatible later. It will be:
> >> 	foo@xxxx {
> >> 	
> >> 		compatible = "ti,k2g-qspi", "cdns,qspi-nor";
> >> 		
> >>  		...
> >>  	
> >>  	};
> > 
> > Do you expect any specifics which cannot be handled by the current
> > bindings btw? In my socfpga case, the compatible strings will be
> > probably:
> > 
> > "altr,socfpga-gen5-qspi"
> > 
> > Dinh, Graham, do you agree with this or should we use something else ?
> 
> I agree.

Thanks

Best regards,
Marek Vasut
