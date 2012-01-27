Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqlcP-0000Br-Tm
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 13:13:30 +0000
Received: by dadz9 with SMTP id z9so503359dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 05:13:28 -0800 (PST)
Message-ID: <1327670133.26648.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd/nand:Fix wrong usage of is_blank() in
 fsl_ifc_run_command
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Date: Fri, 27 Jan 2012 15:15:33 +0200
In-Reply-To: <1326859991-7469-1-git-send-email-prabhakar@freescale.com>
References: <1326859991-7469-1-git-send-email-prabhakar@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/l8yZfJW974mBC31yWcY"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Poonam Aggrwal <poonam.aggrwal@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/l8yZfJW974mBC31yWcY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-18 at 09:43 +0530, Prabhakar Kushwaha wrote:
> Freescale IFC NAND Machine calculates ECC on 512byte sector and same is u=
sed in
> fsl_ifc_run_command() during ECC status verification. Also this sector is=
 passed
> to is_blank() for blank checking. It is wrong at first place because
> is_blank()'s implementation checks for Page size and OOB area size.=20
> is_blank() should be called per page for main and OOB area verification.
>=20
> Variables name are redefined to avoid confusion between buffer and ecc se=
ctor.
>=20
> Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>

The driver is not in 3.3-rc1, so I skip this patch.

--=20
Best Regards,
Artem Bityutskiy

--=-/l8yZfJW974mBC31yWcY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIqN1AAoJECmIfjd9wqK0gbIP/iyK9JJBinXxp8RLUcvgpTs/
5tqnrR6oBpBRoHFfLU46pskKRXYVtD2mXMkgSTXt32R6HOpxgnzToS/sg3R0Vpz6
SNEIJH3dZzcjYtFF+5iJDNEnZvMtuNMdvMSq4sIF5lY2dzGkjOd/KTb+860fYY6T
tHgxyrhVrVwitoRUauybdEAJG7gXdGjzrPEexbtzEPsSeKcfZ8ObMVwZCZ98YH4q
zm1dWbt4cV72Y08tRpAtb2h++ld1PEm0wkD/oj2we9BsRBJlPSzo8OqCIXcb7JWv
mxbp+3xBahz0hdSrVOI0uOrPDsgnmfGsAe4FflUJrQEaxdIP7whJC7BYRUbboHIa
TsBcnAXmciz6Z6wMd7vU45jYbv/3+P2kI7pBZpQoxZBGSdy4KpIMog6gjSXvFIs1
mzd+VKChsIn2bYAK7kqTDTrU20A/XG5Xbu8BDY1GgHguwjjy7zu3HCedLVZvoGpS
ey+X25L7vORLo/RRmxT7s4v9Tq9CbWQH3JpKNjMGlessFwOGucN7tXBS64l1tE4l
XW+7zUm4XQz27dHggtbXoBQLVp/4g3QPFq8i7Q3/pN2xFQoqfss3frjrYxxktlJl
JK/f4VmSHywGMPYmeAM8TcqDI5TuRtuqPb7XUp2SK/foepIgAPb2pjscmygTfrK8
HZlPEe5Q8wrd6ttTAwyh
=RCir
-----END PGP SIGNATURE-----

--=-/l8yZfJW974mBC31yWcY--
