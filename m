Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7Pak-0000w6-Ux
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 11:40:52 +0000
Message-ID: <1346413543.9709.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 31 Aug 2012 14:45:43 +0300
In-Reply-To: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rCjxV1362Zlpdx9yzFL7"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shmulik.ladkani@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rCjxV1362Zlpdx9yzFL7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 13:21 -0400, Huang Shijie wrote:
> There are typically two types to set the mtd partitions:
>=20
> <1> set with the `size`, such as
>     gpmi-nand:100m(boot),100m(kernel),1g(rootfs)
>=20
> <2> set with the `offset`, such as
>     gpmi-nand:100m@0(boot),100m@100m(kernel),1g@200m(rootfs)
>     gpmi-nand:1g@200m(rootfs),100m@0(boot),100m@100m(kernel)
>=20
> If we mix these two types, such as:
>      gpmi-nand:100m@0(boot),100m(kernel),1g@200m(rootfs)
>      gpmi-nand:1g@200m(rootfs),100m@0(boot),100m(kernel)
>=20
> It's hard to understand the cmdline. And also it is hard to sort the
> partitions in this mixed type. So we explicitly forbid the mixed type.

So "explicitly forbid" is just to add a "do not do this" comment?

--=20
Best Regards,
Artem Bityutskiy

--=-rCjxV1362Zlpdx9yzFL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQKPnAAoJECmIfjd9wqK0es8P/2zg2GDh+wvHN29raiWfG7/n
KYzTz7tfpactpi34AttSZ0Wj80MCLHgPoCjUbKi100w2Z3OnX5SYSvxZzYwbt8lR
Q6RyAVwwZjt/HsA40ItxeUk89N7xCgkOKsUT2BEVrxzChLq9aotgmuT0vkjaRF6V
A1iwQuh1srMKrTJna10Z8hIGMhB2oWJBNYmF7Rl2JKMHEQD5c1VUoNygR4ck4jUe
ShsPZ0yCyGUU2uOQQuXsm0mTqYiex0fuGPMJtCN0vSs9YdWIR1Jeuo5i+93TvUQT
Gkos9fZK16VzE8USgPlEYo5qCO0++kzvTNMmTOR61l6Sq6GBgRuchDDb2IkuLjpy
FH/cTgGxVOXoaYWflZ9rP4ajNZHDWkmWaLAdAwM1vCYIL1yvAPzS05LrVgZsRwwh
EG0BR2EOjUfDhhMP++HLKym2DMW84flztgKBy/KHgybb/oDf/tHtJ4mvfejR31PH
MARVdZ33QR5OqxZYoebpQcg6RZIHn2FiwO0C/VbsQydimWii/tmefROZk87FQLiT
Vtw07VeaByKo/NU5MFdSVU8bnUj8SzKcFqCnjMfnp9SJR10SqosdhlIGGqMmhwCN
a4N5YRnOp73qDDIYgWDCClQ81tDV+VWsr7G+EeBYX4wQGpziQqSlo98y50pIx6FR
Ivs/BX1gIq26vbdjX46B
=JVNM
-----END PGP SIGNATURE-----

--=-rCjxV1362Zlpdx9yzFL7--
