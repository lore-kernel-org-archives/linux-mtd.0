Message-ID: <1346255161.2848.515.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: orion_nand: remove <mach/hardware.h> include
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 18:46:01 +0300
In-Reply-To: <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <20120816183708.GT22226@titan.lakedaemon.net>
 <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-N7naJ0VbBAglgXD4WKoi"
Mime-Version: 1.0
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Ike Pan <ike.pan@canonical.com>, Albert Stone <albert.stone@canonical.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Ian Molton <ian.molton@codethink.co.uk>, Yehuda Yitschak <yehuday@marvell.com>,
 Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>,
 Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
 Jon Masters <jcm@redhat.com>, Ben Dooks <ben-linux@fluff.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>,
 Nicolas Pitre <nico@fluxnic.net>, Maen Suleiman <maen@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>, Olof Johansson <olof@lixom.net>,
 Eric Miao <eric.miao@canonical.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-N7naJ0VbBAglgXD4WKoi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-28 at 01:35 +0200, Thomas Petazzoni wrote:
> Commit c085d965fb63ac3b4cc7379d45588c0b39e2bdb0 made the ARCH_MVEBU
> platform select PLAT_ORION, which means that now all Orion drivers can
> be enabled on ARCH_MVEBU. This works fine for most drivers, except for
> orion_nand, because it includes <mach/hardware.h>, but mach-mvebu does
> not have a mach/hardware.h header (it is considered as a deprecated
> practice).
>=20
> It turns out that the <mach/hardware.h> include in orion_nand is not
> necessary: the driver builds perfectly fine without it, so we simply
> get rid of it.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-N7naJ0VbBAglgXD4WKoi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPjk5AAoJECmIfjd9wqK0qnUQAM1gVNKyCAmgqE703/OddP67
/prFK9WwUMWEcLyZli+YqpESr/11coFtPNiiQ9cE+FvRCgnx5u/yxrYI9XGzp6J1
inP7QhaN0u9Rdd9DRhSO1JDUl4QE7fdKQYDDju/Uhj41ipAMoVBgCdFxR1oZHQQQ
pfqTjaphvEj0zzP6GttDJBH4Z2B9LBWzz8HBoiG+qhiYZHCrmmEEHy9IRmryl+dw
5HP8ZZ4QwE6Lb4abBf0VJeEsgSYiWsbGMRKxHzpibK4P9a8kuUvgFS+mAzmp3qVr
R8yeKzB5PXQVpbvxxL4+k0XfyTrZASkcjkXQ41WxgTePTBzNt4HLY7Oi++YjL/RR
XR0JCfPfTbvrYDYmv1iLdNBPHmR5aHw04Sxag3KmfzXFjhkyFnnEkKqvkW7sQe98
6CDnBbyTRpHHwacZ0wWtWMzt06bvP+yblSU4tPROJQflzCmYRCj0iHzb1n0SrNVn
TdBOJ/OXYq32uOVJmE90VNJLtLCJcQfsAy3bHt/W30TdWeRW7uCJQxT5MVLzcsvV
3U4pK9528snvyfnr4vW7gzdnzjLekeNyVib6jA/vt/ui3XvK2kQKn6PdE9ZwjDK6
Nu5rArsGtPeqCRXHyjWNjgx8EmgrVizm8vPHCQohdF4uI/mVdaM5AR7nEHv+PXDR
HPchVtfXTRP2Shbg9cS4
=VF4+
-----END PGP SIGNATURE-----

--=-N7naJ0VbBAglgXD4WKoi--
