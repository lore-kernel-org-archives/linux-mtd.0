Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGVlk-0000RI-7f
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 14:05:48 +0000
Message-ID: <1348581950.24309.4.camel@sauron.fi.intel.com>
Subject: Re: [MTD-UTILS] BUG: ubiformat fails on big partitions (>4Gio)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 25 Sep 2012 17:05:50 +0300
In-Reply-To: <1347460639-3241-1-git-send-email-richard.genoud@gmail.com>
References: <1347460639-3241-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-V9TLbWW3BO8rJdONFXRK"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-V9TLbWW3BO8rJdONFXRK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 16:37 +0200, Richard Genoud wrote:
> The offset (which is 64bits when mtd-utils are not compile with
> WITHOUT_LARGEFILE) is calculated like that:
> offset =3D nb * size;
> But nb and size are int, so on 32bits platforms, there's a possible
> overflow.

Pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-V9TLbWW3BO8rJdONFXRK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYbo+AAoJECmIfjd9wqK0LC4P/AkI+GZaMmLTY985Yu2oToyr
r/uZ4guTOYSHEI/c3NaO4V2zJjkwjwKdFQpELhsm8IuCEmm8feCYSR+EA3GXiqRx
+yI1AjqIIdsHUQLCsfeH+gVWCguC0hfl+m0e1bdPtc5tS8sbNZSMS3w1hARpyRIA
SzjDrIV06wpO7XmvkEOk/Ovqg3hmhJleoTbMVWhxCi/bbHHC6LtZoLCwlU4VDPue
AI5XoHyp8NMcxT7AnpvH4bxCJuS1TXmgLYpH70YunBDG1rG8z0Mw0jpCxFXaibGt
RCvp/VmWy4vxAGeBaK9qkQ+Vi5F3hmJEDJ2wbqcqoRsFqI5SmHbFq+948KhHLwQl
t78qD3h5ox+KPlV6lqkVYuK1WX62/LftJb/0aOHvMK43CFD70OQ5eKOqmNmmxTfn
LjrGbX8eWNILmYFU5R709lcDbSoP8HzNf8gCeKxOmt0GxjmfQLXxQYGvY0wv19LT
1iLmI0ynluLLv/HhFQbmeNnw9Cy0XfXoV9Jnvc9fHjOBvzztX+EjJxBx85IEr+4T
kJ9LpfPk/WAie6T11DmErSMeHNR2CjWfdQztqloSu+38Ba23ZAcB5a2ZSkgSXa6G
0OYbzh39/zphxyDz0WX8mhnlbMcfFcA/DsoGL1T/xbpCil3CbMM7/GJlsiZPa+kS
l7bIdp18kCN8w6YRdNJW
=wMho
-----END PGP SIGNATURE-----

--=-V9TLbWW3BO8rJdONFXRK--
