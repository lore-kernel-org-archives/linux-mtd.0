Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUaTz-000235-CD
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 09:25:27 +0000
Message-ID: <1337160532.24809.28.camel@sauron.fi.intel.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 16 May 2012 12:28:52 +0300
In-Reply-To: <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GPwnbII5bTtOvffyaeh1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 uClinux development list <uclinux-dev@uclinux.org>,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-GPwnbII5bTtOvffyaeh1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 11:57 -0400, Mike Frysinger wrote:
> On Tue, May 15, 2012 at 12:08 AM,  <gerg@snapgear.com> wrote:
> > . make the struct uclinux_ram_map static
>=20
> NAK: this breaks Blackfin systems.  we specifically don't want this to
> be static.
>=20
> it should probably get a comment added above it saying as much.

I've just amended that patch and made it non-static as well. But this is
really ugly dependency.

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index ad75346..d8aa6df 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -21,7 +21,7 @@
=20
 extern char _ebss;
=20
-static struct map_info uclinux_ram_map =3D {
+struct map_info uclinux_ram_map =3D {
        .name =3D "RAM",
        .phys =3D (unsigned long)&_ebss,
        .size =3D 0,


--=20
Best Regards,
Artem Bityutskiy

--=-GPwnbII5bTtOvffyaeh1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs3NUAAoJECmIfjd9wqK0nSIP/1C8a+g52cKR/P/zkB+ssgJz
cIFQ4dcAODMtz5zRivWpSpEYxOxT4GonYENSx5b0Bp9HVQIG8EaRx1SxkmpWsvxQ
vxuM5XYImkC19ROsEGaNq9kHbFl2949ecjme/klAzrVpc2e++F7fDNPVKb3fQTyk
rLG1OhyWNvT2is5IkeoTiqmTDTwDf4ivYO7SckL6WNvX2GHBdllyI1dI8OiQUgP2
iWUIIF5O349rv3Uumwv2j7XTQB6JVD2sKJLZ/4qhwwzXvPksWcRPAS+hA0z2q/Hc
S6aBGuw7/6Dhuh9YhWXYO/vBlF1dzhooNehpaaGCTP31Yk7lKTnyJAdIUc6cSFfB
UHT4W/FEEj+5cXUfq3G11DeVzAdbpISjE/cBXTHn5iQL1zTGdmPnqg3O+xEl4uXU
U0v6i6JJmcsDy8Hqewu6jbf60L2uSFB0NC3avjJ1yLoIqZNS3WevoZ5boU6D5Efs
cxUlZtpPSAyEIKDWm2HzBW2kEi9w/XO8dWROzBGIaAYgVQe/CgG7RIuuBi0caLLP
aoh9Q4YhaEGC3rp6FwypFAH/N3UKk7ez41gtScJhRNDeiVbzSTbLrQ8/IL7thz4b
XeHKo3FnSh8ND6+Y8GuP2etC3htpBY3uR8c/MKAQGRj2WPm+5JOdVxT0I2uDXe2Q
5IAiSSGgnuDzmNj0dTVi
=Rooq
-----END PGP SIGNATURE-----

--=-GPwnbII5bTtOvffyaeh1--
