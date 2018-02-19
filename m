Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enofb-00072Y-D5
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 16:52:05 +0000
Date: Mon, 19 Feb 2018 17:51:40 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Peter Pan <peterpansjtu@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Yogesh
 Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar
 <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Extend the framework to generically
 support memory devices
Message-ID: <20180219175140.7ec6f0e1@bbrezillon>
In-Reply-To: <20180219162510.GG32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180219162510.GG32761@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Feb 2018 16:25:10 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Feb 06, 2018 at 12:21:14AM +0100, Boris Brezillon wrote:
> 
> > SPI NAND layer): you can register a SPI NOR device directly from the
> > dedicated SPI memory controller, or it can be registered through the
> > SPI layer if the SPI controller is a generic SPI controller. While
> > the generic SPI controller path works fine, the dedicated SPI NOR
> > controller path brings its own set of issues:  
> 
> > * the SPI bus is not represented in sysfs  
> 
> I'm not sure if this is a big deal or not - at some point it's just an
> implementation detail of the hardware rather than something we're aware
> of or interested in.
> 
> > * because there's no bus, there's no uevent, which means you'll have to
> >   select both the SPI NAND and SPI NOR logic as soon as one driver
> >   supports both interfaces if you don't want to run into loading
> >   dependency issues  
> 
> This is sounding like we want a class (well, virtual bus in the new
> world) for these devices with a SPI based driver sitting on top of that
> for use with genuine SPI controllers.  If the intention is as the
> comments in the code suggested that controllers implementing the memory
> mapping stuff don't use SPI at all then we could have the legacy SPI bus
> support be just another driver for this class.  However when I look at
> what the drivers are actually doing it seems like that's not the case
> and the new API is intended to sit alongside normal SPI support, perhaps
> only implementing certain operations and using regular SPI for others.
> In that case it makes a lot more sense to have this be bolted on the
> side of SPI.

This is a case: most controllers support both regular SPI transfers and
memory-like operations (with some optimizations for memory oriented
operations).

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
