Message-ID: <1346308145.2848.529.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] i.MX53 Nand support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 30 Aug 2012 09:29:05 +0300
In-Reply-To: <1346226019-23560-1-git-send-email-s.hauer@pengutronix.de>
References: <1346226019-23560-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SEEnBzdeue0sTj7Ujgmt"
Mime-Version: 1.0
Cc: Roland Stigge <stigge@antcom.de>, linux-mtd@lists.infradead.org,
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


--=-SEEnBzdeue0sTj7Ujgmt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-29 at 09:40 +0200, Sascha Hauer wrote:
> Hi All,
>=20
> The following patches add i.MX53 and dt support to mxc_nand. This
> is only a resent based on v3.6-rc3 as it seems this series slipped
> through the cracks last time I posted it.
>=20
> So Artem, if there are no objections, please consider applying up to
> 3/4, I would then take 4/4 through my tree.

Please, take a look at the l2-mtd.git tree, I already have all these
patches. Actually, they are already in dwmw2's tree, the and were
supposed to be merged already, but unfortunately the merge window was
missed because (a) dwmw2 did not send a pull request early enough and
(b) Linus decided to punish late pull-request senders and closed the
merge window 2 days earlier than usually.

--=20
Best Regards,
Artem Bityutskiy

--=-SEEnBzdeue0sTj7Ujgmt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPwgxAAoJECmIfjd9wqK0GfoP/1XFsnHM4I7GuY40RGf8+lxH
FRpz2QdKVfR4H5AjAznVJsXvAsasrFvrL0pWFYCDqvt08EQxVShbLPeBNfg2rzgc
Ih4J5WWKu9uV2OvRJADMxcy/TNAqXRaRThx92JVqQIVGo+Q5+2CUAKVq9JXcf3E1
WbVCaNnH6macQ+0lNuugdNMu6G6OypOZ9SWKtm31Zm7l0W80Lq47ZOQegteE2U3T
wv1ii+Ye6NAdBEU0xjQRu93HtYnofb+J+4PIgm6M7tk+IylsTRgvXZyF1sXkds4E
JG0i9Ex17V0WuSlfH/Kf57JvUe0wLkQB1cA/RGNAU3Zy2DlhJvUJsdjYCDO5TvFf
7dRGagCM1AJNrCUWAGg03gYPDij6oSA3JPs3wBq5jTOAV86+vbygskMcQTWFp6ou
kPPeUGy+JlM0y18gm+n4ulere0ITPKPx1r5fKNNiw9KDjfGVfqxBtlrz4Z2/WuBq
mTHdxotBROEtc4ZbbI21/T0Xa0/BaDlNIvEg/ojCnbq6msMCm3uQTde7IrsBtWFb
74TBOe4oAmEX/mQDoNeBUJrU3fZ3mgzPWgu6AN9lYxVGQSjxwDInAQJmP0Z/G/vb
no3D2ZdJWXpwQ+2WWzuP/553WncDfEOhliEhaCs9SB6KapCKH5jNf8HOgdPWUTyh
U2Hcl8PEnuQI2Wr+K91p
=qQPy
-----END PGP SIGNATURE-----

--=-SEEnBzdeue0sTj7Ujgmt--
