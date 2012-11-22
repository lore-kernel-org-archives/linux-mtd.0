Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUeI-0004Ho-TJ
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:08:51 +0000
Message-ID: <1353582575.2701.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd cs553x_nand: Initialise ecc.strength before
 nand_scan()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nathan Williams <nathan@traverse.com.au>
Date: Thu, 22 Nov 2012 13:09:35 +0200
In-Reply-To: <1353541372.12585.14.camel@laptop>
References: <1353541372.12585.14.camel@laptop>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AJLtNBYWMPGfI3eUi58P"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-AJLtNBYWMPGfI3eUi58P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 10:42 +1100, Nathan Williams wrote:
> Loading cs553x_nand with Hynix H27U1G8F2BTR NAND flash causes this bug:
>=20
> kernel BUG at drivers/mtd/nand/nand_base.c:3345!

Pushed to l2-mtd.git, added

Cc: stable@vgen.kernel.org [3.4+]

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-AJLtNBYWMPGfI3eUi58P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrgfvAAoJECmIfjd9wqK0iv8QAJ45xmmUBmwrUWPhwa2txCtq
lcAAh3sUpcRFZCJnu79UKweqYES/TKVpS/+Z1HR0sMzAOXRujFYqEGT1enXMXpfh
Z3zrLijzDpVrc2543u2g4gppOjEYvY5ax0hCAR27Rc1lq1Y58QVpN64cepHVpJ6p
uMiQhQE4s0bMecPCaT4fD/f6Fc6SkSewCEmeusK+OTLoIDyjD5z9yVviZSBhEk9r
UFPTxp+P8zPUQzuRCdtBGnjTcXgil+SXYUPzfsaVDVbvprNSjJY2UvsveVfSZLeL
oOg/YL61qJdEXp7q4vStZgwRH/brr39I39MuNXnVZQjdJa2z8dgouc4XP1S41kND
AIhbsKpZPF8WCUGN2bNhf6r2VdNeQZU5/jiDyCRHQy4H7q5Hwb3JDIKzPIP7T15N
Z5n35NAA7lh5pB5CDzdp8KeXt30p60+G0Gk7oNcdQwL1hTxpe0m30M00i3lBCa5p
eshNZb9kwh80p1UnHaS2Oj6Zd2Fvarn+1yewugZZ+H/X9vqAcLvPfdAIa6g5fJXz
Ps2B9G6UpBnAsZl8q3MH10SC73NJrB8mIde2iHVWUvppEC1n7AHcQnDbt9IwH/VU
sF87EqZnC5fUzmg3GycaBNjhc5AIe0pRA9h/4bqe3TWkN3KV8/ukvb22x4mc4QXT
2gLo3++NBN45eenDEw5b
=ESjF
-----END PGP SIGNATURE-----

--=-AJLtNBYWMPGfI3eUi58P--
