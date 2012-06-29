Message-ID: <1340970369.3070.166.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd mxc_nand: use 32bit copy functions
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 29 Jun 2012 14:46:09 +0300
In-Reply-To: <1338279369-25915-1-git-send-email-s.hauer@pengutronix.de>
References: <1338279369-25915-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2OUxUQZDkoCWxzyRtyzz"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2OUxUQZDkoCWxzyRtyzz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-29 at 10:16 +0200, Sascha Hauer wrote:
> The following commit changes the function used to copy from/to
> the hardware buffer to memcpy_[from|to]io. This does not work
> since the hardware cannot handle the byte accesses used by these
> functions. Instead of reverting this patch introduce 32bit
> correspondents of these functions.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-2OUxUQZDkoCWxzyRtyzz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7ZWBAAoJECmIfjd9wqK0HdoP/0Mefaef+c9nZmnPwxeFv+vw
rnsC3/QXm/VAFlbX4//5P9QHjL0yZG1NYuPQ3hy8//SnxFAUbk5UJJlvEAA1PtUx
huEH9RTCZqlwS9aX1h3cFGyBtWvqvGGGnsvWkvTgxPC4rtccbrimoWw+auqVkkNk
XuPl3lui7O+XqUCaHzOyEFn75KHNedzZ3JSrEoyd58ovalCl3wdF3GuVf0dTCFX3
TQhZxvcLD0NNoW4TtXhxs0TRJH2q3dsPuNtFKXSfOQL0PoYie+Y8ivfmZGsut0bd
52v4jsNmx5gjSAmLU0a8X3N6vfPuQfioUxO34ECun8dGJ868bncDdCT35C7PSYu1
dWQrW65jsCY7BGc6boHza0iHYCwo4Pf5qckU5omo+3iUWZmNY3GoWdKcdHaPcM42
FRwLrf0ypvgY+foXn+R8NzT7AoekZ9IL0i8fPXniHp86gGNFKYHhAczER4QR8OC6
OV29MW1Uoq84L31IIlZRC4iPfy3UvJPtp5qhXRgfrYEvzXufkdBF44g6zd6meLu/
E42mac/51GjKrAGumgydQVUEzf4AxjjLuUOr7ZzzGJVMSxIfbueJiMwa5QMnupKf
/sGk6SlIES9sXEHlZ01E/356m1eQHrKPJh4oiSzrXAsYYweilczS2KYFMy64WiF5
wB6RpMvcWpj6ooFlcVk6
=lb9O
-----END PGP SIGNATURE-----

--=-2OUxUQZDkoCWxzyRtyzz--
