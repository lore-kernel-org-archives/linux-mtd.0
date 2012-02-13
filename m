Content-Type: multipart/mixed; boundary="===============1013088695=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie-B32955 <B32955@freescale.com>
Subject: =?utf-8?B?UmU6IOetlOWkjTogW1BBVENIXSBtdGQvZ3BtaSA6IGFkZCBncG1pIHN1cHBv?=
 =?utf-8?Q?rt_for_mx6q?=
Date: Mon, 13 Feb 2012 16:22:49 +0000
Message-ID: <1329150312.22240.211.camel@sauron.fi.intel.com>
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>	,
 <1329134454.22240.114.camel@sauron.fi.intel.com>
 <14C4E31473AF7E4B98176CB73615181C362D9F@039-SN1MPN1-006.039d.mgd.msft.net>
In-Reply-To: <14C4E31473AF7E4B98176CB73615181C362D9F@039-SN1MPN1-006.039d.mgd.msft.net>
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "w.sang@pengutronix.de" <w.sang@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1013088695==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-njTKWZIVOLHrDKgk92mH"

--=-njTKWZIVOLHrDKgk92mH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-13 at 15:05 +0000, Huang Shijie-B32955 wrote:
> Hi Artem:
>=20
> >Please, let me know how I can compile-test this. This diver depends on
> >imx23 or imx28 and I cannot find a defconfig for these. When I select
> >MXS platform the compilation fails. Could you please describe some way
> >to generate a compilable configuration which would include this driver
> >as well, or send me the defconfig file.
>=20
> use make mxs_defconfig to make the .config.
> and select the gpmi-nand driver. then you can compile it.
>=20
> This patch is just part of the patches for mx6q, another two patches are =
the mxs-dma patches.
> So in the mx6q, I do not enable the  gpmi-nand driver. you can compile-te=
st it just on mxs_defconfig.

I cannot apply this to l2-mtd.git tree anyway:

$:~/git/l2-mtd$ git am ~/tmp/gpmi.mbox
Applying: mtd/gpmi : add gpmi support for mx6q
error: patch failed: drivers/mtd/nand/gpmi-nand/gpmi-lib.c:1066
error: drivers/mtd/nand/gpmi-nand/gpmi-lib.c: patch does not apply
Patch failed at 0001 mtd/gpmi : add gpmi support for mx6q
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".
$:~/git/l2-mtd$ patch -p1 < .git/rebase-apply/patch=20
patching file drivers/mtd/nand/gpmi-nand/bch-regs.h
patching file drivers/mtd/nand/gpmi-nand/gpmi-lib.c
Hunk #3 FAILED at 1067.
1 out of 3 hunks FAILED -- saving rejects to file drivers/mtd/nand/gpmi-nan=
d/gpmi-lib.c.rej
patching file drivers/mtd/nand/gpmi-nand/gpmi-nand.c
patching file drivers/mtd/nand/gpmi-nand/gpmi-nand.h


--=20
Best Regards,
Artem Bityutskiy

--=-njTKWZIVOLHrDKgk92mH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOTloAAoJECmIfjd9wqK00IkQALhAfYG8UFhT/0jGGfCOFLHI
GhR9r0PvGvxA+MZoSKIEL5iHvO8JrOKc4mRxxto4cJgQaMb3sjPzBAFNhl1BCHYL
wCz9JduRPq/HhEijj1IJqfWHLHS3bLQftDTeZ8v4GnmTqR8uEGJJZWngm6t5wEbS
AD8my8Njdeheqz8gKYudzbUANogB4oBOF3ncxzVSFajQFXBkQPYdeY7lqlH4VPyj
KM9rnMpn789wW6vKuWjHabpZTAcCrKvQfKgJhgx8wB7F/rMc/BTNAj87kRuKpmYp
NOzZVadyebub3opEw5ZYc2Pu+jg9bQWV4pb7et5YyTHPWQwTY4Z6Pex+yfs/CNQD
QJoa0FOKDbdxUCbX/JNdUzL8IAftze0gtc0Hwe0HrRRJ5+FBawk0CKgmbbGhpGHU
2US5s1Ijj2iuf36eavkYkP/l3HTJHJuzUN1uwKpNLq47+GmbWKdyGxhFa4yh4Ki8
TGAq9LsZZkTj96QFwTMkij8KuRWM+BR5B99FNS4OYD7L8wplHsaCkkdsNggdbKYR
fZ6D3KJqPKq2Ot6ZSOZff0U9MsVO0Gs/LAuEjlHVaFpSRpSaEtvWEhedYCfxRglo
RrW5IlBc44dlyKnmRmQUz45XoQX9VMsGOjphfVx3Wggnu+0ZAwHcLicOCHwlIICj
SHlol6Pm94ebJOWUTBuk
=il9t
-----END PGP SIGNATURE-----

--=-njTKWZIVOLHrDKgk92mH--

--===============1013088695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============1013088695==--
