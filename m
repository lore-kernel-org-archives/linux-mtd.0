Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYU2W-0001xI-Pq
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 09:48:23 +0000
Date: Mon, 8 Jan 2018 10:47:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Marek Vasut
 <marex@denx.de>, Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Suresh Gupta <suresh.gupta@nxp.com>, Poonam
 Aggrwal <poonam.aggrwal@nxp.com>
Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
 and NAND flash
Message-ID: <20180108104758.0a0f4226@bbrezillon>
In-Reply-To: <CAOiHx=kQP2tok=G-utWBY-ivC2j2UX39Dsvwnu0rwJYXxsmwVA@mail.gmail.com>
References: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <20180104184722.551ca6aa@bbrezillon>
 <HE1PR04MB12410ABF9189334C4CDE512A971C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <CAOiHx==at9hRbzEyyo3FpOHrQJS7jy-wSF9Fg=EkS4r11qZVNw@mail.gmail.com>
 <20180105144444.338c2cdc@bbrezillon>
 <CAOiHx=mpNQhWEXeGOqBU=oD8MOV=L9CBbJxGosnRL72LFwWYhg@mail.gmail.com>
 <HE1PR04MB1241F9507EDB679098CDA13197130@HE1PR04MB1241.eurprd04.prod.outlook.com>
 <20180108101447.1d9ab212@bbrezillon>
 <CAOiHx=kQP2tok=G-utWBY-ivC2j2UX39Dsvwnu0rwJYXxsmwVA@mail.gmail.com>
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

On Mon, 8 Jan 2018 10:39:19 +0100
Jonas Gorski <jonas.gorski@gmail.com> wrote:

