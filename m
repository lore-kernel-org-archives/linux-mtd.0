Date: Tue, 20 Mar 2018 08:24:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Josh Wu <rainyfeeling@outlook.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 21/52] mtd: rawnand: jz4780: convert driver to nand_scan()
Message-ID: <20180320082458.6ecb52e9@xps13>
In-Reply-To: <c3df8f9f-7d3f-4fa5-dad3-a9f6697aa67d@gmail.com>
References: <20180302170400.6712-1-miquel.raynal@bootlin.com>
 <20180302170400.6712-22-miquel.raynal@bootlin.com>
 <d57f95d3-03d0-5905-835f-c278df578b1e@gmail.com>
 <20180316143824.568be773@xps13>
 <c3df8f9f-7d3f-4fa5-dad3-a9f6697aa67d@gmail.com>
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

Hi Harvey,

On Fri, 16 Mar 2018 15:33:05 +0000, Harvey Hunt
<harveyhuntnexus@gmail.com> wrote:

> Hi Miqu=C3=A8l,
>=20
> On 03/16/2018 01:38 PM, Miquel Raynal wrote:
> > Hi Harvey,
> >=20
> > On Thu, 15 Mar 2018 15:40:25 +0000, Harvey Hunt
> > <harveyhuntnexus@gmail.com> wrote:
> >  =20
> >> Hi Miquel,
> >>
> >> Sorry it's taken me a little while to review your changes, a few
> >> comments below:
> >>
> >> On 03/02/2018 05:03 PM, Miquel Raynal wrote: =20
> >>> Two helpers have been added to the core to make ECC-related
> >>> configuration between the detection phase and the final NAND scan. Use
> >>> these hooks and convert the driver to just use nand_scan() instead of
> >>> both nand_scan_ident() and nand_scan_tail().
> >>>
> >>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>> ---
> >>>  drivers/mtd/nand/raw/jz4780_nand.c | 30 ++++++++++++----------------=
--
> >>>  1 file changed, 12 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/ra=
w/jz4780_nand.c
> >>> index e69f6ae4c539..fd5dc9d9b0c6 100644
> >>> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> >>> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> >>> @@ -157,9 +157,8 @@ static int jz4780_nand_ecc_correct(struct mtd_inf=
o *mtd, u8 *dat,
> >>>  	return jz4780_bch_correct(nfc->bch, &params, dat, read_ecc);
> >>>  }
> >>> =20
> >>> -static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struc=
t device *dev)
> >>> +static int jz4780_nand_attach_chip(struct nand_chip *chip)
> >>>  {
> >>> -	struct nand_chip *chip =3D &nand->chip;
> >>>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> >>>  	struct jz4780_nand_controller *nfc =3D to_jz4780_nand_controller(ch=
ip->controller);
> >>>  	int eccbytes;
> >>> @@ -170,7 +169,8 @@ static int jz4780_nand_init_ecc(struct jz4780_nan=
d_chip *nand, struct device *de
> >>>  	switch (chip->ecc.mode) {
> >>>  	case NAND_ECC_HW:
> >>>  		if (!nfc->bch) {
> >>> -			dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> >>> +			dev_err(nfc->dev,
> >>> +				"HW BCH selected, but BCH controller not found\n");
> >>>  			return -ENODEV;
> >>>  		}
> >>> =20
> >>> @@ -179,15 +179,16 @@ static int jz4780_nand_init_ecc(struct jz4780_n=
and_chip *nand, struct device *de
> >>>  		chip->ecc.correct =3D jz4780_nand_ecc_correct;
> >>>  		/* fall through */
> >>>  	case NAND_ECC_SOFT:
> >>> -		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
> >>> -			(nfc->bch) ? "hardware BCH" : "software ECC",
> >>> -			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> >>> +		dev_info(nfc->dev, "using %s (strength %d, size %d, bytes %d)\n",
> >>> +			 (nfc->bch) ? "hardware BCH" : "software ECC",
> >>> +			 chip->ecc.strength, chip->ecc.size, chip->ecc.bytes)>  		break;
> >>>  	case NAND_ECC_NONE:
> >>> -		dev_info(dev, "not using ECC\n");
> >>> +		dev_info(nfc->dev, "not using ECC\n");
> >>>  		break;
> >>>  	default:
> >>> -		dev_err(dev, "ECC mode %d not supported\n", chip->ecc.mode);
> >>> +		dev_err(nfc->dev, "ECC mode %d not supported\n",
> >>> +			chip->ecc.mode);
> >>>  		return -EINVAL;
> >>>  	}   =20
> >> These changes seem redundant as dev is passed into the function,
> >> although you could remove it from the function defintion. =20
> >=20
> > That is right, I should have also removed the 'dev' parameter.
> >  =20
>=20
> That'd be great

Actually there is nothing to do, the new prototype is already:

    static int jz4780_nand_attach_chip(struct nand_chip *chip);

which doesn't have the *dev parameter anymore :-)

Thanks anyway for reviewing!
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
