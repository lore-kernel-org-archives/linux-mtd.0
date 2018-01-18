Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecFtR-00016t-Ba
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 19:30:35 +0000
Date: Thu, 18 Jan 2018 20:30:15 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>, richard@nod.at,
 dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: ubifs: noatime support?
Message-ID: <20180118193015.GA24748@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Ubifs seems to have atime support these days:

          sb->s_flags |=3D SB_ACTIVE;
#ifndef CONFIG_UBIFS_ATIME_SUPPORT
          sb->s_flags |=3D SB_NOATIME;
#else
          ubifs_msg(c, "full atime support is enabled.");
#endif

Which can be configured at compile-time, but no option to disable it
at runtime. What is going on there?

UBIFS: parse noatime
UBIFS error (ubi1:0 pid 94): ubifs_parse_options.constprop.5:
unrecognized mount option "noatime" e
mount: mounting ubi1:log_volume on /mnt/log failed: Invalid argument

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpg9ccACgkQMOfwapXb+vKYwwCaA62JVdeZyAP2Jp9RYVFNMMdK
8BQAnjHYqzIbJswJWxAn73EpBINgNUfE
=OXzL
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
