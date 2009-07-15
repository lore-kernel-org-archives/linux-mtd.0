Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRBSo-0000jz-Pr
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 20:52:35 +0000
Date: Wed, 15 Jul 2009 21:52:17 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090715205217.GH3056@shareable.org>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
Cc: linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>,
	Stefan Roese <sr@denx.de>, Nicolas Pitre <nico@cam.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Holmberg wrote:
> I verified with Spansion that the embedded erase algorithm first clears
> all 1's to 0's before erasing the bits to charge them back up to 1.

I suspect that's quite common for NOR cells.

Here's a question: Does it ever happen for NAND cells?  Does the UBIFS
code assume that NAND erase only _ever_ converts 0 bits to 1 bits,
never 1 bits to 0 bits temporarily?

> Essentially, the contents of the PEB are indeterminate between the start
> and completion of an erase cycle.  The erase algorithm isn't
> configurable, so we are stuck with this behavior.

> > > This patch seems to fix the UBI issues Eric and me observed 
> > (issue N2).
> > > I'll test the patch for few days, but I couldn't see any 
> > problem so far.
> 
> The patch to write to the header is a great solution and I think it's
> the only possible solution.  Performance should be fine, since the
> 4-byte write should only take about 0.5ms which is insignificant
> compared to a typical PEB erase time of 700ms.

I agree with the solution.

Can the same problem arise with NAND?  I don't mean "every NAND we
tested", but NAND in general?  Is it correct to assume they never
convert 1 bits to 0 bits temporarily during the erase cycle, and
should the UBIFS code write something to the PEB which invalidates the
header to ensure this cannot result in the same problems we've seen
with NOR?

You can't necessarily overwrite the header with NAND, but you might be
able to write elsewhere to say "this PEB is undergoing erase and is
therefore indeterminate".

> I will run 4 boards through torture tests starting tonight and let you
> know later this week!  Based upon the errors that I've seen and looking
> at the patch, I think that should solve the problem.
> 
> Great work guys!

Yeah :-)

I've been holding off trying UBI on NOR.  Now it's looking more tempting :-)

-- Jamie
