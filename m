Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CREdi-00050z-SR
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 13:53:22 -0500
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Alexander Hoffmann <ahoffmann@sysgo.de>
In-Reply-To: <418F5E68.3010200@sysgo.de>
References: <418F5E68.3010200@sysgo.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Jl3u96EjGwLRus+T4IVv"
Date: Mon, 08 Nov 2004 11:30:15 -0700
Message-Id: <1099938615.10812.5.camel@tubarao>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: Usage of MTD_UADDR_UNNECESSARY broken?
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Jl3u96EjGwLRus+T4IVv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-08 at 12:54 +0100, Alexander Hoffmann wrote:
> Hi everyone,
>=20
> can anybody please explain me the exact difference between=20
> MTD_UADDR_DONT_CARE and MTD_UADDR_UNNECESSARY .

It's exactly what the comments state:

	MTD_UADDR_DONT_CARE,		/* Requires an arbitrary address */
	MTD_UADDR_UNNECESSARY,		/* Does not require any address */


> Because if I use MTD_UADDR_UNNECESSARY an not existing field in the=20
> unlock_addrs array is beeing referenced
> (/drivers/mtd/chips/jedec_probe.c, function cfi_jedec_setup, line 1740):

Unlock addresses shouldn't be assigned if they aren't necessary - hence
why there isn't an entry for them in unlock_addrs[].  There should be
logic that checks this before making the assignment.  Of course another
way to do it would be to have an entry assigned, but not use it.  I
prefer, however, that things break when the logic is incorrect - which
is the way it is now.

> /* Mask out address bits which are smaller than the device type */
> mask =3D ~(p_cfi->device_type-1);
> p_cfi->addr_unlock1 =3D unlock_addrs[uaddr].addr1 & mask;
> p_cfi->addr_unlock2 =3D unlock_addrs[uaddr].addr2 & mask;
>=20
> If I change MTD_UADDR_DONT_CARE to MTD_UADDR_UNNECESSARY everything=20
> works fine!

Apparently there is a problem that it isn't exiting the function earlier
for the MTD_UADDR_UNNECESSARY case.

Of course you also need to know which kind of chip you have: Is it a
DONT_CARE or an UNNECESSARY?

--=20
Thayne Harbaugh
Linux Networx

--=-Jl3u96EjGwLRus+T4IVv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBj7s3sYFQl3A+qS0RAi6jAKDRzesxfo0jnkmYNMMKipd81jQ/FACfbshc
sNtDt+trumwQtAUILhm/AH8=
=6UUZ
-----END PGP SIGNATURE-----

--=-Jl3u96EjGwLRus+T4IVv--
