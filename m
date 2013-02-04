Message-ID: <1359965326.13791.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: fix a dereferencing freed memory error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 04 Feb 2013 10:08:46 +0200
In-Reply-To: <1358929253-29143-1-git-send-email-b32955@freescale.com>
References: <1358929253-29143-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fFZ0ALzzUp/4vrQ+jhCO"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
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


--=-fFZ0ALzzUp/4vrQ+jhCO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-01-23 at 16:20 +0800, Huang Shijie wrote:
> The patch "490e280 mtd: gpmi-nand: Convert to module_platform_driver()"
> introduced a "dereferencing freed memory" error.
>=20
> This patch fixes it.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-fFZ0ALzzUp/4vrQ+jhCO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD2yOAAoJECmIfjd9wqK0tfUQAJFYhq5M8A7lYuVyvqBP/s06
OP86C3EdxNzF3TvV/m28XplZK1Rno8CHcCVMahCrl22P/4TCAsy9MZaE1xsLo70n
3iRAx/KEkI4V8T9lfHNgucsJm8R1cSzXHbRsecfMC1YrGta9KFAiDBoGX1qzrvHR
cFcg0Jc4HfsJILpPPCGzm/V8vq31P7H4YdLhKHQrT0gCA7FhIXidH6/ONZSYLwAF
zuHs+MJ+uOFl3sGV6pnnS0rlkcc38U5jgXjVw9VyJhbFeJfu7s/VhNGgxJzP8hSn
k+c4yL+J0HrzaJ35wo51/AzBGOCrAT2Y9u2gpj142AqLHUiuV3d7zKnS+hIbkMA0
y6/vXkPFvxeUqj6A8RFTQLijZyV2qreAtvtRpEUSGgMwp7nZ81ZtsnlRha6wx2I2
IUTHNYx/GwRA/g2wd0ocqWVaMiLR1Ns030JEopz2COP/VnRCE99L+KfkaCX4mBCp
peyHifU/2EeXrv402FjgAEgqBxwSekNhYdhYV4AWwa3ciNnR7brrhgVJSgKu7ruR
lsajR05ej9DtJxfXPZP6fusmECo8XYBhBYPOjdz7coDwTTmZ9z5hi/a+tXHkyAJF
wDsgqWj/1nLzE8pXRPaPCsq7o1mCxN7aZX9AnXaXyRMAcvIpwcqTYHCkigidSuvq
8KsJv5o3V4+CEg0uQ9Wv
=HHvl
-----END PGP SIGNATURE-----

--=-fFZ0ALzzUp/4vrQ+jhCO--
