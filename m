Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yOq-0003z7-ET
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:38:45 +0000
Message-ID: <1346309023.2848.531.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/3] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Thu, 30 Aug 2012 09:43:43 +0300
In-Reply-To: <1346001700-26895-3-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346001700-26895-3-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0RWnBZXauIGKq6ve5X8+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0RWnBZXauIGKq6ve5X8+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> This patch is based on the assumption that all the partitions are
> in the right offset order.
>=20
> Assume we have a 1GB(8Gb) nand chip, and we set the partitions
> in the command line like this:
>     #gpmi-nand:100m(boot),100m(kernel),1g(rootfs)
>=20
> In this case, the partition truncating occurs. The current code will
> get the following result:
>=20
>      ----------------------------------
> 	root@freescale ~$ cat /proc/mtd
> 	dev:    size   erasesize  name
> 	mtd0: 06400000 00040000 "boot"
> 	mtd1: 06400000 00040000 "kernel"
>      ----------------------------------
>=20
> It is obvious that we lost the truncated partition `rootfs` which should
> be 824M in this case.
>=20
> Why? The old code sets the wrong partitions number when the truncating
> occurs. This patch fixes it. Alao add a `break` to shortcut the code in t=
his
> case.
>=20
> After apply this patch, the result becomes:
>      ----------------------------------
> 	root@freescale ~$ cat /proc/mtd
> 	dev:    size   erasesize  name
> 	mtd0: 06400000 00040000 "boot"
> 	mtd1: 06400000 00040000 "kernel"
> 	mtd2: 33800000 00040000 "rootfs"
>      ----------------------------------
>=20
> We get the right result.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Should this have CC to -stable?

--=20
Best Regards,
Artem Bityutskiy

--=-0RWnBZXauIGKq6ve5X8+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPwufAAoJECmIfjd9wqK0/ScP/0KA4Wuq1FajMuVHf39vfG6I
bQwgvWZlSPC5s2bt0OxFeZ/HNWQyW1BfU32BNkciaMx5N1UKdOOIqqxfMVj6Vw4T
d9farp+Pwb0uZ1xu0kHkAr0LI2R92bYAFbGzTc31tIlyDMzx/c1edwhxV7zUOjrc
LH/6/bZ9Q2svDFqFeUEeMzmNLRZQCjr6HSAVA3lFfkX0pELLIxZlWbCHLaEJal8e
vLU6cfccSmtALxIA8Z9T8a8lgsfa0m38evp6PXJyIo3Saof4mCGK7OIGwrXLkdUG
y2EF1yzydT57Y5x5R3NSlvAA9ogoIS91yu6QT7jFUexKa3IZ2ycm33oKolQ059NR
H9hAna7fgQYifp7N+781h21HX1qj7JS0aiku7nZBrxwFujdxyoyolfD7zOu4+FGP
UVyooq1bZDLyziHvIFfeY9k8kT3humPQjG5pbnhj625PcIT0MWPSTQF73SxWQ+Rb
pj4lpP/0eQzsD177uYKj5qhYB3zjNMBEwLB1pmkBwxgIeRsSxF/IJtFMZD9Rtr87
6Res6dkJjad/BjygEKf7D8RH6Cc7ygqzCSAXlYEYqUJWpEmhjFCNPyyeeamPXFso
oc4Ku4SVPMuv5HoJNb9jbYyReNU2OMtx+/dmBBJUJNK+08m/3eIA6IF0tezu1aGP
LXVwQi/vYEBH5v6DEnkP
=rs6p
-----END PGP SIGNATURE-----

--=-0RWnBZXauIGKq6ve5X8+--
