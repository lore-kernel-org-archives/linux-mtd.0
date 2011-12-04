Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXCMa-0002DD-3L
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 13:44:16 +0000
Received: by iadk27 with SMTP id k27so8175847iad.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 05:44:11 -0800 (PST)
Subject: Re: [PATCH] mtdoops: fix the oops_page_used array size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Date: Sun, 04 Dec 2011 15:44:57 +0200
In-Reply-To: <1322563758-26317-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1322563758-26317-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VXLGaEwRkDHUEZi6fWXT"
Message-ID: <1323006318.9400.52.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, rpurdie@openedhand.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VXLGaEwRkDHUEZi6fWXT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-29 at 12:49 +0200, Roman Tereshonkov wrote:
> The array of unsigned long pointed by oops_page_used is allocated
> by vmalloc which requires the size to be in bytes.
>=20
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
>  drivers/mtd/mtdoops.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
> index 1e2fa62..0782b31 100644
> --- a/drivers/mtd/mtdoops.c
> +++ b/drivers/mtd/mtdoops.c
> @@ -369,7 +369,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
> =20
>  	/* oops_page_used is a bit field */
>  	cxt->oops_page_used =3D vmalloc(DIV_ROUND_UP(mtdoops_pages,
> -			BITS_PER_LONG));
> +			BITS_PER_LONG) * sizeof(unsigned long));

But it is already in bytes. I do not understand which problem this patch
fixes - it looks incorrect to me.

--=20
Best Regards,
Artem Bityutskiy

--=-VXLGaEwRkDHUEZi6fWXT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO23lZAAoJECmIfjd9wqK0H+4QALZLkIsctoDh1ivISA82cyey
DtcqmtVrPw338JYJytAmdOVdM5rr6WsXFwCu5KziKlwznNgntfIsMiMfI7qNEeVR
WIma7fmT7g+entkTqRzp5+ynA6pDr6wcN8oDk2INvduqjVeYHrt9XzDHVdIzP58G
u1EHVRlxRGVnYOrHtjhI4BvpBoOCkonuMAH7lknH5ArjEvlNOe6ehZZc5s1LG+a9
GtQVeK0cNcMr7SRp35sf3KFXoUSaI5o0JVquaNP77wPMxLCj16kUJWLjnqqQOQ3T
gH3a4kHGIGYxSZ2qJX2uPn/UT7ISo2+gNo2TIuKtcxIZ46fxEfgJxz0S4CYL+n3x
NNQaPW6xmG20oMhDcmQDjvjGVfZOXe/jcfUBBfjO/DaWYQ5fCFXhMlibIcKQVkkY
qDdRjz7bT1fhn3igtP0Qh5Z5W5GFDkQU+YYj6ZgTaQdYBOOykG9wO7T4tm62zCYl
cOGHhET+uPAWG5SMToQPAq/N3sziPQ2M7F+lIy4WAGeZzPODgnZ2KiGMIGnO9cUa
pbz5p4583osCfeq4StpzFhZD5A8C3kfN4VIqEh9ZlSpf4iVbYfnT5FpqK18Ug52o
H5Qa3JgPvJA1M3ka5cnHuil7Fh5t0fmZ6c4ODlGHQ1GfuinSxukWGEPRNHGneK3x
J93GJ0MGkuiADfDWYf/i
=dOiP
-----END PGP SIGNATURE-----

--=-VXLGaEwRkDHUEZi6fWXT--
