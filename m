Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaTEP-0007FD-Jk
 for linux-mtd@lists.infradead.org; Thu, 09 May 2013 15:58:10 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH [mtd-utils] 3/3] nandwrite: add --input-{skip,
 size} options
Date: Thu, 9 May 2013 11:57:47 -0400
References: <1368054125-32214-1-git-send-email-vapier@gentoo.org>
 <1368057794-32735-3-git-send-email-vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9C32D8@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C32D8@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2181179.1apU6QZ9T3";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201305091157.48673.vapier@gentoo.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2181179.1apU6QZ9T3
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 09 May 2013 06:42:01 Gupta, Pekon wrote:
> >  	pagelen =3D mtd.min_io_size + ((writeoob) ? mtd.oob_size : 0);
> > +		imglen =3D inputsize ? : pagelen;
> > +		if (inputskip) {
> > +			errmsg("seeking stdin does not work");
> > +			goto closeall;
> > +		}
> >  	} else {
> > -		struct stat st;
> > -		if (fstat(ifd, &st)) {
> > -			sys_errmsg("unable to stat input image");
> > +		if (!inputsize) {
> > +			struct stat st;
> > +			if (fstat(ifd, &st)) {
> > +				sys_errmsg("unable to stat input
> > image");
> > +				goto closeall;
> > +			}
> > +			imglen =3D st.st_size;
> > +		} else
> > +			imglen =3D inputsize;
>=20
> [Pekon]: It would be good to check that both 'inputsize' & 'inputskip'
> are multiples of:
> -  mtd->writesize : if not using '-o' option, OR
> - (mtd->writesize + mtd->oobsize): is using '-o' option.
> Or Simply, both arguments should be aligned to 'pagelen' boundary.

mmm, i don't think so.  the input alignment (inputskip) is entirely irrelev=
ant=20
to the output.

as for inputsize, we already do that check.  if you read the code further=20
(like 5 lines below the diff here), you'll see the --pad flag handling.
=2Dmike

--nextPart2181179.1apU6QZ9T3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRi8d8AAoJEEFjO5/oN/WBFXgP/j8eqSGLdN9goovnmRqjZc8C
zvqWsfKGfK/YTT34+vuAeD0xDhLBWOENqBYQixOK7rVMh4KjfghRftgXsspgQiYf
JomZuon6y0VhGx9YOhdHwY1KA+0ysOnDWQ52F+LcKqBSiNvMhx0b1d7nz7oqg0t5
kw6rKtNfHdsU8GjrE2SmX3OLEUkHCEyDhOYAlCG4aesT/r3nW3haf0PVCDFxpBM9
yGR0VJweS9U8AhDFDilU1ua/G56JFrpUnjV+vsbsz12h2J78ElXo/aL9b20XfjtZ
QoBv1R26XwTln/m4PZgwP4C/XqFtxPiWcIaaffyj/snAb6GUGUDm7r0QvZvk+/SM
YT8tn+me5jEzVLKKtH/qm1s8ZK7/DXW2MXO+19GyYKTMkdUuT/+18l3QxcrnGbJ6
mPE8PMUezXIHAi+px8vHeggynO/7RTeR979tzBHNmFiT09NOWWc2xAyudLWzkduv
gY84sSjriKEO4I6wgFbssjy2s0mMxi6wt2ztNM3LKJ8WddPCMDi6h6lD59zc0wz9
j27ApeyfyVNsU1e1u4db2vHhGOM50xCrrapRzTVns2hjC2MkELxZJAL7iZS22nYi
r1DWzKZJspRli7eGUXhHRiTDxpWl8g0QaC9PSvsg+QY+PaNxljak8LrW5PusVnLi
NukJI+muukIdK3vnzjnw
=1IPU
-----END PGP SIGNATURE-----

--nextPart2181179.1apU6QZ9T3--
