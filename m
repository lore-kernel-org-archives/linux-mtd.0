Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYOcH-0005BI-7B
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 04:00:54 +0000
Date: Mon, 8 Jan 2018 06:00:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/3] spi-nor: intel-spi: Explicitly mark the driver as
 dangerous in Kconfig
Message-ID: <20180108040038.GH27654@lahna.fi.intel.com>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <20180104090744.67654-2-mika.westerberg@linux.intel.com>
 <22d53b77-7c57-e86b-e8f5-465513382647@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22d53b77-7c57-e86b-e8f5-465513382647@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 07, 2018 at 09:32:46PM +0100, Cyrille Pitchen wrote:
> Hi Mika,
> 
> Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
> > The driver is not meant for normal users at all but instead such users
> > who really know what they are doing and are able to build their own
> > kernel to enable it. Mark both driver Kconfig entries as dangerous to
> > make sure the driver is not accidentally enabled without understanding
> > possible issues in doing so.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index 89da88e59121..f480b227a6b8 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
> >  	tristate
> >  
> >  config SPI_INTEL_SPI_PCI
> > -	tristate "Intel PCH/PCU SPI flash PCI driver"
> > +	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> 
> I guess it might be even better and safer to add "default n" too, don't
> you agree? Adding only the "DANGEROUS" word would not prevent build
> scripts to select this driver when creating a kernel config from scratch.

But isn't it always "default n" unless otherwise stated?
