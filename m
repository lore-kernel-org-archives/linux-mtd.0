Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d60Tl-0003Dn-9Y
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 20:02:31 +0000
Date: Wed, 3 May 2017 22:02:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170503200207.GB17315@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170502114228.299fc862@bbrezillon>
 <dfdc3280-8de9-e215-6bc2-9863c7afd9c7@sigmadesigns.com>
 <20170502142016.024416d2@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <20170502142016.024416d2@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Anyway, I think we went too far. I was just arguing that never updating
> stats->corrected just because you don't know the exact number of
> bitflips is not necessarily a better idea than updating corrected with
> a potentially invalid number of bitflips. At least the 2nd approach
> shows that bitflips were present on the media.

I have to agree here. Indication of "we have errors" is important.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkKNz8ACgkQMOfwapXb+vLwlQCggP3N0YVWRJJma8gEIp1V7fRj
r9UAnRZwOsOYSwPSVDghs8txEBuwuYtY
=Jthl
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
