Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Z0DE-0006ax-9B
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 04:29:16 +0100
To: Joshua Wise <joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	<200307052215.35596.joshua@joshuawise.com>
	<m38yrcmkr2.fsf@maxwell.lnxi.com>
	<200307052313.13389.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Jul 2003 21:29:18 -0600
In-Reply-To: <200307052313.13389.joshua@joshuawise.com>
Message-ID: <m3n0fs5o4x.fsf@maxwell.lnxi.com>
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

> On Saturday 05 July 2003 10:50 pm, Eric W. Biederman wrote:
> > gen_probe_chip is one case where the cfi and the jedec case are
> > common.  Warts are there but it is a common case.  And handling
> > the various combinations of interleaved chips and various word
> > sizes is tricky, and is quite easy for people who don't need that
> > logic to get it wrong if it is not handled in common.
> 
> Really? I think it would be better to just probe all the unlock addresses in 
> order instead of probing interleaves, etc

There is more work to do when chips are interleaved.  And that
extra work is non-obvious.  In the current setup almost everything
looks like you have only a single chip, but that is by careful design.

In particular if you have 2 8bit devices on a 16bit bus, a 16bit
read will return one byte from each device.

It happens that jedec_probe_chip is also guessing unlock addresses
based upon the chip configuration, but that is an almost entirely
different issue.  That part of the code can be removed with no ill
effects.  cfi_send_gen_cmd already handles the issues with addresses
caused by interleaved devices.

> > Sorry, I'm not.  Submitting patches for review is another good
> > way of accomplishing the same thing, and it is more economical
> > of other peoples time.  This is a weekend and one of my rare moments
> > with free time.  Thayne Harbaugh should be able to do just as good
> > a job at answering your questions and he has a little more time
> > than me.
> 
> Understood, I can appreciate that :) Who is Thayne Harbaugh? *pokes Thayne 
> with a sharp object to call their attention to the discussion*

He is a coworker, and currently is active making certain jedec_probe
works in a lot of corner cases.  He is the guy who put all of the FIXME's
in the code.  You probably won't here from him until Monday though.
 
> > Seriously all you should need to do is to take the loop in
> > jedec_probe_chip where it loops through some unlock address and have
> > it explicitly loop through all of the combinations, or at least enough
> > of them until a match is found.  Look for the retry label.  It is a
> > significant code change but it should be contained to just that one spot.
> 
> I'll take a look into that.

Have fun.

Eric
