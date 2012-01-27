Message-ID: <1327673774.29385.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: sa11x0: Remove shutdown handler
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Fri, 27 Jan 2012 16:16:14 +0200
In-Reply-To: <E1RoBvE-0005qY-BC@rmk-PC.arm.linux.org.uk>
References: <E1RoBvE-0005qY-BC@rmk-PC.arm.linux.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FdBh0CEkDcT92eaTew0o"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FdBh0CEkDcT92eaTew0o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 10:42 +0000, Russell King - ARM Linux wrote:
> Commit c4a9f88daf ([MTD] [NOR] fix ctrl-alt-del can't reboot for
> intel flash bug) interferes with this work-around, causing MTD to
> issue this warning:
>=20
> 	Flash device refused suspend due to active operation (state 0)
>=20
> The commit makes our work-around in the map driver unnecessary, so
> let's remove it.
>=20
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Pushed both to l2-mtd tree, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-FdBh0CEkDcT92eaTew0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIrGuAAoJECmIfjd9wqK0994P/idAxNVRB7ReWm7iapEu14IM
cbGRUx3KJbmJtx4q6+4gcE241XijhHLKYKz3XraOtRnJt6HxTJyfpE+x4+uGeItS
C/+Rt0T1GVVymsUigJQs6y8AEtO13U/GDh0snwXHk0FLOihV89ifDoj+1v2R3lbP
JjdIpXmRTKhho1x+Prj7rAJ3J6I/aEJ3QrphtoZvgbu5IkiPL2wy/4UZc8NhaNit
63EtqypynuEkcEgaHK8OgKIXS58VpBmfQpMapwOci6w5xIh1AILAO4B/5O2gUmAa
L26d98jV/ueOhwna1IVTBadcALayJA+vp+YENDNtBfMzQWv+gOLYmkX2iwzCRPc8
/SXRydnDLEjkOLJwqIkLFiKHg/RJl8DbM64LEiVYvyI2mUmNy76CwPuf6BiBwQLK
lq0nseBxMoRz7suRa0y12CmqiITwTEkZAJNo7+PT53s1Q7Jb47ly4b1Q+kxeV7SE
nA0wu64cBtMYeCtKcF6a7gE74mtq8WgR6opUvqUZEV8usjI0L7v63UxH/zssyUfX
xcNqMwr185pg+CFaaxo4IWBxQrMKvqqb4W5d+uLY05WTQ5iwrYZcOJJg4R7Bfkt+
tNEymyDq4elKHvMuPVvIwH15NXCb9KCEXJaaNCHg6uSnXbCCZbJFFCQLvI8c6Jez
lyCraTEHiH9Zs4V8056t
=lmpb
-----END PGP SIGNATURE-----

--=-FdBh0CEkDcT92eaTew0o--
