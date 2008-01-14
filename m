Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JEJ42-0001ae-Ox
	for linux-mtd@lists.infradead.org; Mon, 14 Jan 2008 06:44:55 +0000
Date: Mon, 14 Jan 2008 17:19:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 3/3] Freescale enhanced Local Bus Controller FCM NAND
	support.
Message-Id: <20080114171945.a7244eb8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__14_Jan_2008_17_19_45_+1100_vS=oT7IRpccbuQzT"
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Mon__14_Jan_2008_17_19_45_+1100_vS=oT7IRpccbuQzT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Scott,

[Corrected list address.]

On Fri, 11 Jan 2008 14:43:20 -0600 Scott Wood <scottwood@freescale.com> wro=
te:
>
> +static int __devinit fsl_elbc_ctrl_probe(struct of_device *ofdev,
> +                                         const struct of_device_id *matc=
h)
> +{

> +	child =3D NULL;
> +	while ((child =3D of_get_next_child(ofdev->node, child)))

	for_each_child_of_node(of_dev->node, child)

> +		if (of_device_is_compatible(child, "fsl,elbc-fcm-nand"))
> +			fsl_elbc_chip_probe(ctrl, child);

> +static struct of_device_id fsl_elbc_match[] =3D {

const, please.

> +static struct of_platform_driver fsl_elbc_ctrl_driver =3D {

	.driver =3D {

> +	.name	=3D "fsl-elbc",

	},

> +	.match_table =3D fsl_elbc_match,
> +	.probe =3D fsl_elbc_ctrl_probe,
> +	.remove =3D __devexit_p(fsl_elbc_ctrl_remove),
> +};

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jan_2008_17_19_45_+1100_vS=oT7IRpccbuQzT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHiv8FTgG2atn1QN8RAnnvAJ4mdJpGlKEpu6YWv6rWZCLgKut2cACgkXGd
0EoxnDdFmlNQ4LiE2/OL5bU=
=Si09
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jan_2008_17_19_45_+1100_vS=oT7IRpccbuQzT--
