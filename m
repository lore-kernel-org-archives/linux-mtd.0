Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1ChAMS-00034Q-UB
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 12:33:22 -0500
Date: Wed, 22 Dec 2004 18:33:13 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20041222173313.GF9783@wohnheim.fh-wedel.de>
References: <20041222155624.GA9783@wohnheim.fh-wedel.de>
	<JPEALJAFNGDDLOPNDIEEAEKMCPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEAEKMCPAA.joakim.tjernlund@lumentis.se>
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

On Wed, 22 December 2004 17:39:08 +0100, Joakim Tjernlund wrote:
> 
> OK, then there might be worth considering a reverse checksum.

Looks like it.

> This generates a little better code on PPC.
> Not tested.

Thanks.  Imo this variant is less readable and doesn't help i386, so
I'll ignore it for now.  If an i386-optimized engel32 is in the
adler32 range, I'll get back to it.  If not, let's just drop the whole
idea.

> > BTW: I reject the name "Engler32".  Few names are worse than
> > "engel32", but that one is. ;)
> 
> I am so sorry, I felt something was wrong when I wrote that but I didn't
> check, my bad.

No offense taken.  Btw, if you know a better name, that would be nice.
There should be quite a few, I'm just too lazy to think of one.

Jörn

-- 
Fancy algorithms are slow when n is small, and n is usually small.
Fancy algorithms have big constants. Until you know that n is
frequently going to be big, don't get fancy.
-- Rob Pike
