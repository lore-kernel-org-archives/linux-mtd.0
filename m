Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGBuc-0003yF-Nx
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 22:16:20 +0000
Date: Thu, 1 Jun 2017 00:15:54 +0200
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
Message-ID: <20170531221554.GA25597@amd>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
 <20170531204913.GC16962@amd>
 <95d9297bf6604c1f8fe9c36a231b8a06@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <95d9297bf6604c1f8fe9c36a231b8a06@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > You meen "errors =3D 0"? Does that actually make a difference? It is a
> > local variable, and continue makes sure the value is not used:
> >=20
>=20
> I missed the 'continue' statement there. In that case we don't need to=20
> reset 'error'.

Yes, thanks, I wanted to double-check. If you could take a look at
PATCHv2 -- it should have the problems fixed. Your Acked-by would be
nice ;-).

Thanks a lot,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkvQJoACgkQMOfwapXb+vLKjgCgtWKrx5yA6FCAXasnn385wRFV
2JgAoKT/MWklvLkxz2/ufslLoDYBfnyF
=DMKL
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
