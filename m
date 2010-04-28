Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O795e-0001rb-DN
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 15:22:19 +0000
Message-ID: <4BD85298.1000304@pengutronix.de>
Date: Wed, 28 Apr 2010 17:22:00 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1272057944-19380-1-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1272057944-19380-1-git-send-email-mkl@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9FF86D8D9E5CBC331B68E85A"
Subject: Re: [PATCH] pxa32xx_nand: add support for partition table parsing
Cc: David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9FF86D8D9E5CBC331B68E85A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Marc Kleine-Budde wrote:
> The pxa32xx_nand driver doesn't support partition tables from the
> command line. This patch adds support for it.
>=20
> Please review and consider to apply.

Can someone please have a look at this patch.

Cheers, Marc

>>From a2caa92b08351511ee60bd94bf735be5f3a6fb65 Mon Sep 17 00:00:00 2001
> From: Marc Kleine-Budde <mkl@pengutronix.de>
> Date: Fri, 23 Apr 2010 10:43:42 +0200
> Subject: [PATCH] pxa32xx_nand: add support for partition table parsing
>=20
> The pxa32xx_nand driver doesn't support partition tables from the
> command line. This patch adds support for it.
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> index 5d55152..e02fa4f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1320,6 +1320,17 @@ static int pxa3xx_nand_probe(struct platform_dev=
ice *pdev)
>  		goto fail_free_irq;
>  	}
> =20
> +	if (mtd_has_cmdlinepart()) {
> +		static const char *probes[] =3D { "cmdlinepart", NULL };
> +		struct mtd_partition *parts;
> +		int nr_parts;
> +
> +		nr_parts =3D parse_mtd_partitions(mtd, probes, &parts, 0);
> +
> +		if (nr_parts)
> +			return add_mtd_partitions(mtd, parts, nr_parts);
> +	}
> +
>  	return add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
> =20
>  fail_free_irq:


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig9FF86D8D9E5CBC331B68E85A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkvYUpgACgkQjTAFq1RaXHPc5gCfbdmfKLAYkENlXeuGQD4pYbnV
Fu4An1b/4U0/i7soMxeSpyPEXVLDd9e5
=917s
-----END PGP SIGNATURE-----

--------------enig9FF86D8D9E5CBC331B68E85A--
