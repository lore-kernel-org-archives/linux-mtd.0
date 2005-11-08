Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZYHq-0008Ef-Od
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 13:33:47 -0500
Date: Tue, 8 Nov 2005 19:33:39 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Message-ID: <20051108183339.GB31446@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
	<m3zmofovsc.fsf@maxwell.lnxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3zmofovsc.fsf@maxwell.lnxi.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 November 2005 11:10:27 -0700, Eric W. Biederman wrote:
> Jörn Engel <joern@wohnheim.fh-wedel.de> writes:
> 
> > Moving crap over to mtdchar.c is a good thing.  Complete removal of
> > mtdchar.c might be even better, but at least the crap is relatively
> > self-contained now.
> 
> Agreed moving the compat_ioctl to mtdchar now that it is possible
> sounds good.
> 
> I can see that argument with respect to mtdblock.  But why would
> removal of mtdchar be a good thing?  It is a simple raw access
> interface.   For those whose flash parts are too small for a filesystem
> or when you are doing things that you can't do with a filesystem
> like making or checking it you need something like mtd char.  For
> embedded folks who don't care you can just compile it out.

mtdchar.c is one of the worst drivers inside the kernel.  The concept
of having a simple char device driver for flash may have its charm,
but the actual implementation is horrible.  And things like the
read-only devices are even unfixable.

mtdblock.c, while being quite a bit more complicated, does not require
a ton of ioctls, will not confuse users with minor number 7 actually
being device number 3 and magically being read-only despite unix
permissions and hardware properties.  Plus, it is just a file.

Can you name a few examples, where mtdchar.c makes sense?  I've found
it to be quite useless.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
