Received: from avasout06.plus.net ([212.159.14.18])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEYyQ-0004KS-R7
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 09:57:16 +0000
Date: Wed, 7 Dec 2016 09:56:50 +0000
From: Mike Crowe <mac@mcrowe.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Support skipping a certain number of good blocks
Message-ID: <20161207095650.GA13752@mcrowe.com>
References: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
 <20161206181108.GA20416@mcrowe.com>
 <cdfdbe5d-1aa8-e424-7691-338d0d63f7b1@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdfdbe5d-1aa8-e424-7691-338d0d63f7b1@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 December 2016 at 09:53:49 +0100, David Oberhollenzer wrote:
> Since both tools already have a --start[address] option to specify an offset,
> wouldn't it make more sense for your case to add a flag that this offset should
> not include bad blocks? IMO this would remove the ambiguity of having two
> different offset options.

I agree that having two options isn't exactly clear. However, being able to
specify both a start address and a skip offset together might be useful if
the partition table is incorrect (this may occur during upgrades to a
bootloader version that uses a different partition table.)

But, if you'd prefer a separate option I can have a go at implementing
that.

> For both tools, instead of skipping bad blocks on the fly, it would IMO be cleaner
> if you could add a simple check that iterates over the erase blocks ahead of time
> and adjusts the offset if a block is bad. Then you wouldn't have to change the
> later checks or add additional clutches to the already cluttered read/write loop.

I tried to make my changes as minimal as possible, but you are correct that
it just makes the complex main loop even worse. I did initially try to scan
first but decided against that idea for reasons I've now forgotten. I'll
have another go at it.

Thanks for the review.

Mike.
