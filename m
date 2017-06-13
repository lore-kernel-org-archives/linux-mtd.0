Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKh7k-0002R7-Ph
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 08:24:30 +0000
Date: Tue, 13 Jun 2017 10:24:06 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
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
Message-ID: <20170613082406.GA16252@amd>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
 <20170531204913.GC16962@amd>
 <95d9297bf6604c1f8fe9c36a231b8a06@svr-chch-ex1.atlnz.lc>
 <20170531221554.GA25597@amd>
 <1496872770936.46522@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <1496872770936.46522@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>=20
> Looks like uboot has similar IFC driver. Do you have plans to apply this =
change to uboot as well?
>=20

First, sorry for the delay. You are right that u-boot needs similar
changes, but we do not hit the problem in u-boot so it was not
priority.

Thanks for handling it.

									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlk/oSYACgkQMOfwapXb+vJkIQCgj/omCFvqVSZqYCoVzg/cr3pI
YcoAoImiyCFKJti8lxd60dx8KralyCsf
=w84v
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
