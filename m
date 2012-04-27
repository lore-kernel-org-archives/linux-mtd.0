Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNlML-00020b-IO
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 13:37:18 +0000
Received: by lagy4 with SMTP id y4so579601lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 06:37:15 -0700 (PDT)
Message-ID: <1335533832.1910.3.camel@koala>
Subject: Re: [PATCH] MTD: bcm63xxpart: handle Broadcom partition order
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Apr 2012 16:37:12 +0300
In-Reply-To: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
References: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rKjsU+hTvSoxFMlobpF1"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rKjsU+hTvSoxFMlobpF1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-04-19 at 13:15 +0200, Jonas Gorski wrote:
> The original Broadcom partition order has the root fs in front of the
> kernel, which resulted in miscalculated partition sizes.
> Detect when such an image is on the flash and also reorder the partitions
> accordingly.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-rKjsU+hTvSoxFMlobpF1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmqEIAAoJECmIfjd9wqK0zqIP/3S5os0sZr7PZicKV/NrHWaP
G8OtywzcRi28bX7D/H4KbUDhvOar74ckNGR1hxuAe09WVQiEsP/zGVA5F/RXja27
wRD+GSuv9ghBCGroSSa0rtVD0ThOd1GHnQXp7VXWn8nrdscMATm66Mqg4Hlrynoq
d1coVy/C7rBP4DzYNN+kQv1QYqAL9v/M18fvxCxpLBo3abq+V0Tl/lGt0QnZ3xzh
2UJUTvrAts2j+cksDDkB/9d2req1rBxlJ749agNWVgd8zDVwfh3DnG0dcKal8p0a
WyiJavG8Zbiipi0xnZa67na4e/3InucCdj62Y6cPkI39WmdoGCxbC4NVa6hE/OwB
thEJZtT9S9PBdPnmhDBcyIv+n62dqHWED/LT2FSui85PBLR+50K4cDNBf3Knc6O0
9qSmovxlx+RLKtRv2RjWtHDcblgbTglrhPseKowo8KtsnBBbEHPjNIGqmbzXh3tQ
9rVgqSZdav9nnXK/O7UqUpczA9CRMkBPp3eO9tQKed53KYowb2djsZ9FmmTBG+fd
74TvWNzYDwz2aFkRSfO0PDpUlhiQCQT5OtIvTHnJjHdAgTj2wA6TR53EklzbtxPl
hKXdqsXXbc/vD+wzXFjVoGOwFaic4UjXUncMBQOFcOWyL7j807rcNfwn03dGDAdj
XKHckb999mqPQgzdvV3t
=/VwL
-----END PGP SIGNATURE-----

--=-rKjsU+hTvSoxFMlobpF1--
