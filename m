Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5kHl-00037W-No
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 16:31:58 +0000
Date: Mon, 9 Jun 2008 17:31:49 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609163149.GB2596@shareable.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
	<20080609132117.GC29526@shareable.org>
	<20080609143633.GA22447@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080609143633.GA22447@logfs.org>
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
> > May I suggest submit_mtdio?  One concept to one name, you know.
> > 
> > F means flash, sure.  But we don't call the devices /dev/flash0, /dev/flash1.
> > Nor do we call it the Flash subsystem.
> 
> I never liked the name "mtd".

Me neither.

> But mtdio is even worse.  Dude, what are you smoking? ;)

submit_fio suggests "file I/O" to me....  Even if I knew better, it
looks just that bit too much like submit_bio for something file-ish.

submit_mtd_request or async_mtd, then! :-)

> > > And while at it, replace the 32bit size with a 64bit blockno and 32bit
> > > offset.  Unless someone is stupid enough to create devices with 4G
> > > erasesize, that should last for a human lifetime or something close.
> > 
> > Although a single chip is unlikely to have 4GiB erasesize for a while,
> > a cluster of chips might, and it should be possible to represent them
> > as a single device.
> 
> When you have a cluster of chips, striping them and increasing writesize
> and erasesize (and having each bad block kill perfectly good blocks in
> the other stripes) may be the first idea you have.  But I hope it won't
> be the last.

I didn't say it's a _good_ idea!  Just that I won't be surprised when
someone produces hardware like that.  And, there will probably be a
reason you haven't thought of why they did it that way.

> Part of the reason for asynchronous interfaces is to make parallel chips
> work fast without striping them.  Or rather, make them work even faster
> than stripes.

And erasing simultaneous with streaming writes, let the CPU get on
with something else, etc.

What should the behaviour be with devices which block the CPU during
synchronous writes and erases?  Right now, you can be sure the
temporary CPU blockage (if there is one) happens when you request the
I/O.  If it's asynchronous, depending on how it's implemented, the CPU
could block at an unexpected time later.

-- Jamie
