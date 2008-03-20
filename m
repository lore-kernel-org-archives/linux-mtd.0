Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JcJjf-00053F-MZ
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 12:19:08 +0000
Date: Thu, 20 Mar 2008 12:20:29 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
Message-ID: <20080320112029.GB1355@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
	<21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 March 2008 11:56:54 -0000, Adrian McMenamin wrote:
> >> +
> >> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
> >> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);
> >
> > unsigned long is larger than 32bit on many architectures.  Better
> > variant:
> > 	__be32 *sendbuf;
> 
> 
> No, it's not. This is part of a bus subsystem where different parts of the
> incoming packets may or may not be in big endian format. Eg for block
> writes the then the opening blocks may be in big endian format but the
> data to be written is not.

Data to be written is usually treated as opaque void* pointer.  You
don't need to know what's in it, just the pointer and the length.  But
once you dereference the data, it is no longer opaque and you better
know its endianness.

So why do you use void* for data you actually dereference?

> If you insist on leaving open the possibility that someone might decide to
> build the electronics to attach these devices to a 64 bit machine
> (unlikely, I'd suggest) then u32 is the way to go - but are you really
> concerned that might happen?

Not too much, but there are examples where such things did happen.
emac3 is one.

> >> +fail_buffer:
> >> +	return -error;
> >
> > Yikes.  Errnos greater 127 do exist.  Better return a signed int and
> > interpret at error if <0.
> >
> 
> There is an error here, actually, but not as you describe. However as the
> errors defined in errno-base are all positive integers I don't see how
> your proposal works.

A couple of lines down you have "return -ENOMEM;".  Notice the "-"?  As
a general rule, negative return values in the kernel are errors,
positive or zero are non-errors.  Exceptions exist, but they tend to
surprise users and cause subtle bugs.

> > You could also combine the two sets of kfree() into one, btw.
> >
> >> +	do {
> >> +		if (pcache->valid &&
> >> +		   time_before(jiffies, pcache->jiffies_atc + HZ)) {
> >> +			vblock = ofs_to_block(from + index, mtd, partition);
> >> +			if (!vblock)
> >> +				return -ENOMEM;
> >> +			if (pcache->block == vblock->num) {
> >> +				/*we have cached it, so do necessary copying */
> >> +				leftover = card->blocklen - vblock->ofs;
> >> +				if (leftover > len - index) {
> >> +					/* only a bit of this block to copy */
> >> +					memcpy(buf + index,
> >> +						pcache->buffer + vblock->ofs,
> >> +						len - index);
> >
> > Five levels of indentation are a strong indication that this code is
> > buggy.  I don't understand how it behaves in all corner cases and I bet
> > neither do you.
> 
> It's not buggy - and it seems pretty clear to me what is happening here.
> What's the issue?

Every single time I've had to deal with such levels of indentation
before I have found a bug.  No exceptions.  And every single time it was
a _lot_ of work because the code was too complicated for my little brain
to completely understand.  My preferred method is to rework the code
until it is simple enough even for me.

But as long as you are willing to maintain this beast and deal with any
bug reports, I don't mind either way.

Jörn

-- 
The only good bug is a dead bug.
-- Starship Troopers
