Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCSmj-0003TO-Dq
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 20:57:34 -0400
Date: Tue, 28 Sep 2004 20:57:11 -0400 (EDT)
From: Nicolas Pitre <npitre@mvista.com>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <20040928234320.GA8283@slurryseal.ddns.mvista.com>
Message-ID: <Pine.LNX.4.61.0409282042570.15236@xanadu.home>
References: <20040925021907.D14A2A00043@mail.murgatroid.com>
	<1096108415.31730.4411.camel@imladris.demon.co.uk>
	<20040928234320.GA8283@slurryseal.ddns.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Christopher Hoover <ch@murgatroid.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Sep 2004, Todd Poynor wrote:

> On Sat, Sep 25, 2004 at 11:33:36AM +0100, David Woodhouse wrote:
> > This locking scheme is daft. My original reaction was to hide it in the
> > mapping driver for such idiotic flashes, but they're more common now and
> > it really is a function of the flash not of the board. I suspect we
> > ought to add a quirk entry for these flashes, and automatically unlock
> > them on probe.
> 
> Here's a try at automatically unlocking all blocks of Intel CFI flash at
> probe time and at system resume time.  The new logic is in the chip
> driver, but perhaps it would be better to move it generic, adding a new
> chip driver callback for "is unlock needed?"; can rework things that way
> if desired (was originally hoping to hide this "feature" from generic
> code).
> 
> I did not notice a query feature bit that identifies whether the flash
> has the "all blocks locked at power on" property in the datasheets, so
> the patch checks whether block 0 is locked and assumes its one of those
> flashes if so.

This is a rather bad idea since block 0 is often the bootloader and most 
likely to be locked on purpose.

I'm a bit unconfortable with a feature like this as well.  What if I 
want some partitions to remain locked at all times at the hw level?

I think the decision of unlocking the chip and what to unlock should 
remain in the map driver since this is where the knowledge of what the 
flash is meant to be used for is the most likely to be found.

> Since all blocks may be unlocked at resume time, it would be up to a
> userspace action to relock any previously explicitly locked blocks soon
> afterwards.

This sounds really really fishy to me.

If you can query which blocks are or are not locked before suspending, 
then why don't you just create a bitmap with the state of the entire 
flash and restore it upon resume?

> The chip driver (or generic layer) *could* keep track of
> locked blocks and only unlock those not previously locked, can send a
> patch for that if there's interest.

I think this is the only sane approach to this problem IMHO.


Nicolas
