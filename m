Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeAV0-00046b-Nl
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 21:18:51 +0000
Date: Wed, 6 Nov 2013 18:18:34 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 0/1] Fix OMAP2 NAND ONFI device detection
Message-ID: <20131106211833.GB12624@localhost>
References: <1383126788-27426-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131030191414.GA16668@norris.computersforpeace.net>
 <20980858CB6D3A4BAE95CA194937D5E73EA2D41D@DBDE04.ent.ti.com>
 <20131030231956.GA2489@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA31B19@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA31B19@DBDE04.ent.ti.com>
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 06, 2013 at 08:54:56PM +0000, Gupta, Pekon wrote:
> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> > > On Wed, Oct 30, 2013 at 09:18:53PM +0000, Gupta, Pekon wrote:
> > > >
> > > > I'm not sure, of course, but I don't see why not. It's more likely to
> > > > break for x16 than it is for x8.
> > > >
> > > Another question here is ..
> > > The above patch assumes that user has configured GPMC bus-width
> > > correctly, so if user is already providing GPMC bus-width information
> > > via DT, then do we really need to detect NAND device bus-width again
> > > using NAND_BUSWIDTH_AUTO ?
> > >
> > 
> > Hm.. I think you're forgetting the original motivation for this patch,
> > which was initially explained by you :-) The problem is ONFI doesn't work
> > in 16-bit mode.
> > 
> > Let me clarify. Since GPMC and NAND widths *must* match (otherwise, it
> > wouldn't make much sense, right?) we don't really need to autodetect the
> > NAND width.
> > 
> > However, since ONFI doesn't work in 16-bit mode, we would have to do
> > something like this (untested pseudo code):
> > 
> >   nand_scan_ident(...);
> > 
> >   if (platform_data->devsize == 16)
> >   	nand_chip->options |= NAND_BUSWIDTH_16;
> > 
> > And in some cases we might even get away with such solution. However,
> > we can't guarantee nand_scan_ident() doesn't need to swith to 16-bit mode
> > inside to perform other commands (maybe some ONFI extended parameter
> > page).
> > 
> > Therefore, and given the width can be autodetected in any case (array
> > or ONFI based carry such information) it's much cleaner to simply do:
> > 
> >   nand_chip->options |= NAND_BUSWIDTH_AUTOMAGIC;
> >   nand_scan_ident(...);
> > 
> > See? Much cleaner, no?
> > 
> but still dependent on DT property for GPMC configurations...
> I preferred NAND bus-width detection to be completely independent
> of 'any' DT property.
> 

I think we're still mixing GPMC and NAND, and I don't think it's sane.

> > And remember: the fact that we must know the device width to configure
> > the GPMC correctly (which being a hardware parameter belongs to the DT)
> > is OMAP specific. Other SoCs might not have such memory controller
> > and thus won't need such knowledge before hand, although that sounds
> > unlikely to me.
> > 
> > The outcome of this discussion seems to be that no driver should ever
> > need to specify the 'nand-bus-width' DT property, as Brian
> > previously suggested, right?
> > 
> Right.. And this is where I'm suggesting that in-order to completely
> eliminate the dependency on 'nand-bus-width' DT property, you need
> to also update GPMC driver, so that its registers can be re-configured with
> correct NAND bus-width after nand_scan_ident().
> 


Well, as I said: I don't think there's any technical reason why you
can't just export a GPMC function to re-configure it from the NAND
driver. I just think it's ugly, and not useful.

So, I think you (or me, or anybody else) can push an RFC/PATCH to see
how ugly would that really be. Maybe it's not so bad.

But: on the other hand, I'd really like you to convince me as to
why is it so bad to require the DTB to have the proper GPMC bus width.

Once again:
1. the NAND devices aren't hot-pluggable
2. the "user" (who is actually an engineer, not some regular dummy user)
knows perfectly well the width of the device.

What's the problem with describing the hardware in the DT and saving us
lots of runtime re-configuration trouble?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
