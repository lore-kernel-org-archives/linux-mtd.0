Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wBZ-0002z8-Dj
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 15:52:38 +0000
Message-ID: <1345823821.2848.331.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Date: Fri, 24 Aug 2012 18:57:01 +0300
In-Reply-To: <6233716.oXLBM8tzrg@pali>
References: <8381186.XTLIOQGYR2@pali>
 <1345822171.2848.325.camel@sauron.fi.intel.com> <6233716.oXLBM8tzrg@pali>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zw1ZpJrSgJYBPO3ars9n"
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


--=-zw1ZpJrSgJYBPO3ars9n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 17:48 +0200, Pali Roh=C3=A1r wrote:
> > > BTW, is there userspace tool for unpacking data from ubifs
> > > image without need to simulate nand device in kernel?
> >=20
> > Unfortunately no.
>=20
> Ok. I have patch for block2mtd.ko which allows me to mount ubifs=20
> image in way: losetup --> block2mtd --> ubiattach --> mount=20
> without nandsim. I needed to patch block2mtd, because ubi code=20
> needs correct erase size, write size nand subpage shift and full=20
> image size. So I added params for these properties in block2mtd=20
> code - and it working. But I do not know if this is correct way,=20
> but I can send my patch.

Why do you need to use block2mtd? If you have an image for NOR flash,
use mtdram, if it is for NAND - use nandsim. What prevents you from
using mtdram or nandsim?


--=20
Best Regards,
Artem Bityutskiy

--=-zw1ZpJrSgJYBPO3ars9n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6RNAAoJECmIfjd9wqK0tAMP/1DFdrTQzGjFpPiualiaIiky
yUg0nfleIZ2oKeNN391BpL1y7QYbPftkFsjQiI3PinfwY8rF7CiuSZiDE0FGfDm1
GsYJFZaqvo0vlaCYy60Y6FV50cevPs4j5GlN2TRPOvOdFujs1d21U3YHrJnv2Ltk
3uyGliOrH7iji2GRQ6z340NpfV/NxdsnkPOjuix2D8A5zCXr7kv/oi74wN8AEwbF
exoRrxZ3XSFmX+5CqNxDfs0GGKMTteQEeVcOugc8X+F2Rj3X8O+QsxnX3z4Njl6B
WYj1ArRliXKYv9anEcSiZovVe2B06jniSvWrKaaLHVwffUOcQNU68HquFKccZMFU
wVvlYyUGX8/3778ZiFv7d/UxDgrBOON1DWuBiOLu0nxhT/3WQq+vLIQNNsKpluF6
UHFA7cnx320eSPOlQJ1KsDDAe/YwKWiIAtwCjxm3hs+g/hTeGF3iIgcsZit1qSnT
espIK3v/yq6k/qsVDhrCui88cwKotKjoKRIsPeR1n9PjSK/r5F+jm2yOz1QsMZXH
NIL2fAsA1fEct4/dFtlMhzo5rO1Gn5GcSC7K90l6/j9A+9JPU92XCefQMw3Np4ci
/Rq0qatNolns+RrklwzF8ql+jF0X0DE+482aE2zHhS/osNVUubyfOQCmKK6Qt/Tk
Un+D2cHpk+MJPR1CnuF3
=1dc5
-----END PGP SIGNATURE-----

--=-zw1ZpJrSgJYBPO3ars9n--
