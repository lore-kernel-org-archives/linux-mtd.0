Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2JMI-00015q-T3
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 10:33:07 +0000
Message-ID: <1359973956.13791.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: map: BUG() in non handled cases
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Date: Mon, 04 Feb 2013 12:32:36 +0200
In-Reply-To: <1359651994-27363-1-git-send-email-dmitry_eremin@mentor.com>
References: <1359651994-27363-1-git-send-email-dmitry_eremin@mentor.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uLvg00JGLWJcrwwWsYmf"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uLvg00JGLWJcrwwWsYmf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-31 at 21:06 +0400, Dmitry Eremin-Solenikov wrote:
> Several map-related functions look like a serie of ifs, checking
> widths of map. Those functions do not have any handling for default
> case. Instead of fiddling with uninitialized_var in those functions,
> let's just add a (correct) BUG() to the default case on those maps. This
> will also allow us to catch potential errors in maps setup in future.
>=20
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-uLvg00JGLWJcrwwWsYmf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD45EAAoJECmIfjd9wqK0mHoQAKJWUlwGdyM7dzvBE8ddudj+
6OXcXzAWb6GStgXLZ7KDimbllxgiykGx8/SmmC3nmWlsCnJcB4xr7XDrLlbJlGV/
l92jFuABYzAnGtdE7TN9LBD3F8SD8Nw+YSIv0NFRB713lLJ9DW+PyHB7dYEAyTD4
rU4eEq0RXk6AByR604ic5jWJvq4r6WU8wC7/6ZWi1jetUC9POssZ6D4ESVNorWmO
N34T2ZNArvgMyrUXqiGU3A5gkXLM03wxSGd5FmPv9zL73M6ug4OLxsmTnQoiAR+i
SjAe7jQ5bURMTO1MKO0+z7SajtzMXMTKGGfFXPxBvwoJwab7ksdaNZ4jYPJoXKNJ
+Rz1SqKIZqskYF21BaTsgA+yWW02NnsRmrHRaCscjs07w2NQEQxGIgx/DARtN9Ms
OV3ttW2kJ3Z9g7byaS7fSCKqfplhdy6C+2rdqI0pqhsUGnaoD1wSVQPofo+rF4ar
cCqUR7YhIOMGNRabJZyxrHg7CTMOAXgQhrH1F0JqTHMxViRNkkm1DH61BQQCrdE2
R4tEXNIU+HZwXUvB7aYRV4aNaP0tMF64d6N8gVC84htKAbyHpOxse1Xz+U8jBQRm
eodsM/tp3V/hL27WiaD4GAeH15t2c4r6DQaZuUcixdkklJkvKxGgd5yNIsRCMOjF
ceW8t5+wBbIjVB+OI4er
=ti/m
-----END PGP SIGNATURE-----

--=-uLvg00JGLWJcrwwWsYmf--
