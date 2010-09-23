Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OykPN-0004UT-5a
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 11:56:15 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L97004NL7TJND20@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:07 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L9700BIH7THMR@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 20:56:07 +0900 (KST)
Date: Thu, 23 Sep 2010 17:26:05 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: RE: [PATCH 2/2][MTD]MLC device check in OneNAND driver
In-reply-to: <1284988680.5258.48.camel@localhost>
To: dedekind1@gmail.com
Message-id: <000001cb5b16$4e3f23c0$eabd6b40$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: en-us
Content-transfer-encoding: quoted-printable
References: <000101cb53e3$b15d6280$14182780$%hs@samsung.com>
	<1284988680.5258.48.camel@localhost>
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
> Sent: Monday, September 20, 2010 6:48 PM
> To: Rohit Hassan Sathyanarayan
> Cc: v.dalal@samsung.com; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH 2/2][MTD]MLC device check in OneNAND driver
>=20
> On Tue, 2010-09-14 at 13:36 +0530, Rohit Hassan Sathyanarayan wrote:
> > Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> > ---
> >  include/mtd/mtd-abi.h |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> > index 4debb45..6c6465d 100644
> > --- a/include/mtd/mtd-abi.h
> > +++ b/include/mtd/mtd-abi.h
> > @@ -57,12 +57,14 @@ struct mtd_oob_buf64 {
> >  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
> >  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
> >  #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
> > +#define MTD_WRITABLE_ONCE	0x4000
>=20
> MTD_WRITABLE_ONCE is bad name.
>=20
  Removed
> >
> >  // Some common devices / combinations of capabilities
> >  #define MTD_CAP_ROM		0
> >  #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | =
MTD_NO_ERASE)
> >  #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
> >  #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
> > +#define MTD_CAP_MLCNANDFLASH	(MTD_WRITEABLE | MTD_WRITABLE_ONCE)
>=20
> MLC is not really a capability.
>=20
> I think MLC flash is so much different to the old good SLC flashes, =
that
> I'd just treat it as another flash type. I'd introduce =
MTD_MLCNANDFLASH
> for it, similar to MTD_NANDFLASH.
>=20
> What do you think?
>=20
  Yes, MLC flash has different cell structure.
  Added MTD_MLCNANDFLASH flash type.   =20
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)

Sending changes as per your suggestion.
Regards,
Rohit.H.S
