Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Yzbb-0003mB-7B
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 03:50:23 +0100
To: Joshua Wise <joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	<200307052157.06325.joshua@joshuawise.com>
	<m3el142yly.fsf@maxwell.lnxi.com>
	<200307052215.35596.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Jul 2003 20:50:25 -0600
In-Reply-To: <200307052215.35596.joshua@joshuawise.com>
Message-ID: <m38yrcmkr2.fsf@maxwell.lnxi.com>
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

> On Saturday 05 July 2003 10:11 pm, Eric W. Biederman wrote:
> > Ok.  My point is that there is no reason to go through each chip in the
> > array.  We can just iterate through the unlock_addrs array, which
> > holds every unlock address.
> 
> Right, that makes sense.
> 
> > We can and do have generic probe functions, in the jedec case.
> 
> Not even like that - I meant the way gen_probe.c goes through all
> interlaces, all device sizes, etcetera. I meant that 'different'.

gen_probe_chip is one case where the cfi and the jedec case are
common.  Warts are there but it is a common case.  And handling
the various combinations of interleaved chips and various word
sizes is tricky, and is quite easy for people who don't need that
logic to get it wrong if it is not handled in common.

> > It is a different probe than the cfi one but it is just as valid.
> > The challenge is that the query opcode needs a prefix for some chips
> > so we need to loop through all of the prefixes (unlock addresses) instead
> > of just some magic subset of them.
> 
> Right - guessing at what gen_probe really wants and interpreting it
> like that, IMHO, makes extremely little sense.
> 
> > It shouldn't be, and the probes are just used at probe time.  The
> > rest of the time their modules can even be unloaded if necessary.
> 
> Sweet, so if jedec_probe was rewritten to not have to use
> jedec_probe_chip, or gen_probe at all for that matter, we would not
> have to deal with jedec_probe_chip anywhere else?

Well yes, but I don't see the point in going in that direction.
 
> Also, out of curiousity, are you on IRC? I would appreciate it if you could 
> 'look over my shoulder' through a screen session as I hack at a new 
> jedec_probe, and poke me with a generic sharp object if I do something 
> obviously stupid.

Sorry, I'm not.  Submitting patches for review is another good
way of accomplishing the same thing, and it is more economical
of other peoples time.  This is a weekend and one of my rare moments
with free time.  Thayne Harbaugh should be able to do just as good
a job at answering your questions and he has a little more time
than me.

I just wanted to catch this and point you onto a useful direction
before things go to far.  

Seriously all you should need to do is to take the loop in
jedec_probe_chip where it loops through some unlock address and have
it explicitly loop through all of the combinations, or at least enough
of them until a match is found.  Look for the retry label.  It is a
significant code change but it should be contained to just that one spot.

Eric
