Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAsBG-0005Ox-OU
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 14:53:58 -0400
From: David Brownell <david-b@pacbell.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
Date: Tue, 17 Jul 2007 11:47:09 -0700
References: <200706241509.14367.david-b@pacbell.net>
	<1183066751.1170.208.camel@pmac.infradead.org>
	<200706281545.37013.david-b@pacbell.net>
In-Reply-To: <200706281545.37013.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707171147.10337.david-b@pacbell.net>
Cc: hjk@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 June 2007, David Brownell wrote:
> On Thursday 28 June 2007, David Woodhouse wrote:
> > On Thu, 2007-06-28 at 13:08 -0700, David Brownell wrote:
> > > They applied just fine against 2.6.22-rc6 ... did you apply them
> > > in the correct order? 
> > 
> > No, sorry. I did now though, with a small cleanup patch to follow.
> 
> Whew!  Thanks for the update.  I was hoping there wasn't another
> patchset around that I had somehow missed.  ;)

Oh, and by the way:  don't forget to revert

  340ea370c2ce89d1c15fbf785460f2f74314ce58

It's not needed given the other m25p80 patch (which now handles
at26 "dataflash" as well as most other standard SPI flash chips),
and requires a controller driver that won't be merged upstream
(supplanted by drivers/spi/atmel_spi.c) ... the submitter of
that at91_dataflash26.c driver concurred.

- Dave
