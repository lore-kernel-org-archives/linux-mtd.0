Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QwBi-00043I-F5
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 22:34:22 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HGF00N6OVXB2I@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 13 Jun 2003 23:34:24 +0200 (MEST)
Date: Sat, 14 Jun 2003 00:32:29 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1055484161.16455.133.camel@imladris.demon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>, Chris <csperandeo@intrinsyc.com>
Message-id: <200306140032.29488.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <Pine.LNX.4.44.0306121704110.1757-100000@intrinsyc.com>
 <1055484161.16455.133.camel@imladris.demon.co.uk>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: Reliability of NAND JFFS2 vs YAFFS for Embedded Systems
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 13 June 2003 08:02, David Woodhouse wrote:
> On Fri, 2003-06-13 at 01:05, Chris wrote:
> > I am considering moving to the YAFFS filesystem due to reliablity
> > concerns, but I am also wondering if YAFFS will have its own can of
> > worms.  I would like to have reliability, performance and space but
> > reliability is the most important concern.
> >
> > Does anyone have experience with testing reliability of both
> > configurations?
> > If so what were the resutls?
>
> There's been powerfail testing done on JFFS2 on NOR; not yet for NAND
> and there are some known corner cases which need sorting out before I
> really undertake that.

I have done intensive powerfail testing on NAND. I have no problem with JFFS2 
and YAFFS. I think both are reliable and have their (dis)advantages.

Both filesystems have invalid files on it, if the powerfail occures during a 
file write. That's normal behaviour. This would be the same on your harddisk 
or any other medium.

I have never seen a serious fs corruption neither on JFFS2 nor on YAFFS, 
except for some development phases, when the code was buggy. That's normal 
for work in progress too.

The only unsolved problem for JFFS2 on NAND at the moment is a writebuffer 
flush failure. This has hit me once during a log term test, where a sector 
went bad after > 1.200.000 erase cycles. But this did not corrupt the hole 
filesystem. It was just the last written file, which was lost. It should be 
not too hard to fix that at least, if somebody has enough time or someone 
does a little sponsoring for that :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
