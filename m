Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAtL7-00066Z-DI
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 16:08:12 -0400
From: =?iso-8859-1?q?Hans-J=FCrgen_Koch?= <hjk@linutronix.de>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
Date: Tue, 17 Jul 2007 22:07:30 +0200
References: <200706241509.14367.david-b@pacbell.net>
	<200706281545.37013.david-b@pacbell.net>
	<200707171147.10337.david-b@pacbell.net>
In-Reply-To: <200707171147.10337.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707172207.30167.hjk@linutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag 17 Juli 2007 20:47 schrieb David Brownell:

> 
> Oh, and by the way:  don't forget to revert
> 
>   340ea370c2ce89d1c15fbf785460f2f74314ce58
> 
> It's not needed given the other m25p80 patch (which now handles
> at26 "dataflash" as well as most other standard SPI flash chips),
> and requires a controller driver that won't be merged upstream
> (supplanted by drivers/spi/atmel_spi.c) ... the submitter of
> that at91_dataflash26.c driver concurred.

That's right.

Thanks,
Hans
