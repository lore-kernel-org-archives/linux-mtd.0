Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECfTE-0006dH-8s
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 11:34:53 -0400
From: Richard Purdie <rpurdie@rpsys.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050906152238.GC14661@wohnheim.fh-wedel.de>
References: <E1ECeiI-0000H1-91@phoenix.infradead.org>
	<20050906150819.GA14661@wohnheim.fh-wedel.de>
	<1126019839.8338.156.camel@localhost.localdomain>
	<20050906152238.GC14661@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 06 Sep 2005 16:34:46 +0100
Message-Id: <1126020886.8338.164.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/nand sharpsl.c,1.4,1.5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-06 at 17:22 +0200, Jörn Engel wrote: 
> On Tue, 6 September 2005 16:17:19 +0100, Richard Purdie wrote:
> > On Tue, 2005-09-06 at 17:08 +0200, Jörn Engel wrote:
> > > With Ferenc's patch in, MTD_NO_VIRTBLOCKS has lost its effect.  I
> > > guess we will remove that flag sometime in the near future.
> 
> Actually, this flag is important to *everybody*.  Whoever thought up
> the hack to use virtual blocks instead of physical ones was plain
> stupid and opened the door for incompatibilities, data loss and who
> knows what else.
> 
> Hence, Ferenc made the flag implicit.  Actually, he was a bit smarter
> and only made it implicit when required.  Either way, the virtual
> blocks are gone, thankfully.

Ah, so this flag is enabled for everyone now? If so, that's fine. I was
thinking you meant there was no longer a way to disable virtual blocks
which was worrying me, a lot :)

Cheers,

Richard - relived
