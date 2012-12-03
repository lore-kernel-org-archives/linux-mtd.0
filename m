Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfUam-0005Pa-92
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 11:53:45 +0000
Message-ID: <1354535678.30168.192.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/5] ubi: Replace memcpy with struct assignment
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Mon, 03 Dec 2012 13:54:38 +0200
In-Reply-To: <1353671885-2287-1-git-send-email-elezegarcia@gmail.com>
References: <1353671885-2287-1-git-send-email-elezegarcia@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Yr+uFMNaZcWwgcUC985z"
Mime-Version: 1.0
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Yr+uFMNaZcWwgcUC985z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-23 at 08:58 -0300, Ezequiel Garcia wrote:
> This kind of memcpy() is error-prone. Its replacement with a struct
> assignment is prefered because it's type-safe and much easier to read.
>=20
> Found by coccinelle. Hand patched and reviewed.
> Tested by compilation only.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Yr+uFMNaZcWwgcUC985z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvJL+AAoJECmIfjd9wqK0PdsP/jEU92BVSEDCcf972h5gQSEy
trYOfEDZA/2hulT4zItCy3t/UGAt1zRgaF0wDHmafKR0GV1AMzgAIjj6ZCNVx+4g
sPs1nBkzC3ySB55pAqr1Xy27zh4CHON3pQg+xeacf7vx7K8MqnAIQaw0wYhKSoq7
padZfbD32RKcFknXH14TYZotKKbc78ziaubLVQBWHxzx0ww36ap3u+fuWVxTd0jv
5cizAxYO32xPXeXm6P7KBMDngPKnNireKsScc/gC+KcRMJYce/pkZhH+NTIfuR0g
g9aCX3cYk+CC8Sw7Kc8DoFoSt0z60bd97F+dbNg6AiibPgn5SIRT4SUJ8KSPVju8
3z1Woun3F6nV3pQ1EjsQJcz1HM2JpeuP9vUwzPLC4kk5bqyFqiCQLDXrh+6TihMr
2DiMh8guqEb3QLx5eAkQC9BEZ4YxH/1+x7OBY4wVggfl51WrlsgYLpRbMi+YQps3
dEQvhmAwyheVCqWR3E+GU29IjpwVrMuCvXMrVOlcxD/7MFkRIYdYYowxqRNLiYo+
Nx5h2C79tlgSw2Z8mBaU+KS+ZRbofNyU4p8x35wY5Fp/WxBTK/51Pif1wK4Jgmz8
ZzGjbUNKS2ahFT6cUNMp4BwXicdC3Xvs+3Uk0lZTV3fIytdrFqxHrBtXVeoNemUe
eyDy9jaGFYnCTrlw55CK
=/qfD
-----END PGP SIGNATURE-----

--=-Yr+uFMNaZcWwgcUC985z--
