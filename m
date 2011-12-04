Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXDH7-0004fI-0E
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:42:41 +0000
Received: by iaby26 with SMTP id y26so38866iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:42:39 -0800 (PST)
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sun, 04 Dec 2011 16:43:42 +0200
In-Reply-To: <4EDB7B1D.60603@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-m5AO5AZ9rc7N1wRe7Cap"
Message-ID: <1323009827.9400.75.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Peter Horton <phorton@bitbox.co.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-m5AO5AZ9rc7N1wRe7Cap
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-12-04 at 05:52 -0800, Mike Dunn wrote:
> On 12/04/2011 12:43 AM, Peter Horton wrote:
> > On 03/12/2011 20:20, Mike Dunn wrote:
> >>
> >> This patch proposes a change to the mtd API for the purpose of returni=
ng to
> >> the caller information on the number of bit errors corrected by the ec=
c
> >> facilities of the device during read operations.  The affected functio=
ns are
> >> read() and read_oob().
> >>
> >
> > Do the number of bit-flips mean anything to the higher layers like UBI?=
=20
>=20
>=20
> The change was motivated primarily by the desire to get ubifs working wel=
l on
> nand flash.  Currently it works well only on onenand devices where single
> bitflips are rare and random.  On nand with frequent and consistent bitfl=
ips,
> ubi marks a large portion of the blocks as "bad".

Well, I think non-onenands are also supported. The very modern NAND
support has issues because of new problems which did not exist or were
not visible in the past.

>=20
> > As the ECC strength / error rate are a chip dependent thing how do the =
higher
> > layers know what is good/normal/bad?
>=20
>=20
> Good point.  To be determined.  Probably just another element in the mtd_=
info
> struct named ecc_strength or some such.  UBI e.g., can determine a suitab=
le
> "scrublevel" based on that.

I think UBI should scrub only if max_bitflips =3D=3D ecc_strength by
default. If the driver supplies scrublevel scrub if max_bitflips =3D=3D
scrublevel.

--=20
Best Regards,
Artem Bityutskiy

--=-m5AO5AZ9rc7N1wRe7Cap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24ceAAoJECmIfjd9wqK0XHYP/0jpiO43+9yk5Ud9Ct4uHyF8
Z0CV6F0yAUdKEZLW3MOfewPYg5ZN2m6T/XgWg81dy+Sk7ooaVkA/M/2jsy8Nr8nO
sJ7zXUpc6YflvicYZa4+ovDEeKp46M/tzSi/VGE/sIqCVHtLYN1K1j/qyv6uz5R6
+wHsmaMr0NDn+gQjtrQPPRUKp7XH7M4nP5TFUUt9AMeugYvaKrsIY2KQKqYFZzH6
1zn2QRKCd/R4kgiwJ50ISOuvmm4j/J2ZYZbxwyxvDaNWahp6ndE8+QvGvc0X3yxO
0clx+BwO6BpbyrgESXp++ic5iRWWBwBw24BfkI9X5UOX+Pd0y/1gagWNbPEJ9t5o
6uLpdAQN6fnFBv5kp9peepUmDa4hlF//9k5tXiJVTnp2EF+DAsFmd3Y0XOIzvbVe
gu7yGMK9MwUdVxTVzF5Vsw4gkBHk0Coe49zASfGnejf8954rIQhQ+BVkg2LlzbkT
ZumZD57yUkHulZNUJb6T4E6zTK0NwH/vfvXQgRWc73uUxngEn9W+NaP25nqWzjCU
oml4jNNUHBC+H2lE324SZP8KxyIpGUKrPSet2ug+nZgdiLxJvH+COwYla/LkrIsu
ehsqput1BdzlfNVmtOkNBUyQgjkHzr8UhGASW8cc5Q017T9dh7O5M8rU/kx2ud6K
9LO2fOKAxkHA0UTK3SJG
=Ov0/
-----END PGP SIGNATURE-----

--=-m5AO5AZ9rc7N1wRe7Cap--
