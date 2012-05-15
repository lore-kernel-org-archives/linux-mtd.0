Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUEyG-0001Mu-BE
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 10:27:12 +0000
Message-ID: <1337077840.2528.151.camel@sauron.fi.intel.com>
Subject: Re: How common is OTP support in NAND flash?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Tue, 15 May 2012 13:30:40 +0300
In-Reply-To: <4FAFC468.8080701@grid-net.com>
References: <4FAFC468.8080701@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lewZx4/2DX4wtPEq3SxM"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lewZx4/2DX4wtPEq3SxM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-13 at 07:25 -0700, Subodh Nijsure wrote:
> I see that MTD char drivers have support for programming the OTP pages=
=20
> on NAND flash, some questions regarding that.
>=20
> Do most flash chip vendors support on-flash OTP pages or if one develops=
=20
> product that depends on using data from flash OTP, one would be locked=
=20
> into that specific vendors.
>=20
> And does anybody know if these OTP pages are also subjected to=20
> bit-flipping or one shouldn't have to worry about that for OTP pages?

I think this OTP stuff is ad-hoc and was not designed carefully. I
cannot tell for sure, but most probably this is very vendor/HW -
specific.

--=20
Best Regards,
Artem Bityutskiy

--=-lewZx4/2DX4wtPEq3SxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsjBQAAoJECmIfjd9wqK0D00P/R549CZFqTiPtiq8Q6VhrIf3
DP8fdITztvGkLCYkQcVtrklWWk1b0Z8UaUKwfTrA3zM76gJyDpDl5XtmHMXMKDZX
9T3gSpCyeCX2TRHshnRLxwl94CBiNUg9RnEpqecmoto9jLC0l/dNBoq3jl+x6Esi
PRZbXhwwVta/Ji1mh+N7Nu7aiwyIgklNlncCmcdWp8xprhAJTzG9uaWwh662IXbm
YUhSDJsCDo/JAQ0KvrBWA79gX5kDmlNR0DcgCeBi7ZeFVNEgXhpzDNLOXNLDrNCP
LhZp6OU3CBh3uaHo6vs+naBvlTCqyfk654vNssXbWD6tZuJP0P/5VrtFeO05Qoe9
DUYW3BDfMPwbvseXq0VzGe8fKUPYgvfU85ljMNYhYXqa7siJRdl5M2/tJ2embzJp
7yQHcsWAGIK+47g/ZvcFo3JZ8onWHfENw48CAqxYk9a8iBCDd4giAvyKZl1bIV9U
hWYpaqNyIgPWqrK1t4GdnwMmtSnb+vbZ41WxQ6niFiEyLVO4yK/oVlLT039hsUux
QxxEJNOhszuOhvAjZ9jRBuM3F3K+74jddhXjLjXpGnma8cQ7VXwTjfzljFAajmYx
hqQDGDYmRyA8Xv4p+dmvD8OrJX4FKtpMXx7BVYw/Jidl/vAKyZV0/cN58p05Pb5u
eIh9V/XJRy50awNcj2MS
=+o2j
-----END PGP SIGNATURE-----

--=-lewZx4/2DX4wtPEq3SxM--
