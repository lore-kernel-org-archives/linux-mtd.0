Date: Fri, 20 Jul 2018 09:17:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans
 Rullgard <mans@mansr.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 28/33] mtd: rawnand: docg4: convert driver to
 nand_scan()
Message-ID: <20180720091745.7b1de031@xps13>
In-Reply-To: <20180720012732.3753e0ef@bbrezillon>
References: <20180719230026.8741-1-miquel.raynal@bootlin.com>
 <20180719230026.8741-29-miquel.raynal@bootlin.com>
 <20180720012732.3753e0ef@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 20 Jul 2018
01:27:32 +0200:

> On Fri, 20 Jul 2018 01:00:21 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Two helpers have been added to the core to make ECC-related
> > configuration between the detection phase and the final NAND scan. Use
> > these hooks and convert the driver to just use nand_scan() instead of
> > both nand_scan_ident() and nand_scan_tail().
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/docg4.c | 55 ++++++++++++++++++++++++++----------=
--------
> >  1 file changed, 32 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
> > index 4dccdfba6140..2f6fcd4efab2 100644
> > --- a/drivers/mtd/nand/raw/docg4.c
> > +++ b/drivers/mtd/nand/raw/docg4.c
> > @@ -1227,10 +1227,9 @@ static void __init init_mtd_structs(struct mtd_i=
nfo *mtd)
> >  	 * required within a nand driver because they are performed by the na=
nd
> >  	 * infrastructure code as part of nand_scan().  In this case they need
> >  	 * to be initialized here because we skip call to nand_scan_ident() (=
the
> > -	 * first half of nand_scan()).  The call to nand_scan_ident() is skip=
ped
> > -	 * because for this device the chip id is not read in the manner of a
> > -	 * standard nand device.  Unfortunately, nand_scan_ident() does other
> > -	 * things as well, such as call nand_set_defaults().
> > +	 * first half of nand_scan()).  The call to nand_scan_ident() could be
> > +	 * skipped because for this device the chip id is not read in the man=
ner
> > +	 * of a standard nand device.
> >  	 */
> > =20
> >  	struct nand_chip *nand =3D mtd_to_nand(mtd);
> > @@ -1315,6 +1314,27 @@ static int __init read_id_reg(struct mtd_info *m=
td)
> > =20
> >  static char const *part_probes[] =3D { "cmdlinepart", "saftlpart", NUL=
L };
> > =20
> > +static int docg4_attach_chip(struct nand_chip *chip)
> > +{
> > +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > +	struct docg4_priv *doc =3D (struct docg4_priv *)(chip + 1);
> > +
> > +	init_mtd_structs(mtd);
> > +
> > +	/* Initialize kernel BCH algorithm */
> > +	doc->bch =3D init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
> > +	if (!doc->bch)
> > +		return -EINVAL;
> > +
> > +	reset(mtd);
> > +
> > +	return read_id_reg(mtd);
> > +}
> > +
> > +static struct nand_controller_ops docg4_controller_ops =3D {
> > +	.attach_chip =3D docg4_attach_chip,
> > +};
> > +
> >  static int __init probe_docg4(struct platform_device *pdev)
> >  {
> >  	struct mtd_info *mtd;
> > @@ -1350,26 +1370,16 @@ static int __init probe_docg4(struct platform_d=
evice *pdev)
> >  	mtd->dev.parent =3D &pdev->dev;
> >  	doc->virtadr =3D virtadr;
> >  	doc->dev =3D dev;
> > -
> > -	init_mtd_structs(mtd);
> > -
> > -	/* initialize kernel bch algorithm */
> > -	doc->bch =3D init_bch(DOCG4_M, DOCG4_T, DOCG4_PRIMITIVE_POLY);
> > -	if (doc->bch =3D=3D NULL) {
> > -		retval =3D -EINVAL;
> > -		goto free_nand;
> > -	}
> > -
> >  	platform_set_drvdata(pdev, doc);
> > =20
> > -	reset(mtd);
> > -	retval =3D read_id_reg(mtd);
> > -	if (retval =3D=3D -ENODEV) {
> > -		dev_warn(dev, "No diskonchip G4 device found.\n");
> > -		goto free_bch;
> > -	}
> > -
> > -	retval =3D nand_scan_tail(mtd);
> > +	/*
> > +	 * Asking for 0 chips is useless here but it warns the user that the =
use
> > +	 * of the nand_scan() function is a bit abused here because the
> > +	 * initialization is actually a bit specific and re-handled again in =
the
> > +	 * ->attach_chip() hook. It will probably leak some memory though.
> > +	 */
> > +	nand->dummy_controller.ops =3D &docg4_controller_ops;
> > +	retval =3D nand_scan(mtd, 0);
> >  	if (retval)
> >  		goto free_bch; =20
>=20
> Hm, not sure this works. The driver only calls nand_scan_tail(), but
> you replace that by a call to nand_scan(), which will call both
> nand_scan_ident() and nand_scan_tail(), and I'm pretty sure
> nand_scan_ident() will fail here.

I know docg4 is a bit specific and could maybe be moved out of the raw/
subdirectory. But in the meantime I don't want to block the series for
this. The better I can propose right now (open to other ideas as
well) would be to return 0 in nand_scan_ident() if the maxchip parameter
is 0 which is the case only in this driver AFAIS.

Miqu=C3=A8l
