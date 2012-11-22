Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbVPd-0006Vj-He
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:57:46 +0000
Message-ID: <1353585508.2701.47.camel@sauron.fi.intel.com>
Subject: Re: [resend] [PATCH] mtd: m25p80: modify info for Micron N25Q128
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Liming Wang <walimisdev@gmail.com>
Date: Thu, 22 Nov 2012 13:58:28 +0200
In-Reply-To: <1353567489-29220-1-git-send-email-walimisdev@gmail.com>
References: <1353567489-29220-1-git-send-email-walimisdev@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UnTqU16M9KYcPR3wiMAs"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Jan Luebbe <jlu@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UnTqU16M9KYcPR3wiMAs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 14:58 +0800, Liming Wang wrote:
> Micron N25Q128 has two types of flash:
>=20
>  - One is for 1.8v supply voltage, prefixed with "n25q128a11" and the jed=
ec
>    code is 0x20bb18.
>=20
>  - Another is for 3v supply voltage, prefixed with "n25q128a13" and the j=
edec
>    code is 0x20ba18.
>=20
> So modify the original type info and add another type for Micron N25Q128.
>=20
> Signed-off-by: Liming Wang <walimisdev@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-UnTqU16M9KYcPR3wiMAs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrhNkAAoJECmIfjd9wqK0+xYP/1N85MsQykqQOv59zeb0BUC9
0LXqmsvH2OAYOfP6W1li27tDoKGGVv2aLLTqTvyVo9Izbb71Qcd32NFZHJreZtKX
bkKtpU8Byuav1koOu/97WH4Oxyytt0f2ON+wdT86E9ZJJjfykfprX7aXEfuS47bM
Zxl7eK4t6zjw7gV4nXrbahmFpOpFbUVXbNbaRQnDFt35urwsW3ezgeGmaMfU0vrm
bwtGNJN1BBMgXlIeKFwByFUC2CjD5o3KqQvQApVPm0qe3Z05L3yp3JJYef1wHke5
rBUi8e75frKJS7HOU4DzuR8a4E7Wxj3gKvx3gRSjf4ocESnsR44vw3QROYeTsYMr
TvkhTvjgCdN7IjR1dZRngCMe/WMCw9newMCFdZCQxz6ml5L3Sty29oGdGaw3ykPK
MOCcPRyts+Xk5aLzUOinLFlZG9U2qnH0QNNy6xwS+z1xmSx2Llg3UlqCmD7S8TIK
7QwuoxlAZoj8V4CPOkhpehAtLbq8SXv4O+2zFilhCvqCa3SRXn8A1uQqg/SApG0O
gTVq691XbsS3il2YrUtED5ZWih0NwVFZ1wELZiBIf9hDOBhVJuV0xKKzv9bZMQEz
oRxfCZYIdN7UOBLz/mZd0lgnLRdSjtBl2RRqgEE90DVwgtH1Iy9NKDeiILpMZ9Bs
bQ/aZvg/hhtAnLbI/sOa
=ApIY
-----END PGP SIGNATURE-----

--=-UnTqU16M9KYcPR3wiMAs--
