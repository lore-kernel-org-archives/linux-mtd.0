Message-ID: <1348647472.24309.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/9] add EDO feature for gpmi-nand driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 26 Sep 2012 11:17:52 +0300
In-Reply-To: <1347519480-31106-1-git-send-email-b32955@freescale.com>
References: <1347519480-31106-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SZH9kfNAq5yXIT2hY2XW"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, vikram186@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SZH9kfNAq5yXIT2hY2XW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-13 at 14:57 +0800, Huang Shijie wrote:
> The ONFI nand supports the EDO (extended data out) feature in=20
> asynchronous mode when the host controller(such as gpmi-nand)
> uses a tRC of less then 30ns.
>=20
> The gpmi can supports this EDO feature.
> This patch set adds the EDO support the gpmi-nand driver.

I did not review this deeply, but the speed improvements are impressive
and patches look good, so pushed to l2-mtd.git, thanks!


--=20
Best Regards,
Artem Bityutskiy

--=-SZH9kfNAq5yXIT2hY2XW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrowAAoJECmIfjd9wqK0zzIP/12eDOfZAbunG9hzq+R+8mzT
2Yy+cBpBbe5aWHATF+pb3PcwHZd+sRKYcYuG9SIvzkyvUX09N2B9tXpBIvPgrcEk
6o3JDiivVDpMnlJlKQgLq8nHOLrknJIGEcp55l+axLvpnKd0D3GGxJ0svidB6/Gf
PwP+KRiZTq01tOiu5KV22GVW/tXkZQoBREhrXf7tDOfXuUYUOzomHvpv5uoTwQj+
xMT/xnut3svWtIJZZsJxAOPhUSFB7mNdBbYg5NH3W3MF4pRS834C2MLpkIA8Rx6N
CANELPxyAyEqd86YhoEHoGCQPNjJuCUb8txq/lr8to0H8rngDh18UfvBGXA7iyar
J6m6g9Atx4rvblKTBo/BT0qcoK6CNN6ToDBSYrbxRZWTAJ2xUVBOj7gDA1fcmTfj
MiX9vEWoXYb5HBue3WFce+V3ZkLL21r8t9ECRRRXUo0AZ4lK/14jHf5RuPzfxKIA
5MxvadkYl/7HNVM7zV98hPTF0F/ujT7fV/gSSL2bHHgOnVLh6JohiVdKL2y6RdPn
QKEMBuRYeIaLzFVdKbt/ZdHBlxfWb5IMjG81uu0ddg0KP5MqC8L4Xta7BX6X4V0J
V1UOId96MoHpWCbUW7OqD0VzRfkTFBvrJWpqvMEk/UWI7uDPb2YeHgcf+HYGs9/T
SRTBKt23e3fjqAyvBjM6
=VD0r
-----END PGP SIGNATURE-----

--=-SZH9kfNAq5yXIT2hY2XW--
