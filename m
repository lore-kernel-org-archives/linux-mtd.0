From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 03 Mar 2003 14:21:29 -0700
Subject: [PATCH] C99 initializers for drivers/mtd files
In-Reply-To: <20030303210613.GA7875@wohnheim.fh-wedel.de>
References: <20030226205334.GB8966@debian>
 <20030227194424.GC29233@wohnheim.fh-wedel.de>
 <20030227214646.GD8116@debian>
 <20030302185616.GC10681@wohnheim.fh-wedel.de>
 <1046724566.2672.634.camel@tubarao>
 <20030303210613.GA7875@wohnheim.fh-wedel.de>
Message-ID: <1046726489.2672.641.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-VG6xTcuLBgQIdyzP0w2K
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hmmm.  I guess C99 mostly works - with the exception of array
initializers:

[thayne at tubarao tmp]$ cat foo.c
                                                                           =
    =20
struct foo {
  int bar;
  int baz;
};
                                                                           =
    =20
struct foo fufu[] =3D {
  [0].bar =3D 0,
  [0].baz =3D 0
};
                                                                           =
    =20
[thayne at tubarao tmp]$ gcc -c foo.c
foo.c:8: unknown field `bar' specified in initializer

It's the array initialization that I want to use.  Grrrr!


On Mon, 2003-03-03 at 14:06, J=F6rn Engel wrote:
> On Mon, 3 March 2003 13:49:27 -0700, Thayne Harbaugh wrote:
> >=20
> > GCC 2.95 does not understand C99 and will fail to compile kernels
> > that require this syntax.
>=20
> You had me for a moment. But at least Debians gcc 2.95.4 does not fail
> too badly:
>=20
> joern at Limerick:~/foo$ cat foo.c
> struct foo {
>         int bar;
>         int baz;
> };
>=20
> struct foo fufu =3D {
>         .bar =3D 0,
>         .baz =3D 0
> };
> joern at Limerick:~/foo$ gcc --version
> 2.95.4
> joern at Limerick:~/foo$ gcc -c foo.c
> joern at Limerick:~/foo$ ls
> foo.c  foo.o
> joern at Limerick:~/foo$ =20
>=20
> What compiler do you have that breaks with C99 initializers?
>=20
> J=F6rn
--=20
Thayne Harbaugh
Linux Networx

--=-VG6xTcuLBgQIdyzP0w2K
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Y8dYfsBPTKE6HMkRAnOQAJ9NZnPOXRGbE+t0GVcUpKvy+fBB3ACfWAp0
9g5zrdqObx7vv79g80fbU9E=
=zBXV
-----END PGP SIGNATURE-----

--=-VG6xTcuLBgQIdyzP0w2K--
