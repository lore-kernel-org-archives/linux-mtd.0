Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WNpe-0002Xz-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 21:33:50 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8F001JN1AYNG@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 08 Jan 2003 23:04:11 +0100 (MET)
Date: Wed, 08 Jan 2003 23:03:11 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: 16 NANDS
In-reply-to: 
 <515CABE7496FD111AA3300201829FCBE3552E0@archie.gsi.synergie-inf.com>
To: m.neiger@synergie-inf.com, manningc2@actrix.gen.nz,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200301082303.11643.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <515CABE7496FD111AA3300201829FCBE3552E0@archie.gsi.synergie-inf.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wednesday 08 January 2003 22:23, Marc Neiger wrote:
> Hi Thomas,
>
> > I have the framework ready to support different buswidths.
>
> It's dangerous talking to you, guys, one gets easily caught in the
> maelstrom ;-)
>
> I'll gladly put my share back into the GPLd world, however my timeframe for
> the current project is very tight; everything, board, embedded linux and
> application should be working in less than 2 months.....
> Moreover, although I, and my colleagues, are experienced programmers, both
> in embedded and win32, I booted my first Linux about 6 weeks ago....
>
> The project shall be using a customly developped board using AMD Alchemy
> AU1000 (MIPS4Kc) processor. The board is planned to support both 8 and
> 16bits NAND flash, an EPLD shall, among other task, take care of data bus
> bits reordering (8 and 16 bits NANDS are pin out compatible except for the
> bit order). After reading some msg on this list, we already doubt about the
> ease of mounting a root JFFS2 filesystem.
It's really no big deal to mount a root fs with JFFS2 on NAND FLASH (8 bit 
buswidth). It works right out of the box, if you take the preliminaries into 
concern (see http://www.linux-mtd.infradead.org/tech/nand.html)
It is used in production systems.

> I'll have a look at the framework, then if I have some "time" and I feel
> comfortable with your code, I'll try to finish it, and we'll test it on our
> first board version. Otherwise, and it seems more likely, after the project
> is delivered and we have some experience on Linux, including kernel
> development since we are to write a driver for this very specific hardware,
> I'll get more seriously hands on the code but without having a very short
> deadline in front of me.
If your deadline is so tight and your capacities are so restricted, you could 
consider to sponsor one of the volunteer experts. This would speed up 
development rapidly. :)

> I already do much non computer related volunteer work and can not afford to
> take on my "free" time anymore.
See above. :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
