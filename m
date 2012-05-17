Message-ID: <1337254937.2564.1.camel@koala>
Subject: Re: [PATCH v7 0/3] Add PMECC support for at91 nand flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Thu, 17 May 2012 14:42:17 +0300
In-Reply-To: <4FB49B67.2040705@atmel.com>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337159858.24809.21.camel@sauron.fi.intel.com>
 <4FB49B67.2040705@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zIJGiKXY8vMMLg6bQN6g"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zIJGiKXY8vMMLg6bQN6g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 14:32 +0800, Josh Wu wrote:
> > -----------------------------------------------------------------------=
---------
> >
> > Successfully built configuration "arm-at91cap9_defconfig,arm,arm-unknow=
n-linux-gnueabi-", results:
> >
> > --- before_patching.log
> > +++ after_patching.log
> > @@ @@
> > +drivers/mtd/nand/atmel_nand.c: In function 'atmel_pmecc_nand_init_para=
ms':
> > +drivers/mtd/nand/atmel_nand.c:910:29: warning: assignment from incompa=
tible pointer type [enabled by default]
> > +drivers/mtd/nand/atmel_nand.c:910:50: warning: incorrect type in assig=
nment (different argument counts) [sparse]
> > +drivers/mtd/nand/atmel_nand.c:910:50:    expected int ( *read_page )( =
... ) [sparse]
> > +drivers/mtd/nand/atmel_nand.c:910:50:    got int ( static [toplevel] *=
<noident>  )( ... ) [sparse]
> > +drivers/mtd/nand/atmel_nand.c:912:30: warning: assignment from incompa=
tible pointer type [enabled by default]
> > +drivers/mtd/nand/atmel_nand.c:912:51: warning: incorrect type in assig=
nment (different argument counts) [sparse]
> > +drivers/mtd/nand/atmel_nand.c:912:51:    expected void ( *write_page )=
( ... ) [sparse]
> > +drivers/mtd/nand/atmel_nand.c:912:51:    got void ( static [toplevel] =
*<noident>  )( ... ) [sparse]
> >
> > -----------------------------------------------------------------------=
---------
>=20
> Since I used Code Sourcery tools-chain (2010q1-202) to compile the code=
=20
> and I didn't get any warning.
>=20
> So I am not sure what's caused above warnings. From the warning message,=
=20
> I don't know the reason exactly.

The warnings come from sparse, not gcc. And they are introduced by this
patch - aiaiai informs only about new warnings, otherwise it would be
useless.

> > WARNING:LONG_LINE: line over 80 characters
> > #642: FILE: drivers/mtd/nand/atmel_nand.c:567:
> > +                               a =3D readw_relaxed(alpha_to + tmp % ho=
st->cw_len);
> >
> > WARNING:LONG_LINE: line over 80 characters
> > #664: FILE: drivers/mtd/nand/atmel_nand.c:589:
> > +                               a =3D readw_relaxed(index_of + host->sm=
u[i + 1][k]);
> >
> > total: 0 errors, 3 warnings, 1136 lines checked
>=20
> For these two warnings, I would like to keep it for more readable. but=
=20
> if you would like to fix the warning, then I can fix them too by split=
=20
> into two lines.

Fine with me.

--=20
Best Regards,
Artem Bityutskiy

--=-zIJGiKXY8vMMLg6bQN6g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtOQZAAoJECmIfjd9wqK06tcP/Rqfr1iDnuoH9lWX/fUJG2Rm
c9xx85tKo4Ul5+Zb4nZuuMb6hb40ixTWRPZ8jkOLr9LyX51y83eHO7QEGSOXN82I
gQ0Y1B+5+Zkd8Yw8I33JqRIJs2tQZqZQbbuzvHtGdm+bfBT7IwRFu7Oy4yVZVga7
UxmWTWQiktNfvQPFYvFiXSDY/0lIG/L7BUL6rrpCdRrA87fMV/b4YqQ7QhjLss9o
MaI3CfGq61iXomW0RFwBgo1K42n5cCR27pXqeblieFLbBu1BxUff9yJ80F9Z9s+e
MAwQczwcvc9dNNfWZ2afft/UjpdMkpb57YF82kGzegPiq06yfPAqX+HNL+4koJ1P
cMaBgrVfbR9ff/0yEV8jSYi4brv8xUW3v5xa59/0hpQsEfwyhcLOQPG/QNxfirX5
HLTq2/nro+MGBthmx1P5gVbOz33aqN0HnLQsVASQK7AHJOR/dnmuqNnx9StL/oMq
INbvu+DTWlDBIwZsgsPqIdVRIah1eRO8OQKNLtR5Xz4fRmRXVwyqisU2mXuheu+N
P3kJLNblSnXjlgQPcjrtiaQa3XaazKyoLljVWZqRRP5qsvCwTCMczRv/cajEre7b
a4N956pdOVc8iewnUyKBmkBIwt/iKA5odhUwgofo1/bgt88hS5vL8Ee2Lr/VSsuK
pNd9gssdt22DmvadTFjE
=J9Ko
-----END PGP SIGNATURE-----

--=-zIJGiKXY8vMMLg6bQN6g--
