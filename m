Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auxZQ-00083u-HD
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 07:38:09 +0000
Date: Tue, 26 Apr 2016 09:37:36 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJl?=
 =?UTF-8?B?Y2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND
 subsystem
Message-ID: <20160426093736.3978a718@bbrezillon>
In-Reply-To: <20160426055355.GA25981@localhost>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-3-git-send-email-zajec5@gmail.com>
 <20160426055355.GA25981@localhost>
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

Hi Brian,

On Mon, 25 Apr 2016 22:53:55 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Fri, Apr 22, 2016 at 01:23:15PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> > It's more reliable than guessing based on ECC strength. It allows using
> > NAND on devices with BCH-1 (e.g. D-Link DIR-885L).
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > ---
> >  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/br=
cmnand/brcmnand.c
> > index c3331ff..dcb22dc 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -1927,7 +1927,7 @@ static int brcmnand_setup_dev(struct brcmnand_hos=
t *host)
> > =20
> >  	switch (chip->ecc.size) {
> >  	case 512:
> > -		if (chip->ecc.strength =3D=3D 1) /* Hamming */
> > +		if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING) =20
>=20
> This doesn't handle most of the problems I noted on the early version of
> this series. (But thank you for following through on the algorithm
> selection refactoring!)
>=20
> Particularly, this change will
> (a) break any existing DTs which used to have 'nand-ecc-size =3D <1>', and
>     would assume this gets Hamming ECC; and
> (b) allows DTs to specify Hamming ECC for unsupported modes, like 1024B
>     sectors, or ecc_level !=3D 1. None of these are supported in HW.

Indeed.

>=20
> >  			cfg->ecc_level =3D 15;
> >  		else
> >  			cfg->ecc_level =3D chip->ecc.strength; =20
>=20
> Something like the following probably works better (not tested):
>=20
> ---8<---
>=20
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Mon, 25 Apr 2016 20:48:02 -0700
> Subject: [PATCH] mtd: brcmnand: respect ECC algorithm set by the NAND
>  subsystem
>=20
> This is more obvious than guessing based on ECC strength. It allows
> using NAND on devices with BCH-1 (e.g. D-Link DIR-885L).
>=20
> This maintains DT backward compatibility by defaulting to Hamming if a
> 1-bit ECC algorithm is specified without a corresponding algorithm
> selection. i.e., to use BCH-1, you must specify:
>=20
>   nand-ecc-strength =3D <1>;
>   nand-ecc-step-size =3D <512>;
>   nand-ecc-algo =3D "bch";
>=20
> Also adds a check to ensure we haven't allowed someone to get by with SW
> ECC. If we want to support SW ECC, we need to refactor some other pieces
> of this driver.

I'm waiting a bit before applying this patch (I'd like to have a
Tested-by first).

>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcm=
nand/brcmnand.c
> index c3331ffcaffd..b76ad7c0144f 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1925,9 +1925,31 @@ static int brcmnand_setup_dev(struct brcmnand_host=
 *host)
>  	cfg->col_adr_bytes =3D 2;
>  	cfg->blk_adr_bytes =3D get_blk_adr_bytes(mtd->size, mtd->writesize);
> =20
> +	if (chip->ecc.mode !=3D NAND_ECC_HW) {
> +		dev_err(ctrl->dev, "only HW ECC supported; selected: %d\n",
> +			chip->ecc.mode);
> +		return -EINVAL;
> +	}
> +
> +	if (chip->ecc.algo =3D=3D NAND_ECC_UNKNOWN) {
> +		if (chip->ecc.strength =3D=3D 1 && chip->ecc.size =3D=3D 512)
> +			/* Default to Hamming for 1-bit ECC, if unspecified */
> +			chip->ecc.algo =3D NAND_ECC_HAMMING;
> +		else
> +			/* Otherwise, BCH */
> +			chip->ecc.algo =3D NAND_ECC_BCH;
> +	}
> +
> +	if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING && (chip->ecc.strength !=3D =
1 ||
> +						   chip->ecc.size !=3D 512)) {
> +		dev_err(ctrl->dev, "invalid Hamming params: %d bits per %d bytes\n",
> +			chip->ecc.strength, chip->ecc.size);
> +		return -EINVAL;
> +	}
> +
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength =3D=3D 1) /* Hamming */
> +		if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING)
>  			cfg->ecc_level =3D 15;
>  		else
>  			cfg->ecc_level =3D chip->ecc.strength;



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
