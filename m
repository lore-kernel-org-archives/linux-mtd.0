Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Akt4Q-0006NL-Tu
	for linux-mtd@lists.infradead.org; Sun, 25 Jan 2004 22:49:35 +0000
Date: Sun, 25 Jan 2004 23:49:11 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20040125224911.GA12365@wohnheim.fh-wedel.de>
References: <m3u12jr8y4.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3u12jr8y4.fsf@maxwell.lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 25 January 2004 14:53:55 -0700, Eric W. Biederman wrote:
> 
> Currently I am examining the possibility of using a filesystem with
> LinuxBIOS so that I may store parameters and kernels in the flash in a
> more flexible manner. 
> 
> The current flash chips I am working with are NOR flash from 512KiB to
> 4MiB.  And they generally have a 64KiB erase size.
> 
> I have two flash blocks that are reserved for XIP code (the hw
> initialization firmware) and the rest can be used for the filesystem.
> So in the worst case I have 6 flash blocks to play with.
> 
> The old papers on jffs2 would make it unacceptable as it reserves
> 5 erase blocks.  And I don't know if yaffs or yaffs2 is any better.
> 
> In addition boot time is important so it would be ideal if I did not
> to read every byte of the ROM chip to initialize the filesystem.
> 
> Is there a filesystem that only reserves one erase block?
> 
> Does it look like I need to write my own solution?

Not necessarily.  Disable compression for jffs2 and you should be able
to get away with two reserved blocks, or even 80kiB or so.  But that
requires changes to current code and lots of testing.  Compression
makes things more complicated, basically impossible to calculate, so
you have to reserve a little more and hope for the best.  Five blocks
are *very* conservative for a filesystem of six block total, though.

The idea is pretty old, it's just that noone cared enough to do all
the work.

Jörn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike
