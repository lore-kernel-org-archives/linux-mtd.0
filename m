Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19YnFD-0001ey-Cz
	for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2003 14:38:27 +0100
To: Joshua Wise <joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	<200307050103.58666.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Jul 2003 07:38:22 -0600
In-Reply-To: <200307050103.58666.joshua@joshuawise.com>
Message-ID: <m3wuexksa9.fsf@maxwell.lnxi.com>
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

> On Friday 04 July 2003 10:32 pm, Joshua Wise wrote:
> > tracked this down to jedec_probe_chip's cfi->addr_unlock* garbage - it does
> > look like that function will need to be rewritten. Has anyone already
> > started this, or should I just go ahead?

Why?  What is your problem.  All the pieces do is validate what
was detected.

> I stand corrected. It seems like it's also possible that jedec_probe() could
> be rewritten to just probe all the chips that we know about. Methinks I'll
> try that.

It already does test for all of the chips we know about.
 
> (Addendum a few minutes later)
> Sigh.. This just exposes fscking LAYERS of cruft that MTD was built on, 
> including the idea that every flash chip would be CFI, and this horrible 
> probing cruft. Someone please shoot me.
???

Flash chips are almost ISA devices so there is no 100% reliable
way of detecting which type of flash device you have plugged in.
But there are major trends that help quite a lot.

NOR flash devices have two different JEDEC specified methods of detecting
exactly which flash chip you have plugged in.   Either the older
jedec_probe, or the more recent cfi_probe.  Using the basic method
in jedec_probe we can only get the manufacturer and device id of the
flash chip, the rest of the information we need comes from a table.
Flash devices tend to be a lot more common than that so the newer
Common Flash Interface probe also reports the number of erase regions
and the like, so the flash drive does not need to have knowledge of 
a specific kind of flash device.

Most NOR flash devices implement either the Intel or the AMD command
set.  The probe method does not matter so the command set code
is reused by both methods.

There is no requirement to reuse the mtd infrastructure.  It is
there simply because it does a good job of factoring out the common 
pieces.

So what kind of flash device do you have?  And why does the
existing infrastructure not work for you?  

Eric
