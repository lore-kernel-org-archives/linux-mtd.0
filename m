Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUBjc-0003wn-Al
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 06:59:52 +0000
Message-ID: <1337065400.2528.120.camel@sauron.fi.intel.com>
Subject: Re: Missing offset increment in scan_read_raw_oob()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Maluka <D.Maluka@adbglobal.com>
Date: Tue, 15 May 2012 10:03:20 +0300
In-Reply-To: <4FAD51B7.6010303@adbglobal.com>
References: <4FAD51B7.6010303@adbglobal.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qafGNwFb+UtWLleI742u"
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


--=-qafGNwFb+UtWLleI742u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 20:51 +0300, Dmitry Maluka wrote:
> It seems there is a bug in scan_read_raw_oob() in nand_bbt.c which
> should cause wrong functioning of NAND_BBT_SCANALLPAGES option.
>=20
> Possible fix (relies on offs passed page-aligned):

I pushed it to l2-mtd.git, but please, tell how you found this issue.
Also you did not provide signed-off-by - can I add this:

Signed-off-by: Dmitry Maluka <D.Maluka@adbglobal.com>

?

Also note, the patch was line-wrapped and did not apply, so I had to
amend it.

--=20
Best Regards,
Artem Bityutskiy

--=-qafGNwFb+UtWLleI742u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsf+4AAoJECmIfjd9wqK0tJQQANDoOppvyrd6IW6B2cPS2GyB
VJBoHjYj6O6bUoCcEHtG0L+vx+dodcHQoaa/HWUHHvW5bp+rZi6AfIv4lW1iohxk
0UQRhm6N2jp4zRpo1bAfkbdUDr8r11Mk91deAOYtTmx4tJxS58RPJzo9ODtbFscB
9c6yhlNxWGFc1MXmvuZPYk36UPYXvvyu/s0gdZqCmNdZJAinGH13TJuoRIZUaHIn
CvsJTMcheUMLdahyBEPMHbHbnajHPmek+GNaiMZC5bYSUQSN0KT5zJOWqezI1RSf
Wg7UQa8bBP6O2Bz/NyLkJ+1IBIy70LtRC60PGesUx8rb2gHzUwgdpYzOC1iojeyg
BkYU+a6Dc1nT9ZyvXPKYstFmv4nzqz6YUwnGMDKRmYc49rIlksUfzPS0l3xgRTsn
+a0Drh1oxkTBCx7yCx5eAqr78ifiBnJBWhI5C2VegjCon0Hijfl+lLZlyKq9prmg
OMTB43GwDhF8TTNN3JNILcILaGwNN7wSIy+X2ULNseaW5Bf4k1gMuhUz4tj2wSBT
fZdq3Qi+42ay/ghhOWjz09PLYkgA6hw2g0wo6m7Y2nPlhOKl2YTq2HYW31+RCHB4
Nti5qSBCiBuKy8rMrQIaRrDzhf0q14yYNherYanDvEI22lfTY/VBMqriW0u5Sbnq
xQli+5GEkenli3z1AU+v
=SrP9
-----END PGP SIGNATURE-----

--=-qafGNwFb+UtWLleI742u--
