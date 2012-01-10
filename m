Message-ID: <1326185340.8847.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] MTD/GPMI bugfix : reset the BCH module when it is
 not MX23
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Tue, 10 Jan 2012 10:49:00 +0200
In-Reply-To: <1325647126-4281-1-git-send-email-b32955@freescale.com>
References: <1325647126-4281-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-56IGo6emiDNvbSxUVDCr"
Mime-Version: 1.0
Cc: baruch@tkos.co.il, koen.beel.barco@gmail.com, w.sang@pengutronix.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-56IGo6emiDNvbSxUVDCr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-04 at 11:18 +0800, Huang Shijie wrote:
> In MX28, if we do not reset the BCH module. The BCH module may
> becomes unstable when the board reboots for several thousands times.
> This bug has been catched in customer's production.
>=20
> The patch adds some comments(some from Wolfram Sang), and fixes it now.
>=20
> Also change gpmi_reset_block() to static.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-56IGo6emiDNvbSxUVDCr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPC/t8AAoJECmIfjd9wqK0KUwP/3C8ahDKkj/h0de2y2Z1SHik
Y1vGFcmFzkB8pUrZUpRLLCaW5zwKlbQd3iR524xpDOOrtrVEwfRf4ZXiObm3Eh4v
IBXcxdOUffMnIIHZ/m0VCsRiVWPwNFYnpN1aos6dFBTRo6NdDMVFpaOujoYn/h76
4u0Txmz53F223fozEDLHdlcT9HBPcxbF0MaX/gGbkZZFYV+aJAPPhxw5cXTDTaSj
6F6latC3LkFbu9jBYctcf5f+SffOD6Cr+ovuM8ZxtXrQfB/NoNvQEphtF6wVGQf2
BY6Ktc49paOocxzi7UDgNG5uu3lIwRJtPDkOK4HY1W1lPHIsED/cGt0q60KokSqv
zmRDDOmkAg7poNi/JEWososj5MgNFqXBGukdpsa5ytGQt7yaSXwMancRkP3cDcpT
EkCI6puM/dDABNwR8IRJETT8oxnxGH5+u299M0PLJ0zcjJPeY+VpB92CL5uOK2FX
C7pJwYRrEHTfGoQz3vIC/QGs+iJrGnZfxduT5OuH3ttguuHqw3CXmGWhVlSDZN7F
DdPW9EzD3sime1FvYz1X04Lv+rOV87sgM9eQaWRRVWQrN2u3GpQRL5fcG0YYo5j9
mBAZGYOAVms+U4+KUiDyPKVVzcP/Ze//WftD1Oj0bvlwAkKD06ZrrzG/iandPzgF
eTu8YiTR7tabr/AAwX+V
=4BEL
-----END PGP SIGNATURE-----

--=-56IGo6emiDNvbSxUVDCr--
