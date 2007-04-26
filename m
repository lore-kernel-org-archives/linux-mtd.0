Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgzDC-00049O-B5
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 04:20:23 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177569177.2755.274.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177569177.2755.274.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 10:20:17 +0200
Message-Id: <1177575617.28488.17.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 07:32 +0100, David Woodhouse wrote:
> On Wed, 2007-04-25 at 19:39 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-04-25 at 17:07 +0100, David Woodhouse wrote:
> > > I've just committed something to the git tree which should fix the
> > > symptoms --and I think it should apply OK to 2.6.20 which predates other
> > > improvements in read_inode(). 
> > > 
> > > We should still work out the _cause_ though. Once you've confirmed that
> > > this patch avoids the crash, you'll know the inode number (because it'll
> > > bitch about it). If you don't want to wait for a full
> > > CONFIG_JFFS2_FS_DEBUG=1 run, can you enable all the output in
> > > jffs2_get_inode_nodes() _just_ for that inode, and show me what nodes
> > > are found?
> > 
> > Seems to work, at least I can boot now but I get a few compliants:
> 
> Hm, so you've lost a _lot_ of data. I don't suppose there's any chance
> they've been putting new images at the start of the flash without
> actually _erasing_ the remainder of the space?

No this is a matter of installing a number of new execuables/libs in
the FS and moving a few symlinks. Then a reboot.
I suspect that the it is only one of these printout that actually
makes the system crash, the other ones has problaby been there for a
while. Does that make sense?

> 
> Are you getting lots of messages about bad CRCs?

No, none acutally.

> 
> This is with JFFS2 from 2.6.20, right? Not a bug in the read_inode code
> I just committed a couple of days ago?

Plain 2.6.20 with my optimized scan you just commited.

> 
> > Wonder how the lab manged to get that many corrupted nodes?
> > One thing that is rather new in our system is that we trigger GC by
> > sending HUP to the GC thread from a script in user space at startup
> > and then every 24 hours.
> 
> That shouldn't make any difference. 

I know, but thats the only thing that I can think of that is somewhat
unique to our system.

 Jocke
