Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HVp46-0002mQ-BC
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 09:16:51 -0400
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1174912656.3454.1.camel@zod.rchland.ibm.com>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<46028675.30200@ru.mvista.com>
	<1174571529.26465.311.camel@gentoo-jocke.transmode.se>
	<1174670673.26465.333.camel@gentoo-jocke.transmode.se>
	<1174912656.3454.1.camel@zod.rchland.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Mar 2007 15:16:48 +0200
Message-Id: <1174915008.26465.390.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-26 at 07:37 -0500, Josh Boyer wrote:
> On Fri, 2007-03-23 at 18:24 +0100, Joakim Tjernlund wrote: 
> > 
> > I found that an all empty FS took about the same time to mount
> > which I find very strange.
> > 
> > Looking into the code in scan.c I found that even though I have
> > cleanmarkers in all EB:s, JFFS2 still scans the whole EB. Do
> > you really need to scan the whole area after the cleanmarker?
> > Should be enough to only check a few words after the clean marker
> > and if that is 0xffffffff then assume that the EB is clean
> > since it had a valid clean marker at the beginning.
> 
> No,  you can't just read a few words.  On some flash, the cleanmarker
> cannot be marked invalid in place so you still need to scan the rest of
> the block.  Sucks.

Not quite true, for the non XIP case you don't read more than
EMPTY_SCAN_SIZE(c->sector_size) before declaring it free.

JFFS2 has relied on this behavior in 2.4 and I see no reason to
change that.
