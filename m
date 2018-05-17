Received: from mail-ve1eur03on0622.outbound.protection.outlook.com
 ([2a01:111:f400:fe09::622]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJFj1-0003bJ-8l
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 10:01:35 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>, Ashish Kumar <ashish.kumar@nxp.com>, Yogesh
 Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>
Subject: RE: [PATCH v7 0/5] mtd: Add a SPI NAND driver
Date: Thu, 17 May 2018 10:01:17 +0000
Message-ID: <AM6PR0402MB3847AD1E2BC7CAA66C7AD45D97910@AM6PR0402MB3847.eurprd04.prod.outlook.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <VI1PR0402MB385432DF72BABAAA10EF4B2297910@VI1PR0402MB3854.eurprd04.prod.outlook.com>
 <20180517090513.005614e4@bbrezillon>
In-Reply-To: <20180517090513.005614e4@bbrezillon>
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


> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Thursday, May 17, 2018 12:35 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: David Woodhouse <dwmw2@infradead.org>; Brian Norris
> <computersforpeace@gmail.com>; Marek Vasut
> <marek.vasut@gmail.com>; Richard Weinberger <richard@nod.at>; linux-
> mtd@lists.infradead.org; Miquel Raynal <miquel.raynal@bootlin.com>; Peter
> Pan <peterpansjtu@gmail.com>; Frieder Schrempf
> <frieder.schrempf@exceet.de>; Vignesh R <vigneshr@ti.com>; Xiangsheng
> Hou <xiangsheng.hou@mediatek.com>; Ashish Kumar
> <ashish.kumar@nxp.com>; Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com>; Poonam Aggrwal
> <poonam.aggrwal@nxp.com>
> Subject: Re: [PATCH v7 0/5] mtd: Add a SPI NAND driver
>=20
> On Thu, 17 May 2018 06:33:36 +0000
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Dear Boris,
> >
> >
> > > -----Original Message-----
> > > From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On
> > > Behalf Of Boris Brezillon
> > > Sent: Tuesday, May 15, 2018 8:38 PM
> > > To: David Woodhouse <dwmw2@infradead.org>; Brian Norris
> > > <computersforpeace@gmail.com>; Boris Brezillon
> > > <boris.brezillon@bootlin.com>; Marek Vasut <marek.vasut@gmail.com>;
> > > Richard Weinberger <richard@nod.at>; linux-mtd@lists.infradead.org;
> > > Miquel Raynal <miquel.raynal@bootlin.com>
> > > Cc: Peter Pan <peterpansjtu@gmail.com>; Frieder Schrempf
> > > <frieder.schrempf@exceet.de>; Vignesh R <vigneshr@ti.com>;
> > > Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > > Subject: [PATCH v7 0/5] mtd: Add a SPI NAND driver
> > >
> > > Hello,
> > >
> > > This is a brand new version of the SPI NAND framework initially
> > > proposed by Peter. Note that this version has little in common with
> > > the previous one, mainly because it's been reworked to use the SPI
> > > mem interface (which allowed us to get rid of the complex NAND
> initialization/registration logic).
> > >
> > > Also, this version now natively supports on-die ECC and multi-die
> > > chips (which was required to expose the 256MB of the W25M02GV chip).
> > > I know I initially asked Peter to not support on-die ECC in the
> > > first version of the framework so that we can work on a proper
> > > abstraction for ECC controllers, but I ended up implementing it,
> > > since all the chips seem to have on-die ECC and the implementation wa=
s
> not that complicated.
> > >
> > > I'm not giving up on the "ECC controller abstraction" stuff, but
> > > with this initial implementation we at least have usable SPI NAND
> > > support, which should give us some time for complex setups with
> external ECC controllers.
> > >
> > > Just a few details about the patches in this series:
> > >
> > > Patch 1 is just extending the nand_page_io_req structure to pass
> > > information about the access mode (ECC enabled/disabled) so that we
> > > can use that in the SPI NAND framework to decide whether on-die ECC
> > > should be enabled or not.
> > >
> > > Patch 2 is adding the core infrastructure to handle SPI NANDs, and
> > > patch 3 is decribing the SPI NAND bindings.
> > >
> > > Patch 4 and 5 add support for 2 different chips, one from Micron and
> > > one from Winbond.
> > >
> > > Comments/reviews are welcome.
> > >
> > > Thanks,
> > >
> > > Boris
> > >
> > > v7 changes:
> > > - Use the spi-mem interface
> >
> > This is putting requirement for having controller driver in  driver/spi=
.
>=20
> Yes.
>=20
> > What about the controllers which are supporting NOR and NAND flash.
> How they are going to co-exist.
>=20
> Can you give an example (with a datasheet or a detailed description) of w=
hat
> you call a controller that supports NOR or NAND. AFAICT, all SPI controll=
ers
> can support NANDs and NORs, because all they do is send spi-mem
> operations to the device, no matter if the operation is NAND or NOR relat=
ed.
>=20
> >
> > Are we supposed to have 2 flavor of driver. One in driver/mtd/spi-nor a=
nd
> driver/spi?
>=20
> Definitely not. You should have one driver in drivers/spi/ and the SPI NO=
R
> layer should access this controller through the m25p80 driver. If you nee=
d
> features that are not yet supported by the spi-mem API, then we should
> discuss it, 'cause the goal is to have all SPI controller drivers in driv=
ers/spi/
> instead of creating one interface per memory type.
>=20

Currently NXP has fsl_qspi driver is placed in driver/mtd/spi-nor.  QSPI co=
ntroller(hardware) can support both SPI NOR,  SPI NAND flashes.

fsl_qspi is currently supporting Serial NOR. =20

As NXP will be adding support SPI NAND with fsl_qspi driver in near future.
This means  a transition is required from driver/mtd/spi-nor/fsl_qspi.c to =
driver/spi.=20

Hence driver/spi/fsl_qspi has to support both SP NOR and SP NAND under cont=
rol of mtd/nand or mtd/mp2580.c driver.=20

--pk
