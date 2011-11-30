Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVjLD-00025y-J7
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 12:32:49 +0000
Received: by ywp18 with SMTP id 18so643669ywp.36
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2011 04:32:43 -0800 (PST)
Subject: Re: [PATCH] [MTD:UBI] Missing scrub when there is a bit-flip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bparekh@nvidia.com>
Date: Wed, 30 Nov 2011 14:33:38 +0200
In-Reply-To: <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
References: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
 <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+xo5Rl+aCFUJ6xqG5btC"
Message-ID: <1322656423.24797.428.camel@sauron.fi.intel.com>
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


--=-+xo5Rl+aCFUJ6xqG5btC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-11-30 at 17:43 +0530, Bhavesh Parekh wrote:
> Under some cases, when scrubbing the PEB if we didnot get the lock on
> the PEB it fails to scrub. Add that PEB again to the scrub list
>=20
> Signed-off-by: Bhavesh Parekh <bparekh@nvidia.com>

I think we need to send it to -stable as well. Could you please confirm
that you verified that this patch solves the issue you reported - I ask
this to make double sure we are sending a good patch to the stable tree.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+xo5Rl+aCFUJ6xqG5btC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO1iKiAAoJECmIfjd9wqK03sYP/AtIWKTNhietqeX+BfjHk/CJ
8o89RatSDhItY5t51dVyEqW6TXT4WkhCvs7aaxl+4Xj0EFiK9DusUKYMWPhsjNlO
Fe/FdAuP0qP9FmXn+kwAmLdmPcKjBrsWo6nJ5LbEKkvY/XlTGiXR3TwTZpM6I/Ee
+8ObS/EgY1+9u1KnMkWYT5ehpMV1Oo5TmvlbUJirwGkWXmePcwmzdGcA/evbyeNp
YK+zj4h7t3thw+FbN5g9RRcf5EgjHIzfku7HCLucggR4X1Ufa9AgY+gnaBXtLZkd
clcdNnMUOh/scu5vtHZBqpDsM71xAJdZrPfPYvSL6qtLCKw1Xu3olKnSD5Q72Y/H
BDAqxdnmM4FabyhDDqdt+GQzR5Xv52etp1K9oF1jrvHAOsX/vBqDSa48fgXkvitf
JPKMXnfql1JdA7BHYiKif499yr8oVYDNbES9BLWg23Fc9gm9FWmFrVqrKUO43TCL
oePDRU2AdTvmSPRb/V53yqdmdAMFI9KqSVl97oiMiaJFNRQti9oY0osIvFV1jd4k
OIRM6uU193lP/R2fQ0N1Qi1uXvcdbAUku5akrranx25I/NfiOxdOFbVZxvHmCFGk
WirLE9vbGoc1Qg4Y0NPz8B+zF3eG2DY83uZNEzysfp3X+IZm7ZGK2MkHqO+MT/2y
9oNkGyU9OgH3gJOj1vUn
=ESrh
-----END PGP SIGNATURE-----

--=-+xo5Rl+aCFUJ6xqG5btC--
