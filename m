Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HyXBl-0000Nf-1Z
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 14:03:30 -0400
Date: Wed, 13 Jun 2007 19:58:32 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
Message-ID: <20070613175831.GC24502@lazybastard.org>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
	<20070613115445.GA24502@lazybastard.org>
	<1181741378.30670.293.camel@gentoo-jocke.transmode.se>
	<20070613142926.GB24502@lazybastard.org>
	<1181754991.30670.325.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1181754991.30670.325.camel@gentoo-jocke.transmode.se>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 June 2007 19:16:31 +0200, Joakim Tjernlund wrote:
> > 
> > I can see two sane alternatives.
> > 
> > /*
> >  * An MTD driver may return from mtd->write() calls before the data has
> >  * safely been written to the medium.  Any amount of dirty data may be
> >  * cached by either the driver or the device.  If a filesystem depends
> >  * on the data being safely on the medium, it has to explicitly call
> >  * mtd->sync().
> >  */
> > 
> > /*
> >  * Mtd->write() and mtd->erase() methods may only return if the data has
> >  * been safely written to the device.  Special care needs to be taken
> >  * for devices that support caching.
> >  */
> > 
> > My tendency is to favor the first variant. 
> 
>    Me too.
> 
> >  Block2mtd already implements
> > it.  And if we went for variant two, mtd->sync() would be pointless and
> > should get removed.
> > 
> > Now to the bug report:
> > JFFS2 must call mtd->sync() for its various sync routines.  If mounted
> > with -o sync or for files opened with O_SYNC, it has to call that after
> > every write.  If nothing else, it is currently broken on block2mtd.
> 
> Sure, but for NOR flash this sync can be a NOP, right?

Actually, no.  After dwmw2 explained things in irc, I finally understand
the original meaning of that method.  It is supposed to wait until any
erase suspend (or program suspend) has finished.  You can view erase
suspend as a form of caching and erase as a form of writing.

If we wanted to avoid the cost without paying in reliability, we could
add an argument to sync().  Sync(now) would have the current semantics.
Sync(five minutes ago) would require that any writes/erases started more
than five minutes ago must be safe.  It add quite a bit of complexity,
though.  Maybe not worth it.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
