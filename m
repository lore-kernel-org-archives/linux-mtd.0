Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjt9y-0007jh-61
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 14:23:58 +0000
Message-ID: <1340807279.3070.39.camel@sauron.fi.intel.com>
Subject: Re: How does UBI FS handle invalid PEB on nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steven Munk =?ISO-8859-1?Q?=D8stergaard?= <sml@rosetechnology.dk>
Date: Wed, 27 Jun 2012 17:27:59 +0300
In-Reply-To: <4FE872C3.1020402@rosetechnology.dk>
References: <4FE872C3.1020402@rosetechnology.dk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gi/AHT+wO0PuwViw4lLc"
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


--=-gi/AHT+wO0PuwViw4lLc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 16:16 +0200, Steven Munk =C3=98stergaard wrote:
> Been reading all of the available documentation on UBI and UBIFS but I=
=20
> cannot  find a clear statement on how UBIFS handles production marked=20
> invalid PEB's, and if their location is saved; So when a format is done,=
=20
> this information is not lost.
>=20
> is there a way to make sure UBIFS allways checks for production marked=
=20
> invalid PEB's when a device is started the first time?

UBIFS / UBI do not store information about bad eraseblocks. This is
handled by MTD. UBI may only query "if this eraseblock is good?" or mark
an eraseblock as bad. The bad block management is done at the MTD level.
Traditionally, the bad block marker is stored in the OOB of the first
page, but there are variations. When MTD initalizes, it scans the entire
flash and reads all OOBs, and builds the in-memory bad block table. The
other option is on-flash bad block table, which is typically stored at
the 2 last good eraseblocks of the flash (AFAIR) and stores information
about all bad eraseblocks. In this case you do not need scanning, which
is faster. There are flashes which cannot store bad/good status in OOB,
they use the on-flash BBT.

--=20
Best Regards,
Artem Bityutskiy

--=-gi/AHT+wO0PuwViw4lLc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6xhvAAoJECmIfjd9wqK08HgP/i5H5aifZVJQZ4vk/8oxIPiR
w2OtCPdYAFFlDafCu/mZuQbRnNaOcLvaIGpwYn0jjORz0D1KrYF7gRuMF8zq4SMt
XwP0gxr1ab/35L60b/v6A9eQyVvhpFnOztsWPQKoc9zXb3CCcWe88m0SynzEaa3f
5OChsloo8yhJ7JMT8e4zB+52iD48Ded0zlhCRuNa3B1WlJXS1ZmJPSQo/nv0AHMg
Za9VcKLWaToMwveYCMT5Ex9D+mpZXoldcnRS/DvA1w0xXBWOaP/J12DgbA4NfnTH
6wf7fdhrpZNR+1NClOtYL40R76NxLo/MnovKA6Htp7Ti/FwPytv6FqlKuf1fB+Cl
JYqaOepEt+nDHMck2ms0vwAXJShxq2bMP+v6o5hCAMiYEXUZdm5/veoD0+YSn31X
jnnwVi192aj3+broKrYbA0vS9tvGflFENMD8HjC2+ACUFtHqoO4Tj+6RtZN6i+ZY
LlwgfMnh0oQFPTX33ppOq7DUe2Ig/NKFRQQR3UPaiT0hO2MZ6Yl2PdYyRZdVgHXr
4LSsT4WcVsmBgARNTKNiCkz6MI1kRHYIfPfHlvWSQDn1Nto9eyZsbxYILIiTnGe1
8iZ4RqT3WHE9XdA/jXyItbWWwl3EeM8W/Iut3litGEMs+oduLPX2bA/MtSucBDZN
yMuJN2D5ri0PPRPUFdE5
=jjg6
-----END PGP SIGNATURE-----

--=-gi/AHT+wO0PuwViw4lLc--
