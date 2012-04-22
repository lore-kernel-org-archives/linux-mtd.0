Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxwy-00028H-6I
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:39:40 +0000
Received: by lagy4 with SMTP id y4so9609724lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 07:39:37 -0700 (PDT)
Message-ID: <1335105421.28267.21.camel@brekeke>
Subject: Re: Why the nand chip driver "should never return -EBADMSG if it
 failed to read all the request data"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 17:37:01 +0300
In-Reply-To: <4F8AD1E5.6080307@gmail.com>
References: <4F8AD1E5.6080307@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3+qsaU+lWmmaKUjBOzWX"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>, zxm927@163.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3+qsaU+lWmmaKUjBOzWX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-15 at 21:49 +0800, Mark wrote:
> And, after I patched the nand driver, in most of the situations the
> UBIFS can be successfully recovered, but I still get this error:
>=20
> ...
> UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
> 2:4096, read 126976 bytes
> UBIFS error (pid 481): insert_node: duplicate sqnum in replay
> mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: Invalid argumen=
t
> ...
>=20
> Does this mean this should never happen to UBIFS? Then what could be the=
=20
> reason?
> Thank you very much, and my test environment:

I see ubi_dbg_dump_stack() call in ubi_io_read() when it returns an
error. If you have debugging enabled - you should have the dump in your
kernel buffer.

Yeah, we should turn it into 'dump_stack()' to always have the dump. I'd
gratefully accept a patch.

--=20
Best Regards,
Artem Bityutskiy

--=-3+qsaU+lWmmaKUjBOzWX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBeNAAoJECmIfjd9wqK0KOgP/35/lBgHtWxUAhBcXMvXMC9t
xDgPiE+y2e77IE11NnBNTjDao0FHFpOWnD1oS8aZP0VbaegacWreMcPQB+r8sJjF
xJcAVqzA1Wypdfaqo9X2wpLX6jsVaE6nWeVTdgS2aGJ1vg8pCBw5H7qqEfa70UAf
g/kBXfocBqfgA//Cex+Dqv5vH+EtEzci4Bh680JAyrLYArtpeXNmG239U5YCWnLJ
ww4RKC1UhZfS9Fu4rQu7Ia6vtb+qtDF2T2Sm6CLASMofv9OkLrO311+l4lI2Yclk
xNY87bUXrd0u7V3TWiDG8Ny/dURKnD3KEr168q5lOi4cZqo5uWa5oBEz7ZEeVHVg
Wngh0MZrMfSmgHRglguAWiYtj5YM6d3oRdWKAQ5eIUgChVVzskPfVxDgOiMq7Vgw
JYG95MJPOFhIzkacoHHaHI5Ozp9lQGdSTBUPI29Tcj7+DzK7JISsq+4rqAg5WOmn
4Tuqwp3nCSZ4h8NOPrJRDBDb5goc39nJfrSwNYHJRX6n5TfmSrCg5r+DyjuiUwUv
8OkV+yOJBW/5SHlCzsTswCaNqx7QTU1z8hqhtlr4kgM02FXJ4khJFIFVqD82Mf/M
9COmI4dFsT+diBAqnkfmsEkyjDxY0nkYWxM5441OhbfQmiLAbzj0iHqIa4h+NCdr
Y8FgMkwRXVaisvI0oj+a
=F60r
-----END PGP SIGNATURE-----

--=-3+qsaU+lWmmaKUjBOzWX--
