Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RrrFj-00019P-0U
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 13:26:35 +0000
Received: by pbdx9 with SMTP id x9so4613432pbd.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2012 05:26:33 -0800 (PST)
Message-ID: <1327930095.13286.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 30 Jan 2012 15:28:15 +0200
In-Reply-To: <4F263AD8.7030809@newsguy.com>
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1327673847.29385.4.camel@sauron.fi.intel.com>
 <4F263AD8.7030809@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-V4ZaHAOL/GciPgzloilx"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, robert.jarzmik@free.fr
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-V4ZaHAOL/GciPgzloilx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-01-29 at 22:38 -0800, Mike Dunn wrote:
> Because the driver uses the mtd/nand interface (unlike the docg3).  It is=
 on top
> of the nand infrastructure code.  Specifically, nand_base.c and nand_bbt.=
c.

OK, thanks. On an unrelated note, you can now submit your patches wchich
add the bitflips stuff. Make inline functions non-inline, and hide
things there.

--=20
Best Regards,
Artem Bityutskiy

--=-V4ZaHAOL/GciPgzloilx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPJprvAAoJECmIfjd9wqK0aPAQALc/4yaiRp6ft06n+IFSuTPp
AdcTPpDMOchsAkOx98RJEbPVqSbkLUHrmw/S3KcEJOZE8ZBJ4NOifETR2Bi7Sdt0
aFhvdVazh7D42ASZpwXPY29Y2s2NbEeLPJukhuxpuWPqgEarqkNKHgg821LpxbOJ
nEVf2hau5eL207oZ3DqNzjBexQuyMJ+Ag+STxr0bFfo3pRlUHA0YQGlFSnm09qKq
kuvegX6z22Ea0Wj7tluuhSs8AWKBA6qdAhENrue1FhzpOb2GFM+Hp9UAiHgzZTus
Btep5xqOc/evHOzavjgQW7/Jp8QMfuGvsqeeQA3Fe3gUS0gdx4htIUW8M7pli8Rd
dmVv3NggWT4doW4ediBHHUZQIIApfETa+0K72orK60VcbaNgb7jF2G6PbLjvZ44L
IFy9u946ZkYjLrlLKhXrLe+H4z+xpaBk8UR/BLVzLV26pGorAUfZgzJ8f2/swgDQ
FWm8nMnAid+4oC2aKfboIIJSlYEuDn8XexUqgumHOcxbABxf6FdQumfIEOpw7MBt
E49fdkqR4Y/SImKsi7F+W108NRGQKJED01TXcL6qaSvaVFFaUzte7vb188vrxPIk
GufKW3+VB546K6bLUQtZqS5Q1tz97l8A3FRqxjkcL4snqKCjYeolkSc5Uy+pDXDk
VsLH5zQkD6b/tNcPv4hx
=22r4
-----END PGP SIGNATURE-----

--=-V4ZaHAOL/GciPgzloilx--
