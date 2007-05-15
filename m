Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho2cj-0007aF-0K
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 15:23:56 -0400
Date: Tue, 15 May 2007 21:19:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: John Stoffel <john@stoffel.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070515191926.GB1220@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<17994.1241.436841.681216@stoffel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17994.1241.436841.681216@stoffel.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 May 2007 15:07:05 -0400, John Stoffel wrote:
> 
> I've been semi watching this, and the only comment I really can give
> is that I hate the name.  To me, logfs implies a filesystem for
> logging purposes, not for Flash hardware with wear leveling issues to
> be taken into account.

Yeah, well, ...

Two years ago when I started all this, I was looking for a good name.
All I could come up with sounded stupid, so I picked "LogFS" as a code
name.  As soon as I find a better name, the code name should get
replaced.

By now I still don't have anything better.  All alternatives that were
proposed are just as bad - with the added disadvantage of being new and
not established yet.  My hope of ever finding a better name is nearly
zero.

> Also, having scanned through the code, I find the name "cookie" using
> in logfs_inode(), logfs_iput(), logfs_iget() to be badly named.  It
> should really be something like *cached_inode, which would seem to
> give more natural semantics of
> 
> 	if (cached_inode)
> 		do_cached_inode_ops(...)
> 	else
> 		do_inode_ops(...)

Half-agreed.  For callers, the name "cookie" makes sense.  It is a
transparent thing they should not tough and hand back unchanged.  For
logfs_iget() and logfs_iput() something like "is_cached" would be
better.

Will change.

Jörn

-- 
Linux [...] existed just for discussion between people who wanted
to show off how geeky they were.
-- Rob Enderle
