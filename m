From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 12 Feb 2003 15:36:28 -0700
Subject: sharp memory leak
In-Reply-To: <1045072520.12666.53.camel@tubarao>
References: <1045072520.12666.53.camel@tubarao>
Message-ID: <1045089388.12666.92.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-myRpfaxD47kplKDEkUJd
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

s/linux-2.4.20-pre4/linux-2.4.21-pre4/

Grrr!

On Wed, 2003-02-12 at 10:55, Thayne Harbaugh wrote:
> I've been sitting on some patches for a while and have not sent them
> in.  I saw Jorn send in the patch for the missing cfi_cmdset_0020 and
> decided that I need to get my submissions in befor Jorn sends all of
> them in.
>=20
> Here's just one - it's a memory leak in the sharp driver.  It's not huge
> and will likely never leak, but it needs to be there to balance the
> kmalloc().
>=20
> I'll send in the other patches separately.
--=20
Thayne Harbaugh
Linux Networx

--=-myRpfaxD47kplKDEkUJd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+SsxsfsBPTKE6HMkRAlYiAJ9biAKx9kqQTK3n2fbvG8uLrd8psgCeJApH
04OvmLCF7jWzG6HSnTAjaoA=
=0TQK
-----END PGP SIGNATURE-----

--=-myRpfaxD47kplKDEkUJd--
