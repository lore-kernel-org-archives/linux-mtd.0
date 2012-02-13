Content-Type: multipart/mixed; boundary="===============0184390104=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add gpmi support for mx6q
Date: Mon, 13 Feb 2012 11:58:32 +0000
Message-ID: <1329134454.22240.114.camel@sauron.fi.intel.com>
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1328505606-27981-1-git-send-email-b32955@freescale.com>
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

--===============0184390104==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-wGt2f6AMjLtkEVb6hud9"

--=-wGt2f6AMjLtkEVb6hud9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 13:20 +0800, Huang Shijie wrote:
> add gpmi support to mx6q.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Please, let me know how I can compile-test this. This diver depends on
imx23 or imx28 and I cannot find a defconfig for these. When I select
MXS platform the compilation fails. Could you please describe some way
to generate a compilable configuration which would include this driver
as well, or send me the defconfig file.

--=20
Best Regards,
Artem Bityutskiy

--=-wGt2f6AMjLtkEVb6hud9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOPt3AAoJECmIfjd9wqK0Cy0P/RESU1AVb2G2wsU3Iijepvgg
uOmdhRhSLGqvo9+VkW8sPElVcSv9JGzsf/OKzsLoAeC6SL8HrSbHvBhly+vITJKy
2IASPTadHSGpThqA3XYdLWo/FFxglvJrHLUKyeDscHoYsRqQF6qUWH5oO4G4xjJR
PUk/oQhATrDcCwe4EBc5h43z8PaZksK+knf2ORSJqy7Kgx20lPpxlN0eHLr4j53F
3GJUHq3oZREzUHykIUtEQRQEDCEjM935NAw1n+CFn3O84arJCQMCRjHEXG/0u0g0
Z/joajr7nvrGGRv9MAwg54nPuM5RW94RdwhG6euHtSgqvhnInPzYyF4rDsBfLDHr
2gLCJrfWOgy1UWekuApbDEUP/0PUc2vjTxBf5y9SleDx0tuT3NPBDl6gLFEHuguQ
4ddn98fjuPeMcrm/W+N+WXjEiq7yTAbU65/Qxq7YRGOLfbFTRap0ZhbFfem1eZUs
CSbBY6DSIZh1CH5QbZSou6Od45akuMPNZKiQEdC/yt5rn2wBkzH58EfXtegQmCps
vMn7P/a61MIDx/00xiGgAjmr/NSpcfBR8IZr0in6yxMfEr0QMcaVIBKYx3rAwa5W
NQ/YSHr+va2XG4Ag5PWsjJZwUvpvM8ozKq4yKLfULjUMONxujWJC/hLYV2ZscR9J
/MYli6Z1k+Dccu5rhm1M
=nivo
-----END PGP SIGNATURE-----

--=-wGt2f6AMjLtkEVb6hud9--

--===============0184390104==
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

--===============0184390104==--
