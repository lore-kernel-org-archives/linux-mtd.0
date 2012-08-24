Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4syA-0005YN-P4
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 12:26:35 +0000
Message-ID: <1345811483.2848.310.camel@sauron.fi.intel.com>
Subject: Re: UBI on SPI NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Date: Fri, 24 Aug 2012 15:31:23 +0300
In-Reply-To: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FCVc8U1H0ZP/uxu5qAvB"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FCVc8U1H0ZP/uxu5qAvB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-15 at 19:10 +0200, Jan L=C3=BCbbe wrote:
> Hi all!
>=20
> I'm trying to use UBIFS on SPI NOR flash, but have been unable to get it
> to work on kernel version 3.5. It is a Numonyx N25Q128 connected to an
> TI AM3505.

First of all, run the mtd tests and see if the flash works well.

Another problem I know with SPI flashes is that UBIFS uses vmalloc'd
memory for I/O, which is not suitable for DMA-ing on ARM platforms and
may cause subtle bugs and curruptions. Can you try to disable DMA and
see if the issues go away?

--=20
Best Regards,
Artem Bityutskiy

--=-FCVc8U1H0ZP/uxu5qAvB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN3QbAAoJECmIfjd9wqK0F9sP/R+tKNNMCzcjSVCdiw0VJyPo
py+3gUTQuczydKpy5asnMDs6Mgxhehd6dx3Er3jfYywFWNevLTWjYil+uNdei0bG
kvgKT7GWWTp8Z+dkKeVmGWkedSJCWKpAhcYMKX1jt5fmzh/4yJ3MXjFmiYlBfi9+
qjCmm6jm9luLkraB/LVSq2PF7AdkCFG1vL9UXQHxIQtmmFY4dcDEAmB3QtWidHbQ
FobSU40OgrW0qWNgYc0NkReyCvGtWY9tqlvMKh4nrjF3Mp+CUlF+mTF86F67REAU
jBbuzmQxoUrq9ALIfwHjdCPlrl/S1/XEUg36m+zkL4bQ4OOSJ2XYL91URdhqXhrs
G8PTXP5zLACfQklTSQ5NC5Xm723XSwgJY1sm8/XvIFeTr6dZdvzQExAq4XfYCird
mW7rTNWjPJSv/BaBSAXdpRoCgRm92/LAhaOSEiOIgNAYC6ADiq8/DJwXOuE8m2a5
w4O2J7y0asYgv8Esh042i2/Cun6EKCvnl4gG07ktTz0Sc6OakHWIUytdB8Z/FuIr
0In6PkU8LJ8OmGLaOybf/vXxgZRZnXHyHovIrTcl3W9gO4oppAaeyIrbXD2XLqjj
6nDMQy1yscH2UOB+hL9F9PjpbfrbGPatVqp0CmmjB/c4Rfu6BmI8PpVqneDXQA0m
fMvzCchY9Zb4zYAemwUf
=8bEa
-----END PGP SIGNATURE-----

--=-FCVc8U1H0ZP/uxu5qAvB--
