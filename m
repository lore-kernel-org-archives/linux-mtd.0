Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K61X0-0001oS-Hd
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 10:56:50 +0000
Date: Tue, 10 Jun 2008 11:56:48 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080610105647.GD25910@shareable.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
	<20080609132117.GC29526@shareable.org>
	<20080609143633.GA22447@logfs.org>
	<20080609163149.GB2596@shareable.org>
	<20080609172202.GB22447@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080609172202.GB22447@logfs.org>
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> > I didn't say it's a _good_ idea!  Just that I won't be surprised when
> > someone produces hardware like that.  And, there will probably be a
> > reason you haven't thought of why they did it that way.
> 
> If someone is stupid enough to create such hardware, I don't mind if
> they suffer.  Quite the contrary.  Send them the darwin award of
> hardware engineering!

Erm, I think a good reason will crop up in a few years that you
haven't thought of.

Like a fast system with 128TiB molecular flash where the erase power
circuit is 10^7 x larger than each storage bit.

I just don't see any advantage to assuming "nobody will ever use 4GiB
erase blocks", when changing the API with larger sizes.

> > What should the behaviour be with devices which block the CPU during
> > synchronous writes and erases?  Right now, you can be sure the
> > temporary CPU blockage (if there is one) happens when you request the
> > I/O.  If it's asynchronous, depending on how it's implemented, the CPU
> > could block at an unexpected time later.
> 
> Good devices should have a dma engine and an interrupt line.  Lesser
> devices can set a timer in the driver.  If the cpu has to actively do
> some work during erase, you won't win any benchmark crowns with it
> anyway and I care fairly little.
>
> If you are designing hardware ...

Back in the real world, we want to run current kernels on hardware
which is already built, or which is not designed for current kernels.

We also want to run current kernels on hardware designed by people who
care about minimising hardware cost, or design time, or using the
cheapest available old chips.

Fine, the async interface isn't designed for that.  If it's only used
for high-performance chips, that's fine with me.

But if you want to make the async interface the _central_ interface
for kernel flash API in future, around which everything should
revolve, please at least specify what behaviour to expect with
non-async devices - particularly, how should chip drivers behave.

There are plenty of slow, crappy parts in use for good reasons, cost,
size, and compatibility with other software or reference designs, primarily.

I have a particularly crappy one where erase blocks the CPU if the CPU
reads from the chip during the erase - so the cfi_cmdset_0002.c file
needs a patch to avoid polling the status register for this board.
This is topic for another post, though.

-- Jamie
