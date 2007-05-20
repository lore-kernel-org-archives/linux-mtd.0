Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpsPn-0000kf-BH
	for linux-mtd@lists.infradead.org; Sun, 20 May 2007 16:54:08 -0400
Date: Sun, 20 May 2007 22:49:34 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Eric Sesterhenn / Snakebyte <snakebyte@gmx.de>
Subject: Re: leak in mtd/devices/phram.c
Message-ID: <20070520204934.GA6347@lazybastard.org>
References: <20070520200936.GB22049@alice>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20070520200936.GB22049@alice>
Cc: linux-mtd@lists.infradead.org, joern@wh.fh-wedel.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 20 May 2007 22:09:37 +0200, Eric Sesterhenn / Snakebyte wrote:
>=20
> coverity spotted this leak in mtd/devices/phram.c (bug id #1512),
> when register_device() fails, we dont kfree() name and leak it,
> attached patch should fix this.
>=20
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

Acked-by: J=C3=B6rn Engel <joern@lazybastard.org>

> --- linux-2.6/drivers/mtd/devices/phram.c.orig	2007-05-20 22:04:24.000000=
000 +0200
> +++ linux-2.6/drivers/mtd/devices/phram.c	2007-05-20 22:06:12.000000000 +=
0200
> @@ -276,7 +276,9 @@ static int phram_setup(const char *val,=20
>  		parse_err("illegal device length\n");
>  	}
> =20
> -	register_device(name, start, len);
> +	ret =3D register_device(name, start, len);
> +	if (ret)
> +		kfree(name);
> =20
>  	return 0;
>  }
>=20

J=C3=B6rn

--=20
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFGULRdfbqVtkXfjukRAr2mAKCJrDtAB19MgAUx0HS4Vh/jJh6nPACfQW8V
SJgF5PWXbrUR7bgO7ZrfxCU=
=dmkV
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
