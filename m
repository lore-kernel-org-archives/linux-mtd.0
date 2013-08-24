Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDN7i-0005x7-NF
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 23:20:03 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH [mtd-utils] 2/3] mtd-utils: new prompt() helper for
 talking to the user
Date: Sat, 24 Aug 2013 19:19:42 -0400
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-2-git-send-email-vapier@gentoo.org>
 <CAN8TOE8zAiSxxB5X_wVJ+=Fi8tSDoFEDatRRY-qQy9805J5H=Q@mail.gmail.com>
In-Reply-To: <CAN8TOE8zAiSxxB5X_wVJ+=Fi8tSDoFEDatRRY-qQy9805J5H=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2795729.KHBhcX3Opo";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201308241919.43159.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2795729.KHBhcX3Opo
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 03 July 2013 22:01:52 Brian Norris wrote:
> On Wed, May 8, 2013 at 9:27 AM, Mike Frysinger <vapier@gentoo.org> wrote:
> > --- a/include/common.h
> > +++ b/include/common.h
> >=20
> > +               if (strcmp("\n", line) !=3D 0) {
> > +                       switch (rpmatch(line)) {
>=20
> rpmatch() is not POSIX-compliant and is not available on my uclibc, so
> this breaks my compile.

i added this to uClibc already :)
=2Dmike

--nextPart2795729.KHBhcX3Opo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSGT+PAAoJEEFjO5/oN/WB/PIQALwCCycXFbPCVyKEEnODDzAt
UwwSspY7e151efczyBiFWaC67zKtyqfAtrhdIwGIuC3DIz1630zVrZIpvbiAdsUS
cTg8wapU9JEvGBtogV/dd/uK6FC8DYWYs/3qmT0cdhNGhWhFd3aDpM6ABczo193V
RIEGMfwW/Bfx1mNGVMuniYzrd2t4tfi3yXozhBWQ4dV+bt9lhLawsu2nQ/HcdPBv
OchUJ8mUZ3tIEoSVTzjl31OQ3sQjTE51VdkZzIknWc7Zq1MWaIaWR18pxCcVt7Hm
boimRUikMFxqEpzpg3rQ6ESff/zoUxTra+1rKoaIeFW0X2Vp0Yh8QPLjWHGAeV6y
JCMd2BFU1CoK45JS37sXHUy4BbKC0CdCVoBmwIbfVWuuvRSfYFKYY68BytD7Rccl
Ir0UU7SBsheX9lLic/81jiWKyf+BSmdOTDbuLP65kd+KbpCWmkwywRXxcS6cy+0Z
BpgrYJqTZtKRJfaKD6PizlxbPeOjbayV8NRq+o96TpgcDhPkQKKVgYjEzJbBCeZG
/kwqRQ/k+8x+0UAelL2cBBXAUksWekTf+u8h2StVJzUs4iJokcxnH9hDtjV6zvyZ
ZLBPVnCs4r1FkebBBmsJOilYMGe+uGz6GIL7w6MG7KZaxi2go/NVdoQGmeJGqLz7
2iK3WewZ5MRsyKdplhK6
=v49A
-----END PGP SIGNATURE-----

--nextPart2795729.KHBhcX3Opo--
