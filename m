Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgGDj-0001s0-1k
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 21:12:20 +0000
Date: Thu, 19 Jul 2018 23:12:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] mtd: rawnand: s3c2410: Error out when ->nrsets < 0
 or ->sets == NULL
Message-ID: <20180719231202.7a2f77ed@xps13>
In-Reply-To: <20180719205350.16655-1-boris.brezillon@bootlin.com>
References: <20180719205350.16655-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
22:53:50 +0200:

> All of the code in the probe path assumes ->sets !=3D NULL and
> ->nrsets > 0. Error out if that's not the case to avoid dereferencing a =
=20
> NULL pointer.
>=20
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Hello,
>=20
> I intentionally did not Cc stable because nobody complained so far.
> Also didn't add a Fixes tag because it's hard to tell when people
> started to dereferencing ->sets without checking its value.
>=20
> Regards,
>=20
> Boris
>=20
> Changes in v2:
> - Kill an unneeded 'sets !=3D NULL' test (reported by Dan)
> ---
>  drivers/mtd/nand/raw/s3c2410.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c241=
0.c
> index 10d81f367d26..5a4a68790653 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -1134,8 +1134,13 @@ static int s3c24xx_nand_probe(struct platform_devi=
ce *pdev)
> =20
>  	dev_dbg(&pdev->dev, "mapped registers at %p\n", info->regs);
> =20
> -	sets =3D (plat !=3D NULL) ? plat->sets : NULL;
> -	nr_sets =3D (plat !=3D NULL) ? plat->nr_sets : 1;
> +	if (!plat->sets || plat->nr_sets < 1) {
> +		err =3D -EINVAL;
> +		goto exit_error;
> +	}
> +
> +	sets =3D plat->sets;
> +	nr_sets =3D plat->nr_sets;
> =20
>  	info->mtd_count =3D nr_sets;
> =20
> @@ -1152,7 +1157,7 @@ static int s3c24xx_nand_probe(struct platform_devic=
e *pdev)
> =20
>  	nmtd =3D info->mtds;
> =20
> -	for (setno =3D 0; setno < nr_sets; setno++, nmtd++) {
> +	for (setno =3D 0; setno < nr_sets; setno++, nmtd++, sets++) {
>  		struct mtd_info *mtd =3D nand_to_mtd(&nmtd->chip);
> =20
>  		pr_debug("initialising set %d (%p, info %p)\n",
> @@ -1174,9 +1179,6 @@ static int s3c24xx_nand_probe(struct platform_devic=
e *pdev)
>  			goto exit_error;
> =20
>  		s3c2410_nand_add_partition(info, nmtd, sets);
> -
> -		if (sets !=3D NULL)
> -			sets++;
>  	}
> =20
>  	/* initialise the hardware */

Applied to nand/next.

Thanks,
Miqu=C3=A8l
