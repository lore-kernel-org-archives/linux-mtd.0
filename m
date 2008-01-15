Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEv1g-0004qi-7Z
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 23:17:09 +0000
Date: Tue, 15 Jan 2008 21:51:44 +0000
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115215144.GA29037@shareable.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
	<20080115140759.GE11941@shareable.org>
	<20080115165043.GD22338@lazybastard.org>
	<20080115173510.GC16677@shareable.org>
	<20080115191603.GJ22338@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115191603.GJ22338@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Jeff S <jsolman33@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Tue, 15 January 2008 17:35:10 +0000, Jamie Lokier wrote:
> > 
> > Oh, ok, I thought it at least merged things in the page cache like
> > most other filesystems.  It seems it's more like O_DSYNC - or more
> > like O_SYNC (commits metadata changed for every write too)?
> 
> I don't think there is a really good equivalent.  Writes happen
> immediatly, but the changes may not become effective immediatly.  In a
> way, the worst of both worlds. :)

I'm not sure if I understand what you mean by that.  Let me guess:

Do you mean that MTD write operations are started by write(), but
write() returns before the writes are committed reliably?

If so does fsync/fdatasync/sync_page_range ensure that the preceding
writes are committed reliably?  And does that include fsync on a
directory following an atomic rename (for reliable replacement of a
file)?

> > Also, does LogFS (which I want to try later) have similar
> > characteristics?
> 
> At the moment, yes.  Most likely I won't get the caching part done
> before LCA.

I guess write caching is an interesting beast for such a structured
filesystem.  It would seem like a good opportunity to coalesce some
tree node updates, something applications can't do themselves.
Looking forward to it :-)

-- Jamie
