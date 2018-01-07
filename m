Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYI9e-0003fL-En
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 21:06:56 +0000
Date: Sun, 7 Jan 2018 22:06:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Anthony
 Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/3] spi-nor: intel-spi: Explicitly mark the driver as
 dangerous in Kconfig
Message-ID: <20180107220631.73f303b6@bbrezillon>
In-Reply-To: <22d53b77-7c57-e86b-e8f5-465513382647@wedev4u.fr>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
 <20180104090744.67654-2-mika.westerberg@linux.intel.com>
 <22d53b77-7c57-e86b-e8f5-465513382647@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 7 Jan 2018 21:32:46 +0100
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:

> Hi Mika,
>=20
> Le 04/01/2018 =C3=A0 10:07, Mika Westerberg a =C3=A9crit=C2=A0:
> > The driver is not meant for normal users at all but instead such users
> > who really know what they are doing and are able to build their own
> > kernel to enable it. Mark both driver Kconfig entries as dangerous to
> > make sure the driver is not accidentally enabled without understanding
> > possible issues in doing so.
> >=20
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index 89da88e59121..f480b227a6b8 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -90,7 +90,7 @@ config SPI_INTEL_SPI
> >  	tristate
> > =20
> >  config SPI_INTEL_SPI_PCI
> > -	tristate "Intel PCH/PCU SPI flash PCI driver"
> > +	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)" =20
>=20
> I guess it might be even better and safer to add "default n" too, don't
> you agree? Adding only the "DANGEROUS" word would not prevent build
> scripts to select this driver when creating a kernel config from scratch.

How about adding

	depends on EXPERT

?

>=20
> Best regards,
>=20
> Cyrille
>=20
> >  	depends on X86 && PCI
> >  	select SPI_INTEL_SPI
> >  	help
> > @@ -106,7 +106,7 @@ config SPI_INTEL_SPI_PCI
> >  	  will be called intel-spi-pci.
> > =20
> >  config SPI_INTEL_SPI_PLATFORM
> > -	tristate "Intel PCH/PCU SPI flash platform driver"
> > +	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
> >  	depends on X86
> >  	select SPI_INTEL_SPI
> >  	help
> >  =20
>=20
