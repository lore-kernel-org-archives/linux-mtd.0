Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPclp-0003AX-UP
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 05:56:25 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173433611.3461.566.camel@pmac.infradead.org>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432976.26465.31.camel@gentoo-jocke.transmode.se>
	<1173433611.3461.566.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Mar 2007 11:56:20 +0100
Message-Id: <1173437780.26465.47.camel@gentoo-jocke.transmode.se>
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

On Fri, 2007-03-09 at 09:46 +0000, David Woodhouse wrote:
> On Fri, 2007-03-09 at 10:36 +0100, Joakim Tjernlund wrote:
> > I am starting to think that this error is due to an old design mistake
> > in JFFS2 I pointed out years ago: crc32 sums are seeded with zero instead of -1
> 
> Indeed. But you only pointed it out in 2004, which was 3 years too
> late :)

Someone got his archive in order :)

>  
> > Zero seed makes an zeroed JFFS2 header match its crc32 and that is what I think
> > is happening here, readinode.c:576 should reject this node but doesn't due to this flaw)
> > 
> > What to do:
> > 1) Add extra checks for zeroed headers?
> 
> That's the approach in the patch I just sent you.
> 
> > 2) Add an config option where one can change the crc32 seed to -1? 
> 
> If we're going to change it, why not change to something cheaper, like
> Adler32? As you also pointed out. I suspect we should just leave it as
> it is with the extra checks though.

Yeah, but I figured that changing seed was less intrusive. Not 
sure how good Alder32 is but if we make an incompatible change we
could change it to something else than crc32. We should measure if 
how much faster Adler32 is first though.

You think such a change is worthwhile?

 Jocke
