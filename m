Received: from ozlabs.org ([203.10.76.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1Oqe-0003QR-0m
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 23:17:13 +0000
Date: Fri, 10 Jan 2014 10:16:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: please, remove UBI tree from linux-next
Message-Id: <20140110101632.1e698592a51c7b533be8d129@canb.auug.org.au>
In-Reply-To: <1389285200.2259.147.camel@sauron.fi.intel.com>
References: <1389285200.2259.147.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__10_Jan_2014_10_16_32_+1100_kl.QgDnaYOXpCq8K"
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__10_Jan_2014_10_16_32_+1100_kl.QgDnaYOXpCq8K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Thu, 9 Jan 2014 16:33:21 +0000 "Bityutskiy, Artem" <artem.bityutskiy@int=
el.com> wrote:
>
> could you please remove the UBI git tree from linux-next?
>=20
> git://git.infradead.org/linux-ubi
>=20
> I will use the UBIFS git tree for both UBI and UBIFS patches from now
> on. The traffic became so low that it does not make sense to keep 2
> separate trees for these very related subsystems.
>=20
> The UBIFS git tree is also in linux-next, so both UBI and UBIFS will be
> covered through the UBIFS git tree.

Done.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__10_Jan_2014_10_16_32_+1100_kl.QgDnaYOXpCq8K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJSzy3UAAoJEMDTa8Ir7ZwVCeEP/1cWQnbN36XIllfTTkqNkFEg
WACwm4uUjMWHgcnO5unqFYG40cVPm2cB31DJRJ9lz7sLjBR00Q4sqauyFDr+pQtX
+J5K5jjvI0erT1w/oDZsgMbg2dLWmsaAn5EwaC7BQUN8txbgHg7z7UPVU69ZVHX/
tHZ9en8ZyEwiw/ypgsRsptCGIkAg1Z4XPl0hGITadNPKw0YfBWuXsnRRvC678nKI
ZP/hgwgkhNQ2iaw/txF7nGVvGo3hg/99VrCgkxggICGTRqRjQafvjNxlJR5EVWwQ
ecJi7d9P8a3cJe4jCVSp/IaMkF4oaZd/b3fBt+NkhI33DFIW7dh0r5QHcuNh8aDf
iZJHeD/mu2IzQTMQ2++W/XjJy+R/6bJEC3GrW+jTXbUEny2gbafMCVrBtjvQQ/cu
91ht7hfl+EmRIvR62jpQP3Caut4yyHyiUTnMuv9OGAhSESGyNeyw7Ch12Xxq9RYB
zlijY6EIcrz31PxLYI+veFIu6B0LvfJsSEHiHbRiSNIQMAzRPjjYZQsWGhqYMGgP
v7+uQViLOZ1XoHr8YJSTOSICH+HrIDUHBqY/kOsgmjh/o2oQ4G9TJFO3CRhlNywW
fwDt03Di7BhjPNoohuYxMN9YruFKixTZUVXkPCHR5qLR+HN4DV0MsZdx8fjzrFmx
ImMLRh/afBQu3OqZEDSr
=+jGa
-----END PGP SIGNATURE-----

--Signature=_Fri__10_Jan_2014_10_16_32_+1100_kl.QgDnaYOXpCq8K--
