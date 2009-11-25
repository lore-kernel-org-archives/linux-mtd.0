Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDRdg-0003d8-6e
	for linux-mtd@lists.infradead.org; Wed, 25 Nov 2009 23:51:16 +0000
Date: Thu, 26 Nov 2009 10:51:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?IkrDtnJuIEVuZ2VsIg==?= <joern@logfs.org>
Subject: Re: [PATCH 0/17] [LogFS] New flash filesystem
Message-Id: <20091126105103.4b2b4408.sfr@canb.auug.org.au>
In-Reply-To: <20091125155510.GE10944@logfs.org>
References: <20091120181113.GA2159@logfs.org>
	<200911231318.39685.arnd@arndb.de>
	<20091125155510.GE10944@logfs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__26_Nov_2009_10_51_03_+1100_mvK7wAz0.=Lx4JZ3"
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Thu__26_Nov_2009_10_51_03_+1100_mvK7wAz0.=Lx4JZ3
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rn,

On Wed, 25 Nov 2009 16:55:11 +0100 J=C3=B6rn Engel <joern@logfs.org> wrote:
>
> On Mon, 23 November 2009 13:18:39 +0100, Arnd Bergmann wrote:
> >=20
> > It should definitely be included in linux-next, and I guess it
> > should have been in there for some time, to get better
> > compile-time coverage across architectures, and some
> > more testing.
> >=20
> > I can't find it in linux-next right now, but I could be
> > looking at the wrong stuff again, as I have before.
>=20
> do you have a reason not to add logfs to linux-next?

Apart from not having been asked to do so, no ;-)

i.e. send me a request with the git url and I will add it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_10_51_03_+1100_mvK7wAz0.=Lx4JZ3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNwucACgkQjjKRsyhoI8wySACfY7xsQV8+dibyJKsEr5cl4NWT
3j0An3DBUGHzFEyGNp43It93lBTWyzWo
=WJtC
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_10_51_03_+1100_mvK7wAz0.=Lx4JZ3--
