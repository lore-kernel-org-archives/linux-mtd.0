Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTLZ6-0002QB-Oi
	for linux-mtd@lists.infradead.org; Sun, 24 Feb 2008 18:27:09 +0000
Date: Sun, 24 Feb 2008 16:11:35 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080224161135.GA4918@shareable.org>
References: <20080223235742.GE2202@elf.ucw.cz>
	<1203813368.5771.174.camel@shinybook.infradead.org>
	<20080224072423.GF2202@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080224072423.GF2202@elf.ucw.cz>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel Machek wrote:
> > You need to write a log entry indicating the new length of the file.
> > There is no space for new log entries.
> > 
> > There is a special case for removal -- 'rm gps.nmea' would work. Perhaps
> > we should add a special case for truncation too, so that it can also use
> > the extra pool of free space.
> 
> Yes, that would be nice. I somehow assumed that truncate can't fail
> for -ENOSPC ... I was trying to actually free some space on the
> filesystem...

Same here!  When I got ENOSPC from truncate, trying to free some
space, I was so surprised (and a bit disappointed) that I assumed
removal could fail too.  So now I'm pleasantly surprised to learn I
can at least remove a file.

It does seem odd that truncate to zero length can fail.  It is
guaranteed to free up one or more data nodes, so there should be
enough space for the size change node, provided GC is invoked when
necessary and the node sizes are compatible for this in corner cases.

-- Jamie
