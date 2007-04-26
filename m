Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgzto-0005Eg-8a
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 05:04:26 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177576195.2755.286.camel@pmac.infradead.org>
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
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 11:04:22 +0200
Message-Id: <1177578263.28861.7.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 09:29 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 10:20 +0200, Joakim Tjernlund wrote:
> > No this is a matter of installing a number of new execuables/libs in
> > the FS and moving a few symlinks. Then a reboot.
> > I suspect that the it is only one of these printout that actually
> > makes the system crash, the other ones has problaby been there for a
> > while. Does that make sense?
> 
> Yes. Only one of those was a complaint with "but the old size was 0",
> which will have led to a NULL frag_last() since there were no frags.
> 
> > No, none acutally.
> 
> Hmmm.
> 
> > > 
> > > This is with JFFS2 from 2.6.20, right? Not a bug in the read_inode code
> > > I just committed a couple of days ago?
> > 
> > Plain 2.6.20 with my optimized scan you just commited.
> 
> By 'optimised scan' you just mean the fix to make it not crash, right?

No, sorry to be a bit unclear. I mean 
  "[JFFS2] Speed up mount for directly-mapped NOR flash"
and then the patch you did yesterday:
  "[JFFS2] Handle inodes with only a single metadata node with non-zero isize"
Had to apply than one by hand, but it was easy.

> 
> Not the _real_ optimisation I committed before that, which rewrites the
> entire read_inode() code path?
> 
> > > 
> > > > Wonder how the lab manged to get that many corrupted nodes?
> > > > One thing that is rather new in our system is that we trigger GC by
> > > > sending HUP to the GC thread from a script in user space at startup
> > > > and then every 24 hours.
> > > 
> > > That shouldn't make any difference. 
> > 
> > I know, but thats the only thing that I can think of that is somewhat
> > unique to our system.
> 
> Hm. I'm trying to think how it could trigger the problem -- even if we
> didn't block SIGHUP when we were in the GC routines, I still don't see
> how we could lose old nodes of a file without writing out new ones.
> 
> You can reproduce this at will by mounting a _clean_ filesystem, then
> "installing a number of new executables and moving a few symlinks" and
> then rebooting?

No, this SW upgrade procedure has been performed many times and this
is the first time we had this problem. 

> 
> Can you do that all with CONFIG_JFFS2_FS_DEBUG=1 and log it? I'll then
> see where _all_ the nodes for these problematics files are on the first
> boot, I'll see what happens when you make changes, and I'll see what we
> find on the second boot.
> 
> If you kill the GC thread (or hack the kernel not to start it) that'll
> make the dump a bit less noisy.

Since I can't reproduce how it happened we are stuck with the image we
have, would a full CONFIG_JFFS2_FS_DEBUG=1 help now?

 Jocke
