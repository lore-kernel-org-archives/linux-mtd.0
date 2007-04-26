Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh27G-0008Ps-08
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 07:26:27 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177578263.28861.7.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177569177.2755.274.camel@pmac.infradead.org>
	<1177575617.28488.17.camel@gentoo-jocke.transmode.se>
	<1177576195.2755.286.camel@pmac.infradead.org>
	<1177578263.28861.7.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 13:26:24 +0200
Message-Id: <1177586784.8841.3.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 11:04 +0200, Joakim Tjernlund wrote:
> On Thu, 2007-04-26 at 09:29 +0100, David Woodhouse wrote:
> > On Thu, 2007-04-26 at 10:20 +0200, Joakim Tjernlund wrote:
> > > No this is a matter of installing a number of new execuables/libs in
> > > the FS and moving a few symlinks. Then a reboot.
> > > I suspect that the it is only one of these printout that actually
> > > makes the system crash, the other ones has problaby been there for a
> > > while. Does that make sense?
> > 
> > Yes. Only one of those was a complaint with "but the old size was 0",
> > which will have led to a NULL frag_last() since there were no frags.
> > 
> > > No, none acutally.
> > 
> > Hmmm.
> > 
> > > > 
> > > > This is with JFFS2 from 2.6.20, right? Not a bug in the read_inode code
> > > > I just committed a couple of days ago?
> > > 
> > > Plain 2.6.20 with my optimized scan you just commited.
> > 
> > By 'optimised scan' you just mean the fix to make it not crash, right?
> 
> No, sorry to be a bit unclear. I mean 
>   "[JFFS2] Speed up mount for directly-mapped NOR flash"
> and then the patch you did yesterday:
>   "[JFFS2] Handle inodes with only a single metadata node with non-zero isize"
> Had to apply than one by hand, but it was easy.

Actually I forgot these:
[JFFS2] Use yield() between GC passes in background thread.
[JFFS2] Check for all-zero node headers

Should be harmless though.
