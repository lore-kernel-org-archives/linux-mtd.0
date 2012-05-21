Message-ID: <1337589270.2483.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] GPMI-NAND: Define ecc.strength
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 21 May 2012 11:34:30 +0300
In-Reply-To: <4FB9FCDE.9070803@freescale.com>
References: <1337571865-8016-1-git-send-email-marex@denx.de>
 <1337587991.2483.65.camel@sauron.fi.intel.com>
 <4FB9FCDE.9070803@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HCQjI70AZdXlEaQri7G/"
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
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


--=-HCQjI70AZdXlEaQri7G/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 16:29 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B405=E6=9C=8821=E6=97=A5 16:13, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> > On Mon, 2012-05-21 at 05:44 +0200, Marek Vasut wrote:
> >> The ecc.strength wasn't set, resulting in the following crash:
> > How about ccing -stable? Can you find out which commit broke the driver=
?
> >
> The commit cfbc855b (mtd: nand:add sanity check of ecc strength to=20
> nand_scan_tail()

OK, it is not merged upstream yet, so it does not need the -stable tag.
Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-HCQjI70AZdXlEaQri7G/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuf4WAAoJECmIfjd9wqK0LrgP/1j1X/+Ae/wqp/NCnUHm6ydf
scT70aahIPtpyf+ICgXoUJ1yi4zu0z6acQj3RDTgR2/Zx2NnYgODZyiUgDMLH2nH
0fW8C+RZPCtjTis9csjKWzVre+m9Q0uxCcucSjnS9eEbXoB+FEs1ucv9xkn2oZQK
8kcK/6UNuIAqUauYaDH2QGNY30xD1/YYJE4q1g4JLezW4p3U+zxtKJWEJ9ZVyUt0
8R3SCh8zWvLfz6TFJt9qR6gS6K4zt6/Y6WeBMthxEoHY6Om1MwI2RrxbtFPO3KB3
70hlDjJ+To69ffLt92Xi+i0q5vSW2vNT6wjNpbaWMxquzwomJsjFTMLpzuBjZcyE
Ae/l2QxQ5rOzWgQhvH2ayk64Y8rkjnfl2h0+bSlvwTknxx0sjJT9q4ywqGqapVIA
EKTsvuNSUD9KLms0NET3X/piAhG29xCv0SR3lTORNQGSheNKYDl33hPTXYoMu+al
hmdoBftX8rJq0Y6Qzt1ti4sVmIYSvgzIKoaiO8UnVlPlSYOqDv5zJEPONfG52eT7
Kh3FiBlFtWSYbDoLS2Ouc4B7fTHgwVVH5OllGqsypRVlXU66uXmcUfsitE8bvKSz
10HDMZu/8d3Aun+umTjAa0KDfRqrffCGJE398YsbDabd+70PSh9oLqdxepf0CW4M
AsyTQXBmmCOYIwQ57JW6
=TX4A
-----END PGP SIGNATURE-----

--=-HCQjI70AZdXlEaQri7G/--
