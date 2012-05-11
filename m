Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSpuD-0007Qd-4e
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 13:29:14 +0000
Message-ID: <1336743157.2625.69.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: nand: remove 'sndcmd' parameter of
 'read_oob/read_oob_raw'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 11 May 2012 16:32:37 +0300
In-Reply-To: <20120509130635.32973038@pixies.home.jungo.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-z2uxKJFvg3uPHDpbV/UW"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-z2uxKJFvg3uPHDpbV/UW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 13:06 +0300, Shmulik Ladkani wrote:
> As of [mtd: nand: remove autoincrement 'sndcmd' code], the
> NAND_CMD_READ0 command is issued unconditionally.
>=20
> Thus, read_oob/read_oob_raw's 'sndcmd' argument is no longer needed, as
> well as their return code.
>=20
> Remove the 'sndcmd' parameter, and set the return code to 0.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-z2uxKJFvg3uPHDpbV/UW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrRT1AAoJECmIfjd9wqK0rBMP/REITXIhsr3/OtLTZ8B/q0Us
Np7blrBWMFmufgpKa73arimqEm3SmBLQ5CNRdbHKHxcNv8kIIPBHGr6lRqzPevbk
uhOO0A05XaugcSyuN9BQMZurcdCuG6sGQSWyU3qG+5n6EVS5EzyqWhUzZHidljIm
89WAMxrZsWD8EXH7EMNpbRpyvhjs3+fS/juDxw+zD+y/sRB6zCYQ6NQAzu2LYbU2
IXz0NCMtNyEVXUdywCm22CLVzllNX5KW03Cbrc/Awh/NaTXFVb/W3FKostcKtRsg
xV2DjGj2BsKnCEOK8dOmqwHxuSb3lQrtF4fE4XvtM/UIlvaB12nzTJCBQ9gN8tl9
0/ZSd/Q33NWqRf/aIsedyVnxLGl+FTQv1o3qK1uVZrt7O4uuE3efUjj+9f8SMdGb
PC5Vc0VEOzhe/w5S/gHDFfBTypbm7qvNEl4VHOqlRf/kXdfgXue2YoakzcSa1gGr
hyh49QDwO5vmwkzgxGNF6NakSmoYIM62JU4Q2OZoU2Z1IIY+vBwG0JO5ViQnJtl4
vDsko+qgYoHK4770R1foepyzne44DRKXYGd4P8t9P/t87SncDp294ksbrkLghhHN
QN064Rpk6C7Y6FtCNjL6zTrvksO3mfeVruYNyfuCgWiZfwFSl15qVClv/2zukS46
dQ8/NPTNYAwyyMaHWc0U
=dIEN
-----END PGP SIGNATURE-----

--=-z2uxKJFvg3uPHDpbV/UW--
