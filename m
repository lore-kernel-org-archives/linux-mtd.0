Message-ID: <1334333373.13160.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd/gpmi : do not include the mxs.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 13 Apr 2012 19:09:33 +0300
In-Reply-To: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
References: <1333247817-18472-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-v1Le70Zrq51dlcviCLfY"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, w.sang@pengutronix.de,
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


--=-v1Le70Zrq51dlcviCLfY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-31 at 22:36 -0400, Huang Shijie wrote:
> The mxs.h does not exit in the mx6q.
> So rewrite the __mxs_clrl()/__mxs_setl() and remove the mxs.h.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Pushed  to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-v1Le70Zrq51dlcviCLfY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiE+9AAoJECmIfjd9wqK0SPAQAIkkOvwGVEpNSZL1km96wYF6
20g0Qd2ISE956SrbbGpQc3EvxRQ02nxFQWvCYFXvdcd5o6Pw4sC+D2I9mLm44wQw
qZBDa5mfklN/toSK7MHIJFZqIBNtQcf9UgVSeo91XWPbgrr9OKWQiyGzd0Scp3DG
4u0inFIfAHs0e/aJY4Tltsz/LUnswIqkzPfAfRb3zw29c2wvP1CXK8yYngA9ZDtu
wOgNEVJ5pRbuZGbnDvijuOsbljTxkV4tEPklWpsRjI0+t2lo9ZYgncsJgNEG2Ozd
IbXIsfrLWHKM9E+Px3uwf/+9FkXCooGgcDCSy3XgxRAC43/QCljlqBUYG/hASMcx
38l5ZcuPOO9lFea5x4u73naEd5JM6fjDw0Zm00hijyfSxsAQFgUC4Zoj4DZ+nl6n
FzsIChZXPcAk0bmr61qt9lUs3QOBFVy4Vlg2hDbaGMnShP1jPbVA+KrjrFlF1hIz
YWUy6J8XY2DcUUP0V0KnZsVgYxYrj//kJk1Fy0F2pSs3jlRsr769ml0jvliHp486
CvaPlY4cWxKQMwIi8sRHLc+3dTtqaOXiHPE4C928aYF5LAmC+BZxz2nGxDboJPkD
qbi/cbYlvwNoqkWvEYmDZK/tBvkUwIMdYDWWNOIwwv8RPxFLQ+h/1duI5YPWojdG
/BVgzhvtXOQ6AzDHPw6K
=452J
-----END PGP SIGNATURE-----

--=-v1Le70Zrq51dlcviCLfY--
