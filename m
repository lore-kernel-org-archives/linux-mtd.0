Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWsc4-0005jz-N7
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 17:11:14 +0000
Date: Tue, 22 May 2012 19:10:24 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Johan Gunnarsson <johan.gunnarsson@axis.com>
Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
 nand_wait{_ready, }
Message-ID: <20120522171023.GA2372@parrot.com>
References: <1337589758-8775-1-git-send-email-johan.gunnarsson@axis.com>
 <1337589758-8775-3-git-send-email-johan.gunnarsson@axis.com>
 <1337673190.2483.115.camel@sauron.fi.intel.com>
 <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7534B129D18@xmail3.se.axis.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jesper Nilsson <jespern@axis.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 22, 2012 at 09:52:22AM +0100, Johan Gunnarsson wrote:
> > -----Original Message-----
> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> > Sent: den 22 maj 2012 09:53
> > To: Johan Gunnarsson; Brian Norris
> > Cc: linux-mtd@lists.infradead.org; Jesper Nilsson
> > Subject: Re: [PATCH 2/2] mtd: nand: use hrtimer to measure timeout in
> > nand_wait{_ready, }

(...)

> > Si this function waits for the chip, but if we cannot access the
> > "ready"
> > pin - it waits for 400msecs? Where this number 400 comes from? Why not
> > 500? How many chips we have which do not provide "dev_ready()"
> > function?
> 
> Not an expert on the MTD framework -- but I believe the 400 comes from the comment above nand_wait(): "Wait for command done. This applies to erase and program only. Erase can take up to 400ms and program up to 20ms according to general NAND and SmartMedia specs."
> 

Hi Johan and Artem,

Current NAND devices require approximately 1-3 ms per block erase, and 100-200 us per page program operation.
But I think this timeout is only useful to detect and recover from broken hardware: IMHO there is no point in
trying to "optimize" the timeout delay to 20ms or 400ms depending on which operation is being done (program or erase).

Why not simplify and just use a single 1s (1000ms) timeout ?

Johan,
with such a timeout value, your bug would manifest itself only if interrupts are blocked for nearly a second: would that be acceptable ?

> > Can we simplify this function and assume everyone has "dev_ready()" and
> > add BUG_ON(!chip->dev_ready) - could you make a small research ? Or can
> 
> The drivers/mtd/nand/h1910.c driver sets dev_ready to NULL on init. The others seem to have dev_ready implementations.
> 
> > we do like this:
> > 
> > if (!dev_ready()) {
> > 	msleep(400);
> > 	return
> > }
> > 
> > do {
> > } while
> > 
> > Why should we iterate if "dev_ready" is NULL?

nand_wait() polls the device until it is ready or a timeout has elapsed.
More details here: http://lists.infradead.org/pipermail/linux-mtd/2011-June/036795.html


> Actually, it's worse than that. If dev_ready is NULL (as in the h1910.c case) we'll crash the kernel, right?
> 
> > 
> > My point is that this stuff ancient horror which needs love and
> > cleaning
> > up. Your does not make it less scary. I'd prefer to first clean the
> > whole thing up, and then fix it.

I agree it needs some cleaning; here are a few things I have noticed:

* panic_nand_wait() and panic_nand_wait_ready() are nearly identical

* Some patterns are repeated:
	/* Apply delay or wait for ready/busy pin */
	if (!chip->dev_ready)
		udelay(chip->chip_delay);
	else
		nand_wait_ready(mtd);

* the udelay() fallback should probably be phased out if only one driver (h1910) depends on it because it does not define chip->dev_ready() ?

* nand_wait() and nand_wait_ready() use different strategies to wait:
  - nand_wait_ready = busy loop
  - nand_wait       = busy loop with cond_resched call
  Presumably, this is because nand_wait_ready() should not wait for more than ~25 us (typically),
  so it is more efficient to avoid the cond_resched() call ?

* We could separate dev_ready() and STATUS polling inside nand_wait(), or even better, directly call nand_wait_ready() from nand_wait() ?
  The only difference between the 2 functions (besides cond_resched) is that nand_wait_ready() does not send any STATUS command: as a consequence,
  it does not interfere with the device mode (polling the device with STATUS reads while waiting during a read operation requires
  re-sending a READ0 command at the end to return to read mode).

I would suggest the following approach:

1. Use a single timeout value (1s for instance).

2. Rewrite and simplify nand_wait() as follows:
   a) loop until dev_ready() returns true OR timeout
   b) send a STATUS command
   c) loop until status is ready OR timeout, and return NAND status

The idea is that in most cases, dev_ready() will be defined and functional, and the loop in c) will finish immediately.
If dev_ready() is not available or defective, step c) still ensures we properly wait.
Step a) could be replaced with a call to a modified version of nand_wait_ready() with optional cond_resched-uling.

What do you think ? Any suggestions ?
I'm willing to submit patches if we reach a consensus on this,

Best regards,
--
Ivan
