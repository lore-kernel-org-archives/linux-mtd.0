Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Yyzo-0003VL-Ha
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 03:11:20 +0100
To: Joshua Wise <joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
	<200307051406.08109.joshua@joshuawise.com>
	<m3k7aw8sua.fsf@maxwell.lnxi.com>
	<200307052157.06325.joshua@joshuawise.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 05 Jul 2003 20:11:21 -0600
In-Reply-To: <200307052157.06325.joshua@joshuawise.com>
Message-ID: <m3el142yly.fsf@maxwell.lnxi.com>
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

> On Saturday 05 July 2003 7:19 pm, Eric W. Biederman wrote:
> > > But IMHO it does a bad job of doing it. It needs to go through each chip
> > > in order, and try each chip's unlock addresses in order, as opposed to
> > > guessing at unlock addresses based on interleave and chip type.
> 
> Bah, I was just pissed off :), I meant go through each chip in the array.

Ok.  My point is that there is no reason to go through each chip in the
array.  We can just iterate through the unlock_addrs array, which
holds every unlock address.  

> > I would hate to get to the point where the order of the table entries
> > matters.  Magic table orders are very hard to maintain properly, and
> > very easy for one inattentive update to break.  jedec_probe does get
> > a manufacturer id and a device id which makes it good enough that with
> > a few refinements it should be able to handle this.  A better
> > algorithm for selecting the unlock addresses is certainly desirable,
> > and now we have a test case, where it actually matters.
> 
> Right. This is what I mean - jedec_probe cannot use the generic probing 
> functions that assume that we can query chips by doing something like Q/R/Y, 
> it instead should loop.

We can and do have generic probe functions, in the jedec case.
It is a different probe than the cfi one but it is just as valid.
The challenge is that the query opcode needs a prefix for some chips
so we need to loop through all of the prefixes (unlock addresses) instead
of just some magic subset of them.

> > Does it work if you just hard code the address in jedec_probe_chip?
> > Just to confirm which piece needs to get fixed.
> 
> I'd assume that it would. Is jedec_probe_chip used anywhere other than 
> jedec_probe?

It shouldn't be, and the probes are just used at probe time.  The
rest of the time their modules can even be unloaded if necessary.

Eric
