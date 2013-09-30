Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQRld-0006Hh-Cv
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 00:55:17 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH [mtd-utils] 2/3] mtd-utils: new prompt() helper for
 talking to the user
Date: Sun, 29 Sep 2013 20:54:56 -0400
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <201308241919.43159.vapier@gentoo.org>
 <20130917003549.GJ4550@ld-irv-0074.broadcom.com>
In-Reply-To: <20130917003549.GJ4550@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11066679.bPvbV8i9Dt";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201309292054.57815.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart11066679.bPvbV8i9Dt
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 16 September 2013 20:35:49 Brian Norris wrote:
> On Sat, Aug 24, 2013 at 07:19:42PM -0400, Mike Frysinger wrote:
> > On Wednesday 03 July 2013 22:01:52 Brian Norris wrote:
> > > On Wed, May 8, 2013 at 9:27 AM, Mike Frysinger wrote:
> > > > --- a/include/common.h
> > > > +++ b/include/common.h
> > > >=20
> > > > +               if (strcmp("\n", line) !=3D 0) {
> > > > +                       switch (rpmatch(line)) {
> > >=20
> > > rpmatch() is not POSIX-compliant and is not available on my uclibc, so
> > > this breaks my compile.
> >=20
> > i added this to uClibc already :)
>=20
> So I have to upgrade uClibc if I'm going to upgrade mtd-utils. Nice!

it's a one line change to a header file that you could easily do locally.  =
no=20
need to be facetious.

#define rpmatch(line) (line[0] =3D=3D 'Y' || line[0] =3D=3D 'y')
=2Dmike

--nextPart11066679.bPvbV8i9Dt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSSMvhAAoJEEFjO5/oN/WB/r8QAMGlYUfzBZcGZf5oxR/PPcaY
p6Njo6CoTEJUWjwsrskXPJaBHgY74uQ5INho/0iH36vD6Rch15JbyL9XqNbq71Px
mHKpA4n00fsUAZ0kgj3vvTXYP5eFS/YKwH3iNfMSJUSqIPvALj4V3f3qg2cRaAtd
HGBD1JhRWroYDP+2Jeqo90rAh+gKS/FXsJdCUd7lcmxl/pCBb3YCfuWVv9o2BWyY
B+XNhxkl2Lhd+yNeCFWuW6V9IiXSeIoq+sHXfULlMcf1JG7hSNIE4C7TWB8xwMI/
TRMdoTD8evVUal/qR+HNrcmy06LyC5ALMmkLZ/NMe+yVfr7aldUPLNKXoaPL+uWU
NIbPsA4ykZpifz3qrR9PJZtOS0q2RbWbgHVXoPrYmQ0/gMMoL6Fl0+Pi0rEH9I4V
rSZKa25BiIf4wyNXGELZv+Tm8hWqvXfGbgOcSsXPI1om2K5Ftny7l/YvpqiQ90Gx
1+l3Wzl7I5+mByIaHEU2tQlWMwVzBQXMN3JeNV7xgX4w3PlTF0LK7Aq7uwcCC8U9
XCZjXU3KhHUrd8UPWVwPf2s3wJm5YLwVOfFVBDsC+YW+SqsB+IL2KZI0AW+L54wW
2S4AID8tGut+4KQGaSkcjwNmvvxwnl6T74/v4q8zcLDAZqsJZYEMalQRXh/ttKtd
Ixf5dUbvMld2icJdlGqo
=L1TL
-----END PGP SIGNATURE-----

--nextPart11066679.bPvbV8i9Dt--
