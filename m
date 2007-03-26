Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HVpmT-0003MW-Gf
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 10:02:43 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2QE2ccv012423
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 10:02:38 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2QE2bLi053332
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 08:02:37 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2QE2beh023275
	for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2007 08:02:37 -0600
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1174915008.26465.390.camel@gentoo-jocke.transmode.se>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<46028675.30200@ru.mvista.com>
	<1174571529.26465.311.camel@gentoo-jocke.transmode.se>
	<1174670673.26465.333.camel@gentoo-jocke.transmode.se>
	<1174912656.3454.1.camel@zod.rchland.ibm.com>
	<1174915008.26465.390.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Mon, 26 Mar 2007 09:02:16 -0500
Message-Id: <1174917736.4773.4.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-26 at 15:16 +0200, Joakim Tjernlund wrote:
> On Mon, 2007-03-26 at 07:37 -0500, Josh Boyer wrote:
> > On Fri, 2007-03-23 at 18:24 +0100, Joakim Tjernlund wrote: 
> > > 
> > > I found that an all empty FS took about the same time to mount
> > > which I find very strange.
> > > 
> > > Looking into the code in scan.c I found that even though I have
> > > cleanmarkers in all EB:s, JFFS2 still scans the whole EB. Do
> > > you really need to scan the whole area after the cleanmarker?
> > > Should be enough to only check a few words after the clean marker
> > > and if that is 0xffffffff then assume that the EB is clean
> > > since it had a valid clean marker at the beginning.
> > 
> > No,  you can't just read a few words.  On some flash, the cleanmarker
> > cannot be marked invalid in place so you still need to scan the rest of
> > the block.  Sucks.
> 
> Not quite true, for the non XIP case you don't read more than
> EMPTY_SCAN_SIZE(c->sector_size) before declaring it free.
> 
> JFFS2 has relied on this behavior in 2.4 and I see no reason to
> change that.

Well, yes you're right.  Too early in the morning for me to be emailing.

But now I'm confused.  Are you running with XIP or no?  If not, then you
shouldn't be hitting this issue from what I can tell.  The check below
the code you quoted earlier explicitly looks to see if the first node
found is a cleanmarker and then returns.

I'm confused how you're hitting this issue unless you have XIP turned
on.

josh
