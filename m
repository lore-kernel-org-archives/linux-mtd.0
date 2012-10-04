Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJo6R-0003G7-4T
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 16:16:47 +0000
Message-ID: <1349367416.20373.75.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Thu, 04 Oct 2012 19:16:56 +0300
In-Reply-To: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kFTyLygmw1qyzt4MWTiZ"
Mime-Version: 1.0
Cc: Ricard Wanderlof <ricardw@axis.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kFTyLygmw1qyzt4MWTiZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-09-21 at 17:41 +0200, Marcus Prebble wrote:
> Hi,
>=20
> We are working on a project using UBI/UBIFS and I have run into a
> problem with mkfs.ubifs which I am hoping someone can advise on.
> Apologies if I have already missed the answer to this in the archives
> somewhere.
>=20
> A requirement of the project is to take an image of the root filesystem
> (/) which is implemented as a static UBI read only volume. Obviously its
> not possible to unmount /, but it seems to be possible to re-mount the
> UBI volume, read only, onto another location e.g. /tmp/mnt/new_rootfs.
>=20
> The problem arises when running mkfs.ubifs is that it fails saying that
> the output file cannot be in the UBIFS root directory.
> This sounds like a reasonable constraint if the output file really was
> in the root, but this is not the case for us seeing root is mounted
> somewhere belowtmp. To give a concrete example of the command we are
> running:
>=20
> mkfs.ubifs --output=3D/tmp/rootfs.img  --leb-size=3D129024
> --root=3D/tmp/rootfs_mnt --min-io-size=3D2048 --max-leb-cnt=3D147=20
>=20
> Where /dev/ubi0_11 is mounted read-only on both / and /tmp/rootfs_mnt/.
>=20
> Having a look at the source for mkfs.ubifs it seems that the function
> in_path(..) is the problem - it works up the directory tree using ../
> until it either reaches the top_dir (/) or the inode number/dev match in
> which case it fails. It doesn't seem that this section of code has
> changed in the latest version of mtd-utils (we are running 1.4.3-2) and
> I wonder if this is a bug in in_path(..) or a genuine safeguard against
> screwing something up? I suspect the former for when I disabled this
> check in mkfs.ubifs.c the resulting image was completely OK.

Well, obviously this is a safeguard check. If your source FS is
in /a/path/, and the output image file is /a/path/image, then we will
loop forever reading /a/path/image and writing the output
to /a/path/image.

In your case 'tmp' is a tmpfs, right? This is obviously a bug then. You
should probably analyze it and send a fix.

--=20
Best Regards,
Artem Bityutskiy

--=-kFTyLygmw1qyzt4MWTiZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbbZ4AAoJECmIfjd9wqK0L4sQAMAcnsE7IRzBDZYh28cI0/HI
P9JZ0JhxzAD3ENR4yh+GjsFQ23LczcavveDcHITjTYDO0/rAl+Ze6YCPGe0qf4ew
TafIaeSVJlAiUmssqqAB6Sb5jEjSp6ah34JUjKQ6/OIfByXbnZXVX8P5VlJnve8E
u56EQqiPHODYJmzCHucgunGqd86qqhHnf9/OOkkMNmDmtV91nLvtDIBLjA5+Z/Hv
XkHLgZhEcPNATddlJTKiJV+OmKFJV+GjOjgzeRcPuI2x2KOJSXuOcYgCe8CGbFjJ
RwHF9gGaI9EwvbkRXkgOW4l1dlLLD3gmfZuupKAYwIO608bY2DJy9bi6+6ohnDTs
P28Sq0oAqjgqvpdshvTVyqzxgNaZBT6PyPsGv/2JmBdtLi0xWMwLQgO8In0n1peO
xCntUjvnUr34wTTXnzwapSoMKrUfRCw3zdwlWfsOyFKK9CXwBuetnSIBjvqTt0DS
GQXhjvNKoOOMqH9b55CFL3YL7jZ2hkzHqQyG6RcjbqKJJwiSNe2KePv2F5WL80I7
XFAZ93YFeBCDa84q/zczhXgMiyKR9DLMNP71O1RlG2OTh9CeTEGmar1YC8KuSwSr
j1Y8GgIzU+1wofNm3sYYN0thz4K+8hwKH0JX2PJVo5j6dltuOEv7MTAyYny+5m9I
RRlHLH0Q4pjFVW+8N9Gs
=vCyD
-----END PGP SIGNATURE-----

--=-kFTyLygmw1qyzt4MWTiZ--
