Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeQV8-0006Wm-K6
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 13:19:31 +0000
Message-ID: <1354281616.30168.132.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nand_wait_ready timeout fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Fri, 30 Nov 2012 15:20:16 +0200
In-Reply-To: <1353605488-29438-1-git-send-email-matthieu.castet@parrot.com>
References: <1353605488-29438-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YQUJ0rWXPgjKORspkHld"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YQUJ0rWXPgjKORspkHld
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 18:31 +0100, Matthieu CASTET wrote:
> nand_wait_ready timeout should not assume HZ=3D100.
> Make it independent of HZ value by using msecs_to_jiffies.
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-YQUJ0rWXPgjKORspkHld
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuLKQAAoJECmIfjd9wqK0uBMP/3WB9UfMGo/ACKfB8Msl20Qm
fAH/MhwIklF+0+KrPi0l06weCCdCqhSIAM0NwzW4tKQOcYIHHUFYuuruIJJrmOHl
A5NEPPbMUqDjzElyEnWh5ZXCRCUvDSN3dyYRBBk6KllAa8ISH3zRq/JvdXUQzHVf
056TOLrHDf9Ls8pAdHZdoN/SLBl/LjuLXYv2tXipSYsxpivoSbhCZadvfdF0UMu8
eh4BSFxTKhUttdzUcTcD727rhCMir5Jd8DmszGRpRLVgMwsuNQC2fbBgOUxk/JMt
fySBGD+pIelvM83kGUp5pT//5mcZ3gg6DzA8KoyaRVgHDmaTrqdp5bUPY3jk1Uhv
KSJ4prVLm5EgExaui60oHITaY4/XNQLefewdIgF6T3lkoRO4xF0HKwCMGAsCifpr
5alT2U7O+pF7QEgudv++uzkWB2gaGCLHhvXuNw8jdzteXfaU+31dQ2DnNuaoViiS
0IZj+RRWE2Ve3VH4SrFIZ9hkeKiu9kBrJQKH1meYJNuYx7r6Sjus2u56ba3aBgMg
Mr5ZGn2vU2lzccAyqEO3ctfki8OPX2C5iYjsngeOGpsT9kOBp5CHxgXsU/nAtkf1
UPBuc+RUqmqauiemduaGopML1boseejrA8ZElIc9y92gBTW1y+BaNovuPpH8J3B1
frXRBfUinHShwL0P5/qw
=RB75
-----END PGP SIGNATURE-----

--=-YQUJ0rWXPgjKORspkHld--
