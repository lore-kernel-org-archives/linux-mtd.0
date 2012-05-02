Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPYNj-0005iN-Lf
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 12:10:08 +0000
Message-ID: <1335960807.10293.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: use ecc_strength to determine whether to perform
 bitflip_threshold test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 02 May 2012 15:13:27 +0300
In-Reply-To: <1335902181-18110-1-git-send-email-mikedunn@newsguy.com>
References: <1335902181-18110-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MIJ8fTkk9R+81APuqddN"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MIJ8fTkk9R+81APuqddN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 12:56 -0700, Mike Dunn wrote:
> This is a minor change to the recent EUCLEAN patch set that I think makes=
 it
> more correct.  Currently, the test in mtd_read() that determines whether =
or not
> to return -EUCLEAN is skipped if bitflip_threshold =3D=3D 0.  This logic =
was added
> (without much thought) to fix a bug in an earlier version of the patch se=
t that
> would have caused devices lacking ecc to always return -EUCLEAN [1].
>=20
> This patch replaces bitflip_threshold with ecc_strength as the value used=
 to
> determine whether the device has ecc capability.  I think this is more co=
rrect
> because bitflip_threshold can be changed via sysfs.  Currently, if the us=
er sets
> it to zero, -EUCLEAN is never returned.  This is also what happens if the=
 user
> sets it to a value exceeding ecc_strength.  With this patch, if the user =
sets it
> to zero, -EUCLEAN will always be returned (provided ecc_strength > 0), wh=
ich
> makes more sense, and may even be useful occasionally.
>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040468.html
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>


Folded this patch into:

mtd: driver _read() returns max_bitflips; mtd_read() returns -EUCLEAN

and pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-MIJ8fTkk9R+81APuqddN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoSTnAAoJECmIfjd9wqK08zoQAMWdYFuy2AB0JXb9O56pBi+u
pk+sLn7JI5R5V/V7RhKLJc6I06QWp7RTQl6xt0C5M8YCPMWdO7XNQmJcci9GfWKw
lkh3A+xk0qT7W4rQTQ9JYj6/39NsO3dc/rwMcp/yC7hMvtn3zJrqa1sLsJ4aHWUZ
6EY+aJoTJUO95ztkDKcHXtiAapzaaGcVJNxQQW4HAaBMCiCd5h3tSwUE/sO/TEJv
8FlvJV1t81u31eLhL7TV3kh0GhI06b5kalYQG132ACfbaLOVGcx3lBCibXsUJqYK
BHxS+hKYvji3m/VzX8iGQbGK5h+gbv/OoHPglLYFcb3GmpuRFigL6kRJmdW6bv4T
V7lWFLw5OcWYm4pEWLqddRAM9JizocIMN3cKVJLnsGznqYBzBmbHojvv4RgVCQj6
Y293frgK1+2k92RcMvdVovEVwT+7wx1gW8EBb/JyM0uBkrNSJvGo/Be6rqf6XTQX
UflO5tULzXLU+x66bu1NliZMIpYlZy9GdH+M9LVPRDTW1Pv/Apg0LtajpCqVpWYF
rAqFECg0SpinPBhn1LYqe2LVYyaIWk81KN+fukwz7u8Z7AGQBHsks2Bw2OaDqfOw
7Rd6jjQp6AAXHSBk+WV1telzTlh3GV3T6SuPh8ZMYRkDhA08K+T1xiBdnvvJgsUf
3+Pp4LoJMcL5LmGH9RMx
=HPvA
-----END PGP SIGNATURE-----

--=-MIJ8fTkk9R+81APuqddN--
