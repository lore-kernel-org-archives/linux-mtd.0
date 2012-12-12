Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tio3F-0004do-Km
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 15:16:50 +0000
Message-ID: <1355325438.3400.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zach Sadecki <zsadecki@itwatchdogs.com>
Date: Wed, 12 Dec 2012 17:17:18 +0200
In-Reply-To: <50C5FD4A.6090405@itwatchdogs.com>
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qfucCHryNieXtEpkQpYm"
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


--=-qfucCHryNieXtEpkQpYm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-10 at 09:18 -0600, Zach Sadecki wrote:
> Always report corrected and failed ECC stats back up to the MTD layer.  A=
lso
> return max_bitflips from read_page() as is expected from NAND drivers now=
.
>=20
> Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
> Acked-by: Huang Shijie <b32955 at freescale.com>
> ---
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   27 ++++++++-----------------=
--
>   1 file changed, 8 insertions(+), 19 deletions(-)

patching file drivers/mtd/nand/gpmi-nand/gpmi-nand.c
Hunk #1 FAILED at 921.
Hunk #2 FAILED at 946.
Hunk #3 FAILED at 996.
3 out of 3 hunks FAILED -- saving rejects to file drivers/mtd/nand/gpmi-nan=
d/gpmi-nand.c.rej

--=20
Best Regards,
Artem Bityutskiy

--=-qfucCHryNieXtEpkQpYm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQyJ/+AAoJECmIfjd9wqK0eswQAL7FFOH1YJ9vrwW/fmbqkAOL
lK3+ESyY/BzYjOSBXXh22FZsJFKEelwtaxrRwG3S5MkSQEOZdzETREv/KLHMgR1V
hxlvK9e5hlGB/hhhWaZNCenMOay1FAgUHObsJn6QJLBCHWifyGURnKZP9TrNvf88
udf3LhikyiKzIhxHIE/+P1nGajy6ZKuqgIRXPCT3Xz4jPA2pMDmGFzk3O4rkVA5h
WYuNdk6aG52JpUk/0hm/2QT3bOI7MPPnO29eBp+41tyoDJ31W4F0ghRjCl09WYTY
t4aCigXKZXcr+ZIofE4gExhiC1SZdoVAC8ynFyDRiBmH9g9SBknqKAsTe1vtLCJ/
+iIw39rYHgwkgC8GqvrTRtOcansLb6UlPkWrsXcflNlwfREI+UTGPXRApKRU/YMA
+XcO9EmT2fcTeNqjF7s2PbJNXqWkS7DnFj2ugD+MxDVpS7dctxtL0W9G9J1zKrin
v9s8pYFCGt9FE6Vobx1oOhtEPrw+OhAR40/a2Er6uYDhaSuX51vXRVw4t71OMLa+
lDD/SRPNJlVNBBl8O7O46U3glD3Z/NwFiVmTPOBax1hJBynC5qAwfmHtiMHgFRWB
0D3pxBMkL/dK45apgKLWsMax082QGzeM613a92pd406NEkEsb0wZXhP4ndvXc5OE
f2rCqBWJwQrexUtjT9br
=3gms
-----END PGP SIGNATURE-----

--=-qfucCHryNieXtEpkQpYm--
