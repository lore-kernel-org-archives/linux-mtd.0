Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEvJJ-0006Lx-GQ
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 23:35:13 +0000
Date: Wed, 16 Jan 2008 00:26:13 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115232613.GA25000@lazybastard.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
	<20080115140759.GE11941@shareable.org>
	<20080115165043.GD22338@lazybastard.org>
	<20080115173510.GC16677@shareable.org>
	<20080115191603.GJ22338@lazybastard.org>
	<20080115215144.GA29037@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115215144.GA29037@shareable.org>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Jeff S <jsolman33@yahoo.com>, Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 21:51:44 +0000, Jamie Lokier wrote:
> Jörn Engel wrote:
> > 
> > I don't think there is a really good equivalent.  Writes happen
> > immediatly, but the changes may not become effective immediatly.  In a
> > way, the worst of both worlds. :)
> 
> I'm not sure if I understand what you mean by that.  Let me guess:
> 
> Do you mean that MTD write operations are started by write(), but
> write() returns before the writes are committed reliably?

Yes.  Write() may return before or after reliable commit, depending on
hardware, config options and sheer luck.

> If so does fsync/fdatasync/sync_page_range ensure that the preceding
> writes are committed reliably?

Yes.

> And does that include fsync on a
> directory following an atomic rename (for reliable replacement of a
> file)?

Yes.

> I guess write caching is an interesting beast for such a structured
> filesystem.  It would seem like a good opportunity to coalesce some
> tree node updates, something applications can't do themselves.

That bit is actually done already, modulo some bugs.  Once those bugs
are sorted out, caching actual data is a straight-forward extention.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
