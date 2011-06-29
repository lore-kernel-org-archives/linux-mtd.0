Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbvJu-0007Ht-45
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 14:00:47 +0000
Date: Wed, 29 Jun 2011 15:59:34 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/6] nand_wait : warn if the nand is busy on exit
Message-ID: <20110629135934.GA18102@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
	<1309247836.23597.42.camel@sauron> <4E09ED56.2070704@parrot.com>
	<1309287916.7411.9.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1309287916.7411.9.camel@koala>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 28, 2011 at 08:05:14PM +0100, Artem Bityutskiy wrote:
> On Tue, 2011-06-28 at 17:03 +0200, Matthieu CASTET wrote:
> > Artem Bityutskiy a écrit :
> > > On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> > >> This patch allow to detect buggy driver/hardware with
> > >> bad RnB (dev_ready) management.
> > >> This check cost nothing and could help to detect bugs.
> > >>
> > >> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> > >> ---
> > >>  drivers/mtd/nand/nand_base.c |    2 ++
> > >>  1 files changed, 2 insertions(+), 0 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > >> index a3c7fd3..095dfea 100644
> > >> --- a/drivers/mtd/nand/nand_base.c
> > >> +++ b/drivers/mtd/nand/nand_base.c
> > >> @@ -885,6 +885,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> > >>  	led_trigger_event(nand_led_trigger, LED_OFF);
> > >>  
> > >>  	status = (int)chip->read_byte(mtd);
> > >> +	/* This can happen if in case of timeout or buggy dev_ready */
> > >> +	WARN_ON(!(status & NAND_STATUS_READY));
> > >>  	return status;
> > > 
> > > This seem to completely miss the chip->dev_ready != NULL case, e.g.,
> > > piece of code above is like this
> > > 
> > >                 while (time_before(jiffies, timeo)) {
> > >                         if (chip->dev_ready) {
> > >                                 if (chip->dev_ready(mtd))
> > >                                         break;
> > >                         } else {
> > >                                 if (chip->read_byte(mtd) & NAND_STATUS_READY)
> > >                                         break;
> > >                         }
> > >                         cond_resched();
> > >                 }
> > > 
> > Sorry, I don't understand what you mean.
> > 
> > We don't care what's done in the loop (chip->dev_ready != NULL or, not). We only
> > check when the loop exit, that READY bit is set in the status.
> 
> Well, the logic is suspicious.
> 
> 1. For NAND with chip->dev_ready != NULL, why NAND_STATUS_READY should
> be set? We do not check for this in the loop.
> 
> 2. For NAND with chip->dev_ready != NULL, if NAND_STATUS_READY has to be
> set at the end, why wouldn't we drop this chip_ready part completely? We
> could just loop while NAND_STATUS_READY is not set.
> 
> Isn't this strange?

Not really. There are 2 methods to wait for an erase/program command completion:

1. Wait until nand RnB pin goes high (that's what chip->dev_ready usually does)
2. Poll the device: send a status (0x70) command and read status byte in a loop
   until bit NAND_STATUS_READY is set

In all cases, you should send a status command after completion, to check if
the operation was successful. And if the operation completed, the status should
have bit NAND_STATUS_READY set.

Method 1 is optimal, you can often use an interrupt to signal completion, and
no cpu cycles are lost in a polling loop. But flaky hardware (bad pull-ups) or
bad gpio configuration can make it unreliable.

Method 2 is the safest, it always works, but it is less efficient.

Here, Matthieu wants to detect cases where method 1 is unreliable or a timeout
occurs (e.g. somebody forgot to put a nand device on the board :).
Both conditions are not expected on working hardware.

Another option (that I used on other systems) is to systematically perform
method 1 first (if chip->dev_ready != NULL), _then_ method 2.
If method 1 works as expected, then the polling loop in method 2 finishes
immediately because nand status already has bit NAND_STATUS_READY set.

--
Best Regards,

Ivan
