Received: from canuck.infradead.org ([2001:4978:20e::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Shwks-0003pI-0P
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 05:50:02 +0000
Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Shwkq-0003cn-OY
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 05:50:01 +0000
Date: Fri, 22 Jun 2012 07:49:42 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] of: fix a few typos in the binding documentation
Message-ID: <20120622054942.GI5642@pengutronix.de>
References: <1335171443-15371-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20120518142148.GC3710@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120518142148.GC3710@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Randy,

expanding the audience a bit ...

On Fri, May 18, 2012 at 04:21:48PM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 23, 2012 at 10:57:23AM +0200, Uwe Kleine-König wrote:
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/mtd/atmel-nand.txt |    2 +-
> >  Documentation/devicetree/bindings/mtd/partition.txt  |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > index a200695..0c1bccd 100644
> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > @@ -3,7 +3,7 @@ Atmel NAND flash
> >  Required properties:
> >  - compatible : "atmel,at91rm9200-nand".
> >  - reg : should specify localbus address and size used for the chip,
> > -	and if availlable the ECC.
> > +	and if available the ECC.
> >  - atmel,nand-addr-offset : offset for the address latch.
> >  - atmel,nand-cmd-offset : offset for the command latch.
> >  - #address-cells, #size-cells : Must be present if the device has sub-nodes
> > diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> > index f114ce1..6e1f61f 100644
> > --- a/Documentation/devicetree/bindings/mtd/partition.txt
> > +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> > @@ -35,4 +35,4 @@ flash@0 {
> >  	uimage@100000 {
> >  		reg = <0x0100000 0x200000>;
> >  	};
> > -];
> > +};
> this patch didn't appear in next yet (looking at next-20120518). Do you
> have concerns? Or do you think someone else should take and/or ack the
> patch?
ping

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
