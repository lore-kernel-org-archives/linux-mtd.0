Received: from a80-127-156-242.adsl.xs4all.nl ([80.127.156.242]
	helo=linserv001.aimsys.nl)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By4Db-0004Vv-Gc
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 03:53:51 -0400
From: Jaap-Jan Boor <jjboor@aimsys.nl>
To: Stefan =?ISO-8859-1?Q?St=FCrke?= <sst@pandatel.com>,
	Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1092930561.2991.8.camel@weaponx.rchland.ibm.com>
References: <cg23u5$gd0$1@sea.gmane.org>
	<1092919733.23187.34.camel@linpc003.aimsys.nl>
	<4124C848.7000808@pandatel.com>
	<1092930561.2991.8.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Message-Id: <1092988420.23187.45.camel@linpc003.aimsys.nl>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 09:53:40 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and 28F128J3A
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-19 at 17:49, Josh Boyer wrote:
> On Thu, 2004-08-19 at 10:33, Stefan Stürke wrote:
> 
> > Thank you, nice idea. I just tested it but unfortunatly at
> > my hardware the reset pin of the flash is only triggered
> > by power on reset and not by processor reset. So the
> > checkstop just kills the processor but it still can not
> > read valid code from flash :-(
> 
> I had a situation like that once.  Some may tell you that it's a broken
> board design, which is mostly true.  But we don't always have a say in
> the design of the boards we use ;).
> 
> > 
> > Of course as 'dirty' solution I could write a 0xFF to
> > the flash device before executing 'm8260_gorom()'.
> > In this way the problem should be solved.
> > 
> > But I am afraid that the code in cfi_cmset_0001 has a bug
> > leaving the chip in query mode after writing to it. And that
> > this bug has side effects which I can't see know but which will
> > be seen by our customers.
> > Has anybody ever heard of such behavior of cfi_cmset_0001?
> 
> Is it in CFI query mode, or in Read Status mode?  I have seen it be left
> in Read Status mode after a write, but never CFI query mode.

Yes, that's what I also see. That should be ok.

> 
> Leaving it in Read Status mode shouldn't have any side effects during
> runtime operation, since the MTD code expects that.  It's probably more
> efficient anyway, since the code can't be sure of what the next
> operation will be.
> 
> To solve your reset issue, you could do what you said above.  Or you can
> put the chip in Read Array mode after every write is completed (erase
> too for that matter).  That won't catch all the corner cases though.
> 
> josh
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
J.G.J. Boor                       Anton Philipsweg 1
Software Engineer                 1223 KZ Hilversum
AimSys bv                         tel. +31 35 689 1941
Postbus 2194, 1200 CD Hilversum   mailto:jjboor@aimsys.nl
