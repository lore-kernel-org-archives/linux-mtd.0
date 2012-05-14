Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STynZ-0002QN-1L
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 17:11:09 +0000
Message-ID: <1337015671.2528.91.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBI: add means to clear ubi work queue for particular
 lnums
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 14 May 2012 20:14:31 +0300
In-Reply-To: <alpine.DEB.2.00.1205131043370.654@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205121712410.24689@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1205131043370.654@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UJfIC7+BkD5RmmrctHxN"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UJfIC7+BkD5RmmrctHxN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-13 at 10:47 +0200, Joel Reardon wrote:
> This is the second part of a patch to allow UBI to force the erasure of
> particular logical eraseblock numbers. In this patch, a new function,
> ubi_lnum_purge, is added that allows the caller to synchronously erase al=
l
> unmapped erase blocks whose LEB number corresponds to the parameter. This
> requires a previous patch that stores the LEB number in struct ubi_work.
>=20
> This was tested by disabling the call to do_work in ubi thread, which res=
ults
> in the work queue remaining unless explicitly called to remove. UBIFS was
> changed to call ubifs_leb_change 50 times for three different LEBs. Then =
the
> new function was called to clear the queue for the three differnt LEB num=
bers
> one at a time. The work queue was dumped each time and the selective remo=
val
> of the particular LEB numbers was observed.
>=20
> Calls to down_read(&ubi->work_sem) are not being done (unlike in
> do_work).. I'm not sure
> exactly where its needed / what it does, so perhaps someone can enlighten
> me.
>=20

Joel, I've just pushed patches from Richard which will conflict with
your patch-set. His patches are ready to go in right away so I took them
first. Please, re-base and re-send your changes.

I've re-based your "joel" branch against latest UBI/UBIFS stuff. Your
previous branch is now "joel_old".

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-UJfIC7+BkD5RmmrctHxN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsT13AAoJECmIfjd9wqK03ncP/1Z/6quqqaoHqBfSyvKHxHTU
m7FDuAJirtLE5tULHu5x3GlmpSOUr/tvrLKUr09U0/itRVtGR7X3buzXk705/y/6
U9oPRrGK7FUfpEtyIn7eZhOVSE8P7iTWaq8QkSCFet2AOXS7tKPMCFJrpHsMYF8G
ui0mGBSkEOOQ6f28XlR8OTKLe6xH961296+XXsjYVqMAjrS3xpNLDdSdsQEFeCno
T8VyaO1NIFJnhNwtlTHwDiH4AFbA6jskHN2NUsMVlOf2DepJujOTkNREgAeOW49z
GExsSH7oGzRUeZXIDoB1Gwn3x4rl5T9PL39kygOXMNJB5e1sMbz+r0oQ/Y+Nmbk9
tJmcR2pukc1nSSyvtsch+4tiZj3aoqThN99wrhX2Kf5ZMRc2bRLIKvQSuQFJWgSf
hks9846pSw+M6UOkQBngtwc3+yoAsehyGCkQl29leemAb5nsE2ZQtRgLI6ZcXqzK
qs9WzVrOqN8e5cEdVKY8AEREfAK2mbTtWseQbLx+6gQ0hProR2/Q52zKgJI/aPbX
nocd22y9ADjeBE/IRY3ykKYJ8Y0LPGxEmXHpM4dBQB8rtF2nd4XkzyoXCq7PLeIl
PNuOZSLvBYea6JS+4qh2Ru8mbTe/jBoQnxeT+l4vla5ZXiW6QPRWQJLrQem78OAr
ognkRRmSzQe+AAb5h/Uw
=sWVA
-----END PGP SIGNATURE-----

--=-UJfIC7+BkD5RmmrctHxN--
