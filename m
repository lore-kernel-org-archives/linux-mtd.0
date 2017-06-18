Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMX6c-0007nY-41
 for linux-mtd@lists.infradead.org; Sun, 18 Jun 2017 10:06:56 +0000
Date: Sun, 18 Jun 2017 12:06:26 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mtd: block2mtd: Add support for specifying MTD write
 size and subpage shift
Message-ID: <20170618100626.GC20211@amd>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at>
 <20170605112145.GE14675@pali>
 <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
 <20170605112508.GF14675@pali>
 <79f3b92f-5be4-8d46-985d-0b38cffd6032@nod.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline
In-Reply-To: <79f3b92f-5be4-8d46-985d-0b38cffd6032@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>> Am 02.06.2017 um 17:43 schrieb Pali Roh=E1r:
> >>>>> It is needed for creating emulated devices suitable for using in UB=
I layer
> >>>>> and with UBIFS.
> >>>>
> >>>> Why?
> >>>
> >>> ubifs depends on write size of nand. And without those parameters as
> >>> specified in cover letter I'm unable to mount N900 rootfs image expor=
ted
> >>> via block2mtd. ubifs reject such image.
> >>
> >> Hmm, so you render block2mtd into a semi-NAND chip? :)
> >=20
> > Probably you can call it like that. But it is still MTD device...
>=20
> This is what I meant in my other mail.
> You add NAND specific properties but still denote it as MTD_RAM/ROM.
> I'm not sure whether this is a good idea.

Can you suggest any other way for Pali to mount rootfs image on his
PC?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllGUKIACgkQMOfwapXb+vK7ogCgjYcfUThJBj/7SABEnYyP0Lhr
zhEAn1KO/5G7/HhwV/hboemb+3+bpQRP
=A3EQ
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
