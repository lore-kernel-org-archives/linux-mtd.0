Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1p3X-0006ml-It
 for linux-mtd@lists.infradead.org; Sat, 22 Apr 2017 07:02:10 +0000
Date: Sat, 22 Apr 2017 09:01:39 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Dipen.Dudhat@freescale.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170422070139.GA15339@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20170421154903.2782cd06@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Maybe I figured it out. Unfortunately, it is only compile tested. Does
> > it look approximately right?
>=20
> Yep that's definitely better. Just one thing missing (see below),
> otherwise it looks good.

Thanks for review. Unfortunately it is still untested, so...

> > +		if (res < 0)
> > +			mtd->ecc_stats.failed++;
>=20
> 		else
> 			mtd->ecc_stats.corrected +=3D res;

Ok, I copied this from tango_nand. I'll submit a patch to fix it
there...

> > +
> > +		bitflips =3D max(res, bitflips);
> > +		buf +=3D pkt_size;
> > +		ecc +=3D ecc_size;
> > +	}
> > +
> > +	mtd_ooblayout_ecc(mtd, 1, &oobregion);
> > +	BUG_ON(oobregion.length);
>=20
> Probably something you should check at registration time only.

Drive defensively, buy a tank ;-). Ok, I'll delete this one in final
version.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj6/9MACgkQMOfwapXb+vL7PwCgp8GSbGRWMzs5hocN/NitXE0H
5R4An3UdBqXduj6GqEjDj+FkMROCdRRK
=lrJ/
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
