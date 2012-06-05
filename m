Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbtET-0002UR-GH
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 12:51:35 +0000
Message-ID: <1338900917.2507.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: add JEDEC ID for w25q32wd to chip table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "ing. Federico Fuga" <fuga@studiofuga.com>
Date: Tue, 05 Jun 2012 15:55:17 +0300
In-Reply-To: <1338900730.2507.49.camel@sauron.fi.intel.com>
References: <1338478732-31992-1-git-send-email-fuga@studiofuga.com>
 <1338900730.2507.49.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-b2Pqr3kmW0lMDCF5K4Hu"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-b2Pqr3kmW0lMDCF5K4Hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-05 at 15:52 +0300, Artem Bityutskiy wrote:
> > +	{ "w25q32wd", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
>=20
> It is w25q32wd, not w25q32wd.

Gr, "dw", not "wd".

http://www.nexflash.com/hq/enu/ProductAndSales/ProductLines/FlashMemory/Ser=
ialFlash/W25Q32DW.htm

--=20
Best Regards,
Artem Bityutskiy

--=-b2Pqr3kmW0lMDCF5K4Hu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzgG1AAoJECmIfjd9wqK0nYUP/iWs69HQaYDtJvxOm1uaTKtt
XNyckYSRpxEFCS2uqsYrA/27xo98IYUeadtYaPwXeyxl9Ovqv61qJdUhgGeUfmXp
jBnaitQeLsbajTaXb2OzdQVifg5m8BjbAO6Dpi4onCuXcARo/hCPTmTnZp/kdXv/
IE8hPCI+m7yUsMesJbFcYw2pInNfi+NOFlHDa96RvUi4oGd6A3pK+hP1dzh2eFbI
Zd3rAaVinU4WtiXznNc+S/M0RDVxQu8A2PEyXrhLgb5Q6G5vSjilXBrgzxgDiGgx
hsDhnFzUsQ3YlbQ/4NahnP9+lgqZDBblug13+6sIjEuIxVdMMjey46ddCN4JbxHh
yG1hNel5DTn/3pryzd8hSMyVkxDPCtOee3JYwEQz8bnLO+dUzKNsj9bw5kn8iAsk
a1IkTW8MsZ4r5FO5p7sMj/127vz+vAH6BkpyyUvOonFUb748W7eh2Fj+PQcQUXaF
Y6jBIC5O1r94IPWxearycGXnkrAwOw9UpkHZJCnubAGPzgnA1U9zId0NesoR8Dr1
XdXpSnbKWwaTIQo2RA1XaBH3gu20xjO98euSn060JLIi3O4QufZ6h3A3NmmNnaLU
z6pIDmXhDDzLfnqYbm8SsdA82l67LPlv9rHeDYExZBPY/e9ROLsSko5pyWDjHIIW
LGfQuV+5fWn/SFVkj1xq
=OZxw
-----END PGP SIGNATURE-----

--=-b2Pqr3kmW0lMDCF5K4Hu--
