Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPICZ-0003WV-5Q
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 07:58:36 -0500
Date: Thu, 8 Mar 2007 13:54:17 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 as transactional FS (in other words: how to be sure that
	data have been writtent correctly from userspace)
Message-ID: <20070308125416.GB23216@lazybastard.org>
References: <45EFDC0D.4090409@dave-tech.it>
	<1173351098.3461.414.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173351098.3461.414.camel@pmac.infradead.org>
Cc: R&D4 <r&d4@dave-tech.it>, mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 March 2007 10:51:38 +0000, David Woodhouse wrote:
> 
> On NOR you don't need the sync(). At least, if you're using write() you
> don't need the sync. I make no claims about what glibc does with
> fwrite(), but I believe fsync() ought to be perfectly sufficient.
> 
> JFFS2 doesn't support O_SYNC because it's _already_ synchronous.

It used to be.  And then came wbuf.c.  With write buffer enabled, JFFS2
is still serialized, but no longer synchronous (in the meaning of having
an implicit sync() after each operations).

Last time I checked, JFFS2 got one case wrong.  Don't remember which one,
but there are not that many to check:
 - mount -o sync
 - open(..., O_SYNC);
 - fsync()
 - sync()

[ Side note - NOR flash can still have a write buffer and require
explicit sync. ]

Jörn

-- 
Prosperity makes friends, adversity tries them.
-- Publilius Syrus
