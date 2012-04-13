Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIk4f-0004K5-Bo
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 17:14:17 +0000
Message-ID: <1334337435.13160.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH mtd-www] UBI FAQ: suggest omission of vol_size option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Fri, 13 Apr 2012 20:17:15 +0300
In-Reply-To: <20120404212706.970C69D401E@zog.reactivated.net>
References: <20120404212706.970C69D401E@zog.reactivated.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zESxkQUakGBsz1uRTtEA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zESxkQUakGBsz1uRTtEA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-04 at 22:27 +0100, Daniel Drake wrote:
> OLPC set vol_size based on the size of the target NAND and found out
> that it resulted in some systems being unbootable, where such systems
> had a lot of bad blocks on their flash.
>=20
> For distributors such as OLPC wishing to maximize robustness in the
> face of varying bad block counts, it makes a lot of sense to avoid
> the vol_size option and let it be calculated automatically.
> Document this.
>=20
> Signed-off-by: Daniel Drake <dsd@laptop.org>

Pushed both to mtd-www, thanks a lot!

--=20
Best Regards,
Artem Bityutskiy

--=-zESxkQUakGBsz1uRTtEA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiF+bAAoJECmIfjd9wqK0+JcQAIfHjF+2i5IEBfOarskHZqcU
Cpret60VBMZHSmkWCppe9nHDGwUQ52gVwDo8kmngMdaMyeiAeUe0w2Nm7+Qmlv81
7yNh9WnEiVo64GUjuR+V/ztzIyeiNFODPOkCfdpYWngQ8G5FV2ZWgxQZvBTak6/d
sOVWXGfjNfY166JrKLIBqR1y4Rh/iagyUQ1A7sxdOBq4Evy3Ik/Sj/RZiRN4fGWp
ZX7+YFERqc5HEuKW7nVxlhbaN4WVExtOpx9XAHBv4/qrk/9R9EQ69kjfkfxthN0u
kScxAEli+DKjvkVLm1dppTXkuPCKdD9hEHJb1tlsJPDSZDUcgmxtHx/1+zUocj7A
kOOs4bRsXoFt+ZE1I9HsrC/uWotnA1NDTBNI8nCe/68upFGMjWp8jdR9gMhV1hrN
gxOTcIwduauO+rlSyTfyeMD6c0Ft1ZyGvLef8udForBIPyl71GznYsVW91NUlOE9
Dzdibj7h/h8C8mOocUb9oJMweRqeeMSkosLvpP4Bcm5QNQmHty9scijFs9Yq45dO
JhoO3Gf/y1lmz0w0Sktnace3FcxSFHm9pq4DIANPtTC6geDdOgI7q2gabjS7bZAD
Iqq6wBpq3XYOLiSbgoGdd2i4ckOR4MnZ2Easoa6LLEKXuT95KCBFdYALhjk5M1Gu
qqlorB0j10bMG8pEX/am
=bnYv
-----END PGP SIGNATURE-----

--=-zESxkQUakGBsz1uRTtEA--
