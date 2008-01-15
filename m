Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEp8X-0003RL-Jm
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 16:59:41 +0000
Date: Tue, 15 Jan 2008 17:50:43 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115165043.GD22338@lazybastard.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
	<20080115140759.GE11941@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115140759.GE11941@shareable.org>
Cc: Jeff S <jsolman33@yahoo.com>, Josh Boyer <jwboyer@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 14:08:00 +0000, Jamie Lokier wrote:
> 
> But the particular fs behaviour is relevant the other way around: I
> have a program which calls open/write/close with small writes
> moderately often (because it calls another program which actually
> operates on the file).
> 
> If JFFS2 commits pending writes on every close, I should change things
> to keep the file open between writes so they are coalesced and faster,
> when I don't need the individual writes to be committed separately.

JFFS2 also commits on every write.  So you need userspace caching if you
want to coalesce things.  fwrite might be enough for that...

> When I do need the data committed I can use fsync of course.

...as long as you also fflush (or fclose) before fsync.

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
