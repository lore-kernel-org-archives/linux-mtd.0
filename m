Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arrvN-0007UK-MO
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 19:00:02 +0000
Date: Sun, 17 Apr 2016 20:59:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH V2 09/11] mtd: nand: read ECC algorithm from the new field
Message-ID: <20160417205938.71fcabf3@bbrezillon>
In-Reply-To: <1460913104-27388-10-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460913104-27388-10-git-send-email-zajec5@gmail.com>
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

On Sun, 17 Apr 2016 19:11:42 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> Now we have all drivers properly setting this new field we can start
> using it. For a very short period of time we should support both values:
> NAND_ECC_SOFT and NAND_ECC_SOFT_BCH treating them the same. It's because
> of_get_nand_ecc_mode may still be setting NAND_ECC_SOFT_BCH.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> V2: Move SOFT-related code to separated functions
>     Add missing checks for SOFT before checking Hamming vs. BCH
> ---
>  drivers/mtd/nand/nand_base.c | 116 ++++++++++++++++++++++++++-----------=
------
>  1 file changed, 71 insertions(+), 45 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c

[...]

> =20
> @@ -4154,7 +4217,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/*
>  	 * If no default placement scheme is given, select an appropriate one.
>  	 */
> -	if (!mtd->ooblayout && (ecc->mode !=3D NAND_ECC_SOFT_BCH)) {
> +	if (!mtd->ooblayout &&
> +	    (ecc->mode =3D=3D NAND_ECC_SOFT || ecc->mode =3D=3D NAND_ECC_SOFT_B=
CH) &&
> +	    ecc->algo !=3D NAND_ECC_BCH) {

Sorry, I got this wrong in my previous review. It should be

	if (!mtd->ooblayout &&
	    ((ecc->mode !=3D NAND_ECC_SOFT &&
	      ecc->mode !=3D NAND_ECC_SOFT_BCH) ||
	     ecc->algo !=3D NAND_ECC_BCH) {

otherwise we're only addressing the software ECC case, and IIRC, some
drivers rely on these default layouts for their HW ECC implementation.

The rest looks good to me.

Thanks,

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
