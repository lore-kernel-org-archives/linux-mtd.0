Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfVmZ-0004KB-SL
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:10:00 +0000
Message-ID: <1354540234.11583.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nandsim: Introduce debugfs infrastructure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 03 Dec 2012 15:10:34 +0200
In-Reply-To: <1353808304-2538-1-git-send-email-elezegarcia@gmail.com>
References: <1353808304-2538-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-004ECdzFdlHnEsq/K6t9"
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


--=-004ECdzFdlHnEsq/K6t9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-11-24 at 22:51 -0300, Ezequiel Garcia wrote:
> It's more user friendly to report debug information and statistics
> through debugfs, than to use printing facilites.
>=20
> This patch introduces a very minimal debugfs infrastructure
> and moves eraseblock wear report to an entry located at:
>=20
> /sys/kernel/debug/nandsim/wear_report
>=20
> This means we can remove rptwear option and just let
> the user read the wear report when we needs to.
>=20
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>

Looks good but would you please refactor it to get rid of the following
warnings identified by aiaiai:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/nandsim.c:528:5: warning: no previous prototype for 'nand=
sim_debugfs_create' [-Wmissing-prototypes]
+drivers/mtd/nand/nandsim.c:528:5: warning: symbol 'nandsim_debugfs_create'=
 was not declared. Should it be static? [sparse]
+drivers/mtd/nand/nandsim.c:564:6: warning: no previous prototype for 'nand=
sim_debugfs_remove' [-Wmissing-prototypes]
+drivers/mtd/nand/nandsim.c:564:6: warning: symbol 'nandsim_debugfs_remove'=
 was not declared. Should it be static? [sparse]

--=20
Best Regards,
Artem Bityutskiy

--=-004ECdzFdlHnEsq/K6t9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvKTKAAoJECmIfjd9wqK0aScP/02w/IHjzWHntLEcOymaPLsC
CGYfjw8978B+6h+tw/sMshPeJPkscmFLp0TBT+0xPJEbokGtO8i+zTouB3oWfxoT
CEZOfvf/nCuicW94iHV7YtHlpBqCSyJYNaeaHy2XN5jun4OajCGm4pWZASoq0wAn
EBW7vYFD3Bip0kRWZ3YPXbz85Oq31gZA0nVlWGD94PV2Kdj6jRMT/71B7YoO32X1
FWXa34SV9ddw8EGMQRjIaHLqnYN30EWvvLzhN3k1iEMXdLEtaxmCBnH74O0WE6Kp
X1uuDbkwI+Gwkqj0WQUarqnHHAz6nmEaUUODdMsiPJjvBU9j58uFQvT3AZiwUCrt
gJ7AtM5KLnFUMTMlEcn2HOBCiVorCFTjyzVtl/rn+nLqsCcKSkIQOD1Jz5Qgd66j
vU95gAdLTJWVyKY9YmYmn+0k4OTx2II9JImzga16CuN/zNeSJeQH4ZVYWwvHSUvv
t2W3M0PN9pEC/7UePSnC2neI+pHCubI59OhNKsenWMC4zXppSOUITDzPYR393Z1j
kW1EjAixWfjWqg8W67xAvwXvhT3Mo608WyXpi0WGQ4etdcAF3bbRlhSv2Zt+WzTj
CxMoy9R1zLgrGx97OEKxPqbBb62KAnBkMTEZdkyY/pIZ63pVTgq+bRZO6sCoTKSy
2V9dIi7WdRJ/F3TSEqth
=MliB
-----END PGP SIGNATURE-----

--=-004ECdzFdlHnEsq/K6t9--
