Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkWyu-0008Sw-4i
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 08:22:56 +0000
Received: by iakk12 with SMTP id k12so672653iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 00:22:55 -0800 (PST)
Message-ID: <1326183912.8847.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 10 Jan 2012 10:25:12 +0200
In-Reply-To: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nLNq5bjnPcfdoBwFguaM"
Mime-Version: 1.0
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nLNq5bjnPcfdoBwFguaM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-03 at 16:05 -0800, Mike Dunn wrote:
> This patch adds a driver for the M-Sys / Sandisk diskonchip G4 nand flash=
 found
> in various smartphones and PDAs, among them the Palm Treo680, HTC Prophet=
 and
> Wizard, Toshiba Portege G900, Asus P526, and O2 XDA Zinc.  It was tested =
on the
> Treo 680, but should work generically.
>=20
> Since v3, this patch adds power management functions, a scan of the facto=
ry bad
> block table during initialization, several fixes, and more extensive test=
ing.
> Also, the platform data header file, which only contained partitioning
> information, was removed.  Command-line partitioning can be used, at leas=
t until
> an mtd parser is written for the saftl format with which these chips are
> shipped.
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Would be nice if DoC guys could also fix huge amount of GCC warnings -
there are DoC I/O macro definitions which produce a warning every time
they are used - very annoying noise. I guess those macros can be turned
into static inline functions? Would someone take the initiative?

--=20
Best Regards,
Artem Bityutskiy

--=-nLNq5bjnPcfdoBwFguaM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPC/XoAAoJECmIfjd9wqK012UP/18nWxbYO5hLdobd2SKQtjRr
o2YaeS4Inv/Za3swjtoXNLuFRjPGGCOZIUo1OfxKCNulR+tZoxjm4xzsz5W6pcWW
fpGn9Tv+zT2TyZc8rA4cyfKK1EOlOaoQiytpnMWvCkB7BX1guuqs8b0jmw7YUbDw
zUUfdk9A6oiQeDM1/TkxAexesXhsneikIuUJij+rAcgXGYN2+Xmh5exqoLAqd/zm
OcwWeWevN+0KFFDrAOnClmPbUMiEn9YHMvxiKy218Nv9joayhexFyD06/Svh0+YC
pB63+WXAAwqK15hnZ3cAcXpU/RHy5OYYA8VrcAOPZ3X3CuKXOERTLk/Yp4cJau78
PIX4a6toOkT7BvbEpRZPFGvQLOo5weKvnQfdaP1iCSIgi/9lEAuVTRBVyA5CnstB
y+oe8YriA3cSe3sJJlX4fieOZSKm3m2Ts41o/VvmgGY+CNUKxOAMWuUAMQ2IvUCl
SCNt5PuP9iMS33fSP4VBvI4Gt2NJBTgdhwoGirW/2L7oVaeWBDLUqPpzzHc+dnHr
mO+dWq1SK/kwQbjlePYlpc7xLfplyxn/tGALbCfZdqGCzIF3+dsceVEwAUtvcPN5
Y69ERoBKPvBc+I/2wB3i+qYxp2WumA4749O+sUPiURvuDKFgBURv+RPojbL2U/2a
JAay64bbeDr1dfgBFWn2
=dm3s
-----END PGP SIGNATURE-----

--=-nLNq5bjnPcfdoBwFguaM--
