Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL3oT-0007GP-AO
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 03:15:26 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] nand: gpmi-nand: Fix clock registration
Date: Mon, 8 Oct 2012 05:15:19 +0200
References: <1348425062-17427-1-git-send-email-festevam@gmail.com>
 <50723E5C.3020403@freescale.com>
In-Reply-To: <50723E5C.3020403@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201210080515.19706.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2012=E5=B9=B409=E6=9C=8824=E6=97=A5 02:31, Fabio Estevam =E5=86=
=99=E9=81=93:
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> >=20
> > On a mx28 board the following error happens since commit 638064e56c
> > (mtd: gpmi: change the code for clocks):
> >=20
> > gpmi-nand: probe of 8000c000.gpmi-nand failed with error -12
> >=20
> > Acquire the clock using "NULL" as it was done previously, so that the
> > driver can register on mx23/mx28 as well.
> >=20
> > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> > ---
> >=20
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index c46be6c..1f23cb4 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -492,7 +492,7 @@ static int __devinit gpmi_get_clks(struct
> > gpmi_nand_data *this)
> >=20
> >  	int i;
> >  =09
> >  	/* The main clock is stored in the first. */
> >=20
> > -	r->clock[0] =3D clk_get(this->dev, "gpmi_io");
> > +	r->clock[0] =3D clk_get(this->dev, NULL);
>=20
> Please do not change this line.
>=20
> The gpmi_io is for mx6q.
> If you replace it with `NULL`. The mx6q can not find the proper clock.

Suggestion is really welcome though, please :) This is a problem, GPMI NAND=
 is=20
broken on anything !=3D mx6q. Huang, can you please also test the changes y=
ou do=20
to GPMI NAND on mx28/mx23 so we can avoid this breakage in the future?

Best regards,
Marek Vasut
