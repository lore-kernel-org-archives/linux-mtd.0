Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv6qF-00035j-0F
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 13:46:16 +0000
Message-ID: <1358257658.2731.140.camel@sauron.fi.intel.com>
Subject: Re: [PATCH -v2 13/26] ubifs: rename random32() to prandom_u32()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 15 Jan 2013 15:47:38 +0200
In-Reply-To: <1357215562-6288-14-git-send-email-akinobu.mita@gmail.com>
References: <1357215562-6288-1-git-send-email-akinobu.mita@gmail.com>
 <1357215562-6288-14-git-send-email-akinobu.mita@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Di2XiKRPZcm5S9NL7AHm"
Mime-Version: 1.0
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Di2XiKRPZcm5S9NL7AHm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-03 at 21:19 +0900, Akinobu Mita wrote:
> Use more preferable function name which implies using a pseudo-random
> number generator.
>=20
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

Pushed to linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Di2XiKRPZcm5S9NL7AHm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9V36AAoJECmIfjd9wqK0UJwQAKGj6JVnIfCrFsLWSh8d0mYf
pqpRlg5SXS6cZ9UBAVH1OOFxYbE0mclXH3EsK+5KxBaIAMehfqZ5p4/il4JVCBII
lrgLDNNoQdHiUEQV+KORDTVymN/ppHHvIxXFQQPLk9fJXVvgEnOrqcglSikZloB0
SMytJrQ1mGrJCwvjw3aL0TwVzhCAROSa/aU/BU9+LWff1SufIsDd4tUa8nsMuEAL
uYf80BBqkczk2GePWZ4TIMRN5gFRxH5obRq4I7WnGoo3ndDj9M5460BybFPxY8Nj
IzZAKLiXuLJa9keYgKHfz4JvKZY+Ny1cZfhfXFsmnPu+cwT0PixFwPwiPX0d8Nfx
O+erANNd8UjHJpW51rsKOyER4l7AYnvXcDuu7lSb9kGfMkac1Cdpqo+W3JMF7bHw
M/UqM9q+yKbLAudhrpvAVggKVEU96B4VoV9s8tgpUWZfPjJ6zEe+RmGX9axx2EVM
YzeP+yTFTy/Eof7HJqr7lkyv3ccCc62HMRZLBKgeqH6r1ZQNRW+E30A0iB/1Ydd5
UttvwIBbBiq1TqV1x6PVMYXio+laMAdiQ5OG+fqg6EnPjCx9kUhLK7ze5TluVFrq
dWLEWgTivHoEp0Yf4605190K5BOQ/YmWTrDXem3zHKfdqF5pk2DgaJ9iShfB5E/0
hJNLZIzXgsJ9PUMoVvXt
=tSLq
-----END PGP SIGNATURE-----

--=-Di2XiKRPZcm5S9NL7AHm--
