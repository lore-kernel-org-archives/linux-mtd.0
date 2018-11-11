Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLwit-00020u-LB
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 20:52:49 +0000
Date: Sun, 11 Nov 2018 21:52:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Robert Marko <robimarko@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N01GV
Message-ID: <20181111215235.71176bbb@xps13>
In-Reply-To: <20181012110412.000a932c@bbrezillon>
References: <20181006153642.10376-1-robimarko@gmail.com>
 <20181012110412.000a932c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 12 Oct 2018
11:04:12 +0200:

> +Miquel
>=20
> Hi Robert,
>=20
> Please Cc the NAND mantainers when you send a NAND related patch
> (in case you don't know about it already, scripts/get_maintainer.pl
> should help you find who to Cc).
>=20
> On Sat,  6 Oct 2018 17:36:42 +0200
> Robert Marko <robimarko@gmail.com> wrote:
>=20
> > W25N01GV is a single die version of the already supported
> > W25M02GV with half the capacity. Everything else is the
> > same so introduce support for W25N01GV.
> >=20
> > Datasheet:http://www.winbond.com/resource-files/w25n01gv%20revl%2005091=
8%20unsecured.pdf
> >=20
> > Tested on 8devices Jalapeno dev board under OpenWrt running 4.19-rc5.
> >=20
> > Signed-off-by: Robert Marko <robimarko@gmail.com> =20
>=20
> Looks good.
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied to nand/next.

Thanks,
Miqu=C3=A8l
