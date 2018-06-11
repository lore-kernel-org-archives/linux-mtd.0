Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSRT4-0004HJ-O3
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 18:23:14 +0000
Date: Mon, 11 Jun 2018 20:22:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
Subject: Re: atmel-nand-controller: NAND chip selects?
Message-ID: <20180611202249.63a11950@bbrezillon>
In-Reply-To: <20180611144214.GA19449@lenoch>
References: <20180611110425.GA4059@lenoch> <20180611132131.4f175aea@bbrezillon>
 <20180611144214.GA19449@lenoch>
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

On Mon, 11 Jun 2018 16:42:14 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> On Mon, Jun 11, 2018 at 01:21:31PM +0200, Boris Brezillon wrote:
> > On Mon, 11 Jun 2018 13:04:25 +0200
> > Ladislav Michl <ladis@linux-mips.org> wrote:
> >   
> > > Consider there are more NAND chips connected to the same lines and only nCE
> > > (connected to GPIO line one per each chip) is used to select them.
> > > How is driver supposed to work in such situation?
> > > Common memory region cannot be requested multiple times as well as the
> > > same gpio for R/B cannot be requested.  
> > 
> > I thought you could request several times the same GPIO if it's in input
> > mode, but maybe I'm wrong.  
> 
> Well, it does not seem to work:
> atmel-nand-controller 10000000.ebi:nand-controller: Failed to get R/B gpio (err = -16)

Okay, that's a problem.

> 
> > > Something as davinci_nand for
> > > memory region? Use 'ranges' property? How should one express in DT gpio
> > > is shared between child nodes?  
> > 
> > For both problems, the solution is to reserve the resources at the NAND
> > controller level instead of the NAND level. It's pretty easy for the CS
> > memory range, because the driver can easily detect when the same CS is
> > used by different NAND chips. It's a bit more complicated for the R/B
> > pins.  
> 
> Do you mean something like this?
> 
> 		ebi: ebi@10000000 {
> 			status = "okay";
> 			pinctrl-0 = <&pinctrl_nand_cs &pinctrl_nand_cs1 &pinctrl_nand_rb>;
> 			pinctrl-names = "default";
> 
> 			nand_controller: nand-controller {
> 				status = "okay";
> /*				reg = <0x3 0x0 0x800000>; */
> 				nand@3,0 {
> 					reg = <0x3 0x0 0x800000>;
> 					rb-gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
> 					cs-gpios = <&pioC 8 GPIO_ACTIVE_HIGH>;
> 					nand-bus-width = <8>;
> 					nand-ecc-mode = "soft";
> 					nand-ecc-algo = "bch";
> 					nand-ecc-strength = <8>;
> 					nand-on-flash-bbt;
> 					label = "atmel_nand";
> 				};
> 				nand@3,1 {
> 					reg = <0x3 0x0 0x800000>;
> 					rb-gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
> 					cs-gpios = <&pioC 14 GPIO_ACTIVE_HIGH>;
> 					nand-bus-width = <8>;
> 					nand-ecc-mode = "soft";
> 					nand-ecc-algo = "bch";
> 					nand-ecc-strength = <8>;
> 					nand-on-flash-bbt;
> 					label = "atmel_nand";

Two devices with the same label, that probably won't work correctly.

> 				};
> 			};
> 		};
> 
> Note the commented out 'reg' property. I'm not sure if you meant to actively
> compare 'reg's of nand child nodes or put 'reg' property on 'nand-controller'

I thought about doing the former. The first cell in reg is encoding the
EBI CS, so it's pretty easy to have a table of already requested CS ids
in struct atmel_nand_controller, and when you see the same CS, you just
have to get the already requested iomem region.

> level (latter does not currently fly):
> atmel-ebi 10000000.ebi: missing or invalid timings definition in /ahb/ebi@10000000/nand-controller
> atmel-ebi 10000000.ebi: failed to configure EBI bus for /ahb/ebi@10000000/nand-controller, disabling the device

It's caused by this check [1] because I assumed the NAND controller would
never have a reg prop defined. If we need to, we can extend the check
to make sure the child not does not have an "atmel,xxx-nand-controller"
compat.

[1]https://elixir.bootlin.com/linux/v4.17/source/drivers/memory/atmel-ebi.c#L573
[2]https://elixir.bootlin.com/linux/v4.17/source/drivers/mtd/nand/raw/atmel/nand-controller.c#L2435
