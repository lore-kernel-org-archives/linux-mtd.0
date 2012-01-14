Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5M6-0005Ar-BR
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:17:19 +0000
Message-ID: <1326554330.14299.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] drivers: mtd: mtdcore: Fix build warning when
 CONFIG_MTD_CHAR is not defined
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Sat, 14 Jan 2012 17:18:50 +0200
In-Reply-To: <1326338704-30199-1-git-send-email-festevam@gmail.com>
References: <1326338704-30199-1-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-boVanI+ctRmhohNUVTbD"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-boVanI+ctRmhohNUVTbD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-12 at 01:25 -0200, Fabio Estevam wrote:
> Fix the following build warning:
>=20
> drivers/mtd/mtdcore.c: In function =E2=80=98mtd_release=E2=80=99:
> drivers/mtd/mtdcore.c:110: warning: unused variable =E2=80=98mtd=E2=80=99
>=20
> This happens when neither CONFIG_MTD_CHAR nor CONFIG_MTD_CHAR_MODULE are =
defined.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-boVanI+ctRmhohNUVTbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEZzaAAoJECmIfjd9wqK07nwP/3uZxtpf5HyGF+E2jvRz2Dhd
7Xr8MGa5nVYuJU1pC6UaoSYSQ2wQFqS1HONtgTMZQOSFWv4L3LmbfU3XobDXjVpg
IzHJFpZ2aa7LFo/JyZEF3wgw6ffU3rZTOEjVMVYMydXUKZWfFpqkNBn0aZIDgLK8
IP3LNp+8vDddt8UaNPuTr+beEutNgFB3stbJNjUzDd2I4Oppsm6hxzhYV8Km97qm
+FxgkpJ2bFCr2YLA+rvqnVafIk5VDhGx2llsbxyu0qEv8jqbfZfRJA/xiyrag+y5
Quf0U1tv30Oi+t1q0E3VP2tHTEZ6LWuBlKvB701fFSGTzSCGePUCwK4aD71bW8MY
7adKINWcEqnW0G0CCcHfzVV4aENydUhqR1Fwqx05SkOi1p9LvSmPjQ4XFEMtJgyh
iP+JlQHRIQNXxHLGT2eC6Ynw3IP84PnUqYUJx7leqtHO334vqYyqA2MhWi+FckSb
gO7F6dlyNhQv+mCv9rnPldRg73lDdIJpwPTiZ6+avwhSsBY/U36Ge1hb31waVdbY
4rjabMj6RK8piMarW+No1IwxLnyMO9P46FQvDlFwQC/tbXlm8UlIHGRiUma4eHDp
Dw+ptURsIGL0lP5UnmYLIWzNjLYtNw71BBTBacDPvZpJZ9FTIDe6YT5TiYgR7BJU
V9/qP+hx7Rbm8D7lCfQo
=jz5h
-----END PGP SIGNATURE-----

--=-boVanI+ctRmhohNUVTbD--
