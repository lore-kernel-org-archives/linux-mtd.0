Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAbTU-0004ex-4i
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2015 10:44:24 +0000
Received: by mail-lb0-x234.google.com with SMTP id oh2so2127325lbb.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Dec 2015 02:44:03 -0800 (PST)
Message-ID: <1450608238.15911.24.camel@gmail.com>
Subject: Re: [PATCH v5] mtd: support BB SRAM on ICP DAS LP-8x4x
From: Sergei Ianovich <ynvich@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Jeremy Kerr <jk@ozlabs.org>, Cyril Bur
 <cyrilbur@gmail.com>, Neelesh Gupta <neelegup@linux.vnet.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list:MEMORY TECHNOLOGY DEVICES (MTD)"
 <linux-mtd@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Dec 2015 13:43:58 +0300
In-Reply-To: <20151220033807.GC9883@rob-hp-laptop>
References: <1397668667-27328-4-git-send-email-ynvich@gmail.com>
 <1450205941-15593-1-git-send-email-ynvich@gmail.com>
 <20151220033807.GC9883@rob-hp-laptop>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
> On Tue, Dec 15, 2015 at 09:58:53PM +0300, Sergei Ianovich wrote:
> > This provides an MTD device driver for 512kB of battery backed up
> > SRAM
> > on ICPDAS LP-8X4X programmable automation controllers.
> > 
> > SRAM chip is connected via FPGA and is not accessible without a
> > driver,
> > unlike flash memory which is wired to CPU MMU.
> > 
> > This SRAM becomes an excellent persisent storage of volatile process
> > data like counter values and sensor statuses. Storing those data in
> > flash or mmc card is not a viable solution.
> > 
> > Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> > Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >    v4..v5
> >    * remove .owner from struct platform_driver
> >    * constify struct of_device_id
> >     for further Brian Norris comments:
> >    * drop unused property from doc file
> >    * move defconfig update to a different file
> >    * drop extra match w/ of_match_device()
> > 
> >    v3..v4 for Brian Norris 'Reviewed-by'
> >    * add doc file for DT binding
> >    * move DTS binding to a different patch (8/21)
> >    * drop unused include directive
> >    * drop safely unused callback
> >    * drop non-default partion probe types
> >    * drop duplicate error checks
> >    * drop duplicate error reporting
> >    * fixed error message on MTD registeration
> >    * fixed module removal routine
> > 
> >    v2..v3
> >    * no changes (except number 08/16 -> 10/21)
> > 
> >    v0..v2
> >    * use device tree
> >    * use devm helpers where possible
> > 
> >  .../devicetree/bindings/mtd/sram-lp8x4x.txt        |  20 +++
> >  drivers/mtd/devices/Kconfig                        |  14 ++
> >  drivers/mtd/devices/Makefile                       |   1 +
> >  drivers/mtd/devices/sram_lp8x4x.c                  | 199
> > +++++++++++++++++++++
> >  4 files changed, 234 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/sram-
> > lp8x4x.txt
> >  create mode 100644 drivers/mtd/devices/sram_lp8x4x.c
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > new file mode 100644
> > index 0000000..476934f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/sram-lp8x4x.txt
> > @@ -0,0 +1,20 @@
> > +512kB battery backed up SRAM on LP-8x4x industrial computers
> > +
> > +Required properties:
> > +- compatible : should be "icpdas,sram-lp8x4x"
> 
> No wildcards please. Otherwise looks fine.

There is a similar review comment from Arnd Bergmann in the discussion
of `[PATCH v5] serial: support for 16550A serial ports on LP-8x4x`.

I'll quote my latest clarification:
> ... This driver will support ports on LP-8081, 
> LP-8141, LP-8441, LP-8841. Last time I checked the vendor was announcing
> a series with 3 as the last digit. They use lp8x4x name, eg. in
> documentation like `LP-8x4x_ChangeLog.txt`. They ship their proprietary
> SDK in `lp8x4x_sdk_for_linux.tar`. All of this implies that it is a
> single board.

I think the solution should be the same for all LP-8x4x drivers (IRQ,
SRAM, SERIAL, IIO).
