From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 13 Feb 2003 09:02:52 -0700
Subject: sharp memory leak
In-Reply-To: <20030213085927.GA25431@wohnheim.fh-wedel.de>
References: <1045072520.12666.53.camel@tubarao>
 <20030213085927.GA25431@wohnheim.fh-wedel.de>
Message-ID: <1045152172.12667.100.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-ZEJ1/b3Dh5PuYJHL58b7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-02-13 at 01:59, J=F6rn Engel wrote:
> On Wed, 12 February 2003 10:55:20 -0700, Thayne Harbaugh wrote:
> >=20
> > I've been sitting on some patches for a while and have not sent them
> > in.  I saw Jorn send in the patch for the missing cfi_cmdset_0020 and
> > decided that I need to get my submissions in befor Jorn sends all of
> > them in.
>=20
> At least you allowed me to fix my own bug. I submitted cfi_cmdset_0020
> a while ago and forgot the Makefile line. Darn!

:^)

> > Here's just one - it's a memory leak in the sharp driver.  It's not hug=
e
> > and will likely never leak, but it needs to be there to balance the
> > kmalloc().
>=20
> Leak exists and fix is correct. It may also be worthwhile to do the
> following instead:
> 	mtd =3D kmalloc
> 	if (!mtd)
> 		goto out1;
> 	sharp =3D kmalloc
> 	if (!sharp)
> 		goto out2;
> 	width =3D kmalloc
> 	if (!width)
> 		goto out3;
> 	...
> 	return mtd;
> out3:
> 	kfree(width);
> out2:
> 	kfree(sharp);
> out1:
> 	kfree(mtd);
> 	return NULL;
>=20
> Dunno, this is not a perfect candidate for that strategy, but it might
> be slightly more obvious. You decide.

I mostly don't care.  I'm not even using the sharp driver - I was just
jumping in and looking around the MTD tree so that I could get up to
speed.  I looked around at some examples and noticed that something was
not right with the sharp kalloc/kfree pairing.

In short, you make the decision and commit it - I'm just browsing and am
initially just mentioning what I have come across.

Thanks for the feedback.

BTW, my personal style is the same as what you have suggested above.  It
is a bit cleaner and easier to follow for unwinding - IMHO.

>=20
> J=F6rn
--=20
Thayne Harbaugh
Linux Networx

--=-ZEJ1/b3Dh5PuYJHL58b7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+S8GsfsBPTKE6HMkRArpuAJ9PIeJN3vDZmh9KPpVha78UPJSMrgCeL4va
EHoMTrCIEC/So2qr2LrUF78=
=qmvz
-----END PGP SIGNATURE-----

--=-ZEJ1/b3Dh5PuYJHL58b7--
