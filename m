Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcGU1-0000tK-Fe
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 12:36:39 +0000
Received: by iwn35 with SMTP id 35so2316515iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 05:35:46 -0700 (PDT)
Subject: Re: [PATCH 2/6] nand_wait : warn if the nand is busy on exit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Thu, 30 Jun 2011 15:36:39 +0300
In-Reply-To: <20110629135934.GA18102@parrot.com>
References: <1309105616-3609-1-git-send-email-matthieu.castet@parrot.com>
	<1309105616-3609-2-git-send-email-matthieu.castet@parrot.com>
	<1309247836.23597.42.camel@sauron> <4E09ED56.2070704@parrot.com>
	<1309287916.7411.9.camel@koala> <20110629135934.GA18102@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1309437403.23597.194.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 15:59 +0200, Ivan Djelic wrote:
> On Tue, Jun 28, 2011 at 08:05:14PM +0100, Artem Bityutskiy wrote:
> > On Tue, 2011-06-28 at 17:03 +0200, Matthieu CASTET wrote:
> > > Artem Bityutskiy a écrit :
> > > > On Sun, 2011-06-26 at 18:26 +0200, Matthieu CASTET wrote:
> > > >> This patch allow to detect buggy driver/hardware with
> > > >> bad RnB (dev_ready) management.
> > > >> This check cost nothing and could help to detect bugs.
> > > >>
> > > >> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> > > >> ---
> > > >>  drivers/mtd/nand/nand_base.c |    2 ++
> > > >>  1 files changed, 2 insertions(+), 0 deletions(-)
> > > >>
> > > >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > >> index a3c7fd3..095dfea 100644
> > > >> --- a/drivers/mtd/nand/nand_base.c
> > > >> +++ b/drivers/mtd/nand/nand_base.c
> > > >> @@ -885,6 +885,8 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> > > >>  	led_trigger_event(nand_led_trigger, LED_OFF);
> > > >>  
> > > >>  	status = (int)chip->read_byte(mtd);
> > > >> +	/* This can happen if in case of timeout or buggy dev_ready */
> > > >> +	WARN_ON(!(status & NAND_STATUS_READY));
> > > >>  	return status;
> > > > 
> > > > This seem to completely miss the chip->dev_ready != NULL case, e.g.,
> > > > piece of code above is like this
> > > > 
> > > >                 while (time_before(jiffies, timeo)) {
> > > >                         if (chip->dev_ready) {
> > > >                                 if (chip->dev_ready(mtd))
> > > >                                         break;
> > > >                         } else {
> > > >                                 if (chip->read_byte(mtd) & NAND_STATUS_READY)
> > > >                                         break;
> > > >                         }
> > > >                         cond_resched();
> > > >                 }
> > > > 
> > > Sorry, I don't understand what you mean.
> > > 
> > > We don't care what's done in the loop (chip->dev_ready != NULL or, not). We only
> > > check when the loop exit, that READY bit is set in the status.
> > 
> > Well, the logic is suspicious.
> > 
> > 1. For NAND with chip->dev_ready != NULL, why NAND_STATUS_READY should
> > be set? We do not check for this in the loop.
> > 
> > 2. For NAND with chip->dev_ready != NULL, if NAND_STATUS_READY has to be
> > set at the end, why wouldn't we drop this chip_ready part completely? We
> > could just loop while NAND_STATUS_READY is not set.
> > 
> > Isn't this strange?
> 
> Not really. There are 2 methods to wait for an erase/program command completion:
> 
> 1. Wait until nand RnB pin goes high (that's what chip->dev_ready usually does)
> 2. Poll the device: send a status (0x70) command and read status byte in a loop
>    until bit NAND_STATUS_READY is set
> 
> In all cases, you should send a status command after completion, to check if
> the operation was successful. And if the operation completed, the status should
> have bit NAND_STATUS_READY set.
> 
> Method 1 is optimal, you can often use an interrupt to signal completion, and
> no cpu cycles are lost in a polling loop. But flaky hardware (bad pull-ups) or
> bad gpio configuration can make it unreliable.
> 
> Method 2 is the safest, it always works, but it is less efficient.

Thanks, this is basically the reply I waited for - the explanation how
it works. You guys should not assume that I know everything - I just do
my best to keep MTD subsystem working and make people improve it :-) And
sometimes I just have no time to dig things and ask people to educate
me, to save my time :-)

> Here, Matthieu wants to detect cases where method 1 is unreliable or a timeout
> occurs (e.g. somebody forgot to put a nand device on the board :).
> Both conditions are not expected on working hardware.

Fair enough, thanks!

However, the code is not easy to follow, and this assumption which you
explained - "if dev_ready() returns truth, the status command has to be
sent anyway and the READY bit has to be there anyway" - it is subtle,
and makes the nand_base.c less readable, and more error prone.

And there are tons of things like this. And what the community do in
these cases - it forces people who just want to do a simple thing to
also do general clean-ups, at least some reasonable amount of it.

E.g., recently people cleaned-up the partitions stuff, and this started
with our refusal to take a simple path which touched the MTD_PARTITIONS
macro.

So, what I suggested to Matthieu, although in a vague way, is to look
how this subtle dev_ready things could be cleaned-up.

I said that we probably may:

1. Introduce something like default_dev_ready() which falls-back to the
status polling unless the driver provides it's own.
2. Look to all the if (chip->dev_ready) do A else do B things and try to
remove them.

To put it differently, I am trying to encourage you guys to clean-up the
code a bit in this dev_ready/status area before changing this area.

Any ideas? :-)

-- 
Best Regards,
Artem Bityutskiy
