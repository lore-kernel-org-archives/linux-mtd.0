Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5iUR-0007Ly-Pu
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 14:36:56 +0000
Date: Mon, 9 Jun 2008 16:36:33 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609143633.GA22447@logfs.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
	<20080609132117.GC29526@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080609132117.GC29526@shareable.org>
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 9 June 2008 14:21:17 +0100, Jamie Lokier wrote:
> Jörn Engel wrote:
> > replacing them with submit_fio (or some equivalent function, if
> > people dislike the name).
> 
> May I suggest submit_mtdio?  One concept to one name, you know.
> 
> F means flash, sure.  But we don't call the devices /dev/flash0, /dev/flash1.
> Nor do we call it the Flash subsystem.

I never liked the name "mtd".  It is unpronouncable and reeks of the
kind of premature overgeneralization big corporations usually come up
with.  "One day this will cover all memory, including hard disks, cpu
caches and those five bytes in the rtc."  Or some such madness.

But mtdio is even worse.  Dude, what are you smoking? ;)

> Or, maybe we should change the name to flash everywhere.  Most people
> recognise that nowadays - flash is a common term.

The old name - as stupid as it is - has become part of the eternal
interfaces.  You'll never hunt it to extinction.

> > And while at it, replace the 32bit size with a 64bit blockno and 32bit
> > offset.  Unless someone is stupid enough to create devices with 4G
> > erasesize, that should last for a human lifetime or something close.
> 
> Although a single chip is unlikely to have 4GiB erasesize for a while,
> a cluster of chips might, and it should be possible to represent them
> as a single device.

When you have a cluster of chips, striping them and increasing writesize
and erasesize (and having each bad block kill perfectly good blocks in
the other stripes) may be the first idea you have.  But I hope it won't
be the last.

Part of the reason for asynchronous interfaces is to make parallel chips
work fast without striping them.  Or rather, make them work even faster
than stripes.

> I'm thinking we want asynchronous wrappers around the synchronous
> methods too, using a dispatch thread.  So that drivers can be
> converted one by one, and old drivers don't need to be.  Something like
> generic_submit_fio.

Maybe.  That depends on when and how the users will take advantage of
the new interface.  I have plans for logfs, but don't intend to convert
jffs2, mtdchar, mtdblock or ubi.  If others do, please send patches.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
