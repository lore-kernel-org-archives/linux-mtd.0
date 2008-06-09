Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5hJb-0007B4-DN
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 13:21:39 +0000
Date: Mon, 9 Jun 2008 14:21:17 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609132117.GC29526@shareable.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080608121020.GA13200@logfs.org>
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
> replacing them with submit_fio (or some equivalent function, if
> people dislike the name).

May I suggest submit_mtdio?  One concept to one name, you know.

F means flash, sure.  But we don't call the devices /dev/flash0, /dev/flash1.
Nor do we call it the Flash subsystem.

Or, maybe we should change the name to flash everywhere.  Most people
recognise that nowadays - flash is a common term.

> Submit_fio has the advantage of allowing asynchronous operations,
> queueing, out-of-order completion and all those goodies.  If you
> have several chips in a device, I'm sure you want those as well.

Yes!  I always wondered why it wasn't done like that from the beginning.

> And while at it, replace the 32bit size with a 64bit blockno and 32bit
> offset.  Unless someone is stupid enough to create devices with 4G
> erasesize, that should last for a human lifetime or something close.

Although a single chip is unlikely to have 4GiB erasesize for a while,
a cluster of chips might, and it should be possible to represent them
as a single device.  I strongly suggest supporting erasesizes
comparable with the device size.  That doesn't mean writesize has to
be that big - writesize should fit in size_t (actually ssize_t), just
like sys_write().

> > It still leaves the problem of converting all driver.  I've only started
> on mtdram - because it is simple and everyone can test it.  Other
> drivers can follow over time.  Users like jffs2 could be converted as
> well, but I'd rather leave them for now.

> We want synchronous wrappers around submit_fio anyway, as those are
> useful for development and for trivial performance-agnostic code.
> Comments?

I'm thinking we want asynchronous wrappers around the synchronous
methods too, using a dispatch thread.  So that drivers can be
converted one by one, and old drivers don't need to be.  Something like
generic_submit_fio.

-- Jamie
