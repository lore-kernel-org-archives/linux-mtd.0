Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arL7d-0006Gb-2w
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 07:58:29 +0000
Date: Sat, 16 Apr 2016 09:58:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 10/12] mtd: nand: read ECC algorithm from the new field
Message-ID: <20160416095807.112d2f59@bbrezillon>
In-Reply-To: <1460750052-16285-11-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-11-git-send-email-zajec5@gmail.com>
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

On Fri, 15 Apr 2016 21:54:10 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Now we have all drivers properly setting this new field we can start
> using it and proceed with deprecating NAND_ECC_SOFT_BCH.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 98 ++++++++++++++++++++++++--------------=
------
>  1 file changed, 53 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e1f3cf8..ffd1b32 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4154,7 +4154,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/*
>  	 * If no default placement scheme is given, select an appropriate one.
>  	 */
> -	if (!mtd->ooblayout && (ecc->mode !=3D NAND_ECC_SOFT_BCH)) {
> +	if (!mtd->ooblayout && ecc->algo !=3D NAND_ECC_BCH) {

Should be:

	if (!mtd->ooblayout && ecc->algo =3D=3D NAND_ECC_SOFT &&
	    ecc->algo !=3D NAND_ECC_BCH) {

Otherwise you're also taking the NAND_ECC_HW + NAND_ECC_BCH into
account.=20

>  		switch (mtd->oobsize) {
>  		case 8:
>  		case 16:
> @@ -4248,51 +4248,59 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		ecc->algo =3D NAND_ECC_HAMMING;
> =20
>  	case NAND_ECC_SOFT:
> -		ecc->calculate =3D nand_calculate_ecc;
> -		ecc->correct =3D nand_correct_data;
> -		ecc->read_page =3D nand_read_page_swecc;
> -		ecc->read_subpage =3D nand_read_subpage;
> -		ecc->write_page =3D nand_write_page_swecc;
> -		ecc->read_page_raw =3D nand_read_page_raw;
> -		ecc->write_page_raw =3D nand_write_page_raw;
> -		ecc->read_oob =3D nand_read_oob_std;
> -		ecc->write_oob =3D nand_write_oob_std;
> -		if (!ecc->size)
> -			ecc->size =3D 256;
> -		ecc->bytes =3D 3;
> -		ecc->strength =3D 1;
> -		break;
> -
>  	case NAND_ECC_SOFT_BCH:

Shouldn't we drop this case?

> -		if (!mtd_nand_has_bch()) {
> -			WARN(1, "CONFIG_MTD_NAND_ECC_BCH not enabled\n");
> -			ret =3D -EINVAL;
> -			goto err_free;
> -		}
> -		ecc->calculate =3D nand_bch_calculate_ecc;
> -		ecc->correct =3D nand_bch_correct_data;
> -		ecc->read_page =3D nand_read_page_swecc;
> -		ecc->read_subpage =3D nand_read_subpage;
> -		ecc->write_page =3D nand_write_page_swecc;
> -		ecc->read_page_raw =3D nand_read_page_raw;
> -		ecc->write_page_raw =3D nand_write_page_raw;
> -		ecc->read_oob =3D nand_read_oob_std;
> -		ecc->write_oob =3D nand_write_oob_std;
> -		/*
> -		 * Board driver should supply ecc.size and ecc.strength values
> -		 * to select how many bits are correctable. Otherwise, default
> -		 * to 4 bits for large page devices.
> -		 */
> -		if (!ecc->size && (mtd->oobsize >=3D 64)) {
> -			ecc->size =3D 512;
> -			ecc->strength =3D 4;
> -		}
> +		switch (ecc->algo) {

Please put this logic in a sub-function, nand_scan_tail() is already
quite long and hard to read, let's try to not define sub switch-case
blocks inside existing ones.

> +		case NAND_ECC_HAMMING:
> +			ecc->calculate =3D nand_calculate_ecc;
> +			ecc->correct =3D nand_correct_data;
> +			ecc->read_page =3D nand_read_page_swecc;
> +			ecc->read_subpage =3D nand_read_subpage;
> +			ecc->write_page =3D nand_write_page_swecc;
> +			ecc->read_page_raw =3D nand_read_page_raw;
> +			ecc->write_page_raw =3D nand_write_page_raw;
> +			ecc->read_oob =3D nand_read_oob_std;
> +			ecc->write_oob =3D nand_write_oob_std;
> +			if (!ecc->size)
> +				ecc->size =3D 256;
> +			ecc->bytes =3D 3;
> +			ecc->strength =3D 1;
> +			break;
> +		case NAND_ECC_BCH:
> +			if (!mtd_nand_has_bch()) {
> +				WARN(1, "CONFIG_MTD_NAND_ECC_BCH not enabled\n");
> +				ret =3D -EINVAL;
> +				goto err_free;
> +			}
> +			ecc->calculate =3D nand_bch_calculate_ecc;
> +			ecc->correct =3D nand_bch_correct_data;
> +			ecc->read_page =3D nand_read_page_swecc;
> +			ecc->read_subpage =3D nand_read_subpage;
> +			ecc->write_page =3D nand_write_page_swecc;
> +			ecc->read_page_raw =3D nand_read_page_raw;
> +			ecc->write_page_raw =3D nand_write_page_raw;
> +			ecc->read_oob =3D nand_read_oob_std;
> +			ecc->write_oob =3D nand_write_oob_std;
> +			/*
> +			* Board driver should supply ecc.size and ecc.strength
> +			* values to select how many bits are correctable.
> +			* Otherwise, default to 4 bits for large page devices.
> +			*/
> +			if (!ecc->size && (mtd->oobsize >=3D 64)) {
> +				ecc->size =3D 512;
> +				ecc->strength =3D 4;
> +			}
> =20
> -		/* See nand_bch_init() for details. */
> -		ecc->bytes =3D 0;
> -		ecc->priv =3D nand_bch_init(mtd);
> -		if (!ecc->priv) {
> -			WARN(1, "BCH ECC initialization failed!\n");
> +			/* See nand_bch_init() for details. */
> +			ecc->bytes =3D 0;
> +			ecc->priv =3D nand_bch_init(mtd);
> +			if (!ecc->priv) {
> +				WARN(1, "BCH ECC initialization failed!\n");
> +				ret =3D -EINVAL;
> +				goto err_free;
> +			}
> +			break;
> +		default:
> +			WARN(1, "Unsupported ECC algorithm!\n");
>  			ret =3D -EINVAL;
>  			goto err_free;
>  		}
> @@ -4478,7 +4486,7 @@ void nand_release(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip =3D mtd_to_nand(mtd);
> =20
> -	if (chip->ecc.mode =3D=3D NAND_ECC_SOFT_BCH)
> +	if (chip->ecc.algo =3D=3D NAND_ECC_BCH)

Again, should be:

	if (chip->ecc.mode =3D NAND_ECC_SOFT &&
	    chip->ecc.algo =3D=3D NAND_ECC_BCH)

>  		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
> =20
>  	mtd_device_unregister(mtd);



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
