Message-ID: <1345198171.27859.39.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Roland Stigge <stigge@antcom.de>
Date: Fri, 17 Aug 2012 13:09:31 +0300
In-Reply-To: <1345122935-22115-1-git-send-email-stigge@antcom.de>
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZyiCfxHwrjHO8TiL/3y8"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, arnd@arndb.de,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZyiCfxHwrjHO8TiL/3y8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 15:15 +0200, Roland Stigge wrote:
> The SLC and MLC NAND drivers now need their dma_filter callbacks via plat=
form
> data to make them independent of single DMA engine drivers.
>=20
> (This also helps fixing build errors of the SLC and MLC drivers when buil=
ding
> as modules because direct access to AMBA dma filter functions isn't avail=
able
> via export.)
>=20
> Signed-off-by: Roland Stigge <stigge@antcom.de>

Pushed the 3 patches to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-ZyiCfxHwrjHO8TiL/3y8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLhhbAAoJECmIfjd9wqK0jD8P/3fgYc6v1TzTj2szACe7D8fk
rDpdYHP5JsYzqfaghuK2IZQkgbrq0EKKz057ObvutsZV2zVMyH4VG6+AEoNeLsXt
VARDIWeoj/EcX74rp6PtbXGZzjbxF6bxJuTychCROSxr2L19zaOj7lzx01MfJhly
NVNkK4NZld56jVIBus6R8mDGlTS2QTRdExhtXnlWX2SQcJE58NtwJRBEpCCDKw7C
koB91OPSiOWR1ITC5rXBL8E5y274ykEF4cA1YSjhuGaV9SoOvUEyW+u+kVuF2+9E
kFsKLPz+UNoqW/fXQtbCMpaOKueXvo/md6dinfT4venWPY3AeM1JSPclqEJqHios
v6dTSEBO5EwH2WrpD+KOtK3d+51aGQ8vYsOmJKQRquJXqLwkeLfT2xk+UtsibmyJ
u0xvxjAH0faA96DAqSgQSPvy/d6qLjgXTKXh/7PdY9jGobHdTaTNq33y4m6xUIEd
URMQ09fRnMCawFHr2Jx/xrkAewHfKCFFEth+xf/QdDl0pG1/eTyVC5Q7vASwr5IZ
MO3o+xTLBjy1SkAbAzQm8XZep/6dRQJI5kziDaDcPjB2WsRwtx1l+l/b51rVJ3aG
bzW31V/MXZoH6sjkjBNKp2ahw8Jj/UOwG/zw2VxPJclCymkzjgCWoCtl3xaAessX
0fqufJGSyIsggB4AYxjX
=Bixz
-----END PGP SIGNATURE-----

--=-ZyiCfxHwrjHO8TiL/3y8--
