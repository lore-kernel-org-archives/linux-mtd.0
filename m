Message-ID: <1336042485.13013.41.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] mtd: gpmi: add device tree support for mx6q and mx28
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shawn Guo <shawn.guo@linaro.org>
Date: Thu, 03 May 2012 13:54:45 +0300
In-Reply-To: <20120502144008.GF2194@S2101-09.ap.freescale.net>
References: <1335939209-15625-1-git-send-email-b32955@freescale.com>
 <20120502144008.GF2194@S2101-09.ap.freescale.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iPQgQnIfnJgj1mPLQMhq"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
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


--=-iPQgQnIfnJgj1mPLQMhq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 22:40 +0800, Shawn Guo wrote:
> On Wed, May 02, 2012 at 02:13:28PM +0800, Huang Shijie wrote:
> > add gpmi support for mx6q.
> > add DT support to mx6q and mx28.
> >=20
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
>=20
> Hi Artem,
>=20
> As the patch heavily depends on mxs device tree branch, I think it will
> be easier to have it go through arm-soc tree.  If you agree, can you
> please give your ack if the patch looks fine to you?

I do not mind if it goes via the arm-soc tree. I cannot really review
this patch - it is too big, I think it should be split on smaller
chunks.

--=20
Best Regards,
Artem Bityutskiy

--=-iPQgQnIfnJgj1mPLQMhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPomP1AAoJECmIfjd9wqK0rr4QAMCVM3ZYJOKQshaSrrPwVgVb
aoSiGGKRqpNfDIlN5nGCWdg8I4VvHoUoa62k4aF204cD1ZBegOynbIM70t4145rW
W4bqkIkwT39aK2mnnf2VECdpcTpQdBxwEjq7W06UtIUX5cPxbf5ZP9pG6wt8UEot
3508avu94KeRwWs5gEwHbyFU8FaLFMgjwv6a/Fqce72BQvfkgOlYwIHM7f/OEMXW
Sqxz6b3fcvtdoSI9ZytHRvO6qeKx86AAZYe+O1rKdVmlOF9nD6FI//UqwxCixxvB
PzPa4t6tZDx8JyQZGZIgwaToj7POa4XR4qBP14jF/LJeHZTRCl2btNqYJrKVq97I
mbPQrqQ8Fi4n5DuYzAfaldIiFLmoiw/jT0HsEurP0nHIVAy7JbWn7YCmDf6YewXL
1cvhzZDsQ3ojC7vvk8fP7zmghQxNYqytkpX/3Dw7nZ6WjikzDpvx/l6zEL84LfMF
dQtibX2ymqPty8RKjZzbG138ChUkrsEzrw+GKFVKncaTQL7cR7qDQtPjx9hAEzfd
kImQyPUlDM+4jOr6V5hxldeeQ6XDn4+bkmgr29Jy3pLG00PoejhKD06Sj6GshN0F
LOvg8KQiF1RnwyiEx1od6RAVpUDbPi495Qa2zx02E7e/Dr+vaTWrZwafcC71w9HA
AoumN749plmGvd97c3LK
=isXq
-----END PGP SIGNATURE-----

--=-iPQgQnIfnJgj1mPLQMhq--
