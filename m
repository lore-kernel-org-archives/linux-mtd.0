Date: Fri, 27 Jul 2018 01:13:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard
 <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner
 <stefan@agner.ch>, linux-kernel@vger.kernel.org, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez
 <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sylvain
 Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei Li
 <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.org, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH v4 27/35] mtd: rawnand: sm_common: convert driver to
 nand_scan_with_ids()
Message-ID: <20180727011346.3931dbe9@xps13>
In-Reply-To: <20180726210655.03eca681@bbrezillon>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
 <20180720151527.16038-28-miquel.raynal@bootlin.com>
 <20180722084432.61b579b1@bbrezillon>
 <20180726210655.03eca681@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 26 Jul 2018
21:06:55 +0200:

> On Sun, 22 Jul 2018 08:44:32 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>=20
> > On Fri, 20 Jul 2018 17:15:19 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > Two helpers have been added to the core to make ECC-related
> > > configuration between the detection phase and the final NAND scan. Use
> > > these hooks and convert the driver to just use nand_scan_with_ids()
> > > (alternative to nand_scan() for passing a flash IDs table) instead of
> > > both nand_scan_ident() and nand_scan_tail().
> > >=20
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>   =20
> >=20
> > Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >  =20
> > > ---
> > >  drivers/mtd/nand/raw/sm_common.c | 39 +++++++++++++++++++++++++-----=
---------
> > >  1 file changed, 25 insertions(+), 14 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/=
sm_common.c
> > > index 7f5044a79f01..d05e3f976a5e 100644
> > > --- a/drivers/mtd/nand/raw/sm_common.c
> > > +++ b/drivers/mtd/nand/raw/sm_common.c
> > > @@ -160,19 +160,9 @@ static struct nand_flash_dev nand_xd_flash_ids[]=
 =3D {
> > >  	{NULL}
> > >  };
> > > =20
> > > -int sm_register_device(struct mtd_info *mtd, int smartmedia)
> > > +static int sm_attach_chip(struct nand_chip *chip)
> > >  {
> > > -	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > -	int ret;
> > > -
> > > -	chip->options |=3D NAND_SKIP_BBTSCAN;
> > > -
> > > -	/* Scan for card properties */
> > > -	ret =3D nand_scan_ident(mtd, 1, smartmedia ?
> > > -		nand_smartmedia_flash_ids : nand_xd_flash_ids);
> > > -
> > > -	if (ret)
> > > -		return ret;
> > > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > > =20
> > >  	/* Bad block marker position */
> > >  	chip->badblockpos =3D 0x05;
> > > @@ -187,12 +177,33 @@ int sm_register_device(struct mtd_info *mtd, in=
t smartmedia)
> > >  	else
> > >  		return -ENODEV;
> > > =20
> > > -	ret =3D nand_scan_tail(mtd);
> > > +	return 0;
> > > +}
> > > =20
> > > +static const struct nand_controller_ops sm_controller_ops =3D {
> > > +	.attach_chip =3D sm_attach_chip,
> > > +};
> > > +
> > > +int sm_register_device(struct mtd_info *mtd, int smartmedia)
> > > +{
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > > +	struct nand_flash_dev *flash_ids;
> > > +	int ret;
> > > +
> > > +	chip->options |=3D NAND_SKIP_BBTSCAN;
> > > +
> > > +	/* Scan for card properties */
> > > +	chip->dummy_controller.ops =3D &sm_controller_ops;
> > > +	flash_ids =3D smartmedia ? nand_smartmedia_flash_ids : nand_xd_flas=
h_ids;
> > > +	ret =3D nand_scan_with_ids(mtd, 1, flash_ids);
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > -	return mtd_device_register(mtd, NULL, 0);
> > > +	ret =3D mtd_device_register(mtd, NULL, 0);
> > > +	if (ret)
> > > +		nand_release(mtd); =20
>=20
> Didn't notice that while reviewing, but it would have been better to
> use nand_cleanup() and do this change separately.

Indeed, will fix it.

Miqu=C3=A8l
