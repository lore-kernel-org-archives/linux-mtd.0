Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtCdl-000841-QK
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 06:28:58 +0000
Received: by dakp5 with SMTP id p5so2995288dak.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 22:28:55 -0800 (PST)
Message-ID: <1328250655.6750.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: gpmi: use correct member for checking
 NAND_BBT_USE_FLASH
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 03 Feb 2012 08:30:55 +0200
In-Reply-To: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
References: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BSgvH+ZPkyajKKAJ3sRn"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BSgvH+ZPkyajKKAJ3sRn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 13:10 +0100, Wolfram Sang wrote:
> This has been moved from .options to .bbt_options meanwhile. So, it
> currently checks for something totally different (NAND_OWN_BUFFERS) and
> decides according to that.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, added the following tag:
Cc: stable@kernel.org [3.2+]

--=20
Best Regards,
Artem Bityutskiy

--=-BSgvH+ZPkyajKKAJ3sRn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK38fAAoJECmIfjd9wqK0kQ0P/Amt0AmFeSfF2SZF81tWm9PM
iKIumYCQNc9bHmx4AUIzpGDfD+0hoivIYM10gwLHtIOkK5UfgMeYBLcf6larwrzm
DjTi4bJYG8xyJSzg+tfq9s7VLnq0Z7eadNoAdzshQ/eeTZMjGFnbFO2653UWmoCe
Nof71Wnly9KbHyiwkQ0eSaHelIFm+KktNT/afS/JJ4Mi4vm7jJiddfV1SwX7GBkX
FtsP/NCv4TiKVHWHux6jGUoQKDfyFdGOyRyC05Sr9cOt3OHN/lEigrO7zqgdueyi
BoFN4Yqf0dXmh+GEAsN6YKNQxJ1zZeZp6zo+5t9FHNzSuNWo8ALBGbKBEOoak5bk
9AFMOXH4iHCjHdFQ3o4ENeqx7DVvdDe5gv/lv2pkK+shu9V11usvPocod2AVK5vS
HyiW6CJ7z4gHATGnCCsgxRX2mLUKNahQ+JqavzzNqGpEQG2JS1gNrslrrDKP0QRX
NZ0Z/lBMV3KWWiAlFh4oemy51df8MrzxU0O+yeXvaG2x9wY9zX23Va7xF7T7WU1r
z+/uLeIn2YNyUvRVgi8Xnq0vZoaV13+wAm+xPoNgl9sFXwaLe/MnGjVeoWKF4h0e
R3onnujlBlD4OzMFJ8ypeG5v9GhM6XFBuVBYGfgHYU0GthZYbS81K4GF4wR5XVw3
94q0PazQLkg0wIjei0iR
=7xA7
-----END PGP SIGNATURE-----

--=-BSgvH+ZPkyajKKAJ3sRn--
