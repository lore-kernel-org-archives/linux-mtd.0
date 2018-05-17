Received: from mail-eopbgr20085.outbound.protection.outlook.com ([40.107.2.85]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJCU4-0008S3-TO
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 06:33:55 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>
CC: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>, Ashish Kumar <ashish.kumar@nxp.com>, Yogesh
 Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>
Subject: RE: [PATCH v7 0/5] mtd: Add a SPI NAND driver
Date: Thu, 17 May 2018 06:33:36 +0000
Message-ID: <VI1PR0402MB385432DF72BABAAA10EF4B2297910@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180515150825.19835-1-boris.brezillon@bootlin.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Boris,


> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Boris Brezillon
> Sent: Tuesday, May 15, 2018 8:38 PM
> To: David Woodhouse <dwmw2@infradead.org>; Brian Norris
> <computersforpeace@gmail.com>; Boris Brezillon
> <boris.brezillon@bootlin.com>; Marek Vasut <marek.vasut@gmail.com>;
> Richard Weinberger <richard@nod.at>; linux-mtd@lists.infradead.org;
> Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Peter Pan <peterpansjtu@gmail.com>; Frieder Schrempf
> <frieder.schrempf@exceet.de>; Vignesh R <vigneshr@ti.com>; Xiangsheng
> Hou <xiangsheng.hou@mediatek.com>
> Subject: [PATCH v7 0/5] mtd: Add a SPI NAND driver
>=20
> Hello,
>=20
> This is a brand new version of the SPI NAND framework initially proposed =
by
> Peter. Note that this version has little in common with the previous one,
> mainly because it's been reworked to use the SPI mem interface (which
> allowed us to get rid of the complex NAND initialization/registration log=
ic).
>=20
> Also, this version now natively supports on-die ECC and multi-die chips
> (which was required to expose the 256MB of the W25M02GV chip). I know I
> initially asked Peter to not support on-die ECC in the first version of t=
he
> framework so that we can work on a proper abstraction for ECC controllers=
,
> but I ended up implementing it, since all the chips seem to have on-die E=
CC
> and the implementation was not that complicated.
>=20
> I'm not giving up on the "ECC controller abstraction" stuff, but with thi=
s initial
> implementation we at least have usable SPI NAND support, which should
> give us some time for complex setups with external ECC controllers.
>=20
> Just a few details about the patches in this series:
>=20
> Patch 1 is just extending the nand_page_io_req structure to pass
> information about the access mode (ECC enabled/disabled) so that we can
> use that in the SPI NAND framework to decide whether on-die ECC should be
> enabled or not.
>=20
> Patch 2 is adding the core infrastructure to handle SPI NANDs, and patch =
3 is
> decribing the SPI NAND bindings.
>=20
> Patch 4 and 5 add support for 2 different chips, one from Micron and one
> from Winbond.
>=20
> Comments/reviews are welcome.
>=20
> Thanks,
>=20
> Boris
>=20
> v7 changes:
> - Use the spi-mem interface

This is putting requirement for having controller driver in  driver/spi.=20
What about the controllers which are supporting NOR and NAND flash. How the=
y are going to co-exist.=20

Are we supposed to have 2 flavor of driver. One in driver/mtd/spi-nor and d=
river/spi?

--pk
