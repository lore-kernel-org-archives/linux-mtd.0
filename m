Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFRB3-0006EP-QX
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 14:59:33 +0000
Received: by mail-bk0-f49.google.com with SMTP id ji2so2132415bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 07:59:29 -0700 (PDT)
Message-ID: <1348325966.1894.1.camel@kyv>
Subject: Re: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Sep 2012 17:59:26 +0300
In-Reply-To: <1346855725-31726-1-git-send-email-festevam@gmail.com>
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bl7cO22OTilkka65M0jh"
Mime-Version: 1.0
Cc: marex@denx.de, Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bl7cO22OTilkka65M0jh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-05 at 11:35 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> Using module_platform_driver() makes the code smaller and cleaner.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-bl7cO22OTilkka65M0jh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXdJOAAoJECmIfjd9wqK0Pw0P/iBhbsrafjIDMgkE9xyndtjW
WNRXCpubz+1wOGsCjZqok7IeN3VUvaXABxaVi1qq6k2HZyAAPLNFUfGCJT2iZQYh
3VkfTJZAVN7E+AEtoIib6KD0C1CGZMkMT/aZIOGXkA2X/QZIi7bjLIJHnfPToWjN
9hjsYWb53qCY2I/F+EgJdLktb6ZzUeYRK2zQS3lmnGVEUL8ciRjQAOy9MBuaBr1W
DvAo1xtwl0E9GlwvUujQd1r4sxvd1qhM3yJWZKQH3z1/zsg72AMerGUlZP1jI0su
/u+7aj7JT3mJEC4vu9M0toylv00CENAepdNhwCf5QbLql4kzmmbLb9vHc2aUfN2X
bEtb+V2fOb65hwfvytNKcnlXm/H/PtotJDB1qR0qaqLMRHy6HjeFQxbna2Abnyx2
us80D8bWzBvDx55pIKul2d+L55jVs0zN6LN3Y7YA7l/wuwS3+FCNYoE9fjiGaCXD
kUKYmcro6YvN9nB73jfQuHBx1vwVeeL1HKRmigGk8GirOx4sBxJ6ETf8xlP2oEq/
z1CQ6GSkpqKMVAZ0nGZH4R8qS7Qh+mGs1d6zE0ORPUgeBq+7HZH02D9MzXp+DXpg
BLHShVEPv2EzbNxqRr7BN3/JOoSAI/9cgucjZwAjTAr1+a9A61MOdB1vreaqc51b
83ByRJbAQeHC2sqFfNWw
=iWnm
-----END PGP SIGNATURE-----

--=-bl7cO22OTilkka65M0jh--
