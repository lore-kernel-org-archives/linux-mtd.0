Received: from mail-bn1bn0103.outbound.protection.outlook.com
 ([157.56.110.103] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9r5a-00070x-8r
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 09:12:39 +0000
From: Yao Yuan <yao.yuan@freescale.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
CC: Xu Han <han.xu@freescale.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Fri, 18 Dec 2015 09:12:13 +0000
Message-ID: <BLUPR03MB134C01F17B8F52849C4CFD783E10@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1447838008-3744-1-git-send-email-yao.yuan@freescale.com>
 <20151125190900.GA2959@chopperman.am.freescale.net>
In-Reply-To: <20151125190900.GA2959@chopperman.am.freescale.net>
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

Hi Woodhouse, Norris,

Do you have any comments for this patch?

Thanks for your review.

Best Regards,
Yuan Yao

> -----Original Message-----
> From: Han Xu [mailto:han.xu@freescale.com]
> Sent: Thursday, November 26, 2015 3:09 AM
> To: Yuan Yao-B46683 <yao.yuan@freescale.com>
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v2] mtd: spi-nor: fsl-quadspi: add big-endian support
On Thu, Nov 26, 2015 at=20
> On Wed, Nov 18, 2015 at 05:13:28PM +0800, Yuan Yao wrote:
> > Add R/W functions for big- or little-endian registers:
> > The qSPI controller's endian is independent of the CPU core's endian.
> > So far, the qSPI have two versions for big-endian and little-endian.
> >
> > Signed-off-by: Yuan Yao <yao.yuan@freescale.com>
> > ---
> > Changed in v2:
> > Rebase to the lastest code.
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 157
> > +++++++++++++++++++++++---------------
> >  1 file changed, 97 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
> > b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 9e7f657..0ce7768 100644

...

> > @@ -954,6 +990,7 @@ static int fsl_qspi_probe(struct platform_device
> *pdev)
> >  	if (IS_ERR(q->iobase))
> >  		return PTR_ERR(q->iobase);
> >
> > +	q->big_endian =3D of_property_read_bool(np, "big-endian");
>=20
> I am fine with this patch, but need document the new property with anothe=
r
> patch
>=20
> >  	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >  					"QuadSPI-memory");
> >  	if (!devm_request_mem_region(dev, res->start, resource_size(res),
> @@

...

> >
>=20
> Acked-by: Han xu <han.xu@freescale.com>
> --

Best Regards,
Yuan Yao
