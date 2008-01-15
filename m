Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JErPC-0004TO-4T
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 19:25:02 +0000
Date: Tue, 15 Jan 2008 20:16:03 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: JFFS2 determine writing state
Message-ID: <20080115191603.GJ22338@lazybastard.org>
References: <298338.39997.qm@web56002.mail.re3.yahoo.com>
	<20080111075730.052c821d@zod.rchland.ibm.com>
	<20080112100343.GC1497@shareable.org>
	<20080112141508.22b19686@vader.jdub.homelinux.org>
	<20080115140759.GE11941@shareable.org>
	<20080115165043.GD22338@lazybastard.org>
	<20080115173510.GC16677@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080115173510.GC16677@shareable.org>
Cc: Jeff S <jsolman33@yahoo.com>, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 17:35:10 +0000, Jamie Lokier wrote:
> 
> Oh, ok, I thought it at least merged things in the page cache like
> most other filesystems.  It seems it's more like O_DSYNC - or more
> like O_SYNC (commits metadata changed for every write too)?

I don't think there is a really good equivalent.  Writes happen
immediatly, but the changes may not become effective immediatly.  In a
way, the worst of both worlds. :)

> Is there a particular advantage, in terms of flash overhead,
> compression, or mount/gc times, to writing blocks with a particular
> size and alignment, such as 4k size and 4k offset-alignment-in-file?

4k size and 4k alignment is best for all the reasons you cited above.

> Also, does LogFS (which I want to try later) have similar
> characteristics?

At the moment, yes.  Most likely I won't get the caching part done
before LCA.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
