From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Kishore Kadiyala <kishorek.kadiyala@gmail.com>
Date: Fri, 21 Jan 2011 13:54:05 +0530
Subject: RE: [PATCH] omap3: nand: bch ecc support added
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B036A8DB174@dbde02.ent.ti.com>
References: <1295518680-8737-1-git-send-email-s-ghorai@ti.com>
	<AANLkTimsD1108ASF3H9Y8pjaTsfv0D33K11KOXDmypvJ@mail.gmail.com>
In-Reply-To: <AANLkTimsD1108ASF3H9Y8pjaTsfv0D33K11KOXDmypvJ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Kishore Kadiyala [mailto:kishorek.kadiyala@gmail.com]
> Sent: Friday, January 21, 2011 1:42 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH] omap3: nand: bch ecc support added
>=20
> Ghorai,
>=20
> <snip>
>=20
> > =A0#ifdef CONFIG_MTD_PARTITIONS
> > diff --git a/drivers/mtd/nand/omap_bch_decoder.c
> b/drivers/mtd/nand/omap_bch_decoder.c
> > new file mode 100644
> > index 0000000..da42bda
> > --- /dev/null
> > +++ b/drivers/mtd/nand/omap_bch_decoder.c
> > @@ -0,0 +1,393 @@
> > +/*
> > + * drivers/mtd/nand/omap_omap_bch_decoder.c
> > + *
> > + * Whole BCH ECC Decoder (Post hardware generated syndrome decoding)
> > + *
> > + * Copyright (c) 2007 Texas Instruments
> > + *
> > + * Author: Sukumar Ghorai <s-ghorai@ti.com
> > + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Michael Fillinger <m-fillinger@ti.co=
m>
>=20
> Vimal was the original author who has created this file
> [No change in file name/directory hierarchy].
> It's not fair to remove Vimal's author and add your's.
>=20
> Instead you should have kept his name and added your's.
[Ghorai] Ok.  I will do ..=20
But can you send me working version of these? At least comipled version for=
 any kernel?

>=20
> <snip>
>=20
> Regards,
> Kishore
