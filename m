Received: from mail-bl2on0142.outbound.protection.outlook.com ([65.55.169.142]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPvhB-0004AR-NX
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 16:49:38 +0000
From: Li Frank <Frank.Li@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, Fabio Estevam
 <festevam@gmail.com>
CC: Fabio Estevam <Fabio.Estevam@freescale.com>, Huang Shijie
 <shijie.huang@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Xu Han <han.xu@freescale.com>
Subject: RE: [PATCH] spi-nor: Kconfig: Remove unneeded help message
Date: Thu, 13 Aug 2015 16:49:00 +0000
Message-ID: <SN1PR0301MB16469016E92281F646579FCB827D0@SN1PR0301MB1646.namprd03.prod.outlook.com>
References: <1439378899-5660-1-git-send-email-festevam@gmail.com>
 <20150813031239.GF108786@google.com>
In-Reply-To: <20150813031239.GF108786@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of
> Brian Norris
> Sent: Wednesday, August 12, 2015 10:13 PM
> To: Fabio Estevam
> Cc: Estevam Fabio-R49496; Huang Shijie; linux-mtd@lists.infradead.org; Xu
> Han-B45815
> Subject: Re: [PATCH] spi-nor: Kconfig: Remove unneeded help message
>=20
> On Wed, Aug 12, 2015 at 08:28:19AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> >
> > The "We only connect the NOR to this controller now" phrase is not
> > really useful for a Kconfig help text, so remove it.
> >
> > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> > ---
> >  drivers/mtd/spi-nor/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index 64a4f0e..baa8442 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -26,6 +26,5 @@ config SPI_FSL_QUADSPI
> >  	depends on ARCH_MXC
> >  	help
> >  	  This enables support for the Quad SPI controller in master mode.
> > -	  We only connect the NOR to this controller now.
>=20
> I'm inclined to accept this patch, but I'm curious what the intention for=
 the
> original statement was. Does this mean "this controller could support gen=
eric
> SPI, but this driver only bothers to implement the NOR flash protocol"?

This controller doesn't support generic SPI.=20
Just support connect to SPI NOR flash.

Best regards
Frank Li

>=20
> >
> >  endif # MTD_SPI_NOR
> > --
> > 1.9.1
> >
>=20
> Brian
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
