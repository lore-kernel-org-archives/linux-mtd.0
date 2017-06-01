Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGPuM-0000c9-CZ
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 13:13:00 +0000
Date: Thu, 1 Jun 2017 15:12:32 +0200
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
Subject: Re: [PATCHv2] mtd: nand: fsl_ifc: fix handing of bit flips in erased
 pages
Message-ID: <20170601131232.GA12630@amd>
References: <20170420002748.5c76c9b9@bbrezillon> <20170420114057.GA4705@amd>
 <20170421105107.GA7259@amd> <20170517122224.GB583@amd>
 <20170517143211.205ff5de@bbrezillon> <20170517130059.GA3437@amd>
 <20170517152548.6d52c41b@bbrezillon> <20170517200305.GA12537@amd>
 <20170531205917.GA21878@amd>
 <3ff6a5a52b4744caaa481d482cab54bd@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <3ff6a5a52b4744caaa481d482cab54bd@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-06-01 01:09:17, Darwin Dingel wrote:
> Hi Pavel,
>=20
> Just a minor thing. Sorry about the late comment.
>=20
> On 01/06/17 08:59, Pavel Machek wrote:
> > +
> > +		res =3D check_erased_page(chip, buf);
> > +		return res;
> > +	}
>=20
> Can we just remove 'res' and change this line to:
> 	return check_erased_page(chip, buf);

Well... I originally had a printk there, and yes, it can be
simplified. I can roll v3, if required, but I'd leave it as is -- it
is still convenient place to add debugging to.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkwEsAACgkQMOfwapXb+vLQigCgro3v+EDZoM+eiFsLJxZxuk0k
Ls0AoJuA0FUInHXxEjQRB9Pawkn9U3SC
=xzuG
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
