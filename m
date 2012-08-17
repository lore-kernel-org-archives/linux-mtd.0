Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2OaP-0003y3-NN
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 15:35:46 +0000
Message-ID: <1345218030.1003.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND 1/2] MTD: autcpu12-nvram: Fix compile breakage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Fri, 17 Aug 2012 18:40:30 +0300
In-Reply-To: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
References: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QL0Hi2peT7Qxx9SaD/w5"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QL0Hi2peT7Qxx9SaD/w5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-15 at 20:28 +0400, Alexander Shiyan wrote:
> Update driver autcpu12-nvram.c so it compiles. map_read32/map_write32
> are no longer exist in the kernel so the driver is totally broken.
> Additionally, map_info name passed to simple_map_init is incorrect.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed to l2-mtd.git, thanks!

I've also added "Cc: stable@vger.kernel.org", is this OK?

--=20
Best Regards,
Artem Bityutskiy


--=-QL0Hi2peT7Qxx9SaD/w5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLmXuAAoJECmIfjd9wqK0U9IP/36MNOhZ3rniexwDt9x+FSOn
V1RL7UIF/HuCrVxuZ6/gxKjefBO2yuAKQ+SfSiAQmJcvFeR7tKq97Y7JqqQzeDRJ
safkj4ZNUQGDdtuLw120BCQFcCOQxwYKCyQX2ZqmJF68E/X+3++WKigriTVVg0KI
HsMKrAyp9HJeE5VxKSCGJJzQIhWSnfbnbAXGPDpy8R+NoKTi/Z5s0pkfim5wi00s
UG11AbDTHdh9raAman4YSwQ9G4Ya6PUQAYiGWvxxXUZZia5pV0wqRUodALex4I7b
G7jNYEBLKufugF8XcFTY3xHIGkSWWIGLJkvMgQK8sMt12KncRbRHWU8Qf3JQI3L/
Lmz19/hm1EYzLhBYuSoMXhH47WKxD9d6hqJMYR9fdNJje3jg8C92FkWS4f/0bkxp
P0wfXFlhbCSt/DYWbY7oWpJT4xQi/pcg3+Vh3xbaF8XkcmuBKHejHRZLFTR7/bnG
NUZtc+p2Q5pzM8xp+pa6Hwzz05qyG8u8RNx7Oy5ToXxdq2W5LLCFK0xvD64OU8ou
zze/5gEaoeU8wF2N1RT9/OXVQJfQoyIjUGduOyKNiQxvuv5iiHJkfpsnhPYA0ppn
qPnEU+mQygIyGclzbJQQRMHcYXAXEUyEjkYzMUydddEapetLMSzcTl8NqfNvprHl
OUBDz/Amw4oCX6AlUNaL
=rHMr
-----END PGP SIGNATURE-----

--=-QL0Hi2peT7Qxx9SaD/w5--
