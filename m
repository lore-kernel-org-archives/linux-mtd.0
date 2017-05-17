Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAxhE-0005uF-Ju
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 12:04:54 +0000
Date: Wed, 17 May 2017 14:04:30 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170517120430.GB32246@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170503200427.GC17315@amd> <20170504104216.0969423f@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20170504104216.0969423f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Hello Pavel,
> > >=20
> > > You may have noticed that ecc_stats.corrected is not updated in
> > > decode_error_report() which is the main code path, i.e. the path
> > > that will succeed 99.99% of the time (HW read).
> > >=20
> > > It turns out that the HW does not report the number of errors
> > > corrected in a page... Instead it reports two values:
> > > 1) U =3D number of errors corrected in the first packet/step
> > > 2) V =3D max number of errors corrected in other packets/steps
> > >=20
> > > Thus, it is not possible to determine the actual number of errors
> > > corrected in a page (unless V is 0). Otherwise, we just have an
> > > interval; let n be the number of packets/steps:
> > >=20
> > > U + V <=3D corrected errors count <=3D U + (n-1)*V
> > >=20
> > > In my opinion, it is better to provide no information than to
> > > provide incorrect information. Therefore, I did not update
> > > ecc_stats.corrected in decode_error_report(). =20
> >=20
> > Well... Having corrected ECC errors is pretty rare, right?
>=20
> Depends on the NAND chip. On modern SLC NAND chips requiring
> ECC of 8bits/512bytes are likely to have frequent bitflips.
>=20
> > So one
> > solution would be to re-compute ECCs in software if we see U or V >
> > 0...
>=20
> Hm, not sure it's worth the trouble for statistics that are anyway
> rarely used, and when they are, are only used has a metric to determine
> how worn the NAND is.

Well, knowing "how worn the NAND is" and "when to refresh the
data". Both seem to be quite important for storage system that works.

> I'd prefer to see a better user-space interface returning the
> max_bitflips information when someone reads from an MTD device (see [1])
> rather than trying to fix drivers to return the exact number of
> corrected bitflips (which might be impossible for some of them anyway).
>=20
> > [1]http://lists.infradead.org/pipermail/linux-mtd/2016-April/067187.html

Yes, current interface leaves something to be desired...

Best regards,
										Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkcPE0ACgkQMOfwapXb+vJRcgCeNgMiJJXfA491gtrnwhGIcMlO
kgIAn31t5a56DDgNwj3qlTygjTrVFxbn
=rUKL
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
