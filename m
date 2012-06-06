Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScCGp-0007Mg-Lk
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 09:11:16 +0000
Message-ID: <1338974098.6875.23.camel@sauron.fi.intel.com>
Subject: Re: UBI: Single versus Multiple Images
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Doug Kehn <rdkehn@yahoo.com>
Date: Wed, 06 Jun 2012 12:14:58 +0300
In-Reply-To: <1338902500.33577.YahooMailNeo@web39302.mail.mud.yahoo.com>
References: <1338902500.33577.YahooMailNeo@web39302.mail.mud.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RJV45PVs+IvOW/SJwczs"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RJV45PVs+IvOW/SJwczs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-05 at 06:21 -0700, Doug Kehn wrote:
> Hi Everyone,
>=20
> I have the following NAND flash MTD layout (presently JFFS2):
>=20
> * Boot-loader
> * Kernel
> * Root file-system (rootfs)
>=20
> * Data
>=20
> I'm going to switch from JFFS2 to UBI/UBIFS.  I'm wondering if it is
> better to create a single UBI image containing both rootfs and data
> volumes or to create separate UBI images (each with a single volume)
> or is the answer it depends?

Are you actually talking about how to partition your flash - whether to
have one partition or several?

> The data volume will be used for logging data.  The volume won't
> completely fill as old data will be purged to make room for new data.
> For the single image multiple volume case, if I understand the=20
> documentation correctly, UBI will use all PEB from both volumes for
> mapping per-volume LEB,=20
> correct?  If my understanding is correct, then it's possible, after
> enough time, maximum PEB erase count will be reached and both rootfs
> and data volumes will be read-only?  If the goal is to keep the rootfs
> volume writable, even if the data volume become read-only, then would
> it be better to create multiple UBI images?  Or is my understanding
> all wrong?

I do not really understand the questions. UBI will do wear-leveling
across the mtd device it is attached to. If you have one MTD partition
which spans entire flash, you'll have wear-leveling across entire flash.
You will ave /dev/ubi0 represinting the UBI device,
and /dev/ubi0_0, /dev/ubi0_1, etc for each volume for this UBI device
number 0.

If you partition your flash, then each partition will be managed
independently, and you'll have wear-leveling per-partition. So one
partition may wear out faster than another. You'll
have /dev/ubi0, /dev/ubi1, etc for each partition. Then if you create a
volume in each UBI device, you'll have /dev/ubi0_0, /dev/ubi1_0, etc for
each volume.

--=20
Best Regards,
Artem Bityutskiy

--=-RJV45PVs+IvOW/SJwczs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzx+SAAoJECmIfjd9wqK0IEgP/3ojxMep0pgsD/6+QgBtmuwN
PDvUqUxkTaG5X9uxNDn9DJlMIuUt1Jq6vFq0+ENWNnbKJSSdSAKf/PeHjRWzbvlC
GYtedLf/npoxL8G3oltWIuNxGCCfP1JeFk3HDF5AWQ7/kzvsfso2R1PwaZ/Nem7H
muRvY1EnUKY78U0iX3OKEXquU4RKy4KxI0xU2g1YPfaFXaDhoJ29c32dZRZKU7di
sZtFGMmGYpFYwgyvTrAVNtStUcDS7wauxyp4SMUmZ44SdgBKeTBBqhWP0k9SAOnS
tvODsoAQTe/swOyoLFn8v6tBHpSLFIphaDn1+DC9GG2bJqjyyDk/sj5QTPmTC9Cc
H6b71xRhAezeC8fyL9fnRz14ZcsQeASMKwOL7juJMWMxGUY2WWEWPqofRM2dsbrT
5JfhxnHGyKUzkyk42+DlY0cP599sIC6Ig/iHXtFk5Aq3rAyZGLWjbMQ5SbLYWjcV
sCZv9wGq4fARpGOXsp2g3kZy3zPNGnLFznOKMF364/jnnx4uuD2WEzp0VuZE7VmN
PjYvwWqtT/mJpBp/aChokpfcsdxuZNEzGPWdHmKz+mXXiLUU1q1f/0XS+VASODqU
Vw86tv87ywhdVDEPfjU1Wg15VrQJ7iGlxqT1ymvuJCmaOtLaH4+Ba4kptMQJNWEm
2g9MlWmKdY7qdsy3ishk
=sVoL
-----END PGP SIGNATURE-----

--=-RJV45PVs+IvOW/SJwczs--
