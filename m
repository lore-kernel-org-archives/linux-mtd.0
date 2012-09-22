Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFS4k-0003IK-3D
 for linux-mtd@lists.infradead.org; Sat, 22 Sep 2012 15:57:02 +0000
Received: by bkcji2 with SMTP id ji2so2147768bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2012 08:57:00 -0700 (PDT)
Message-ID: <1348329411.1894.3.camel@kyv>
Subject: Re: [PATCH] mtd: nand/gpio: Use module_platform_driver macro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Sat, 22 Sep 2012 18:56:51 +0300
In-Reply-To: <1346839292-31001-1-git-send-email-sachin.kamat@linaro.org>
References: <1346839292-31001-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cCB206ioo4R8CNB+hIrt"
Mime-Version: 1.0
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cCB206ioo4R8CNB+hIrt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-05 at 15:31 +0530, Sachin Kamat wrote:
> module_platform_driver simplifies the code by eliminating
> module_init and module_exit calls.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-cCB206ioo4R8CNB+hIrt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXd/DAAoJECmIfjd9wqK0kpgP/A+xYmxfW4MIkVcYL66QOBob
XclgOMBr9VSGt4fq3YFAgaCxY/7iAESNtgqp2rhYIt9/IwgF17owlx0ao2ivqs5S
ValMuh59WrOhsF5IBUtCMYdSTFLeriP20cCaAU6kGBDPV4G42OZXws9c81XXHQZZ
x7fCgCY0zGHY8ed7kkPB42/u4OiHEh5sNHdDz9TmbHUTi9cr20aE/91AtgCNgM6g
MQvGZuCnPgB+yx7XWYmMiyDUw+HTUBsAwvyvd2fTLC5NPdVbvdYyNmPTmJs/dulH
SKbT3AIoJiPClOryBKBKy2YkYmjXyQWNedzwdkUDs4Gh4nZV7oRney9WMQIFPYaX
a2nfhmuYECHyXO5Y9nLdAOKMzPyUvfNIUeimUM4oKyLlC9BteefdVBDVeZgbWGtq
iDiwqNROYkzKUyV2/NpWSDABHdtimyWCXTtw7DLCGRhA/3pktvqVpxmJPLkRZx5N
rcuu3zBEJyQLuDXv1EYTg6cKnsK2Xd94cEtxpmdOiFHltxUM/RArFFF+xIyiOHob
TMXJRnFGkxR9j2yLi/y1GJcuHGT1/TPscId3UGbT1UHzKbEqVsNY8+s+bk85R2Xy
2HJPd5WusSrrEzI5dHuGqJssm6Tl1iRS5eyAAgrxVRVAD9jhJ2MDuJUK1+f6nkg8
Z+/UsIqP0mtKMcnkKGbx
=pqo4
-----END PGP SIGNATURE-----

--=-cCB206ioo4R8CNB+hIrt--
