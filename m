Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CSJNb-0006kG-5Z
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 13:09:10 -0500
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41938F11.3040903@imc-berlin.de>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<41938F11.3040903@imc-berlin.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-8VLHLO4pWX3zxLxGP8Vg"
Date: Thu, 11 Nov 2004 10:45:38 -0700
Message-Id: <1100195138.12104.17.camel@tubarao>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8VLHLO4pWX3zxLxGP8Vg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-11 at 17:10 +0100, Steven Scholz wrote:
> Jochen Karrer wrote:
> > Hi,
> > jffs2 did not work in linux-2.6.8.1 because single word writes at the e=
nd
> > of a buffer write are done with the wrong address:
> >=20
> > --- /home/jkarrer/kernel/linux-2.6.8.1/drivers/mtd/chips/cfi_cmdset_000=
2.c
> > Sat Aug 14 12:55:20 2004
> > +++ cfi_cmdset_0002.c	Thu Aug 26 14:33:42 2004
> > @@ -1128,7 +1128,7 @@
> >  	if (len) {
> >  		size_t retlen_dregs =3D 0;
> >=20
> > -		ret =3D cfi_amdstd_write_words(mtd, to, len, &retlen_dregs, buf);
> > +		ret =3D cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),=
 len,
> > &retlen_dregs, buf);
> >=20
> >  		*retlen +=3D retlen_dregs;
> >  		return ret;
>=20
> As far as I can see this bug is still not fixed in 2.6.9!
> Is it done in newer versions?

It's fixed in MTD CVS.  I don't know if it has been pushed to Linus.

--=20
Thayne Harbaugh
Linux Networx

--=-8VLHLO4pWX3zxLxGP8Vg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBk6VCsYFQl3A+qS0RAqxuAKDL13wVDo6o+ecoW0dGu6labAK1SwCg1n3q
R9ryZjyYWlay2CQHyzLnVo8=
=56nE
-----END PGP SIGNATURE-----

--=-8VLHLO4pWX3zxLxGP8Vg--
