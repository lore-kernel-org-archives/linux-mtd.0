Message-ID: <1338122668.19389.4.camel@koala>
Subject: Re: [PATCH v9 1/3] MTD: at91: extract hw ecc initialization to one
 function and use relaxed read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Sun, 27 May 2012 15:44:28 +0300
In-Reply-To: <1338038677-6752-2-git-send-email-josh.wu@atmel.com>
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
 <1338038677-6752-2-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZFxNNg0EJMJ4WJhNz7bM"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZFxNNg0EJMJ4WJhNz7bM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-26 at 21:24 +0800, Josh Wu wrote:
> use _relaxed read/write in most place. And use writel in operations of Co=
ntrol Register since it needs memory barrier.
>=20
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

This should be split on 2 or even 3 parts:

1. You move definitions and things around.
2. You separate out the init stuff into a function
3. You start using _relaxed helpers.

And you should provide better commit messages. You should explain why
you do things - just cleanup? improvement? fix? preparation for
something?

I think this patch is too big, commit message is poor, patch does more
things than documented in the commit message.

--=20
Best Regards,
Artem Bityutskiy

--=-ZFxNNg0EJMJ4WJhNz7bM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwiGsAAoJECmIfjd9wqK0QioP/29s5ZQ0ZeypC1EeRDyG42l1
RoC9wUCbE8+9bTJelzYghIMHdPzZhtXjjwF36XSQMv5SERMVYMrXfK96+2WqMdb4
3gD0w9zCmN+WP+OjjHhaocbEG+0ixlpIv2u+PvsDay8fztPyzdmt3+aAru1tK8Dn
ozGN14Yht91mrK9Vt0n7G7g8BmpWlrLF8M8/NreHaWdYHdTvC0tFrYxzckcbZGxA
izLqGk9etKrdTwNVHRkrF10M/arelrpowgrHkWH259YXOHNLMpAV0MlayZdrYD3X
tFU24lgIHNylS//Q6SAamj5miBzBcqGO+CY1P981wGQp/tAfasnOBJn5OpFpoA7q
7iPG7Ie+BN37x/RBoykKaM75QFKdRr6JIDqDwL7fHy44ftLrNTi46Fx9kaXWFZmg
UV0R4mYpRMgDySdssc0N5j6ubfe1SVyuv+dGNlx+kwMpYXMabMV3BwHN9pyBXF0r
lQ7wZ8031bkKurDy3hBJ+bcmdJEIAIWqXEQtVg9jo6nGr2VEwwk2B0CAWQNlPPxJ
G10QTNKF3WB5oyhduNcVOAuKiEDkOrOfg40mtRTOVnnmyDBbdGCrWGw+v6WRVZRB
n7FEq0Qp+2XGBW4FB9QoVobHkG0NCvfSALxEANE5+CaNJujD9Bo0yO8fW97u8Yp3
ui1Xil9FhzScbvD3s3Hc
=d049
-----END PGP SIGNATURE-----

--=-ZFxNNg0EJMJ4WJhNz7bM--
