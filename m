Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YwJR-0002ob-BK
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 00:19:25 +0100
To: Joshua Wise <joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	<200307050103.58666.joshua@joshuawise.com>
	<m3wuexksa9.fsf@maxwell.lnxi.com>
	<200307051406.08109.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Jul 2003 17:19:25 -0600
In-Reply-To: <200307051406.08109.joshua@joshuawise.com>
Message-ID: <m3k7aw8sua.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Sender: "Eric W. Biederman" <eric@lnxi.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joshua Wise <joshua@joshuawise.com> writes:

> On Saturday 05 July 2003 9:38 am, Eric W. Biederman wrote:
> > Why?  What is your problem.  All the pieces do is validate what
> > was detected.

> My problem is that jedec_probe_chip() incorrectly determines unlock
> addresses for my chip. They seemingly work anyway, but then
> jedec_match() fails because the unlock addresses that already are
> stored in the struct cfi_private do not match what they should be
> for my flash chip. 

Ok.  So one of the TODO list items in jedec_probe finally hit.
The check in jedec_match for unlock addresses was added to verify
the proper unlock addresses was actually used so if the probe
succeeded the chip would work.  The fact that the proper unlock
addresses never get tried is certainly a problem.

When the code was changed to confirm the proper unlock addresses were
being used there were no reported cases of the code not attempting
the proper unlock addresses so that part of the existing code was left
untouched.  Now that we have the information on which unlock addresses
the various chips use we can walk through all of the known unlock
addresses attempting to match them.  That can be refined by a walk
through the table to see if there is a chance of a given unlock
address working.

> > > I stand corrected. It seems like it's also possible that jedec_probe()
> > > could be rewritten to just probe all the chips that we know about.
> > > Methinks I'll try that.
> > It already does test for all of the chips we know about.
> But IMHO it does a bad job of doing it. It needs to go through each chip in 
> order, and try each chip's unlock addresses in order, as opposed to guessing 
> at unlock addresses based on interleave and chip type.

I would hate to get to the point where the order of the table entries
matters.  Magic table orders are very hard to maintain properly, and
very easy for one inattentive update to break.  jedec_probe does get 
a manufacturer id and a device id which makes it good enough that with
a few refinements it should be able to handle this.  A better
algorithm for selecting the unlock addresses is certainly desirable,
and now we have a test case, where it actually matters. 

> > NOR flash devices have two different JEDEC specified methods of detecting
> > exactly which flash chip you have plugged in.   Either the older
> > jedec_probe, or the more recent cfi_probe.  Using the basic method
> > in jedec_probe we can only get the manufacturer and device id of the
> > flash chip, the rest of the information we need comes from a table.
> > Flash devices tend to be a lot more common than that so the newer
> > Common Flash Interface probe also reports the number of erase regions
> > and the like, so the flash drive does not need to have knowledge of
> > a specific kind of flash device.

> Right, right, I know all that - I know that there are multiple ways to probe 
> for chips. I was just mentioning that it seems that MTD was entirely
> built on the assumption that every chip would be CFI, and that every
> chip would  conform to a struct cfi_private. This produces wonderful
> pieces of cruft like jedec_probe.c, which gathers information from a
> JEDEC data table, flies around randomly probing, and then finally,
> by a work of magic, finds out which datatable entry our flash chip
> corresponds with and smashes it into something like a struct
> cfi_private.

cfi_private in this case is more badly named then anything.  It holds
generic parameters that describe NOR flash devices.   The history
is that the cfi code was written first with a generic infrastructure.
And then it was realized that chips that implemented the older probe
had the same set of requirements and the same set of commands, just
a less convenient probe method, that does not provide all of the
information needed to use a random flash chip.  Instead that
information needs to be looked up in a table.

> > There is no requirement to reuse the mtd infrastructure.  It is
> > there simply because it does a good job of factoring out the common
> > pieces.
>
> Oh, but there is. Everything on these iPAQs uses MTD - including JFFS2, and 
> various other things. The userland API, technically, rules. I'm just saying 
> that internally, MTD is based upon many layers of assumptions that, 
> unfortunately, no longer work - or that's how it looks to me.

To clarify I meant things like the command set/chip drivers and the
like.  In particular I meant a driver for sufficiently strange
hardware can fill in a mtd_info structure with a fully custom set
of methods and all of the upper layers will work.
 
> > So what kind of flash device do you have?  And why does the
> > existing infrastructure not work for you?
> I believe I explained the problem earlier - jedec_probe is wildly probing 
> about, and making guesses at addr_unlock, which unfortunately turn out to be 
> correct on every chip but mine. (For what it's worth, this is a AM29LV400BT. 
> Specs: 
> http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/21523d1.pdf)

Hmm.  I am surprised that this has problems as it looks like a pretty
standard part.  But looking at the table of commands on page 19 it
does appear that the standard guesses we make don't seem to line up.

Does it work if you just hard code the address in jedec_probe_chip?
Just to confirm which piece needs to get fixed.

Eric
