Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etgqu-00020z-AJ
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 21:44:03 +0000
Date: Wed, 7 Mar 2018 22:43:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com, tharvey@gateworks.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180307214342.GA9852@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <6772577.AmT7QaWTNU@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-03-07 09:01:16, Richard Weinberger wrote:
> Pavel,
>=20
> Am Mittwoch, 7. M=E4rz 2018, 00:18:05 CET schrieb Pavel Machek:
> > On Sat 2018-03-03 11:45:54, Richard Weinberger wrote:
> > > While UBI and UBIFS seem to work at first sight with MLC NAND, you wi=
ll
> > > most likely lose all your data upon a power-cut or due to read/write
> > > disturb.
> > > In order to protect users from bad surprises, refuse to attach to MLC
> > > NAND.
> > >=20
> > > Cc: stable@vger.kernel.org
> >=20
> > That sounds like _really_ bad idea for stable. All it does is it
> > removes support for hardware that somehow works.
>=20
> MLC is not supported and does not work. Full stop.
> If someone manages to get it somehow work, either with hardware or softwa=
re=20
> hacks they are on their own.
> Having it in stable is the only chance we have to get it into vendor
> kernels.

Can you show how it meets the stable kernel criteria? They are
documented in tree. This should not be in stable.

And I'd like to see changelog improved. Real reason MLC is not
supported is upper/lower page parts on MLC. And real fix to work with
bigger pages in UBI.


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

iEYEARECAAYFAlqgXQ4ACgkQMOfwapXb+vL/RQCfcpBSzmmWE68AU/fR354AZh14
0bkAn1T3J8vwYErdMbytKXu7fUJ4kbvO
=uVCT
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
