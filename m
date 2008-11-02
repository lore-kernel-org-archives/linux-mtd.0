Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kwc40-0002qk-Px
	for linux-mtd@lists.infradead.org; Sun, 02 Nov 2008 12:28:17 +0000
Date: Sun, 2 Nov 2008 12:27:51 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: Werner Almesberger <werner@openmoko.org>
Subject: Re: [PATCH] nand_read_subpage vs. S3C244x NAND: non-word reads
Message-ID: <20081102122751.GC11063@fluff.org.uk>
References: <20081101031505.GA5177@almesberger.net>
	<20081101124634.GB11063@fluff.org.uk>
	<20081101161148.GN31758@almesberger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081101161148.GN31758@almesberger.net>
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben@trinity.fluff.org>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 01, 2008 at 02:11:48PM -0200, Werner Almesberger wrote:
> Ben Dooks wrote:
> > As noted on the openmoko list,
> 
> Sorry for starting two threads on the same topic. The joy of trying
> to do the right thing with lists that don't let you cross-post unless
> you're subscribed ...
> 
> > I think we can do 256byte subpage reads
> > as long as they are aligned to 256bytes. We could make the ECC code
> > deal with non-256 byte power-of-two aligned blocks without huge
> > changes but my belief is that we cannot support anything that isn't
> > a power of two.
> 
> In this case, the problem is a bit more subtle: the data blocks
> retrieved are perfectly normal, i.e., 256 bytes in size and
> properly aligned.
> 
> However, nand_read_subpage optimizes retrieval of the OOB data.
> So instead of retrieving, say, 64 bytes, it only retrieves 24
> (for a 2048 bytes page). Sometimes, not the entire page is
> retrieved, and then we get those accesses with an odd size.
> 
> > I think the best thing to do is to either force the caller to read
> > a power of two (pref. >4 bytes), so either we need some form of flag
> > to say this, or change the behaviour of the callers to never try this.
> 
> If it's considered generally objectionable to call read_buf for
> an amount of data that isn't a whole number of words, those two
> approaches would work as well. Making nand_read_subpage align to
> 4 bytes instead of 1/2 would be fairly simple. A flag would be a
> bit messier.

I think that if it is only a problem of reading the correct number of
bytes for stuff like the OOB, then there's no problem in adding an
fractional fixup after the readsl.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
