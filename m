Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfG9Y-0004A0-EE
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 06:20:16 -0500
Date: Fri, 17 Dec 2004 12:20:00 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041217112000.GB10973@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEGEHCCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412171053080.8020@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 December 2004 10:56:22 +0000, Artem B. Bityuckiy wrote:
> 
> > Another idea, calculate the CRC backwards(from the end of the buffer to the beginning).
> > That give better L1 cache behaviour.
> >
> Why (may be some URL)? For all archs? 

Sounds rather odd indeed.  Most CPUs I know about either have no
hardware-prefetch, can only prefetch forward or can prefetch both
forward and backward.  In either case, calculating the CRC backward
should either be the same speed or slower than going forward.

But I like to learn something new.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
