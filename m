Message-ID: <1339073159.6875.101.camel@sauron.fi.intel.com>
Subject: Re: Re:
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 07 Jun 2012 15:45:59 +0300
In-Reply-To: <20120607101124.GH30400@pengutronix.de>
References: <1338978796-26129-1-git-send-email-s.hauer@pengutronix.de>
 <1338993547.6875.65.camel@sauron.fi.intel.com>
 <20120607101124.GH30400@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nyypWaBPJ4IBRsqWLxz3"
Mime-Version: 1.0
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nyypWaBPJ4IBRsqWLxz3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 12:11 +0200, Sascha Hauer wrote:
> Fixing these warnings in the nand driver does not seem to be the correct
> approach. Initializing mxc_nand_devtype_data as const seems sane, the
> problem is that struct of_device_id expects a void * instead of a const
> void *. A patch fixing this is outstanding here:
>=20
> http://permalink.gmane.org/gmane.linux.drivers.devicetree/15069
>=20
> (this will also fix the other sparse warnings from this driver)
>=20
> I asked Uwe to resend this.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-nyypWaBPJ4IBRsqWLxz3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0KKHAAoJECmIfjd9wqK0XEQQAJsMOgKi+pIbNqxpSCa/m93w
IDqnim4x9+tAO4B9i3Cb43eSvqdLk+1KeeuMwDArq6bFnZGL8Wbs22uSx059deWQ
et8vxucWPlg4Vwiyh9xtsWDSYnloDXYW0U5ZT+sip1TEdJY3Tat4zmdHEHFnb45H
fZLJlERPtgRrpLA209ljxfy/eVyjQja2447pFdnMzSE92sAuZ73l6+Q0zeyZEnYU
wFMD7XR+c2JFBKb9J3SMj2HbrRF/94cDx0aPB9xeLkh5pHV6ur7e3kJi0a962d+5
U2SP9BrURbaGD/I9+/QC6dOo5cdQ4Cj+4SKgKgQHm4Aj1dUKT+ZWrCq3e7Wdevfn
21c/ip3HserXoJQla4Zb8RaPwf925XwpFH4R6x+BGuMlApbQW462AP04dN56fpVi
UpTM0UsSfzZNQBSNv/QLMfE2YVRadBwfJ7DVcb1Nkwut2Ov/aKf5da59JxTvdLYe
d9rpcbntTjZJXByLM7BF4+BB2TYk9lD0tx0SDGaJoRtezhcXlNCtnamaHh67dFDE
VnK+6Rv8JTW3v7/uNVJaQyYWQjXKDVQ+FVrpAWNMv+UTJdDAqkLkt3u1veFZ2p7v
TLwSohpsFiFowGGehIMQJaQLKC41xZEyvMtM9bI6O2so3O9FpMo8Ge1wf81YnNWz
1XBBmUtfPh9P5iMssY/Y
=fncZ
-----END PGP SIGNATURE-----

--=-nyypWaBPJ4IBRsqWLxz3--
