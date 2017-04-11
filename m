Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxrRj-0001xl-6j
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 08:46:45 +0000
Message-ID: <1491899038.4166.236.camel@kernel.crashing.org>
Subject: Re: [PATCH 10/10] mtd: spi-nor: aspeed: optimize read mode
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Apr 2017 18:23:58 +1000
In-Reply-To: <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-11-git-send-email-clg@kaod.org>
 <7d80fbb3-81d9-3ac0-6bb9-47d2d4cf0855@gmail.com>
 <e27b9f19-947f-ab72-056d-d71812e69356@kaod.org>
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

On Tue, 2017-04-11 at 10:13 +0200, Cédric Le Goater wrote:
> 
> > Something tells me this is likely gonna be pretty flaky and might lead
> > to unreliable configurations. The hardware manufacturer should be able
> > to determine the limits of the hardware and those should be put into DT
> > at manufacturing time IMO.
> 
> It is not a common method but we have been using it on many OpenPOWER
> platforms (P8) using the AST2400 (palmetto, habanero, firestone, 
> garrison, etc) and also on the newer P9 platforms using the AST2500
> (romulus, zaius, witherspoon). So I would say that experience 'proves' 
> that it works. We didn't invent the SPI Timing Calibration algo, it is
> described in the specs of the manufacturer.

 ... Partially ;-) I wrote the original pflash so I can take the blame
for that one but yes, it's proven actually more reliable than any
attempt at hard wiring the settings for a given board/chip combination.

> Also, all these platforms use sockets to hold the different flash 
> modules of the system. We don't know in advance what we will find 
> and so it makes difficult to put any timing in the DT.    

Correct. Plus random revisions changing the trace length etc... the
problem isn't so much the SPI frequency which can theorically be
derived from the detected chip, as long as we stay within reasonable
limits. There seem to be sub-cycle read delays that need to be inserted
for reads to be reliable. The controller allow to manipulate those
delays rather precisely but the "right" value is hard to guess and
depend on a given combination of system trace length, flash chip, flash
chip revision even etc...

The algorithm we use goes through several passes over ranges of timings
and delays and picks a "safe" middle ground, ie, picks a combination
that is good *and* have both adjacent combinations good.

It also makes sure that there's a good enough distribution of 0's and
1's in the flash.

If any of the above fails, it falls back to slow and safe timings.

I suggested to Cedric the stuff he proposed below, which is to make it
a manufacturer choice to use the auto calibration or not via the DT.

However ...

> And the values of the "data input delay cycle" (REG94) depend on the 
> chip model and on the length of the wires of the board. If we were to 
> hard-code such values in the DT, we would need to put only safe and slow 
> settings known to work in all configurations. which is a bit what we 
> do in the current driver using really slow ones.
> 
> Here is a proposal. We could activate this algo using a property such
> as :
>  
> 	"speed-mode" = "freq" or "auto-adjust"

You need more than just "freq".

At the moment we use a command freq which is somewhat safe and a
different read freq. There's also a write freq which could be different
based on the flash chip. It also depends on the command mode used (fast
read, dual IO, ...).

The problem is that you need to also provide a way to specify that gate
delay correction (REG94) in addition too. My original implementation in
pflash was forced to slow commands right down (which sucks for write
and erase) because it didn't apply that correction factor to the reads
of the status register and thus was getting occasional garbage there
which can be fatal.

So I would provide a way to specify the "normal+write+erase command"
and the "read command" timing separately, and not as a frequency but as
a precise set of divider and REG94 since the exact frequency obtained
from the divider rather than the "target" frequency is what matters.

> How's that ? 
> 
> Thanks,
> 
> C.
