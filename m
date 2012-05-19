Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVhHE-0006eA-BJ
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 10:52:48 +0000
Received: by lbbgg6 with SMTP id gg6so3328887lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 03:52:46 -0700 (PDT)
Message-ID: <1337424764.2041.12.camel@koala>
Subject: Re: [PATCH V2] UBI: add ubi_lnum_purge function to clear work queue
 for a lnum
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Sat, 19 May 2012 13:52:44 +0300
In-Reply-To: <1337424475.2041.8.camel@koala>
References: <alpine.DEB.2.00.1205150943470.17750@eristoteles.iwoars.net>
 <1337082012.2528.181.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205191140280.19017@eristoteles.iwoars.net>
 <1337424475.2041.8.camel@koala>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KBQR5FGh9eAVvMY3xG1/"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KBQR5FGh9eAVvMY3xG1/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-19 at 13:47 +0300, Artem Bityutskiy wrote:
> If you walk the list and read pointers, and someone else modifies them,
> you may be in trouble. You cannot traverse the list without the
> spinlock. And once you dropped the spinlock - you have to start over
> because your 'wrk' pointer may point to a non-existing object, because
> this object might have been already freed. This is why I added 2 loops.

Actually we ourselves free it in ->func() :-) I think it is saner to not
even use the list_for_each_entry(), but just take the element off the
head, unlock the spinlock use "container_of()", and call ->func(). So we
need only one loop, not 2.

--=20
Best Regards,
Artem Bityutskiy

--=-KBQR5FGh9eAVvMY3xG1/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPt3t8AAoJECmIfjd9wqK0v/kQAKEonKbqorEtjTcNLubZhZ2Z
P2ozT4uplsq2C1p9whzFEVP4+z4i6E4qbKzXcWA9L356ntttQQ3fsOtsItj9KQFe
LpBSUWqKMMAQ89dlczobQlsRuy8yVqRVg/gNCod1JSZJSoAjT+NuBzy0NT1/PulU
JWUXnVXg8jTOPFdUzAhE/A14ChZq3XSXfxNfusd9zlkzmOBzNmdwRbltSrCgoMz5
jOg9nIck88oyD6TASCkNHqwDfct64m02m2OnYSHTOudXXdVQWCvW/nlo2AuZLgzz
Uhcorp2lZlna9qU3Y+c0gZysqPAS+psJla2t/1arzyZlVX9nR2zbtqykNMToxe5a
UTJAaqx7iMhP7CyPDO6VknrQCIksQ+5MRetH2XngS6mBygJpTvk3ZmRdl3VOCsvi
6C/4WZEUAAkjNq/HKx760dbLHFq0UuzVqyhExv1mm2QLRfcfGqHdZfaZZZB7Sgze
OPo9KWn3Q0kSFBobN++pCAB3B3vVEOBcX81+KUs10aKEXJ5kEtRYkzFdPf0uqMcC
twMHQyIxBJOUci2jdeVfJOb8/rtPAYQUc2M+x26vduDbfz+fJ6+uTnM4TxhGS9jz
4sBsmFiGeR/UFd1oO6TAmKFx3tT645QBaweMQw3sVWr4aDTHrLYWK34O2VVsgLJv
PwXN2tZ/ltlpfCgkEbgO
=TNbJ
-----END PGP SIGNATURE-----

--=-KBQR5FGh9eAVvMY3xG1/--
