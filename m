Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXS9X-0002CT-2E
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 13:35:21 +0000
Date: Fri, 5 Jan 2018 14:35:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marex@denx.de>, Brian Norris
 <computersforpeace@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Peter Pan <peterpansjtu@gmail.com>
Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
 and NAND flash
Message-ID: <20180105143506.0d1db1e8@bbrezillon>
In-Reply-To: <HE1PR04MB12410ABF9189334C4CDE512A971C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <20180104184722.551ca6aa@bbrezillon>
 <HE1PR04MB12410ABF9189334C4CDE512A971C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Peter and Frieder who are working on the SPI NAND aspects.

On Fri, 5 Jan 2018 10:21:48 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Thanks Boris for the encouragement. 
> 
> > -----Original Message-----
> > From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> > Sent: Thursday, January 04, 2018 11:17 PM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> > Cc: linux-mtd@lists.infradead.org; Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>;
> > Richard Weinberger <richard@nod.at>; Marek Vasut <marex@denx.de>; Brian
> > Norris <computersforpeace@gmail.com>
> > Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
> > and NAND flash
> > 
> > +MTD maintainers.
> > 
> > On Thu, 4 Jan 2018 14:08:42 +0000
> > Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> >   
> > > Hi All,
> > >
> > > Winbond has come up with special flash i.e.  W25M161AW. It consist of Serial  
> > NOR(Die #0) and Serial NAND(Die #1) flash.  
> > > Means both NOR, NAND flashes are placed in W25M161AW controlled by  
> > single chip-select.  
> > >
> > > "Software Die Select (C2h)" command is being used to switch die or flash.  
> > 
> > Why are they so mean to us?! :-)
> >   
> > >
> > > It looks to be quite unique chip and wondering if any kind framework or work in  
> > progress available to handle it.  
> > > I know that SPI-NAND framework discussions is still in progress.  
> > 
> > Well, nothing impossible to handle, we just need to declare 2 MTD
> > devices (one NAND and one NOR). This being said, it looks like we'll
> > need this spi-flash abstraction we have been talking about with Marek
> > and Cyrille to properly support these use cases: flash devices will be
> > exposed through different sub-layers (spi-nor or spi-nand), but we need
> > a common way to detect those spi-flash chips. I looked at a few SPI
> > NAND and SPI NOR chips, and from what I've seen so far they were quite
> > different (the opcodes and CMD+ADDR+DATA sequences were quite
> > different) so I thought we were safe to start with a completely
> > unconnected SPI NAND framework and merge some bits in a spi-flash layer
> > afterwards, but this chip proves me wrong :-/.  
> 
> I am thinking of following changes with fsl_qspi.c as controller
> 
> &qspi {
> 	num-cs = <2>;
> 	bus-num = <0>;
> 	status = "okay";
> 	compatible = " fsl,ls1021a-qspi ", "fsl,ls1021a-qspi-nand"; <-- updated compatibility for drivers

Nope, "fsl,ls1021a-qspi" should be enough. The fact that this
controller is able to control SPI NAND chips is just an internal detail
(actually, I hope all QSPI controllers are able to support both NOR and
NAND devices, but I wouldn't be surprised if some vendors hardcode the
set of commands they support in their controller :-/)

> 	qflash0: w25q16fw @0 {
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		spi-max-frequency = <20000000>;
> 		reg = <0>;
> 		type = "serial-nor"   <-- Proposed New binding

No, this should be placed in a compatible:

		compatible = "jedec,spi-nor";

> 		is-hybrid <-- Proposed New binding
> 		die-num <-- Proposed New binding
> 	};
> 
> 	qflash1: w25n01gw@1 {
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		spi-max-frequency = <20000000>;
> 		reg = <1>;

This is wrong, the NAND and NOR dies use the same CS line.

> 		type = "serial-nand" <-- Proposed New binding
> 		is-hybrid <-- Proposed New binding
>  		die-num <-- Proposed New binding
> 	}
> };
> };

Not really the DT representation I had in mind. Let's try to keep
things as simple as possible. How about:

&qspi {
	/* compatible is unchanged and has been defined in a dtsi */
	/* same goes for #size-cells, #address-cells, ... */
 	status = "okay";

	qflash0: w25m161aw@0 {
		/*
		 * Thanks to this compatible, the spi-flash logic will
		 * know that this chip is an hybrid flash exposing a
		 * NOR and a NAND, that the NOR is assigned id 0 an
		 * the NAND id 1.
		 */
		compatible = "winbond,w25m161aw";
		reg = <0>;
	};
};


> 
> struct spi_nor {
>     --
>     --
>    u8 is_hybrid
>    u8 select_die_opcode
>    u8 die_num;
>    --
>    --
> }
> 
> struct spinand_device {
>     --
>     --
>    u8 is_hybrid
>    u8 die_num;
> }
> 
> struct spinand_manufacturer_ops {   <-- this will be populated in flash file like drivers/mtd/nand/spi/winbond.c
> 	int (*die_select)(struct spinand_device *spinand);
> } 

Frieder is working on such a ->select_die() interface, but that's not
sufficient for this kind of hybrid chips. We need a lock to prevent
the spi-nor and spi-nand layer from stepping on each other's toes:
when an operation is done on the NAND die, the NOR layer should not
try to select the NOR die.
 
> 
> 
> fsl_qspi.c  <-- existing file to handle NOR
> fsl_qspinandc <--  proposed file to handler NAND

Hm, not sure this is a good idea. Let's keep one driver and add support
for NAND in there.

> 
> fsl_qspi.c
> 	 probe() 
>   		 for_each_available_child_of_node(dev->of_node, np)
>        			- if type == "serial-nor"

Should be based on the compatible.

>  				spi_nor_scan()
>      			 - if (is_hybrid)
> 				Set is_hybrid , select_die_opcode and die-num  field of struct spi_nor
> fsl_qspinand.c
> 	 probe() 
>   		 for_each_available_child_of_node(dev->of_node, np)
>        			- if type == "serial-nand"
>  				spinand_init()
>      			 - if (is_hybrid)
> 				Set is_hybrid and die-num  field of struct spinand_device

Hm, I really hate this situation. What we should be doing is declare a
qspi controller that embeds a SPI NOR and a SPI NAND controller and
then let the core register each chip, deciding which one is a NAND (and
should be attached to the NAND logic) and which one is a NOR (and
should be attached to the NOR logic).

> 
> Whenever read/write/erase come from MTD layer
>   - if is_hybrid
> 	Change the die using select_die_opcode or die_select function pointer


As said above, that's not enough: you need a lock to prevent concurrent
accesses from the NOR and NAND logic.

Regards,

Boris
