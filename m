Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmkbJ-0005KF-MS
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:19:46 +0000
Received: by obcuz6 with SMTP id uz6so1591843obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 03:19:44 -0800 (PST)
Message-ID: <1326712888.14299.55.camel@sauron.fi.intel.com>
Subject: Re: linux/mtd/gpmi-nand.h: No such file or directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Rusko <rusko.peter@prolan.hu>
Date: Mon, 16 Jan 2012 13:21:28 +0200
In-Reply-To: <4F1013DC.8040902@prolan.hu>
References: <4F1013DC.8040902@prolan.hu>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eaxJyyc+qZdcE5dTFwpF"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eaxJyyc+qZdcE5dTFwpF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-13 at 12:22 +0100, Peter Rusko wrote:
> Hi all,
>=20
> I can't compile the gpmi-nand module. Currently I'm using the
> pengutronix/imx repository, but I've tried the master branch in
> mtd-2.6-git and got the same results:
>=20
>    CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:24:33: fatal error:
> linux/mtd/gpmi-nand.h: No such file or directory
> compilation terminated.
>=20
> Where can I find that header?

It looks like it has never been added to the kernel tree. Huang?

--=20
Best Regards,
Artem Bityutskiy

--=-eaxJyyc+qZdcE5dTFwpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFAg4AAoJECmIfjd9wqK0QEkQAM4GjGfLRCbmOxVZBGwRhidQ
KCjJUWzAt4SGCrpai/FBX5brJapxAbWCI+7sL1qfnY9D0KaHeb5koNds+jXKZSkB
f8C8rr1Sq1uoCw+OVpfJJFttbDqJzIrlgT7G6Mg6ynAkZf5gjkXur801JgG5bL1p
d3PNM97mC2D10hYXV5uNdd79he4haqVBlRFSiXS6VZ4l3RoNPELkW9b1U9S5JKhR
99LKQR0U+aGp7eiiRqvGU30qNbHxXkYQcHlfFmpata/B5FH5iponduHeMnepwk7a
vRwwgBUI5mY+53Kf5KoQyqbroWKpRN6lSfWgjx2K+doOCxB5S7IoGFkbNRNGW5Ga
6f7PCTxap4WRtb3VyODNrIFeIPDxxdu0/lMmv9G2214EoVG88WVyIM9dAfhmxhRy
rZnr2+2uOevw7si+5oqR5BmNSqzUypIXWn08mMkuwys/9IR4nnwrkSNJfUsHJa1q
CdrnwcPLT444PTwzVb3vJ7mIuukRq95id5yyHjqYKCZjjtSSQhc04Ogj7EGUe4ZB
2gOGsgf+aQcuO53YI49s+0tGi48fejBHxmhlOjdXnYfJSWqa1hxcn7niybyZnj3a
ASNBUCv9hql0e9uWdGPwu5lz4uiheCraa3LlZD5hhTnyP9H07gCDO+3Bwaguxl4Z
vTCUN7uVe8mHzGvgOWxA
=+F1p
-----END PGP SIGNATURE-----

--=-eaxJyyc+qZdcE5dTFwpF--
