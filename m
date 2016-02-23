Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aY6m0-0002Uk-PV
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 06:48:42 +0000
Date: Tue, 23 Feb 2016 07:48:15 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Subject: Re: Multiple NANDs on non contiguous chip selects, how?
Message-ID: <20160223064815.GQ3939@pengutronix.de>
References: <20160215122251.GE19372@pengutronix.de>
 <20160221083635.4660c3d0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160221083635.4660c3d0@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 21, 2016 at 08:36:35AM +0100, Boris Brezillon wrote:
> Hi Sacha,
> 
> On Mon, 15 Feb 2016 13:22:52 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > Hi all,
> > 
> > I have a i.MX6 board here which has two NAND chips connected to CS0 and
> > CS2 on the same controller. The current code in nand_scan_ident iterates
> > over the chip selects and bails out when there's nothing found on a chip
> > select. This means the current code never finds the chip on CS2 since it
> > already bails out after probing the empty CS1.
> > 
> > Any preferences how this should be handled? I could implement a i.MX6
> > specific mapping function, possibly initialized from the device tree, to
> > map the real chip selects to contiguous chip selects for the NAND layer.
> > 
> > Normally such a function should not be needed since we could autodetect
> > if a chip select has a device connected or not, so the NAND layer could
> > handle this without driver intervention, but is that what we want?
> > 
> > Any ideas/opinions?
> 
> This is a common mistake, caused by a poor documentation of what
> nand->numchips and the chip argument passed to ->select_chip() are
> representing. I'm not even sure I have the correct answer, but here is
> my understanding (and last time I discussed it with Brian he seemed to
> agree).
> 
> 'struct nand_chip' is representing a single NAND chip not the NAND
> controller, so, if you have 2 chips on your board, then your NAND
> controller driver should instantiate 2 nand chips. and register both of
> them to the NAND framework.
> The only case where you'll need to specify numchips > 1 is when you
> have a NAND chip stacking several dies, each of them accessible with
> its own CS line.
> In this case, the mapping between the controller CS line and the chip
> CS line should be done by the NAND controller driver.
> If you take your particular imx6 case, the mapping between the
> chip and controller CS lines should be defined somewhere in the DT.
> 
> You can have a look at this binding [1] if you need an example, and if
> I extend it for the multi-die case, it gives something like that:
> 
> nfc: nand@01c03000 {
> 	compatible = "allwinner,sun4i-a10-nand";
> 
> 	/* ... */
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	nand@0 {
> 		reg = <0 2>; /* CS0 and CS2 */
> 		allwinner,rb = <0 2>; /* RB0 and RB2 */
> 		/* ... */
> 	};
> 
> 	nand@1 {
> 		reg = <1>; /* CS1 */
> 		allwinner,rb = <1>; /* RB0 and RB2 */
> 		/* ... */
> 	};
> };
> 
> I hope this helps.

Indeed this helps, thanks Boris. This also answers my next question why
the nand layer expects the nand chips on the different chip selects to
be identical. If the multiple chip selects on nand level are only used
for multi-die chips then this assumption makes sense.


Thanks
 Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