> On 8 January 2018 at 10:14, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Mon, 8 Jan 2018 08:42:32 +0000
> > Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> >  
> >> Thanks Jonas, Boris,
> >>
> >> Let me try to put my understanding and some proposal based on discussions.
> >>  
> >> > -----Original Message-----
> >> > From: Jonas Gorski [mailto:jonas.gorski@gmail.com]
> >> > Sent: Friday, January 05, 2018 7:28 PM
> >> > To: Boris Brezillon <boris.brezillon@free-electrons.com>
> >> > Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; Marek Vasut
> >> > <marex@denx.de>; Richard Weinberger <richard@nod.at>; Brian Norris
> >> > <computersforpeace@gmail.com>; linux-mtd@lists.infradead.org; Cyrille
> >> > Pitchen <cyrille.pitchen@wedev4u.fr>
> >> > Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
> >> > and NAND flash
> >> >
> >> > On 5 January 2018 at 14:44, Boris Brezillon
> >> > <boris.brezillon@free-electrons.com> wrote:  
> >> > > On Fri, 5 Jan 2018 14:38:48 +0100
> >> > > Jonas Gorski <jonas.gorski@gmail.com> wrote:
> >> > >  
> >> > >> On 5 January 2018 at 11:21, Prabhakar Kushwaha
> >> > >> <prabhakar.kushwaha@nxp.com> wrote:  
> >> > >> > Thanks Boris for the encouragement.
> >> > >> >  
> >> > >> >> -----Original Message-----
> >> > >> >> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> >> > >> >> Sent: Thursday, January 04, 2018 11:17 PM
> >> > >> >> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> >> > >> >> Cc: linux-mtd@lists.infradead.org; Cyrille Pitchen  
> >> > <cyrille.pitchen@wedev4u.fr>;  
> >> > >> >> Richard Weinberger <richard@nod.at>; Marek Vasut <marex@denx.de>;  
> >> > Brian  
> >> > >> >> Norris <computersforpeace@gmail.com>
> >> > >> >> Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both  
> >> > NOR  
> >> > >> >> and NAND flash
> >> > >> >>
> >> > >> >> +MTD maintainers.
> >> > >> >>
> >> > >> >> On Thu, 4 Jan 2018 14:08:42 +0000
> >> > >> >> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
> >> > >> >>  
> >> > >> >> > Hi All,
> >> > >> >> >
> >> > >> >> > Winbond has come up with special flash i.e.  W25M161AW. It consist of  
> >> > Serial  
> >> > >> >> NOR(Die #0) and Serial NAND(Die #1) flash.  
> >> > >> >> > Means both NOR, NAND flashes are placed in W25M161AW controlled  
> >> > by  
> >> > >> >> single chip-select.  
> >> > >> >> >
> >> > >> >> > "Software Die Select (C2h)" command is being used to switch die or flash.  
> >> > >> >>
> >> > >> >> Why are they so mean to us?! :-)
> >> > >> >>  
> >> > >> >> >
> >> > >> >> > It looks to be quite unique chip and wondering if any kind framework or  
> >> > work in  
> >> > >> >> progress available to handle it.  
> >> > >> >> > I know that SPI-NAND framework discussions is still in progress.  
> >> > >> >>
> >> > >> >> Well, nothing impossible to handle, we just need to declare 2 MTD
> >> > >> >> devices (one NAND and one NOR). This being said, it looks like we'll
> >> > >> >> need this spi-flash abstraction we have been talking about with Marek
> >> > >> >> and Cyrille to properly support these use cases: flash devices will be
> >> > >> >> exposed through different sub-layers (spi-nor or spi-nand), but we need
> >> > >> >> a common way to detect those spi-flash chips. I looked at a few SPI
> >> > >> >> NAND and SPI NOR chips, and from what I've seen so far they were quite
> >> > >> >> different (the opcodes and CMD+ADDR+DATA sequences were quite
> >> > >> >> different) so I thought we were safe to start with a completely
> >> > >> >> unconnected SPI NAND framework and merge some bits in a spi-flash layer
> >> > >> >> afterwards, but this chip proves me wrong :-/.  
> >> > >> >
> >> > >> > I am thinking of following changes with fsl_qspi.c as controller
> >> > >> >
> >> > >> > &qspi {
> >> > >> >         num-cs = <2>;
> >> > >> >         bus-num = <0>;
> >> > >> >         status = "okay";
> >> > >> >         compatible = " fsl,ls1021a-qspi ", "fsl,ls1021a-qspi-nand"; <-- updated  
> >> > compatibility for drivers  
> >> > >> >         qflash0: w25q16fw @0 {
> >> > >> >                 #address-cells = <1>;
> >> > >> >                 #size-cells = <1>;
> >> > >> >                 spi-max-frequency = <20000000>;
> >> > >> >                 reg = <0>;
> >> > >> >                 type = "serial-nor"   <-- Proposed New binding
> >> > >> >                 is-hybrid <-- Proposed New binding
> >> > >> >                 die-num <-- Proposed New binding
> >> > >> >         };
> >> > >> >
> >> > >> >         qflash1: w25n01gw@1 {
> >> > >> >                 #address-cells = <1>;
> >> > >> >                 #size-cells = <1>;
> >> > >> >                 spi-max-frequency = <20000000>;
> >> > >> >                 reg = <1>;
> >> > >> >                 type = "serial-nand" <-- Proposed New binding
> >> > >> >                 is-hybrid <-- Proposed New binding
> >> > >> >                 die-num <-- Proposed New binding
> >> > >> >         }
> >> > >> > };  
> >> > >>
> >> > >> assuming the NOR and NAND parts behave like "normal" SPI-NOR /
> >> > >> SPI-NAND chips when selected, a more appropriate binding might be
> >> > >>
> >> > >> &qspi {
> >> > >>     ...
> >> > >>         qflash0: dual-flash@0 {
> >> > >>                 compatible = "winbond,w25q16fw";
> >> > >>                 reg = <0>;
> >> > >>                 spi-max-frequency = <20000000>;
> >> > >>                 #address-cells = <1>;
> >> > >>                 #size-cells = <0>;
> >> > >>
> >> > >>                 nor@0 {
> >> > >>                                 compatible = "jedec,spi-nor";
> >> > >>                                 reg = <0>;
> >> > >>                                 #address-cells = <1>;
> >> > >>                                 #size-cells = <1>;
> >> > >>
> >> > >>                                 partitions {
> >> > >>                                                 ...
> >> > >>                                 };
> >> > >>                 };
> >> > >>
> >> > >>                 nand@1 {
> >> > >>                                 compatible = "jedec,spi-nand"; /* or
> >> > >> whatever the correct nand-compatible would be */
> >> > >>                                 reg = <1>;
> >> > >>                                 #address-cells = <1>;
> >> > >>                                 #size-cells = <1>;
> >> > >>
> >> > >>                                 partitions {
> >> > >>                                                 ...
> >> > >>                                 };
> >> > >>                 };
> >> > >>
> >> > >>     };
> >> > >> };
> >> > >>
> >> > >> with the "windbond,w25q16fw" driver modeled as a simple
> >> > >> "spi-multiplexer" that registers its own virtual spi-bus. Then when
> >> > >> spi-nor or spi-nand tries to communicate with their appropriate die,
> >> > >> it sends the Software Die Select command if needed and then passes on
> >> > >> the message to its parent bus.
> >> > >>
> >> > >> That way there should be no changes needed for spi-nor / spi-nand
> >> > >> themselves. (The devil is probably in the details ;-)  
> >> > >
> >> > > Yep, I thought about this approach, and it's indeed quite elegant, but
> >> > > we're missing the lock I was mentioning in my previous reply. We need
> >> > > to prevent die selection not only for the time we're sending a single
> >> > > SPI message, but for the whole operation (which can be formed of
> >> > > several SPI messages). Or maybe I'm wrong, and operations can actually
> >> > > be interleaved, but I wouldn't bet on that ;-).  
> >> >
> >> > Ah, I missed that. I thought about it, and then tried to hand wave it
> >> > away with the "if they behave like normal chips" ;-)
> >> >
> >> > The mdio-bus supports nested locking, so you can do something like this:
> >> >
> >> > mutex_lock_nested(bus->mdio_lock, MDIO_BUS_NESTED);
> >> > bus->write();
> >> > bus->read();
> >> > mutex_unlock(bus->mdio_lock);
> >> >
> >> > without worrying someone else using the bus in between. [1] for an example
> >> > user.
> >> >
> >> > So going a similar approach with flagging the appropriate chips in
> >> > spi-nor/spi-nand as needing nested locking and then doing it for the
> >> > appropriate commands should solve that issue.
> >> >
> >> >  
> >>
> >> Device tree update:-
> >>
> >> &qspi {
> >>     ...
> >>         qflash0: dual-flash@0 {
> >>                 compatible = "winbond,w25q16fw", "hybrid"; <-- new compatibility value  
> >
> > "hybrid" is not needed, you know that the flash is hybrid with the
> > "winbond,w25q16fw" string.
> >  
> >>                 reg = <0>;
> >>                 spi-max-frequency = <20000000>;
> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>
> >>                 nor@0 {
> >>                                 compatible = "jedec,spi-nor";
> >>                                 reg = <0>;
> >>                                 #address-cells = <1>;
> >>                                 #size-cells = <1>;
> >>
> >>                                 partitions {
> >>                                                 ...
> >>                                 };
> >>                 };
> >>
> >>                 nand@1 {
> >>                                 compatible = "jedec,spi-nand"; /* or
> >> whatever the correct nand-compatible would be */
> >>                                 reg = <1>;
> >>                                 #address-cells = <1>;
> >>                                 #size-cells = <1>;
> >>
> >>                                 partitions {
> >>                                                 ...
> >>                                 };
> >>                 };  
> >
> > Not sure exposing the dies in the DT is such a good idea. You should
> > have a specific handling for "winbond,w25q16fw" which registers one
> > NAND and one NOR.  
> 
> How would you define (fixed) partitions in the dts then? This was one
> of my main motivations of having them there.

You're right. So let's keep the subnodes describing the NAND and NOR
dies.
