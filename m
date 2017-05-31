Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGBxM-0004bs-Lu
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 22:19:10 +0000
Date: Thu, 1 Jun 2017 00:18:46 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>,
 "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mark.marshall@omicronenergy.com" <mark.marshall@omicronenergy.com>,
 "b44839@freescale.com" <b44839@freescale.com>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Message-ID: <20170531221846.GB25597@amd>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
 <20170529104838.48225166@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20170529104838.48225166@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-05-29 10:48:38, Boris Brezillon wrote:
> Hi,
>=20
> On Thu, 25 May 2017 23:33:43 +0000
> Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz> wrote:
>=20
> > Hi,
> >=20
> > We are also having the same problem where the IFC (nand flash) was=20
> > reporting ECC uncorrectable errors on single bitflips with erased pages=
=2E=20
> > Applying this patch with some minor modifications seems to solve our=20
> > issue. We are still doing more testing but recent results looks promisi=
ng.
>=20
> Pavel, can you send a v2 fixing these problems?

You should have v2 in your inbox by now.

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkvQUYACgkQMOfwapXb+vI/1gCgks6xW5tCCQEZzvdocVvqTjBT
AokAoINOsI84mcsUsLJupAMx6W+RDb9/
=si1P
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
