Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SN03A-0004Hx-HK
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 11:06:21 +0000
Message-ID: <1335351951.2094.0.camel@golum>
Subject: Re: [PATCH -next] mtd: fix sbc2_flash build when PCI is not enabled
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 25 Apr 2012 14:05:51 +0300
In-Reply-To: <4F8C780D.9010702@xenotime.net>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
 <4F8C780D.9010702@xenotime.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Gf6yOp/71vBcpW82dVUY"
Mime-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tim Hockin <thockin@sun.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Gf6yOp/71vBcpW82dVUY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-16 at 12:50 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>=20
> sbc2_flash.c is a PCI driver, but its build fails when CONFIG_PCI
> is not enabled, so make it depend on PCI.
>=20
> drivers/mtd/maps/scb2_flash.c:237:1: warning: data definition has no type=
 or storage class
> drivers/mtd/maps/scb2_flash.c:237:1: warning: type defaults to 'int' in d=
eclaration of 'module_pci_driver'
> drivers/mtd/maps/scb2_flash.c:237:1: warning: parameter names (without ty=
pes) in function declaration
>=20
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Gf6yOp/71vBcpW82dVUY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPl9qPAAoJECmIfjd9wqK0eqcP/2ywNT5oHG7e4nV5WvpbZKss
TAsFOEKB3ledaiyZWDBbTcw4gvcbP3qKqN//V0KB40NLuvoDCFrKOq9THWEKe97x
j6wQLDxWlBebUFa17Oan+SqyVPqAY8EAcJBRn+svkC1BmxcEw/K2xeU+Qqwe7eRH
qOX1KGuBJDIhjwnLvSwyHTuVh1dXYazn7JyIEYoqeHjOT/P4HcQiHde2sll0SE0w
nnv+1fQEL4bVFOfex6YnEoHsYQgyLk19cG1tDETHHv2ix6E4goqm1UZV6p+FDNZw
KJKo2c6sM1ajMOXm1l5xBY2zgGIAcu8RWHoSwRmqOucaJeL+TJgATUhXRvCZPuNL
Qhvd2+0hmiIMWxclop+zFLemJnpKiZYCXipmqXE64FyS48btHQBLWVaee3qRkfg4
a9Nm/n2v6IE7nsR0OwN8hUZzrk35jHwuRB2lsG1DfTC1Wlv76uJuQbT4J0tlwW7U
HIkzI7LqbfuacgaznJ12TyQ662v/zGEx3onYBbrwi6s194GRyLbfXp4tU18FMVhU
zLTPO5tWFTpO9uJr8pkhhcfCrGfeiCZwHcXXaqjtXP+qmQ/M/zce5FgDljRN+tov
iVhCPWxVVB9kA6OyCP5DYvDVbdjlKM5A77Q7ZN30uo3hsYfgBS9TXPI7br1yIu4q
IhbZl/teeify0uoFSEu9
=vsCC
-----END PGP SIGNATURE-----

--=-Gf6yOp/71vBcpW82dVUY--
