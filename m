Message-ID: <1346226961.2848.424.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] mxc_nand : allow swapping the Bad block Indicator
 for NFC v1.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?Ga=EBtan?= Carlier <gcembed@gmail.com>
Date: Wed, 29 Aug 2012 10:56:01 +0300
In-Reply-To: <1345825064-9147-1-git-send-email-gcembed@gmail.com>
References: <1345811288.2848.308.camel@sauron.fi.intel.com>
 <1345825064-9147-1-git-send-email-gcembed@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7JIA5bRuea6c1BmBH3FT"
Mime-Version: 1.0
Cc: Russell King <linux@arm.linux.org.uk>, J.Lambrecht@TELEVIC.com,
 linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7JIA5bRuea6c1BmBH3FT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 18:17 +0200, Ga=C3=ABtan Carlier wrote:
> Swap the BI-byte on position 0x7D0 with a data byte at 0x835.  To fix a b=
ug
> in Freescale imx NFC v1 SoC's for 2K page NAND flashes: imx27 and imx31.
> Warning: The same solution needs to be applied to the boot loader and the
> flash programmer.
>=20
> This is a modified version of patch sent by J=C3=BCrgen Lambrecht :
> [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block Indicator,
> and use for imx27pdk nand support.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-7JIA5bRuea6c1BmBH3FT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPcsRAAoJECmIfjd9wqK0KLIQAJ2XPBcCfhm1QJoLVvRNytPi
dJ5+/f2d8rhERvWco+m1ZqJuyYBq+MWxYglfgbC255pcKrkRZtigM/wSUPjhjve0
qXWe+DOjxUEeAvNQJm4QVK4BhgCXNEvNpcX0UEFvOhvB0Ewmc8D2gIbpukuIGtik
CTjSTYFAF2YvXgjRWVfkV54hn+BJWa7xE5v7X0E10S0G5ItJsUx73+nIkBXurExv
X+TjLx22F6jELfKrZoJKZOvvPNC2AHsaoGgDvTo3+9IVDGjm50T2/03dBXlu5AY4
5lmZ3uBM9TQNQQHMgBrc0hmz/ZLbQWUp53ErQfljV3G9N/Rr5LNCPIxWP5aExuXu
bRUh4QuPh3OAMKbATDsD8ztAQj3xXkqPg0jNhROJGzvjp6qpimyaz3NT3olpuyCv
0UwT8Qc9uub8YWJI7PmuhpJHQ25HxNQBAqDcI+ZYLpzJagwMQRsU/DMnkTDPXozS
5BttppoBZSpBPnvernePo5xXkAh7w3hto0n1Lp3TcxbZt0uVmAE+d/9vEs60P9fx
GFXlflzhkfuCTMn6Twz91MyJXfSKYZB8SS1stdtI3A5gx6OE9TQnaz/abiTzsn2o
rQJigOqg47Bk8aD5uUDx6Eyp31T5GaSrsWnTXkaKTMCACMJuu24js0mkp1wZFH/H
ZiRNyNFXa+QonBTZ+3jm
=G41L
-----END PGP SIGNATURE-----

--=-7JIA5bRuea6c1BmBH3FT--
