Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3vLx-0004ux-0g
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 11:06:21 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUR006RAQJKZJ@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 11:59:45 +0100 (MET)
Date: Thu, 18 Mar 2004 11:56:47 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <6.0.1.1.0.20040318105224.01f77d10@192.168.2.1>
To: llandre <r&d@wawnet.biz>, David Woodhouse <dwmw2@infradead.org>
Message-id: <200403181156.47289.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
 <200403181015.58675.tglx@linutronix.de>
 <6.0.1.1.0.20040318105224.01f77d10@192.168.2.1>
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in nand_select_chip?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 March 2004 10:56, llandre wrote:
> >That's correct, but you unfortunaly relied on code, which was in a heavy
> >modifciation phase. If you use leading edge code, be aware, that things
> > might be broken from time to time. The fix for this was committed 10 days
> > after the first rework.
>
> Ok, thanks for the advice.
> To avoid such problems, is it possible to download "stable" releases? Are
> they tagged in the CVS repository?

Yep, but the NAND stuff is quite new and not always up to date in the stable 
versions.

You can subscribe on the CVS mailinglist, which informs you of all changes in 
the repository.
http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
