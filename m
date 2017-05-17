Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAxVN-0000GW-AM
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 11:52:39 +0000
Date: Wed, 17 May 2017 13:52:09 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Mason <slash.tmp@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: [PATCH] nand_base: optimize checking of erased buffers
Message-ID: <20170517115209.GA32246@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <421c46b9-288f-42e9-5b2f-d93af1e8a418@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <421c46b9-288f-42e9-5b2f-d93af1e8a418@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This is not true for my platform, as the ecc pointer is
> chip->oob_poi + 10
>=20
> I suppose it's not a problem if the platform can handle
> unaligned loads, otherwise it spells trouble.
>=20
>=20
> > +		unsigned long d =3D *((unsigned long *)bitmap);
> > +		if (d =3D=3D ~0UL)
> > +			continue;
> > +		weight =3D hweight_long(d);
> >  		bitflips +=3D BITS_PER_LONG - weight;
> >  		if (unlikely(bitflips > bitflips_threshold))
> >  			return -EBADMSG;
> >=20
>=20
> The optimization makes sense in itself, but given that it's on an
> error path (?) I'm not sure it will bring any tangible benefits?

Well, if it is critical enough to do magic it does, it is also
important enough not to do expensive bit-counting needlessly...=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkcOWkACgkQMOfwapXb+vJwIACeK3i/PBV99Fw19DYMc7KuCTCh
3Y8AniSKSNKrCfxYiz4ltoJtnx5uH3P7
=zYT5
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
