Received: from mail-ve1eur03on062e.outbound.protection.outlook.com
 ([2a01:111:f400:fe09::62e]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyxbX-00075l-45
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 10:37:57 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, Han Xu
 <han.xu@nxp.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>
Subject: RE: [PATCH v7 2/2] mtd: fsl-quadspi: fix init AHB read in
 fsl_qspi_nor_setup()
Date: Thu, 22 Mar 2018 10:37:40 +0000
Message-ID: <DB6PR0402MB2838A58BC4A9C0DEA4DC537599A90@DB6PR0402MB2838.eurprd04.prod.outlook.com>
References: <1521631565-24413-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1521631565-24413-3-git-send-email-yogeshnarayan.gaur@nxp.com>
 <c6dd17bd-672e-89b5-af95-ee6359a6d5e9@exceet.de>
In-Reply-To: <c6dd17bd-672e-89b5-af95-ee6359a6d5e9@exceet.de>
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

Hi Frieder,

> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf =
Of
> Frieder Schrempf
> Sent: Thursday, March 22, 2018 2:49 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; linux-
> mtd@lists.infradead.org
> Cc: boris.brezillon@free-electrons.com; marek.vasut@gmail.com; Prabhakar
> Kushwaha <prabhakar.kushwaha@nxp.com>; Suresh Gupta
> <suresh.gupta@nxp.com>; cyrille.pitchen@wedev4u.fr; Han Xu
> <han.xu@nxp.com>; computersforpeace@gmail.com; festevam@gmail.com
> Subject: Re: [PATCH v7 2/2] mtd: fsl-quadspi: fix init AHB read in
> fsl_qspi_nor_setup()
>=20
> Hi Yogesh,
>=20
> On 21.03.2018 12:26, Yogesh Gaur wrote:
> > Move AHB read initialize in fsl_qspi_nor_setup().
> >
> > In file spi-nor.c, func spi_nor_scan() calls nor->read() thru
> > spi_nor_read_sfdp() API.
> >
> > Presently, fsl_qspi_init_ahb_read() called from fsl_qspi_nor_setup_last=
().
> > Func fsl_qspi_probe() calls spi_nor_scan() first and then calls
> > fsl_qspi_nor_setup_last().
> >
> > When nor->read() being called from inside spi_nor_read_sfdp(), QSPI
> > cntlr AHB mode initialization is not yet done results in data read erro=
r.
> >
> > Initialize AHB read inside fsl_qspi_nor_setup().
> >
> > Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> > ---
> > Changes for v7:
> > - None
> > Changes for v6:
> > - None
> > Changes for v5:
> > - None
> > Changes for v4:
> > - None
> > Changes for v3:
> > - None
> > Changes for v2:
> > - None
> >
> >   drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
> > b/drivers/mtd/spi-nor/fsl-quadspi.c
> > index 64b8bb3..424094a 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -820,6 +820,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
> >   	/* enable the interrupt */
> >   	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
> >
> > +	/* Init for AHB read */
> > +	fsl_qspi_init_ahb_read(q);
>=20
> Maybe I missed something, but it seems if you move
> fsl_qspi_init_ahb_read() here and fsl_qspi_read() is used before
> fsl_qspi_nor_setup_last() is called, then the read command is triggered w=
ith an
> uninitialized LUT entry (SEQID_LUT2_AHBREAD).
>=20
For every call to fsl_qspi_read(), I am preparing the LUT before doing actu=
al read so LUT entry for SEQID_LUT2_AHBREAD is never be uninitialized.

Rationale behind moving fsl_qspi_init_ahb_read() from fsl_qspi_nor_setup_la=
st() to fsl_qspi_nor_setup() is to initialize registers which are required =
for AHB read operation like setting of values in QUADSPI_BUF3CR, QUADSPI_BF=
GENCR etc registers as fsl_qspi_read() is called, before call to fsl_qspi_n=
or_setup_last(), through spi_nor_read_sfdp().

--
Thanks
Yogesh Gaur

> So shouldn't the LUT entry for AHB read be initialized with some default =
values
> here, before spi_nor_scan() is called?
>=20
> Thanks,
>=20
> Frieder
>=20
> > +
> >   	return 0;
> >   }
> >
> > @@ -842,9 +845,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi =
*q)
> >   	if (ret)
> >   		return ret;
> >
> > -	/* Init for AHB read */
> > -	fsl_qspi_init_ahb_read(q);
> > -
> >   	/* Prepare LUT for AHB read - required for read from devmem interfac=
e
> */
> >   	fsl_qspi_prep_ahb_read(q);
> >
> >
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.infr
> adead.org%2Fmailman%2Flistinfo%2Flinux-
> mtd%2F&data=3D02%7C01%7Cyogeshnarayan.gaur%40nxp.com%7C427c291bd9c
> f4eafa3bc08d58fd60d88%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C636573071879930483&sdata=3DqL4febRxR%2BvWiSOcnvxgqLzqOX%2BqTV4PA
> UorfjgcLUI%3D&reserved=3D0
