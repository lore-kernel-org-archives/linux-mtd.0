Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb53b-00013i-Jh
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 07:49:17 +0000
Message-ID: <1353484194.2701.5.camel@sauron.fi.intel.com>
Subject: Re: BUG at kernel/timer.c:1100 when using JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nathan Williams <nathan@traverse.com.au>
Date: Wed, 21 Nov 2012 09:49:54 +0200
In-Reply-To: <1353483457.9160.26.camel@laptop>
References: <1353483457.9160.26.camel@laptop>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-f2vo2f6+caFCXtQD9vL7"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-f2vo2f6+caFCXtQD9vL7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 18:37 +1100, Nathan Williams wrote:
> Hi,
>=20
> I've come across a problem when loading a module straight after unmountin=
g a JFFS2 partition.
> I'm using a Geos ADSL router board with an AMD Geode LX/CS5536 chipset an=
d a Hynix H27U1G8F2BTR NAND flash.
>=20
> I can reproduce my problem with this shell script:
>=20
> #!/bin/sh
> mount -t jffs2 mtd:logs /mnt
> echo "Hello World" > /mnt/file
> umount /mnt
> modprobe r8169

You probably use 3.5? There was a bug which was fixed, try the latest
stable 3.5 version, the fix must be there.

--=20
Best Regards,
Artem Bityutskiy

--=-f2vo2f6+caFCXtQD9vL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrIeiAAoJECmIfjd9wqK0mE4P/1SoaSYVCcjrmLgd+t/fqQs9
/PbBJvO/EgB42oR5GG+7JvL6VbBHbpasgALvYSGGF5zxSufd53omSmEQyhFfIrWm
I1uJJv9gfJB9zgvyhWBdzxKbidY10ecbC/Rw4ukuwvZPU8oqPu0Cv0B0DmEYd8fc
yX//F7UnInASWMcdCVBBZzRhU2E5q1NB1YFy8v7bHbj5vS6FtqaK7eOTBV9pOQ0I
TU2//Ww+z6LrS63ijl7xyvYL66Tdjvi5SSdwdIaZsz/ycf5aRRGSZcO3RisiIGBT
3vlNAo3o4cvzJWWVYtkmOwrPZ4bO9x3rWDQqkm+gaasqvzr+awEt3XqB89MCbNfo
4h3PBVA/M5ubw9BDAXZgPX9GOMNLdzxHOWMyS3FU17wDLojKtXfH70GUvfVL4QRV
u9btssWQ+Ph+uSc/EZB8urHVxd17efgRJruHZSUQMttvaA4Wxqpwv3j+rw5WEhbv
vxQ32dgU46KJ0d5mzhz3nV56ui4c8Bur6dGJHKfDWLpvIqh22NUPtgussEfos1rN
EaRAtNKkh75gf1XFvdHMYNID/hSYxTEMd+vx5ioNa3gRVQacI1+PcUh8r3JmqcMe
mBGqBSxcddTTLByIePfgaEOw7Ag5SpzYsa19cpVRgvYCljt5O5gHQSRSm26RZV3c
XG8WshVbWw+oiNA9yBFe
=xQs/
-----END PGP SIGNATURE-----

--=-f2vo2f6+caFCXtQD9vL7--
