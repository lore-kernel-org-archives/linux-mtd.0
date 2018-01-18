Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecHeq-0007qZ-Oo
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 21:23:38 +0000
Date: Thu, 18 Jan 2018 22:23:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Richard Weinberger <richard@nod.at>
Cc: kernel list <linux-kernel@vger.kernel.org>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: ubifs: noatime support?
Message-ID: <20180118212323.GA17412@amd>
References: <20180118193015.GA24748@amd>
 <1996634.ggXeMYieCh@blindfold>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <1996634.ggXeMYieCh@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2018-01-18 21:44:33, Richard Weinberger wrote:
> Pavel,
>=20
> Am Donnerstag, 18. Januar 2018, 20:30:15 CET schrieb Pavel Machek:
> > Hi!
> >=20
> > Ubifs seems to have atime support these days:
> >=20
> >           sb->s_flags |=3D SB_ACTIVE;
> > #ifndef CONFIG_UBIFS_ATIME_SUPPORT
> >           sb->s_flags |=3D SB_NOATIME;
> > #else
> >           ubifs_msg(c, "full atime support is enabled.");
> > #endif
> >=20
> > Which can be configured at compile-time, but no option to disable it
> > at runtime. What is going on there?
> >=20
> > UBIFS: parse noatime
> > UBIFS error (ubi1:0 pid 94): ubifs_parse_options.constprop.5:
> > unrecognized mount option "noatime" e
> > mount: mounting ubi1:log_volume on /mnt/log failed: Invalid argument
>=20
> Filesystems don't parse the "noatime" string, it is job of the mount tool=
 to=20
> translate it to the MS_NOATIME mount flag.

Ahha. I was using busybox version of mount. I guess I should check its
config. Thanks!
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlphEEsACgkQMOfwapXb+vKsRwCgq9PPhfP8UWnShfZIojPLNrTL
pLUAoLOUMscU2cNDmmnYpFrpE7ai8Kpu
=5DSq
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
