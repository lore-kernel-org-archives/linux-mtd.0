Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSAWl-0004fj-Tc
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 18:55:04 +0000
Date: Fri, 4 Oct 2013 15:54:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 03/21] mtd: nand: pxa3xx: Use a completion to signal
 device ready
Message-ID: <20131004185454.GA20476@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131002215628.GW23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131002215628.GW23337@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

First of all: thanks for all your nice feedback.
I'm going through all of it right now, and just started
by this one.

On Wed, Oct 02, 2013 at 02:56:28PM -0700, Brian Norris wrote:
> On Thu, Sep 19, 2013 at 01:01:27PM -0300, Ezequiel Garcia wrote:
> > Apparently, the expected behavior of the waitfunc() NAND chip call
> > is to wait for the device to be READY (this is a standard chip line).
> > However, the current implementation does almost nothing, which opens
> > a possibility to issue a command to a non-ready device.
> > 
> > Fix this by adding a new completion to wait for the ready event to arrive.
> > 
> > Because the "is ready" flag is cleared from the controller status
> > register, it's needed to store that state in the driver, and because the
> > field is accesed from an interruption, the field needs to be of an
> > atomic type.
> 
> Does it really need to be an atomic type? AIUI, you can hand off exclusive
> control to the hardware when you begin a command. So the rest of the driver would be
> inactive when the IRQ handler is setting the ready flag. And similarly,
> the hardware should be inactive (i.e., no interrupts) when you are
> modifying the ready flag in the driver (i.e., in cmdfunc).
> 

Hm... I think that's not the case, and that's exactly why I had to add
an atomic type. See below.

> Or perhaps I'm misunderstanding something.
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 45 +++++++++++++++++++++++++++++-------------
> >  1 file changed, 31 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index a8d2ea7..fba91c2 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -35,6 +35,7 @@
> >  
> >  #include <linux/platform_data/mtd-nand-pxa3xx.h>
> >  
> > +#define NAND_DEV_READY_TIMEOUT  50
> >  #define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
> >  #define NAND_STOP_DELAY		(2 * HZ/50)
> >  #define PAGE_CHUNK_SIZE		(2048)
> > @@ -167,7 +168,7 @@ struct pxa3xx_nand_info {
> >  	struct clk		*clk;
> >  	void __iomem		*mmio_base;
> >  	unsigned long		mmio_phys;
> > -	struct completion	cmd_complete;
> > +	struct completion	cmd_complete, dev_ready;
> 
> Do you really need two completion structures? Does 'device ready' always
> follow 'command complete', so that you can just use 'device ready' all
> the time? And if so, does it make sense to just use dev_ready?
> 
> >  
> >  	unsigned int 		buf_start;
> >  	unsigned int		buf_count;

The idea here is to handle the following situation. After a command is
completed (which also applies to the 'chunked' page command we want to
support later in the patchset) the controller sets a 'command done' flag
in the ISR.

The interruption handler calls the command done completion which causes
the cmdfunc to finish waiting and exit (or continue executing commands
in the 'chunked' case).

Notice that this does *not* guarantee the controller is ready since the
'ready' flag is independent of the 'command complete' flag and the IRQ can
arrive at any later point.

Let's suppose the cmdfunc() has exited, and the NAND base code is going to
continue the operation. In the PAGEPROG case, the NAND base calls waitfunc()
before continuing the operation.

At that point, we **need** to wait for the 'ready' flag because otherwise
the NAND base could issue another PAGEPROG command, while the controller
is not really ready to receive it.

However, if we enter the waitfunc() we want to read the info->is_ready flag
to check the completion has been initialized and a wait is suitable.
Otherwise, some commands that are not issued (with no wait completion
initialized) will stall at that waitfunc().

While at the waitfunc() the interruption handler might get called for
the 'ready' flag and so the info->is_ready variable gets access from two
different execution contexts.

Given the above behavior, I thought the only way of dealing with this
was to add a new completion and use atomic type for the is_ready flag.

Is the above clear? Do you think the implementation is correct for the
behavior?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
