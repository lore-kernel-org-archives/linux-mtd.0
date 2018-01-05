Received: from mail-he1eur01on0056.outbound.protection.outlook.com
 ([104.47.0.56] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXP8X-0006H0-NC
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 10:22:13 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Cyrille
 Pitchen" <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
Subject: RE: mtd layer: support of hybrid flash(W25M161AW) having both NOR and
 NAND flash
Date: Fri, 5 Jan 2018 10:21:48 +0000
Message-ID: <HE1PR04MB12410ABF9189334C4CDE512A971C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <20180104184722.551ca6aa@bbrezillon>
In-Reply-To: <20180104184722.551ca6aa@bbrezillon>
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

Thanks Boris for the encouragement.=20

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Thursday, January 04, 2018 11:17 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: linux-mtd@lists.infradead.org; Cyrille Pitchen <cyrille.pitchen@wedev=
4u.fr>;
> Richard Weinberger <richard@nod.at>; Marek Vasut <marex@denx.de>; Brian
> Norris <computersforpeace@gmail.com>
> Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NO=
R
> and NAND flash
>=20
> +MTD maintainers.
>=20
> On Thu, 4 Jan 2018 14:08:42 +0000
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Hi All,
> >
> > Winbond has come up with special flash i.e.  W25M161AW. It consist of S=
erial
> NOR(Die #0) and Serial NAND(Die #1) flash.
> > Means both NOR, NAND flashes are placed in W25M161AW controlled by
> single chip-select.
> >
> > "Software Die Select (C2h)" command is being used to switch die or flas=
h.
>=20
> Why are they so mean to us?! :-)
>=20
> >
> > It looks to be quite unique chip and wondering if any kind framework or=
 work in
> progress available to handle it.
> > I know that SPI-NAND framework discussions is still in progress.
>=20
> Well, nothing impossible to handle, we just need to declare 2 MTD
> devices (one NAND and one NOR). This being said, it looks like we'll
> need this spi-flash abstraction we have been talking about with Marek
> and Cyrille to properly support these use cases: flash devices will be
> exposed through different sub-layers (spi-nor or spi-nand), but we need
> a common way to detect those spi-flash chips. I looked at a few SPI
> NAND and SPI NOR chips, and from what I've seen so far they were quite
> different (the opcodes and CMD+ADDR+DATA sequences were quite
> different) so I thought we were safe to start with a completely
> unconnected SPI NAND framework and merge some bits in a spi-flash layer
> afterwards, but this chip proves me wrong :-/.

I am thinking of following changes with fsl_qspi.c as controller

&qspi {
	num-cs =3D <2>;
	bus-num =3D <0>;
	status =3D "okay";
	compatible =3D " fsl,ls1021a-qspi ", "fsl,ls1021a-qspi-nand"; <-- updated =
compatibility for drivers
	qflash0: w25q16fw @0 {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		spi-max-frequency =3D <20000000>;
		reg =3D <0>;
		type =3D "serial-nor"   <-- Proposed New binding
		is-hybrid <-- Proposed New binding
		die-num <-- Proposed New binding
	};

	qflash1: w25n01gw@1 {
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		spi-max-frequency =3D <20000000>;
		reg =3D <1>;
		type =3D "serial-nand" <-- Proposed New binding
		is-hybrid <-- Proposed New binding
 		die-num <-- Proposed New binding
	}
};
};

struct spi_nor {
    --
    --
   u8 is_hybrid
   u8 select_die_opcode
   u8 die_num;
   --
   --
}

struct spinand_device {
    --
    --
   u8 is_hybrid
   u8 die_num;
}

struct spinand_manufacturer_ops {   <-- this will be populated in flash fil=
e like drivers/mtd/nand/spi/winbond.c
	int (*die_select)(struct spinand_device *spinand);
} =20


fsl_qspi.c  <-- existing file to handle NOR
fsl_qspinandc <--  proposed file to handler NAND

fsl_qspi.c
	 probe()=20
  		 for_each_available_child_of_node(dev->of_node, np)
       			- if type =3D=3D "serial-nor"
 				spi_nor_scan()
     			 - if (is_hybrid)
				Set is_hybrid , select_die_opcode and die-num  field of struct spi_nor
fsl_qspinand.c
	 probe()=20
  		 for_each_available_child_of_node(dev->of_node, np)
       			- if type =3D=3D "serial-nand"
 				spinand_init()
     			 - if (is_hybrid)
				Set is_hybrid and die-num  field of struct spinand_device

Whenever read/write/erase come from MTD layer
  - if is_hybrid
	Change the die using select_die_opcode or die_select function pointer

--pk
