Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2N4c-0006zE-71
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:58:51 +0000
Message-ID: <1345212215.27859.91.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] MTD: check for valid pdata inside plat_nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 17 Aug 2012 17:03:35 +0300
In-Reply-To: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
References: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gg6Ny4DGiOMVd87eyLK4"
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


--=-gg6Ny4DGiOMVd87eyLK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-22 at 08:59 +0200, John Crispin wrote:
> If plat_nand loads and the platform_data is not properly set it will segf=
ault.
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: linux-mtd@lists.infradead.org
> ---
> I am seeing this when plat_nand is referenced inside my DT file but
> CONFIG_MTD_NAND_XWAY is not selected, resulting in platform_data not bein=
g
> populated with valid data.

Aiaiai complains like this for this patch-set:

---------------------------------------------------------------------------=
-----

Successfully built configuration "mips-lantiq_defconfig,mips,mips-linux-", =
results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/xway_nand.c:145:9: warning: cast removes address space of=
 expression [sparse]
+drivers/mtd/nand/xway_nand.c:163:25: warning: duplicate const  [sparse]
+drivers/mtd/nand/xway_nand.c:184:12: warning: symbol 'xway_register_nand' =
was not declared. Should it be static? [sparse]
+drivers/mtd/nand/xway_nand.c:184:12: warning: no previous prototype for 'x=
way_register_nand' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-gg6Ny4DGiOMVd87eyLK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLk83AAoJECmIfjd9wqK0iLwP/3sip/OPggjOgWRHt2UZMpMq
07lMGno+pZzde7iaxExaAY8xde1dPIY5zWm/qKzPtItBtFgxSYjpmMjATNR8gOPc
kYKZkiAJYN6q2hY0jy7SibjnxahRA7DJT3pAkimaNXhBjetoXo4Mb60bc9hSNW9s
+/xvvCp9fapbp96+Q/2DSL0VJfv134iWhgQEGcKqmcPryhrEoC9UK+KnUv+efvDJ
3+Uzy+EUT48Xm5DwSKtDF7QktKCLk4F/+Xu3LGlDmKdMrpo6CLLIZnCX5SzkakiT
3pbebN8cdGPkr9A8p/UJY4pJHQSqgKgHn2+c+VP1l1fVG/UJY3stsIixAZbVfXx1
xyKknipFhCO27dANLVf5qvKyh83Rf1hFVRVe5iK4yQX00O0vf0+cgx4SS5M3vPeA
QRAGzGu/s92NB8WRgELS5cBkOLKZ+Q+v03iWiuwtOOFTcoob5raWVpdKWW757pv7
lhO/jP1TpDidUGy5I0bl2AImNCTSSBAS80IYcC0UlRqDxhBiadHz67CiZ7VOeozz
CGrfEUhCuqmhsYLsHTKayIKbd8Yi9vJdDb3c+WffyInXkkXq7weOqvO2YkwgzXjW
6XhPMUD8iTnL5N1m0lDSaXVO3DMtcXsEsJgCy56ggM9APoGdFtKlon0ZmEcFXgV7
mvKIP6AmMoMe724yRHqx
=9qfF
-----END PGP SIGNATURE-----

--=-gg6Ny4DGiOMVd87eyLK4--
