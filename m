Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch3wD-0005wx-Mg
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 05:41:51 -0500
Date: Wed, 22 Dec 2004 11:41:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20041222104137.GD31282@wohnheim.fh-wedel.de>
References: <20041221210916.00C8CA00096@mail.murgatroid.com>
	<m33bxzvyl7.fsf@maxwell.lnxi.com>
	<20041222085921.GA31282@wohnheim.fh-wedel.de>
	<m3y8fqtzql.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3y8fqtzql.fsf@maxwell.lnxi.com>
Cc: Christopher Hoover <ch@murgatroid.com>,
	'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 December 2004 03:05:06 -0700, Eric W. Biederman wrote:
> 
> On a 4KiB flash I could probably afford to not use a spare flash block
> or two.   For the common case of 64KiB I don't see how I could leave
> an entire flash block unused.  Which is the very hard part of scaling
> jffs2 down to the tiniest systems.

Yup.  One block (plus a few bytes) is the lower bound.  Below that,
you can read-modify-erase-update and hope the power won't fail before
you're done.  Not fun.

> block2mtd ?

Deal.

> I see more problems with where the code wanted to go, as indicated
> by those comments than with where the code is now.  Probably
> allocating a single buffer page and calling down into the mtd device
> layer multiple times.  I have trouble seeing the benefit
> of making it a zero copy interface.
> 
> But none of this counts as horribly ugly in my book.  Just
> warts that may benefit from being cleaned up.
> 
> Some of the current IB stacks count get a lot closer to horribly ugly.
> Several hundred lines of global variables in one file I count horribly
> ugly.  At 500 lines I can see ugly code, but it is hard to write
> something that is a disaster that is that small.  The obfuscated C
> contest shows you can do it but we certainly don't have that.

Agreed.  Just ugly then.

> So have your fun with block2mtd and I won't worry about it.

;)

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
