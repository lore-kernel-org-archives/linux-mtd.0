Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SYsjg-0000Lz-HZ
 for linux-mtd@lists.infradead.org; Mon, 28 May 2012 05:43:21 +0000
Message-ID: <1338184015.2480.3.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Date: Mon, 28 May 2012 08:46:55 +0300
In-Reply-To: <4FC28D71.1040107@aimvalley.nl>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBF5B20.50406@aimvalley.nl> <1338040835.2525.41.camel@koala>
 <4FC28D71.1040107@aimvalley.nl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3W+70i8zPmwMhnumVRyp"
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


--=-3W+70i8zPmwMhnumVRyp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-27 at 22:24 +0200, Norbert van Bolhuis wrote:
> On 05/26/12 16:00, Artem Bityutskiy wrote:
> > On Fri, 2012-05-25 at 12:12 +0200, Norbert van Bolhuis wrote:
> >> This is not a problem for a UBIFS being created dynamically, so with
> >> ubiformat + ubiattach + ubimkvol ? In this case the size of the lprops
> >> area is determined by the total amount of LEBs of the MTD partition ?
> >
> > No, it is set according to the --max-leb-cnt parameter. Then UBIFS will
> > be able to grow up to "--max-leb-cnt" easily.
> >
> >> A UBIFS volume can then be resized with ubirsvol as long as it does no=
t
> >> conflict with other volumes and does not exceed the total amount of
> >> LEBs of the MTD partition ?
> >
> > Yes, and if you resize withing '--max-leb-cnt', the UBIFS will
> > automatically resize itself.
> >
> > http://linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
> >
>=20
> I was asking because there is no --max-leb-cnt parameter wen creating a U=
BIFS
> dynamically, or is there ?

Ah, you mean when mounting an empty volume? No there is not, UBIFS just
picks some value.

--=20
Best Regards,
Artem Bityutskiy

--=-3W+70i8zPmwMhnumVRyp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwxFPAAoJECmIfjd9wqK0v48QAI2GlA4xY+jClF54Z8KcrSUy
KOKp/0nV3/XAC3NfjJQn8mPNV9LdIL7gPSaFejB2m2ybwiv+7dEXO6ZUpgtLQqwD
4FmNmKIpIql8nFv7fKOQcfOVPHq32HSHg+zr25j+RPDOYXTZ1DlwkwNUMZz16qpo
jiLiPFtt9wzC5+X5TYJbVMiYKjDSnoEM4V9yNnQZ0JcXi3942/L+xrtG39GLeLjr
XaKv5Wo07JF13rsTkFcVBVMph+AWba+PRqY2ILSWPsfjbEGIwJTCH2Mw/ti71ap4
qy3Dd02KfcXjhHxrJ4tisaTmqvLazAEXnnCK0KnbqMpaDVMh+ZNykWpdrc80TcMj
kz0YGIBJCNyBJ4IAhWBF5AB3R59Nq4P/fpwCsbpjo6oyG/faCaVe1T2yTeWiXEd4
3wY+8m194IFaG69P/Nybcdfi3pS+S8TMU57RhlQdZ4NrPS+xJvmrY2HTijrLUpwE
fSqAfGm3daRURgUJ50oy+XqUlWs9IqOTIdworm+jrrU9/rxbHMXL0A2yz6tgrhKr
YOILk2+97ciU2AbsetXD61RqWB1ip8Im2oolBZffbMx8UFYEGzIZ8XAHZd6+p/Uf
7E+iybWBUNGZgg9dO0O87gpKpxAsE0P3XT20Q2Xw5CyEFlc5zofHYBYCh97LIHJs
3m+YTDE4+Qm+mLhU4Y5j
=ux10
-----END PGP SIGNATURE-----

--=-3W+70i8zPmwMhnumVRyp--
