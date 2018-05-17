Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJCye-0000rb-Oz
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 07:05:31 +0000
Date: Thu, 17 May 2018 09:05:13 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>, Xiangsheng Hou
 <xiangsheng.hou@mediatek.com>, Ashish Kumar <ashish.kumar@nxp.com>, Yogesh
 Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>
Subject: Re: [PATCH v7 0/5] mtd: Add a SPI NAND driver
Message-ID: <20180517090513.005614e4@bbrezillon>
In-Reply-To: <VI1PR0402MB385432DF72BABAAA10EF4B2297910@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180515150825.19835-1-boris.brezillon@bootlin.com>
 <VI1PR0402MB385432DF72BABAAA10EF4B2297910@VI1PR0402MB3854.eurprd04.prod.outlook.com>
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

On Thu, 17 May 2018 06:33:36 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Dear Boris,
> 
> 
> > -----Original Message-----
> > From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> > Of Boris Brezillon
> > Sent: Tuesday, May 15, 2018 8:38 PM
> > To: David Woodhouse <dwmw2@infradead.org>; Brian Norris
> > <computersforpeace@gmail.com>; Boris Brezillon
> > <boris.brezillon@bootlin.com>; Marek Vasut <marek.vasut@gmail.com>;
> > Richard Weinberger <richard@nod.at>; linux-mtd@lists.infradead.org;
> > Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Peter Pan <peterpansjtu@gmail.com>; Frieder Schrempf
> > <frieder.schrempf@exceet.de>; Vignesh R <vigneshr@ti.com>; Xiangsheng
> > Hou <xiangsheng.hou@mediatek.com>
> > Subject: [PATCH v7 0/5] mtd: Add a SPI NAND driver
> > 
> > Hello,
> > 
> > This is a brand new version of the SPI NAND framework initially proposed by
> > Peter. Note that this version has little in common with the previous one,
> > mainly because it's been reworked to use the SPI mem interface (which
> > allowed us to get rid of the complex NAND initialization/registration logic).
> > 
> > Also, this version now natively supports on-die ECC and multi-die chips
> > (which was required to expose the 256MB of the W25M02GV chip). I know I
> > initially asked Peter to not support on-die ECC in the first version of the
> > framework so that we can work on a proper abstraction for ECC controllers,
> > but I ended up implementing it, since all the chips seem to have on-die ECC
> > and the implementation was not that complicated.
> > 
> > I'm not giving up on the "ECC controller abstraction" stuff, but with this initial
> > implementation we at least have usable SPI NAND support, which should
> > give us some time for complex setups with external ECC controllers.
> > 
> > Just a few details about the patches in this series:
> > 
> > Patch 1 is just extending the nand_page_io_req structure to pass
> > information about the access mode (ECC enabled/disabled) so that we can
> > use that in the SPI NAND framework to decide whether on-die ECC should be
> > enabled or not.
> > 
> > Patch 2 is adding the core infrastructure to handle SPI NANDs, and patch 3 is
> > decribing the SPI NAND bindings.
> > 
> > Patch 4 and 5 add support for 2 different chips, one from Micron and one
> > from Winbond.
> > 
> > Comments/reviews are welcome.
> > 
> > Thanks,
> > 
> > Boris
> > 
> > v7 changes:
> > - Use the spi-mem interface  
> 
> This is putting requirement for having controller driver in  driver/spi. 

Yes.

> What about the controllers which are supporting NOR and NAND flash. How they are going to co-exist.

Can you give an example (with a datasheet or a detailed description) of
what you call a controller that supports NOR or NAND. AFAICT, all SPI
controllers can support NANDs and NORs, because all they do is send
spi-mem operations to the device, no matter if the operation is NAND
or NOR related.

> 
> Are we supposed to have 2 flavor of driver. One in driver/mtd/spi-nor and driver/spi?

Definitely not. You should have one driver in drivers/spi/ and the SPI
NOR layer should access this controller through the m25p80 driver. If
you need features that are not yet supported by the spi-mem API, then
we should discuss it, 'cause the goal is to have all SPI controller
drivers in drivers/spi/ instead of creating one interface per memory
type.
