Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0REB-0002iz-Ct
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 11:55:41 +0000
Date: Fri, 6 Oct 2017 13:55:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20171006115514.GF9497@amd>
References: <20170923201314.GA14742@amd>
 <b45f83d5-6a0b-64f2-2a3a-708e1a1e7f90@gmail.com>
 <20170924102006.5aa42982@bbrezillon> <9307201.RrdVcHfbLZ@blindfold>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline
In-Reply-To: <9307201.RrdVcHfbLZ@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-09-24 10:23:25, Richard Weinberger wrote:
> Am Sonntag, 24. September 2017, 10:20:06 CEST schrieb Boris Brezillon:
> > On Sat, 23 Sep 2017 23:10:26 +0200
> >=20
> > Marek Vasut <marek.vasut@gmail.com> wrote:
> > > On 09/23/2017 10:13 PM, Pavel Machek wrote:
> > > > C++ comments look wrong in kernel tree. Fix one.
> > >=20
> > > AFAIR they are now (sadly) accepted, but this patch works for me.
> >=20
> > Works for me too. Here is my
> >=20
> > Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >=20
> > > Would be nice if trivial could pick it.
> >=20
> > Hm, I'd recommend not doing that, otherwise we might end up with a
> > conflict if a patch modify something in this area.
>=20
> Let's carry it via MTD.
> BTW: Shouldn't it be s/kernel/comment/ in the subject line?

Yes, it should. Can it be fixed while applying?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnXbyIACgkQMOfwapXb+vKmbwCfbw1rP8Zi3VcitdeQ6jx5nhi/
O4wAn3rEQ6Z6Udpin4DnckSixmrnvLwT
=3I55
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
