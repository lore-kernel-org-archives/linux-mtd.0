Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch8qi-0000Yx-Pp
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 10:56:30 -0500
Date: Wed, 22 Dec 2004 16:56:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20041222155624.GA9783@wohnheim.fh-wedel.de>
References: <20041222151403.GA8943@wohnheim.fh-wedel.de>
	<JPEALJAFNGDDLOPNDIEEGEKICPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEGEKICPAA.joakim.tjernlund@lumentis.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 December 2004 16:30:20 +0100, Joakim Tjernlund wrote:
> 
> Can you do
> 1) First run a forward and then a backward version on memory space >= 2*L1 cache
> 2) Then do two forward runs on the same memory.
> 
> Compare the delta between 1) and 2)
> That should give a clue if it is worth having a backward version.

In my private not-too-scientific hash-table test, I do a strlen()
before calling engel32.  The reverse version is 1.5% faster, even
though the strings are in the 80byte arena.  That's well over noise
level.

> > Adler32 beats the hell out of every other algorithm.  Except for the
> > backwards part, it appears to be a clear winner.
> 
> Have you look at the assembler Engler32 generates? Every instruction counts
> in such small loops.

Not yet.  Might be worth a try, though.  Since it's losing in direct
comparison, but equal in the hash test, it might be slightly stronger
than adler32.

BTW: I reject the name "Engler32".  Few names are worse than
"engel32", but that one is. ;)

Jörn

-- 
A defeated army first battles and then seeks victory.
-- Sun Tzu
