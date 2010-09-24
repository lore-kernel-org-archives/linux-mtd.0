Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz6fs-0003xg-H5
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 11:42:45 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L9900ART1V56K20@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 20:42:41 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9900IDE1V3MQ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 20:42:41 +0900 (KST)
Date: Fri, 24 Sep 2010 17:12:40 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: [PATCH 1/2][MTD]MLC device check in OneNAND driver
In-reply-to: <1285317593.29268.155.camel@localhost>
To: dedekind1@gmail.com
Message-id: <001801cb5bdd$98f03450$cad09cf0$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <000101cb5b16$59d2dab0$0d789010$%hs@samsung.com>
	<1285317593.29268.155.camel@localhost>
Cc: v.dalal@samsung.com, gupta.raghav@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Friday, September 24, 2010 2:10 PM
> To: Rohit Hassan Sathyanarayan
> Cc: v.dalal@samsung.com; linux-mtd@lists.infradead.org; =
gupta.raghav@samsung.com
> Subject: Re: [PATCH 1/2][MTD]MLC device check in OneNAND driver
>=20
> Hi,
>=20
> few minor things. I could just do this all myself, but since this is =
not
> the first non-perfect patch you send, I think I'll be a little nasty =
and
> ask you should do the exercise :-)

  We have combined two patches into one and have posted the same, hope =
new
  Patch complies properly.

> On Thu, 2010-09-23 at 17:26 +0530, Rohit Hassan Sathyanarayan wrote:
> > Hi Artem,
> >
> > Adding driver check for MLC flash type.
> >
> >
> > Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> > Signed-off-by: Raghav Gupta <gupta.raghav@samsung.com>
>=20
> 1. Do no add extra line between the message and signed off.
>=20
> 2. Ideally, your patches should be applicable with git-am without the
>    need to edit them. Try git am for your patches and see the result -
>    the commit message will contain 'Hi Artem,' phrase, which should =
not
>    be there.
>=20
> > ---
> >  drivers/mtd/onenand/onenand_base.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mtd/onenand/onenand_base.c =
b/drivers/mtd/onenand/onenand_base.c
> > index a2bb520..33e0dbb 100644
> > --- a/drivers/mtd/onenand/onenand_base.c
> > +++ b/drivers/mtd/onenand/onenand_base.c
> > @@ -4027,7 +4027,7 @@ int onenand_scan(struct mtd_info *mtd, int =
maxchips)
> >  	mtd->ecclayout =3D this->ecclayout;
> >
> >  	/* Fill in remaining MTD driver data */
> > -	mtd->type =3D MTD_NANDFLASH;
> > +	mtd->type =3D ONENAND_IS_MLC(this) ? MTD_MLCNANDFLASH : =
MTD_NANDFLASH;
> >  	mtd->flags =3D MTD_CAP_NANDFLASH;
> >  	mtd->erase =3D onenand_erase;
> >  	mtd->point =3D NULL;
>=20
> The kernel does not compile with this patch. You should make this =
patch
> the second, the first one should introduce MTD_MLCNANDFLASH.
>=20
> The kernel has to be bisectable, you patches should not break
> bisectability.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)

Regards,
Rohit.H.S
